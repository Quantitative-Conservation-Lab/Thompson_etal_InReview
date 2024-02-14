library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)
library(viridis)

#------------------------------------------------------------------------------#
#### Path to save data ####
path <- here::here("results", "test", "hoccdatM")
res <- c('results/test/hoccdatM') #subset of path for plot save

#### Management Strategy ####
load("parameters.RData")
search.hours <- 1 #search effort
removal.hours <- 1 #removal hours
n.resource <- 20 #total hours per week
#rule = by highest estimated state

logsearch.effort <- log(search.hours) #log search effort
max.spent <- search.hours + removal.hours #max resources you could spend at a single site

#------------------------------------------------------------------------------#
#### Data and parameters ####
n.sims <-  10 #number of simulations per parameter set
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 5 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

#if we have 3 layers use this (low, medium, high)
params <- expand.grid(col1 = c(1,2,3),ste2 = c(1,2,3),nbr3 = c(1,2,3),gro4 = c(1,2,3),rem5 = c(1,2,3),det6 = c(1,2,3))

#if we have 2 layers use this (low, high)
#params <- expand.grid(col1 = c(1,3),ste2 = c(1,3),nbr3 = c(1,3),gro4 = c(1,3),rem5 = c(1,3),det6 = c(1,3))
n.params <- length(params$col)
B0.gamma <- B1.gamma <- B2.gamma  <-  B0.eps.l <- B0.eps.h <- B0.phi.h <-
  B1.eps.l <- B1.eps.h <- B1.phi.l <- B1.phi.h <- B0.p.l <- B0.p.h <- B1.p.l <- B1.p.h <- 
  alpha.l <- alpha.h <- delta <- epsB.l <-epsB.h <-  phiB.l <- phiB.h <- g <- rep(NA, n.params)

for(p in 1:n.params){
  B0.gamma[p] <- col1[[params[p,1]]]$B0.gamma
  B1.gamma[p] <- ste2[[params[p,2]]]$B1.gamma
  B2.gamma[p] <- nbr3[[params[p,3]]]$B2.gamma
  
  B0.eps.l[p] <- gro4[[params[p,4]]]$B0.eps.l
  B0.eps.h[p] <- gro4[[params[p,4]]]$B0.eps.h
  B0.phi.h[p] <- gro4[[params[p,4]]]$B0.phi.h
  epsB.l[p] <- gro4[[params[p,4]]]$epsB.l
  epsB.h[p] <- gro4[[params[p,4]]]$epsB.h
  phiB.l[p] <- gro4[[params[p,4]]]$phiB.l
  phiB.h[p] <- gro4[[params[p,4]]]$phiB.h
  g[p] <- gro4[[params[p,4]]]$g
  
  B1.eps.l[p] <- rem5[[params[p,5]]]$B1.eps.l
  B1.eps.h[p] <- rem5[[params[p,5]]]$B1.eps.h
  B1.phi.h[p] <- rem5[[params[p,5]]]$B1.phi.h
  
  B0.p.l[p] <- det6[[params[p,6]]]$B0.p.l
  B0.p.h[p] <- det6[[params[p,6]]]$B0.p.h
  B1.p.l[p] <- det6[[params[p,6]]]$B1.p.l
  B1.p.h[p] <- det6[[params[p,6]]]$B1.p.h
  alpha.l[p] <- det6[[params[p,6]]]$alpha.l
  alpha.h[p] <- det6[[params[p,6]]]$alpha.h
  delta[p] <- det6[[params[p,6]]]$delta
}

#---- arrays ----#
gamma <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))
eps.l <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))
eps.h <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))
phi.l <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))
phi.h<- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))

TPM<- array(NA, c(n.states,n.sites,n.weeks, n.years + 1,n.params,n.sims, n.states)) 

#---Habitat data---#
# effect of habitat quality on occupancy
site.char <- site.char
State.init <- State.init
State <- array(NA,c(n.sites, n.weeks, n.years, n.params,n.sims)) #state array

#---Neighbor data---#
N <- array(NA, c(n.sites, n.weeks, n.years, n.params,n.sims)) #neighbors array
num.neighbors <- 2 #one upstream, one downstream
neighbors <- matrix(NA, nrow = n.sites, ncol = num.neighbors) #neighbors matrix, each row (site) identifies the neighbors for that site 
neighbors[1,1] <- 2 #site 1 only has site 2 as its neighbor 
neighbors[2:n.sites, 1] <- seq(1,n.sites-1) #filling in upstream neighbors
neighbors[n.sites,2] <- n.sites-1 #end site only has end site -1 as its neighbor
neighbors[1:(n.sites-1), 2] <- seq(2,n.sites) #filling in downstream neighbors
n.neighbors <- rep(2,n.sites)
n.neighbors[1] <- n.neighbors[n.sites] <- 1

#--- removal data and occupancy data ---#
sites.rem.M <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims)) 
#Removal for first time...
for(s in 1: n.sims){
  for(p in 1:n.params){
    sites.rem.M[,1,1,p,s] <- sample(n.sites, n.sites, replace = F)
  }
}

yM <- array(NA, c(n.sites, n.occs, n.weeks, n.years,n.params, n.sims)) 
resource.total <- array(0, c(n.weeks, n.years, n.params,n.sims)) 

#Detection probabilities
pM.l <- invlogit(B0.p.l + B1.p.l*logsearch.effort + alpha.l) #low state detection 
pM.h <- invlogit(B0.p.h + B1.p.h*logsearch.effort + alpha.h) #high state detection 

P.datM <- array(NA, dim = c(n.states, n.params, n.states))
for(p in 1:n.params){
  P.datM[1,p,] <- c(1,0,0)
  P.datM[2,p,] <- c(0,1,0) #c(1-pM.l[p], pM.l[p], 0)
  P.datM[3,p,] <- c(0,0,1)# c(1-pM.h[p], pM.h[p]*1-delta[p], pM.h[p]*delta[p])
}

rem.vec <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims)) #removal sites array


start.time <- Sys.time()
####################################################################################
#### Run Simulation ####
p <- which(apply(params, 1, function(x) return(all(x == c(1,1,1,1,3,3))))) #best case parameter
p <- which(apply(params, 1, function(x) return(all(x == c(3,3,3,3,1,1))))) #worst case parameter
p <- which(apply(params, 1, function(x) return(all(x == c(2,2,2,2,2,2))))) #middle of the road parameter
p <- which(apply(params, 1, function(x) return(all(x == c(3,3,3,3,3,3))))) #bad invasion but good management

year <- 1
#n.years <- 2
#for(p in 1:n.params){
for(year in 1:n.years){
  #--------------------------------------------------------------------------------#
  ### Steps: 
  #---1. Simulate the truth
  #---2. Simulate occupancy data collection (include removal data)
  #---3. Go back to step 1 and take into account removal that previously occurred into state process
  
  ##### Week 1 State  #####
  week <- 1
  
  if(year == 1){
    State[,1,year,p, 1:n.sims] <- State.init #first week state is from data
  }else{
    for(s in 1:n.sims){
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,1,year,p,s] <- rcat(1,TPM[State[i,5,year-1,p,s], i, 5, year-1, p,s,]) 
      }
      
      #### Decision rule ####
      sites.rem.M[,1,year,p,s] <- order(State[,1,year,p,s], decreasing = T)
    }
    
  } #ends year > 1
  
  eps.l[,1,year,p,] <- invlogit(B0.eps.l[p]) #eradication low 
  eps.h[,1,year,p,] <- invlogit(B0.eps.h[p]) #eradication high
  phi.h[,1,year,p,] <- invlogit(B0.phi.h[p]) #transition high to high
  
  # TPM used for week 2
  TPM[1,1:n.sites,1,year,p,,1] <- 1 #empty to empty 
  TPM[1,1:n.sites,1,year,p,,2] <- 0 
  TPM[1,1:n.sites,1,year,p,,3] <- 0 
    
  TPM[2,1:n.sites,1,year,p,,1] <- eps.l[,1,year,p,] #low to empty (week 1)
  TPM[2,1:n.sites,1,year,p,,2] <- (1- eps.l[,1,year,p,]) #low to low (week 1)
  TPM[2,1:n.sites,1,year,p,,3] <- 0 #low to high (week 1)
    
  TPM[3,1:n.sites,1,year,p,,1] <- eps.h[,1,year,p,] #high to empty (week 1)
  TPM[3,1:n.sites,1,year,p,,2] <- (1- eps.h[,1,year,p,])*(1-phi.h[,1,year,p,]) #high to low (week 1)
  TPM[3,1:n.sites,1,year,p,,3] <- (1- eps.h[,1,year,p,])*(phi.h[,1,year,p,]) #high to high (week 1)

  ##### Week 2-4 State #####
  for(s in 1:n.sims){
    for(week in 1:4){
      
      if(week > 1){
        for(i in 1:n.sites){ #State process: state given previous state and transition probability
          State[i,week,year,p,s] <- rcat(1,TPM[State[i,week-1,year,p,s], i, week-1, year, p,s,]) 
        }
        
        #--- Data for the TPM for the next week: week 2+ ---#
        #prev.rem.vec = vector of 0 and 1s indicating where removal previously occurred
        prev.rem.vec <- replace(rem.vec[,week-1,year,p,s], is.na(rem.vec[,week-1,year,p,s]), 0)
        
        # eradication probability = base + effect of previous removal (removal*removal hours)
        eps.l[,week,year,p,s] <- invlogit(B0.eps.l[p] + B1.eps.l[p]*prev.rem.vec*removal.hours) #low eradication
        eps.h[,week,year,p,s] <- invlogit(B0.eps.h[p] + B1.eps.h[p]*prev.rem.vec*removal.hours) #high eradication
        
        #transition rates
        phi.h[,week,year,p,s] <- invlogit(B0.phi.h[p] - B1.phi.h[p]*prev.rem.vec*removal.hours)
        
        TPM[1,1:n.sites,week,year,p,s,1] <- 1
        TPM[1,1:n.sites,week,year,p,s,2] <- 0
        TPM[1,1:n.sites,week,year,p,s,3] <- 0 
        
        TPM[2,1:n.sites,week,year,p,s,1] <- eps.l[,week,year,p,s] 
        TPM[2,1:n.sites,week,year,p,s,2] <- (1- eps.l[,week,year,p,s]) 
        TPM[2,1:n.sites,week,year,p,s,3] <- 0 
        
        TPM[3,1:n.sites,week,year,p,s,1] <- eps.h[,week,year,p,s] #high to empty (eradication)
        TPM[3,1:n.sites,week,year,p,s,2] <- (1- eps.h[,week,year,p,s])*(1-phi.h[,week,year,p,s]) #high to low
        TPM[3,1:n.sites,week,year,p,s,3] <- (1- eps.h[,week,year,p,s])*(phi.h[,week,year,p,s]) #high to high
        
        #week: Identify the sites where removal will occur 
        n.pre.visit <- length(which(rem.vec[,week-1,year,p,s] >= 0)) #number of sites that were sampled last week
        #put last weeks sampling sites at the end of the sampling queue 
        sites.rem.M[,week,year,p,s] <- c(sites.rem.M[,(week-1),year,p,s][-1:-n.pre.visit],
                                       sites.rem.M[,(week-1),year,p,s][1:n.pre.visit])
      } #week > 1
      
      
      ##### Observation process #######
      # Observation process: draw observation given current state
      
      for(i in sites.rem.M[,week,year,p,s]){ #order of sites where removal occurs
        
        #A. while we still have resources to spend:
        if(resource.total[week,year,p,s] < (n.resource- max.spent)){
          
          #1. first occasion occupancy data (1 = not detected, 2 = detected)
          yM[i,1,week, year,p, s] <- rcat(1, P.datM[State[i,week,year,p,s],p,])
          
          #2. second occasion occupancy data
          #2a. if seen in first occasion, do not search again and remove the rush
          if(yM[i,1,week, year, p,s] > 1){ 
            yM[i,2, week,year, p,s] <- NA #no occupancy data because we did not need to search again
            rem.vec[i,week,year,p,s] <- 1 #notes that removal occurred that week at that site
            
            #Calculating resources used = resources already used + search hours + removal hours
            resource.total[week,year,p,s] <- resource.total[week,year,p,s] + search.hours + removal.hours
            
          }else{
            #2b. If not seen the first occasion, we need to search again:
            #Second occasion occupancy data
            yM[i,2, week, year, p,s] <- rcat(1, P.datM[State[i,week,year,p,s],p, ])
            
            #2bi. If seen at the second occasion:
            if(yM[i,2, week, year, p,s] > 1){ #if seen (state observed > 1) the second time
              rem.vec[i,week,year,p,s] <- 1 #notes that removal occurred that week at that site
              
              #Calculating resources used = resources already used + search hours + removal hours
              resource.total[week,year,p,s] <- resource.total[week,year,p,s] + search.hours + removal.hours #removal.hours[State[i,week,year,s]]
            } 
            
            #2bi. If we do not detect flowering rush during the second occasion:
            if(yM[i,2, week, year,p, s]==1){ #if not seen (state observed = 1)
              rem.vec[i,week,year,p,s] <- 0 #notes removal did not occur
              
              #Calculating resources used = resources already used + search hours
              resource.total[week,year,p,s] <- resource.total[week,year,p,s] + search.hours 
            } 
          }
          
          #B. if we do not have any more resources to spend:
        }else{
          yM[i,1:2, week, year,p, s] <- NA #no occupancy data
          rem.vec[i,week,year,p,s] <- NA #removal did not occur
        }
        
      } #ends site loop
    } #ends week loop
    
    ###### Week 5 #####
    #Between weeks: we need to project 48 weeks forward
    for(i in 1:n.sites){ #State process: state given previous state and transition probability
      State[i,5,year,p,s] <- rcat(1,TPM[State[i,4,year,p,s], i, 4, year, p,s,]) 
    }
    
    for(i in 1:n.sites){ #state of neighbors
      N[i,5,year,p,s] <- (sum(State[neighbors[i,], 5,year,p,s])-2)/n.neighbors[i] #state of neighbors
    }
    
    gamma[,5,year,p,s] <-invlogit(B0.gamma[p] + B1.gamma[p]*site.char + B2.gamma[p]*N[,5,year,p,s]) #invasion 
      
    # TPM used for next week
    TPM[1,1:n.sites,5,year,p,s,1] <- 1-gamma[,5,year,p,s] #empty to empty 
    TPM[1,1:n.sites,5,year,p,s,2] <- gamma[,5,year,p,s]*(1-g[p]) #empty to low 
    TPM[1,1:n.sites,5,year,p,s,3] <- gamma[,5,year,p,s]*(g[p]) #empty to high 
      
    TPM[2,1:n.sites,5,year,p,s,1] <- epsB.l[p] #low to empty 
    TPM[2,1:n.sites,5,year,p,s,2] <- (1- epsB.l[p])*(1-phiB.l[p]) #low to low 
    TPM[2,1:n.sites,5,year,p,s,3] <- (1- epsB.l[p])*(phiB.l[p]) #low to high 
      
    TPM[3,1:n.sites,5,year,p,s,1] <- epsB.h[p] #high to empty 
    TPM[3,1:n.sites,5,year,p,s,2] <- (1- epsB.h[p])*(1-phiB.h[p]) #high to low
    TPM[3,1:n.sites,5,year,p,s,3] <- (1- epsB.h[p])*(phiB.h[p]) #high to high
    
    
  } #ends sim loop
    
  
} #year loop 
#} #parameter loop

#################################################################################################
#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

##### Plots #####
#average state across simulations and parameters
summary(State[,5,10,p,1:n.sims])

mean.state <- array(NA, c(n.params, n.sims))

for(p in 1:n.params){
  for(s in 1:n.sims){
    mean.state[p,s] <- mean(State[,5,10,p,s])
  }
}

mean.df <- adply(mean.state, c(1,2))
mean.df$type <- 'mean'

#number of 3 states
state.3 <- array(NA, c(n.params, n.sims))

for(p in 1:n.params){
  for(s in 1:n.sims){
    state.3[p,s] <- sum(State[,5,10,p,s] == 3)
  }
}

s3.df <- adply(state.3, c(1,2))
s3.df$type <- 'state3'

#number of 1 states
state.1 <- array(NA, c(n.params, n.sims))

for(p in 1:n.params){
  for(s in 1:n.sims){
    state.1[p,s] <- sum(State[,5,10,p,s] == 1)
  }
}

s1.df <- adply(state.1, c(1,2))
s1.df$type <- 'state1'

state.summary <- rbind(mean.df, s3.df, s1.df)
colnames(state.summary)[1:3] <- c("param", "simulation", "value")

state.summary <- aggregate(value ~ param + type,
                               data = as.data.frame(state.summary), FUN = mean)

ggplot(state.summary)+
  geom_point(aes(x = param, y = value, color = type))


ggplot(state.summary)+
  geom_boxplot(aes(x = type, y = value, color = type))

