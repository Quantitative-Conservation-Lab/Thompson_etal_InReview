library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)
library(RColorBrewer)
library(readr)


#Remove at downstream 5 locations but collect monitoring data
#at next 5 downstream locations

#### JAGS model ####
#See JAGSModels.R script

#------------------------------------------------------------------------------#
#### Path to save data ####
path <- here::here("results", "test_40", "years_4")
res <- c('results/test_40/years_4') #subset of path for plot save
#------------------------------------------------------------------------------#
#### Management Strategy ####
load("parameters.RData")
#rule = by highest estimated state

n.resource <- 40 #total hours per week
hours <- expand.grid(s = c(0.5, 1, 2, 3), r =  c(1,2,3,4))
hours <- hours %>% filter(s < r)

### Fix with each a ###
hours <- hours[4,]
search.hours <- hours$s
logsearch.effort <- log(search.hours) #log search effort
removal.hours <- hours$r
max.spent <- search.hours + removal.hours #max resources you could spend at a single site

#------------------------------------------------------------------------------#
#### Data and parameters ####
n.sims <-  20 #number of simulations per parameter set
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

#### First Removal Locations ####
for(s in 1: n.sims){
  for(p in 1:n.params){
    sites.rem.M[,1,1,p,s] <- sample(n.sites, n.sites, replace = F)
    sites.rem.M[,1,2,p,s] <- sample(n.sites, n.sites, replace = F)
  }
}

yM <- array(NA, c(n.sites, n.occs, n.weeks, n.years,n.params, n.sims)) 
resource.total <- array(0, c(n.weeks, n.years, n.params,n.sims)) 

d.traveled <- array(NA, c(n.weeks, n.years,n.params, n.sims))
visit <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))

#Detection probabilities
pM.l <- invlogit(B0.p.l + B1.p.l*logsearch.effort + alpha.l) #low state detection 
pM.h <- invlogit(B0.p.h + B1.p.h*logsearch.effort + alpha.h) #high state detection 

P.datM <- array(NA, dim = c(n.states, n.params, n.states))
for(p in 1:n.params){
  P.datM[1,p,] <- c(1,0,0)
  P.datM[2,p,] <- c(1-pM.l[p], pM.l[p], 0)
  P.datM[3,p,] <- c(1-pM.h[p], pM.h[p]*(1-delta[p]), pM.h[p]*delta[p])
}

rem.vec <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims)) #removal sites array
start.time <- Sys.time()

#### JAGS arrays ####
S.init <- array(NA, c(n.sites,n.years, n.sims))
N.init <- array(NA, c(n.sites,n.years, n.sims))

#priors:
B0.eps.l.mean <- array(NA, c(n.years, n.sims))
B0.eps.l.sd <- array(NA, c(n.years, n.sims))
B1.eps.l.mean <- array(NA, c(n.years, n.sims))
B1.eps.l.sd <- array(NA, c(n.years, n.sims))

B0.eps.h.mean <- array(NA, c(n.years, n.sims))
B0.eps.h.sd <- array(NA, c(n.years, n.sims))
B1.eps.h.mean <- array(NA, c(n.years, n.sims))
B1.eps.h.sd <- array(NA, c(n.years, n.sims))

B0.phi.h.mean <- array(NA, c(n.years, n.sims))
B0.phi.h.sd <- array(NA, c(n.years, n.sims))
B1.phi.h.mean <- array(NA, c(n.years, n.sims))
B1.phi.h.sd <- array(NA, c(n.years, n.sims))

B0.gamma.mean <- array(NA, c(n.years, n.sims))
B0.gamma.sd <- array(NA, c(n.years, n.sims))
B1.gamma.mean <- array(NA, c(n.years, n.sims))
B1.gamma.sd <- array(NA, c(n.years, n.sims))
B2.gamma.mean <- array(NA, c(n.years, n.sims))
B2.gamma.sd <- array(NA, c(n.years, n.sims))

epsB.l.a <- array(NA, c(n.years, n.sims))
epsB.l.b <- array(NA, c(n.years, n.sims))
epsB.h.a <- array(NA, c(n.years, n.sims))
epsB.h.b <- array(NA, c(n.years, n.sims))
phiB.l.a <- array(NA, c(n.years, n.sims))
phiB.l.b <- array(NA, c(n.years, n.sims))
phiB.h.a <- array(NA, c(n.years, n.sims))
phiB.h.b <- array(NA, c(n.years, n.sims))
g.a <- array(NA, c(n.years, n.sims))
g.b <- array(NA, c(n.years, n.sims))

B0.p.l.mean <- array(NA, c(n.years, n.sims))
B0.p.l.sd <- array(NA, c(n.years, n.sims))
B1.p.l.mean <- array(NA, c(n.years, n.sims))
B1.p.l.sd <- array(NA, c(n.years, n.sims))
l.mean <- array(NA, c(n.years, n.sims))
l.sd <- array(NA, c(n.years, n.sims))

B0.p.h.mean <- array(NA, c(n.years, n.sims))
B0.p.h.sd <- array(NA, c(n.years, n.sims))
B1.p.h.mean <- array(NA, c(n.years, n.sims))
B1.p.h.sd <- array(NA, c(n.years, n.sims))
h.mean <- array(NA, c(n.years, n.sims))
h.sd <- array(NA, c(n.years, n.sims))
delta.a <- array(NA, c(n.years, n.sims))
delta.b <-  array(NA, c(n.years, n.sims))

x <- list()
rhat_vals <- array(NA, c(n.years, n.sims))
sites <- list()
my.data <- list()
outs <- rep(NA,n.sims)
outputs <- rep(NA, n.sims)
mcmcs <- rep(NA, n.sims)
initial.values <- list()
res.state <- list()
res.params <- list()

S.decision <- array(NA, c(n.sites, n.years, n.sims))

alpha.init <- array(NA, c(n.years, n.sites, n.states, n.sims))
n.chains <- 3
chain <- array(NA, c(n.chains, n.sites, n.states))

start.time <- Sys.time()
####################################################################################
#### Simulations ####

p <- which(apply(params, 1, function(x) return(all(x == c(1,1,1,1,3,3))))) #best case parameter
p <- which(apply(params, 1, function(x) return(all(x == c(3,3,3,3,1,1))))) #worst case parameter
p <- which(apply(params, 1, function(x) return(all(x == c(2,2,2,2,2,2))))) #middle of the road parameter
p <- which(apply(params, 1, function(x) return(all(x == c(3,3,3,3,3,3))))) #bad invasion but good management

sim.start <- c(NA, 1, seq(3, n.years)) 
sim.end <- c(NA, c(seq(2, n.years)))

#year <- 2

for(year in 2:n.years){

  for(y in sim.start[year]:sim.end[year]){
  #### 1. Simulation ####
  #--------------------------------------------------------------------------------#
  ### Steps: 
  #---1. Simulate the truth
  #---2. Simulate occupancy data collection (include removal data)
  #---3. Go back to step 1 and take into account removal that previously occurred into state process
  
  #first estimation process we run two years at a time
  
  ##### Week 1 State  #####
  week <- 1
  
  if(y == 1){
    State[,1,y,p, 1:n.sims] <- State.init #first week state is from data
  }else{
    for(s in 1:n.sims){
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,1,y,p,s] <- rcat(1,TPM[State[i,5,y-1,p,s], i, 5, y-1, p,s,]) 
      }
    }
    
  } #ends year > 1
  
  eps.l[,1,y,p,] <- invlogit(B0.eps.l[p]) #eradication low 
  eps.h[,1,y,p,] <- invlogit(B0.eps.h[p]) #eradication high
  phi.h[,1,y,p,] <- invlogit(B0.phi.h[p]) #transition high to high
  
  # TPM used for week 2
  TPM[1,1:n.sites,1,y,p,,1] <- 1 #empty to empty 
  TPM[1,1:n.sites,1,y,p,,2] <- 0 
  TPM[1,1:n.sites,1,y,p,,3] <- 0 
  
  TPM[2,1:n.sites,1,y,p,,1] <- eps.l[,1,y,p,] #low to empty (week 1)
  TPM[2,1:n.sites,1,y,p,,2] <- (1- eps.l[,1,y,p,]) #low to low (week 1)
  TPM[2,1:n.sites,1,y,p,,3] <- 0 #low to high (week 1)
  
  TPM[3,1:n.sites,1,y,p,,1] <- eps.h[,1,y,p,] #high to empty (week 1)
  TPM[3,1:n.sites,1,y,p,,2] <- (1- eps.h[,1,y,p,])*(1-phi.h[,1,y,p,]) #high to low (week 1)
  TPM[3,1:n.sites,1,y,p,,3] <- (1- eps.h[,1,y,p,])*(phi.h[,1,y,p,]) #high to high (week 1)
  
  ##### Week 2-4 State #####
  for(s in 1:n.sims){
    for(week in 1:4){
      
      if(week > 1){
        for(i in 1:n.sites){ #State process: state given previous state and transition probability
          State[i,week,y,p,s] <- rcat(1,TPM[State[i,week-1,y,p,s], i, week-1, y, p,s,]) 
        }
        
        #--- Data for the TPM for the next week: week 2+ ---#
        #prev.rem.vec = vector of 0 and 1s indicating where removal previously occurred
        prev.rem.vec <- replace(rem.vec[,week-1,y,p,s], is.na(rem.vec[,week-1,y,p,s]), 0)
        
        # eradication probability = base + effect of previous removal (removal*removal hours)
        eps.l[,week,y,p,s] <- invlogit(B0.eps.l[p] + B1.eps.l[p]*prev.rem.vec*removal.hours) #low eradication
        eps.h[,week,y,p,s] <- invlogit(B0.eps.h[p] + B1.eps.h[p]*prev.rem.vec*removal.hours) #high eradication
        
        #transition rates
        phi.h[,week,y,p,s] <- invlogit(B0.phi.h[p] - B1.phi.h[p]*prev.rem.vec*removal.hours)
        
        TPM[1,1:n.sites,week,y,p,s,1] <- 1
        TPM[1,1:n.sites,week,y,p,s,2] <- 0
        TPM[1,1:n.sites,week,y,p,s,3] <- 0 
        
        TPM[2,1:n.sites,week,y,p,s,1] <- eps.l[,week,y,p,s] 
        TPM[2,1:n.sites,week,y,p,s,2] <- (1- eps.l[,week,y,p,s]) 
        TPM[2,1:n.sites,week,y,p,s,3] <- 0 
        
        TPM[3,1:n.sites,week,y,p,s,1] <- eps.h[,week,y,p,s] #high to empty (eradication)
        TPM[3,1:n.sites,week,y,p,s,2] <- (1- eps.h[,week,y,p,s])*(1-phi.h[,week,y,p,s]) #high to low
        TPM[3,1:n.sites,week,y,p,s,3] <- (1- eps.h[,week,y,p,s])*(phi.h[,week,y,p,s]) #high to high
        
        #week: Identify the sites where removal will occur 
        n.pre.visit <- length(which(rem.vec[,week-1,y,p,s] >= 0)) #number of sites that were sampled last week
        #put last weeks sampling sites at the end of the sampling queue 
        sites.rem.M[,week,y,p,s] <- c(sites.rem.M[,(week-1),y,p,s][-1:-n.pre.visit],
                                         sites.rem.M[,(week-1),y,p,s][1:n.pre.visit])
      } #week > 1
      
      
      ##### Observation process #######
      # Observation process: draw observation given current state
      
      for(i in sites.rem.M[,week,y,p,s]){ #order of sites where removal occurs
        
        #A. while we still have resources to spend:
        if(resource.total[week,y,p,s] < (n.resource- max.spent)){
          
          #1. first occasion occupancy data (1 = not detected, 2 = detected)
          yM[i,1,week, y,p, s] <- rcat(1, P.datM[State[i,week,y,p,s],p,])
          
          #2. second occasion occupancy data
          #2a. if seen in first occasion, do not search again and remove the rush
          if(yM[i,1,week, y, p,s] > 1){ 
            yM[i,2, week,y, p,s] <- NA #no occupancy data because we did not need to search again
            rem.vec[i,week,y,p,s] <- 1 #notes that removal occurred that week at that site
            
            #Calculating resources used = resources already used + search hours + removal hours
            resource.total[week,y,p,s] <- resource.total[week,y,p,s] + search.hours + removal.hours
            
          }else{
            #2b. If not seen the first occasion, we need to search again:
            #Second occasion occupancy data
            yM[i,2, week, y, p,s] <- rcat(1, P.datM[State[i,week,y,p,s],p, ])
            
            #2bi. If seen at the second occasion:
            if(yM[i,2, week, y, p,s] > 1){ #if seen (state observed > 1) the second time
              rem.vec[i,week,y,p,s] <- 1 #notes that removal occurred that week at that site
              
              #Calculating resources used = resources already used + search hours + removal hours
              resource.total[week,y,p,s] <- resource.total[week,y,p,s] + search.hours + removal.hours #removal.hours[State[i,week,year,s]]
            } 
            
            #2bi. If we do not detect flowering rush during the second occasion:
            if(yM[i,2, week, y,p, s]==1){ #if not seen (state observed = 1)
              rem.vec[i,week,y,p,s] <- 0 #notes removal did not occur
              
              #Calculating resources used = resources already used + search hours
              resource.total[week,y,p,s] <- resource.total[week,y,p,s] + search.hours 
            } 
          }
          
          #B. if we do not have any more resources to spend:
        }else{
          yM[i,1:2, week, y,p, s] <- NA #no occupancy data
          rem.vec[i,week,y,p,s] <- NA #removal did not occur
        }
        
      } #ends site loop
      
      #Calculating distance traveled: 
      #if we visit all sites:
      if(sum(is.na(rem.vec[,week,y,p,s])) == 0){
        v <- sites.rem.M[,week,y,p,s] #vector 
        index.na <- n.sites+1
      }else{
        #first location we do not go to that week:
        first.na <- intersect(sites.rem.M[,week,y,p,s], which(is.na(rem.vec[,week,y,p,s])))[1]
        index.na <- which(first.na == sites.rem.M[,week,y,p,s])
        v <- sites.rem.M[1:(index.na-1),week,y,p,s] #vector 
      }
      
      l.v <- length(v) #length of visited sites vector
      
      #Vector of sites we visited
      visit[1:l.v, week, y,p,s] <- sites.rem.M[1:(index.na-1),week,y,p,s]
      
      #Calculating stepwise distance traveled
      d.traveled[week,y,p,s] <- abs(visit[1, week, y,p,s] - visit[2, week, y,p,s])
      
      if(l.v > 2){
      for(si in 2:(l.v-1)){
        d.traveled[week,y,p,s] <- d.traveled[week,y,p,s] + 
          abs(visit[si, week, y,p,s] - visit[si+1, week, y,p,s])
      }
      }
      
      
    } #ends week loop
    
    ###### Week 5 #####
    #Between weeks: we need to project 48 weeks forward
    for(i in 1:n.sites){ #State process: state given previous state and transition probability
      State[i,5,y,p,s] <- rcat(1,TPM[State[i,4,y,p,s], i, 4, y, p,s,]) 
    }
    
    for(i in 1:n.sites){ #state of neighbors
      N[i,5,y,p,s] <- (sum(State[neighbors[i,], 5,y,p,s])-2)/n.neighbors[i] #state of neighbors
    }
    
    gamma[,5,y,p,s] <-invlogit(B0.gamma[p] + B1.gamma[p]*site.char + B2.gamma[p]*N[,5,y,p,s]) #invasion 
    
    # TPM used for next week
    TPM[1,1:n.sites,5,y,p,s,1] <- 1-gamma[,5,y,p,s] #empty to empty 
    TPM[1,1:n.sites,5,y,p,s,2] <- gamma[,5,y,p,s]*(1-g[p]) #empty to low 
    TPM[1,1:n.sites,5,y,p,s,3] <- gamma[,5,y,p,s]*(g[p]) #empty to high 
    
    TPM[2,1:n.sites,5,y,p,s,1] <- epsB.l[p] #low to empty 
    TPM[2,1:n.sites,5,y,p,s,2] <- (1- epsB.l[p])*(phiB.l[p]) #low to low 
    TPM[2,1:n.sites,5,y,p,s,3] <- (1- epsB.l[p])*(1-phiB.l[p]) #low to high 
    
    TPM[3,1:n.sites,5,y,p,s,1] <- epsB.h[p] #high to empty 
    TPM[3,1:n.sites,5,y,p,s,2] <- (1- epsB.h[p])*(1-phiB.h[p]) #high to low
    TPM[3,1:n.sites,5,y,p,s,3] <- (1- epsB.h[p])*(phiB.h[p]) #high to high
    
    
  } #ends sim loop
  
  
} #year loop 
  
  #--------------------------------------------------------------------------------#
  #### 2. Learning: ####
  
  ##### 2a. Update priors #####
  ###### 1st Estimation priors #####
  #------------------------1st Est Priors------------------------#
  if(year == 2){
    # --- eps.l ---  eradication low state -------------------- #
    #B0.eps.l = base eradication at low state (beta distribution)
    B0.eps.l.mean[year,] <-  0 #mean
    B0.eps.l.sd[year,] <- 2 #sd
    
    #B1.eps.l = effect of eradication at low state (normal distribution)
    B1.eps.l.mean[year,] <- 0 #mean
    B1.eps.l.sd[year,] <-  2 #sd
    
    # --- eps.h ---  eradication high state ------------------- #
    #B0.eps.h = base eradication at high state (beta distribution)
    B0.eps.h.mean[year,] <- 0 #mean
    B0.eps.h.sd[year,] <- 2 #sd
    
    #B1.eps.h = effect of eradication at high state (normal distribution)
    B1.eps.h.mean[year,] <- 0 #mean
    B1.eps.h.sd[year,] <-  2 #sd
    
    # --- phi ---  transition rates -------------------------- #
    #B0.phi.h = transition high to high (beta distribution)
    B0.phi.h.mean[year,] <- 0 #alpha shape
    B0.phi.h.sd[year,] <- 2 #beta shape
    
    #B1.phi.h of removal on transition from high to high
    B1.phi.h.mean[year,] <- 0 #mean
    B1.phi.h.sd[year,] <- 2 #sd
    
    # --- gamma ---  invasion: Between weeks ------------------- #  
    #B0.gamma = intrinsic invasion (normal distribution)
    B0.gamma.mean[year,] <- 0 #mean
    B0.gamma.sd[year, ] <- 2 #sd
    
    #B1.gamma = effect of site characteristics (normal distribution)
    B1.gamma.mean[year,] <- 0 #mean
    B1.gamma.sd[year,] <- 2 #sd
    
    #B2.gamma = effect of neighboring state (normal distribution)
    B2.gamma.mean[year,] <- 0 #mean
    B2.gamma.sd[year,] <- 2 #sd

    # --- eps ---  eradication: Between weeks ---------------- # 
    epsB.l.a[year,] <- 1
    epsB.l.b[year,] <- 1
    epsB.h.a[year,] <- 1
    epsB.h.b[year,] <- 1
    
    # --- phi ---  transition rates: Between weeks ------------ #  
    phiB.l.a[year,] <- 1
    phiB.l.b[year,] <- 1
    phiB.h.a[year,] <- 1
    phiB.h.b[year,] <- 1
    
    # --- g --- Given colonization, probability of becoming high state -- #
    g.a[year,] <- 1
    g.b[year,] <- 1
    
    # --- p.l ---  detection low state ----------------------- #
    #B0.p.l = base detection low state (normal distribution)
    B0.p.l.mean[year,] <- 0 
    B0.p.l.sd[year,] <- 2 
    
    #B1.p.l = effect of effort (normal distribution)
    B1.p.l.mean[year,] <- 0 #mean
    B1.p.l.sd[year,] <- 2 #sd
    
    # --- alpha.l --- difference in baseline detection btwn dat D and M -- #  
    l.mean[year,] <- 0 #mean
    l.sd[year,] <- 2 #sd
    
    # --- p.h ---  detection high state ---------------------- #
    #B0.p.h = base detection high state (beta distribution)
    B0.p.h.mean[year,] <- 0 #mean
    B0.p.h.sd[year,] <- 2 #sd
    
    #B1.p.h = effect of effort (normal distribution)
    B1.p.h.mean[year,] <- 0 #mean
    B1.p.h.sd[year,] <- 2 #sd
    
    # --- alpha.h --- difference in baseline detection btwn dat D and M -- #   
    h.mean[year,] <- 0 #mean
    h.sd[year,] <- 2 #sd
    
    #---delta -- ability to perfectly detect high invasion state #
    #beta distribution
    delta.a[year,] <- 1
    delta.b[year,] <- 1
    
    # --- S.init and D.init ---  Initial states ------------ #
    alpha.init1 <- rep(1,n.states) #initial state probability vector
    
  } else{
    ###### 2+ Estimation priors #####
    for(s in 1:n.sims){
      # --- eps.l ---  eradication low state -------------------- #
      #B0.eps.l = base eradication at low state 
      B0.eps.l.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param, '^B0.eps.l')) %>% select(mean)))
      B0.eps.l.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param, '^B0.eps.l')) %>% select(sd)))
      
      #B1.eps.l = effect of eradication at low state 
      B1.eps.l.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.eps.l')) %>% select(mean)))
      B1.eps.l.sd[year,s] <-  c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.eps.l')) %>% select(sd)))
      
      # --- eps.h ---  eradication high state ------------------- #
      #B0.eps.h = base eradication at high state 
      B0.eps.h.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.eps.h')) %>% select(mean)))
      B0.eps.h.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.eps.h')) %>% select(sd)))
      
      #B1.eps.h = effect of eradication at high state 
      B1.eps.h.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.eps.h')) %>% select(mean)))
      B1.eps.h.sd[year,s] <-  c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.eps.h')) %>% select(sd)))
      
      # --- phi ---  transition rates -------------------------- #
      #phi.h = transition high to high 
      B0.phi.h.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.phi.h')) %>% select(mean)))
      B0.phi.h.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.phi.h')) %>% select(sd)))
      
      #effect of removal on transition from high to high
      B1.phi.h.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.phi.h')) %>% select(mean)))
      B1.phi.h.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.phi.h')) %>% select(sd)))
      
      # --- gamma ---  invasion: Between weeks ------------------- #  
      #B0.gamma = intrinsic invasion 
      B0.gamma.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.gamma')) %>% select(mean)))
      B0.gamma.sd[year, s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.gamma')) %>% select(sd)))
      
      #B1.gamma = effect of site characteristics 
      B1.gamma.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.gamma')) %>% select(mean)))
      B1.gamma.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.gamma')) %>% select(sd)))
      
      #B2.gamma= effect of neighboring state 
      B2.gamma.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B2.gamma')) %>% select(mean)))
      B2.gamma.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B2.gamma')) %>% select(sd)))
      
      # --- eps ---  eradication: Between weeks ---------------- # 
      epsBl.mean <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^epsB.l')) %>% select(mean)))
      epsBl.sd <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^epsB.l')) %>% select(sd)))
      
      epsB.l.a[year,s] <- (epsBl.mean^2 - epsBl.mean^3 - (epsBl.mean*epsBl.sd^2) )/ (epsBl.sd^2)
      epsB.l.b[year,s] <- (epsB.l.a[year,s]*(1-epsBl.mean))/ (epsBl.mean)
      
      epsBh.mean <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^epsB.h')) %>% select(mean)))
      epsBh.sd <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^epsB.h')) %>% select(sd)))
      
      epsB.h.a[year,s] <- (epsBh.mean^2 - epsBh.mean^3 - (epsBh.mean*epsBh.sd^2) )/ (epsBh.sd^2)
      epsB.h.b[year,s] <- (epsB.h.a[year,s]*(1-epsBh.mean))/ (epsBh.mean)
      
      # --- phi ---  transition rates: Between weeks ------------ #  
      phiBl.mean <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^phiB.l')) %>% select(mean)))
      phiBl.sd <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^phiB.l')) %>% select(sd)))
      
      phiB.l.a[year,s] <- (phiBl.mean^2 - phiBl.mean^3 - (phiBl.mean*phiBl.sd^2) )/ (phiBl.sd^2)
      phiB.l.b[year,s] <- (phiB.l.a[year,s]*(1-phiBl.mean))/ (phiBl.mean)
      
      phiBh.mean <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^phiB.h')) %>% select(mean)))
      phiBh.sd <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^phiB.h')) %>% select(sd)))
      
      phiB.h.a[year,s] <- (phiBh.mean^2 - phiBh.mean^3 - (phiBh.mean*phiBh.sd^2) )/ (phiBh.sd^2)
      phiB.h.b[year,s] <- (phiB.h.a[year,s]*(1-phiBh.mean))/ (phiBh.mean)
      
      # --- g --- Given colonization, probability of becoming high state -- #
      g.mean <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^g')) %>% select(mean)))
      g.sd <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^g')) %>% select(sd)))
      
      g.a[year,] <- (g.mean^2 - g.mean^3 - (g.mean*g.sd^2) )/ (g.sd^2)
      g.b[year,] <- (g.a[year,s]*(1-g.mean))/ (g.mean)
      
      # --- p.l ---  detection low state ----------------------- #
      #B0.p.l = base detection low state (beta distribution)
      B0.p.l.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.p.l')) %>% select(mean)))
      B0.p.l.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.p.l')) %>% select(sd)))
      
      #B1.p.l = effect of effort (normal distribution)
      B1.p.l.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.p.l')) %>% select(mean)))
      B1.p.l.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.p.l')) %>% select(sd)))
      
      # --- alpha.l --- difference in baseline detection btwn dat D and M -- #  
      l.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^alpha.l')) %>% select(mean)))
      l.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^alpha.l')) %>% select(sd)))
      
      # --- p.h ---  detection high state ---------------------- #
      #B0.p.h = base detection high state (beta distribution)
      B0.p.h.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.p.h')) %>% select(mean)))
      B0.p.h.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B0.p.h')) %>% select(sd)))
      
      #B1.p.h = effect of effort (normal distribution)
      B1.p.h.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.p.h')) %>% select(mean)))
      B1.p.h.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^B1.p.h')) %>% select(sd)))
      
      # --- alpha.h --- difference in baseline detection btwn dat D and M -- #   
      h.mean[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^alpha.h')) %>% select(mean)))
      h.sd[year,s] <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^alpha.h')) %>% select(sd)))
      
      #---delta -- ability to perfectly detect high invasion state #
      #beta distribution
      delta.mean <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^delta')) %>% select(mean)))
      delta.sd <- c(t(res.params[[year-1]] %>% filter(sim == s & str_detect(param,  '^delta')) %>% select(sd)))
      
      delta.a[year,s] <- (delta.mean^2 - delta.mean^3 - (delta.mean*delta.sd^2) )/ (delta.sd^2)
      delta.b[year,s] <- (delta.a[year,s]*(1-delta.mean))/ (delta.mean)
      
      # --- S.init and D.init ---  Initial states ------------ #

      for(i in 1:n.sites){
        for(c in 1:n.chains){
          v <- which(grepl("^State", names(get(mcmcs[s])[[c]][1,])))[1] #find which index of mcmc output is state
          chain[c,i,1] <- sum(get(mcmcs[s])[[c]][,(v-1)+i] == 1) #number of mcmc iterations that site i, week 5 = 1
          chain[c,i,2] <- sum(get(mcmcs[s])[[c]][,(v-1)+i] == 2)
          chain[c,i,3] <- sum(get(mcmcs[s])[[c]][,(v-1)+i] == 3)
        }
        alpha.init[year,i,1,s] <- sum(chain[,i,1]) / ((length(get(mcmcs[s])[[1]][,1]))*n.chains)
        alpha.init[year,i,2,s] <- sum(chain[,i,2]) / ((length(get(mcmcs[s])[[1]][,1]))*n.chains)
        alpha.init[year,i,3,s] <- sum(chain[,i,3]) / ((length(get(mcmcs[s])[[1]][,1]))*n.chains)
      }

      
    } #ends s loop
  }
  
  #--------------------------------------------------------------------------------#
  ###### 2b. JAGS data ######
  
  #sites where removal occurred
  ##### JAGS DATA for Estimation 1 ######
  if(year == 2){
    rem.vec.dat <- rem.vec[,,1:2,p,] 
    rem.vec.dat[is.na(rem.vec.dat)] <- 0 #replaces na with 0
    
    for(s in 1:n.sims){
      my.data[[s]] <- list( 
        #constants
        n.sites = n.sites, n.weeks = n.weeks, n.occs = n.occs,  neighbors = neighbors,
        
        #data
        yM= yM[,,,1:2,p,s],
        site.char = site.char,
        logeffort = logsearch.effort,
        rem.vec = rem.vec.dat[,,,s],
        removal.hours = removal.hours,
        n.neighbors = n.neighbors,
        
        #priors
        alpha.init1 = alpha.init1,
        
        B0.eps.l.mean =  B0.eps.l.mean[year,s], B0.eps.l.sd =  B0.eps.l.sd[year,s], B1.eps.l.mean =  B1.eps.l.mean[year,s],
        B1.eps.l.sd =  B1.eps.l.sd[year,s], B0.eps.h.mean =  B0.eps.h.mean[year,s], B0.eps.h.sd =  B0.eps.h.sd[year,s],
        B1.eps.h.mean =  B1.eps.h.mean[year,s], B1.eps.h.sd = B1.eps.h.sd[year,s],
        
        B0.phi.h.mean =  B0.phi.h.mean[year,s], B0.phi.h.sd =  B0.phi.h.sd[year,s], B1.phi.h.mean =  B1.phi.h.mean[year,s],
        B1.phi.h.sd =  B1.phi.h.sd[year,s],
        
        B0.gamma.mean =  B0.gamma.mean[year,s], B0.gamma.sd =  B0.gamma.sd[year,s], B1.gamma.mean =  B1.gamma.mean[year,s],
        B1.gamma.sd =  B1.gamma.sd[year,s], B2.gamma.mean =  B2.gamma.mean[year,s], B2.gamma.sd =  B2.gamma.sd[year,s],
        
        epsB.l.a =  epsB.l.a[year,s], epsB.l.b =  epsB.l.b[year,s], epsB.h.a =  epsB.h.a[year,s],
        epsB.h.b =  epsB.h.b[year,s], phiB.l.a =  phiB.l.a[year,s], phiB.l.b =  phiB.l.b[year,s],
        phiB.h.a =  phiB.h.a[year,s], phiB.h.b =  phiB.h.b[year,s], g.a = g.a[year,s], g.b = g.b[year,s], 
        
        B0.p.l.mean =  B0.p.l.mean[year,s], B0.p.l.sd =  B0.p.l.sd[year,s], B1.p.l.mean =  B1.p.l.mean[year,s], 
        B1.p.l.sd =  B1.p.l.sd[year,s], l.mean = l.mean[year,s], l.sd =  l.sd[year,s],
        
        B0.p.h.mean =  B0.p.h.mean[year,s], B0.p.h.sd =  B0.p.h.sd[year,s], B1.p.h.mean =  B1.p.h.mean[year,s],
        B1.p.h.sd =   B1.p.h.sd[year,s], h.mean =  h.mean[year,s], h.sd =  h.sd[year,s],
        delta.a =  delta.a[year,s],delta.b =   delta.b[year,s]
      )
    }
    
    State.start <- array(NA, c(n.sites,n.weeks,2,n.sims)) #State initial values
    
    for(s in 1:n.sims){for(i in 1:n.sites){for(week in 1:n.weeks){for(y in 1:2){
        State.start[i,week,y,s] <- State[i,week,y,p,s] #max(yM[i,,week,y,p,s], na.rm = T)
    }}}}
    
    #Initial values
    for(s in 1:n.sims){
      initial.values[[s]] <- function()list(State = State.start[,,,s])
    }
  
    ##### JAGS DATA for Estimation 2+ #######
  }else{ 
    
    rem.vec.dat <- rem.vec[,,year,p,] 
    rem.vec.dat[is.na(rem.vec.dat)] <- 0 #replaces na with 0
    
    for(s in 1:n.sims){
      my.data[[s]] <- list( 
        #constants
        n.sites = n.sites, n.weeks = n.weeks, n.occs = n.occs, neighbors = neighbors,
        
        #data
        yM= yM[,,,year,p,s],
        site.char = site.char,
        logeffort = logsearch.effort,
        rem.vec = rem.vec.dat[,,s],
        removal.hours = removal.hours,
        n.neighbors = n.neighbors,
        
        #priors
        alpha.init = alpha.init[year,,,s],
        
        B0.eps.l.mean =  B0.eps.l.mean[year,s], B0.eps.l.sd =  B0.eps.l.sd[year,s], B1.eps.l.mean =  B1.eps.l.mean[year,s],
        B1.eps.l.sd =  B1.eps.l.sd[year,s], B0.eps.h.mean =  B0.eps.h.mean[year,s], B0.eps.h.sd =  B0.eps.h.sd[year,s],
        B1.eps.h.mean =  B1.eps.h.mean[year,s], B1.eps.h.sd = B1.eps.h.sd[year,s],
        
        B0.phi.h.mean =  B0.phi.h.mean[year,s], B0.phi.h.sd =  B0.phi.h.sd[year,s], B1.phi.h.mean =  B1.phi.h.mean[year,s],
        B1.phi.h.sd =  B1.phi.h.sd[year,s],
        
        B0.gamma.mean =  B0.gamma.mean[year,s], B0.gamma.sd =  B0.gamma.sd[year,s], B1.gamma.mean =  B1.gamma.mean[year,s],
        B1.gamma.sd =  B1.gamma.sd[year,s], B2.gamma.mean =  B2.gamma.mean[year,s], B2.gamma.sd =  B2.gamma.sd[year,s],
        
        epsB.l.a =  epsB.l.a[year,s], epsB.l.b =  epsB.l.b[year,s], epsB.h.a =  epsB.h.a[year,s],
        epsB.h.b =  epsB.h.b[year,s], phiB.l.a =  phiB.l.a[year,s], phiB.l.b =  phiB.l.b[year,s],
        phiB.h.a =  phiB.h.a[year,s], phiB.h.b =  phiB.h.b[year,s], g.a = g.a[year,s], g.b = g.b[year,s], 
        
        B0.p.l.mean =  B0.p.l.mean[year,s], B0.p.l.sd =  B0.p.l.sd[year,s], B1.p.l.mean =  B1.p.l.mean[year,s], 
        B1.p.l.sd =  B1.p.l.sd[year,s], l.mean = l.mean[year,s], l.sd =  l.sd[year,s],
        
        B0.p.h.mean =  B0.p.h.mean[year,s], B0.p.h.sd =  B0.p.h.sd[year,s], B1.p.h.mean =  B1.p.h.mean[year,s],
        B1.p.h.sd =   B1.p.h.sd[year,s], h.mean =  h.mean[year,s], h.sd =  h.sd[year,s],
        delta.a =  delta.a[year,s],delta.b =   delta.b[year,s]
       
      )
    }
    
    State.start <- array(NA, c(n.sites,n.weeks,n.sims)) #State initial values
    
    for(s in 1:n.sims){for(i in 1:n.sites){for(week in 1:n.weeks){
      State.start[i,week,s] <- State[i,week,year,p,s] #max(yM[i,,week,y,p,s], na.rm = T)
    }}}
    
    #Initial values
    for(s in 1:n.sims){
      initial.values[[s]] <- function()list(State = State.start[,,s] , StateB = State.start[,1,s])
    }
    
  }

  #Parameters monitored
  parameters.to.save <- c("B0.eps.l", "B1.eps.l", "B0.eps.h", "B1.eps.h", 
                          "B0.phi.h", "B1.phi.h","B0.gamma", "B1.gamma","B2.gamma",
                          "epsB.l", "epsB.h", "phiB.l", "phiB.h","g",
                          "B0.p.l", "B1.p.l", "B0.p.h", "B1.p.h", "alpha.l",
                          "alpha.h", "delta", "State.fin")
  
  #settings
  n.burnin <- 1000
  n.iter <- 10000 
  n.chains <- n.chains
  n.thin <- 1

  ###### 2c. Run JAGS #####
  if(year == 2){
    #Running the model
    for(s in 1:n.sims){
      outs[s]<- paste("out", s, sep = "_")
      assign(outs[s],
             jagsUI::jags(data = my.data[[s]],inits = initial.values[[s]],
                          parameters.to.save = parameters.to.save, model.file = "Flower_datM_est1.txt",
                          n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
    }
  }else{
  
    for(s in 1:n.sims){
      outs[s]<- paste("out", s, sep = "_")
      assign(outs[s],
             jagsUI::jags(data = my.data[[s]],inits = initial.values[[s]],
                          parameters.to.save = parameters.to.save, model.file = "Flower_datM_est2.txt",
                          n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
    }
  }
  
  #--------------------------------------------------------------------------------#
  #### 3. Decision for next year ####
  
  ###### 3a. Save data from MCMC  #####
  for(s in 1:n.sims){ 
    
    outputs[s]<- paste("output", s, sep = "_")
    assign(outputs[s], 
           as.data.frame((get(outs[s]))$summary))
    
    assign(outputs[s], 
           cbind(get(outputs[s]), param = rownames(get(outputs[s]))))
    
    assign(outputs[s], cbind(get(outputs[s]),
                             sim = rep(s, length(get(outputs[s])[,1]))))
    
  }
  
  cbind.res <- get(outputs[1])
  
  for(s in 2:n.sims){
    cbind.res <- rbind(cbind.res, get(outputs[s]))
  }
  
  #Save mcmcs
  for(s in 1:n.sims){
    mcmcs[s]<- paste("mcmc", s, sep = "_")
    assign(mcmcs[s], get(outs[s])$samples)
  }
  
  #parameter results:
  cbind.res.parameters <- cbind.res %>% filter(param %in% parameters.to.save)
  
  truth.params <- c(B0.eps.l[p], B1.eps.l[p], B0.eps.h[p], B1.eps.h[p], B0.phi.h[p], B1.phi.h[p],
                    B0.gamma[p], B1.gamma[p],B2.gamma[p], epsB.l[p], epsB.h[p], phiB.l[p], phiB.h[p], g[p],
                    B0.p.l[p], B1.p.l[p], B0.p.h[p], B1.p.h[p], alpha.l[p],alpha.h[p], delta[p])
  
  cbind.res.parameters$truth <- rep(truth.params, n.sims)
  colnames(cbind.res.parameters)[c(3,7)] <- c("low", "high")
  res.params[[year]] <- cbind.res.parameters
  res.params[[year]]$year <- year
  
  #state results:
  cbind.res.state<- cbind.res %>% filter(str_detect(param, '^S'))
  
  truth.state <- State[,5,year,p,1]
  
  for(s in 2:n.sims){
    truth.state <- c(truth.state, State[,5,year,p,s])
  }
  
  cbind.res.state$Segment <- as.numeric(gsub("\\D", "", cbind.res.state$param))
  
  cbind.res.state$truth <- truth.state 
  colnames(cbind.res.state)[c(3,7)] <- c("low", "high")
  cbind.res.state$nobs <- NA
  Y.nobs <- yM[,,,year,p,]
  Y.nobs[is.na(Y.nobs)] <- 0
  Y.nobs[Y.nobs > 0] <- 1
  
  Y.num.site <- array(NA, c(n.sites, n.sims))
  
  for(i in 1:n.sites){
    for(s in 1:n.sims){
      Y.num.site[i,s] <- sum(Y.nobs[i,1:n.occs, 1:n.weeks,s])
    }
  }
  
  cbind.res.state$nobs <- c(Y.num.site)
  
  res.state[[year]] <- cbind.res.state
  res.state[[year]]$year <- year

  for(s in 1:n.sims){
    for(par in 1:length(unique(cbind.res.parameters$param))){
      MCMCtrace(get(mcmcs[s]),
                params = unique(cbind.res.parameters$param[par]),
                type = 'both',
                ind = TRUE,
                pdf = TRUE,
                open_pdf = FALSE,
                filename = paste0(res,'/densplots/trace',unique(cbind.res.parameters$param[par]),'_sim', s, '_year', year))
    }
  }
  
  
  ###### 3b. Make Decision #####
  S.decision <- array(NA, c(n.sites, n.years, n.sims))
  
  if(year < n.years){
    for(s in 1:n.sims){
      #Removal locations: rank sites by state
      S.decision[,year,s] <- as.vector(t(res.state[[year]] %>% filter(sim == s) %>% select(mean)))
      sites.rem.M[,1,year+1,p,s] <- order(S.decision[,year,s], decreasing = T)
      
    }
  }
  
  
} #End Simulations  
#################################################################################################
end.time <- Sys.time()
time.taken <- end.time - start.time

##### plots #####
ggplot(res.params[[2]]) +
  geom_point(mapping = aes(x = sim, y = mean, col = as.factor(sim)))+
  geom_errorbar(aes(x = sim, ymin = low, ymax = high, col = as.factor(sim)))+
  geom_point(data=res.params[[2]], aes(x = sim, y = truth),color = "black", shape = 22) +
  facet_wrap(~param, scales = "free") +
  xlab("Simulation")+ylab("State") + 
  guides(color = guide_legend(title = "Simulation"))   

ggplot(res.params[[year]]) +
  geom_point(mapping = aes(x = sim, y = mean, col = as.factor(sim)))+
  geom_errorbar(aes(x = sim, ymin = low, ymax = high, col = as.factor(sim)))+
  geom_point(data=res.params[[year]], aes(x = sim, y = truth),color = "black", shape = 22) +
  facet_wrap(~param, scales = "free") +
  xlab("Simulation")+ylab("State") + 
  guides(color = guide_legend(title = "Simulation"))   

ggplot(res.params[[year]]) +
  geom_point(mapping = aes(x = param, y = Rhat, col = as.factor(sim)))+
  geom_hline(yintercept = 1.1, color = 'red')

#### parameters through time ####
res.par.df <- rbind(res.params[[2]], res.params[[3]], res.params[[4]],
                    res.params[[5]], res.params[[6]], res.params[[7]],
                    res.params[[8]], res.params[[9]], res.params[[10]])

max(res.par.df$Rhat)

res.par.df2 <- res.par.df %>% select(low, mean, high, sim,  year, param)
res.par.df2 <- res.par.df2 %>% arrange(param)

p <- which(apply(params, 1, function(x) return(all(x == c(3,3,3,3,3,3))))) #bad invasion but good management

truth.params <- c(alpha.h[p], alpha.l[p], B0.eps.h[p], B0.eps.l[p], B0.gamma[p], B0.p.h[p],B0.p.l[p],
                  B0.phi.h[p], B1.eps.h[p], B1.eps.l[p], B1.gamma[p], B1.p.h[p], B1.p.l[p], B1.phi.h[p],
                  B2.gamma[p], delta[p], epsB.h[p], epsB.l[p], g[p], phiB.h[p], phiB.l[p])  

parms.list <- unique(res.par.df2$param)
truth.params.df <- data.frame(param = parms.list, truth = truth.params)
truth.params.df <- truth.params.df %>% arrange(param)

mean.par <- array(NA, c(n.years- 1, length(parms.list)))
low.par <- array(NA, c(n.years- 1, length(parms.list)))
high.par <- array(NA, c(n.years- 1, length(parms.list)))

for(y in 2:n.years){
  for(par in 1:length(parms.list)){
    vec1 <- c(t(res.par.df2 %>% filter(year == y, param == parms.list[par]) %>% select(low)))
    vec2 <- c(t(res.par.df2 %>% filter(year == y, param == parms.list[par]) %>% select(mean)))
    vec3 <- c(t(res.par.df2 %>% filter(year == y, param == parms.list[par]) %>% select(high)))
    low.par[y-1,par] <- min(vec1)
    mean.par[y-1,par] <- mean(vec2)
    high.par[y-1,par] <- max(vec3)
  }
}

low.df <- adply(low.par, c(1,2))
mean.df <- adply(mean.par, c(1,2))
high.df <- adply(high.par, c(1,2))

res.par.df.summary <- data.frame(year = as.numeric(low.df$X1)+1,
                                 par = low.df$X2, low = low.df$V1,
                                 mean = mean.df$V1, high = high.df$V1)

truth.vals <- rep(truth.params.df$truth, each = 9)
res.par.df.summary$truth <- truth.vals
res.par.df.summary$param <- rep(parms.list, each = 9)

y1.prior.mean <- c(0,0,0,0,0,
                   0,0,0,0,0,
                   0,0,0,0,0,
                   .5,.5,.5,.5,.5,.5)

y1.prior.low <- c(-2.6,-2.6,-2.6,-2.6,-2.6,
                  -2.6,-2.6,-2.6,-2.6,-2.6,
                  -2.6,-2.6,-2.6,-2.6,-2.6,
                  .1,.1,.1,.1,.1,.1)

y1.prior.high <- c(2.6,2.6,2.6,2.6,2.6,
                   2.6,2.6,2.6,2.6,2.6,
                   2.6,2.6,2.6,2.6,2.6,
                   .9,.9,.9,.9,.9,.9)

res.par.df.summary <- res.par.df.summary %>% arrange(year)

y1.priors <- data.frame(year = rep(1, 21),
                        par = seq(1,21),
                        low = y1.prior.low,
                        mean = y1.prior.mean,
                        high = y1.prior.high, 
                        truth = truth.params.df$truth,
                        param = truth.params.df$param)

res.par.df.summary <- rbind(y1.priors, res.par.df.summary)

ggplot(res.par.df.summary) + 
  # geom_line(aes(x = year, y = low), color = 'grey70', size = 1) +
  # geom_line(aes(x = year, y = high), color = 'grey70', size = 1) +
  geom_ribbon(aes(x = year, ymin = low, ymax = high), fill = 'grey70', alpha = 0.8)+
  geom_point(aes(x = year, y = mean), color = 'black', size = 0.5) +
  geom_line(aes(x = year, y = mean), color = 'black', size = 1) +
  geom_point(aes(x = year, y = truth), color = 'red', size = 0.5)+
  scale_x_continuous(breaks=c(1,5,10))+
  facet_wrap(~param, scales = "free")


##### Estimated State #####
num.col <- length(unique(res.state[[year]]$nobs))+1

my_colors <- RColorBrewer::brewer.pal(num.col + 1, "YlOrRd")[2:num.col]

ggplot(res.state[[year]]) +
  geom_point(mapping = aes(x = sim, y = mean, col = as.factor(nobs)))+
  scale_color_manual(values = my_colors)+
  geom_errorbar(aes(x = sim, ymin = low, ymax = high, col = as.factor(nobs)), width = 0.5)+
  geom_point(data=res.state[[year]], aes(x = sim, y = truth), color = "black", shape = 22) +
  scale_x_continuous(breaks=seq(1,n.sims,1))+
  facet_wrap(~Segment, scales = "free",labeller = label_both)  +
  xlab("Simulation")+ylab("State") + 
  guides(color = guide_legend(title = "Number of observations")) 

#### Relative bias- state ####
mean.state <- array(NA, c(n.years,n.sites,n.sims))
true.state <- array(NA, c(n.years,n.sites,n.sims))
state.bias <- array(NA, c(n.years,n.sites,n.sims))

for(year in 2:n.years){
  for(s in 1:n.sims){
    for(i in 1:n.sites){
      mean.state[year,i,s] <- as.numeric(res.state[[year]] %>% filter(Segment == i & sim == s) %>% select(mean))
      true.state[year,i,s] <- as.numeric(res.state[[year]] %>% filter(Segment == i & sim == s) %>% select(truth))
      state.bias[year,i,s] <- ((mean.state[year,i,s])-(true.state[year,i,s]))/(true.state[year,i,s])
      
    }
  }
}

bias.state.df <- adply(state.bias, c(1,2,3))
colnames(bias.state.df) <- c("year", "site", "sim", "rel.bias") 
bias.state.df$year <- as.numeric(bias.state.df$year)
bias.state.df$site<- as.numeric(bias.state.df$site)
bias.state.df$sim <- as.numeric(bias.state.df$sim)
bias.state.df <- bias.state.df %>% filter(year > 1)

#### Relative bias- param ####
p.list <- c(t(res.params[[year]] %>% filter(sim == s) %>% select(param)))
n.params <- length(p.list)

mean.param <- array(NA, c(n.years,n.params, n.sims))
true.param <- array(NA, c(n.years,n.params, n.sims))
param.bias <- array(NA, c(n.years,n.params, n.sims))

for(year in 2:n.years){
  for(par in 1:n.params){
    # for(s in 1:n.sims){
    mean.param[year,par,] <- c(t((res.params[[year]] %>% filter(param == p.list[par]) %>% select(mean))))
    true.param[year,par,] <- c(t((res.params[[year]] %>% filter(param == p.list[par]) %>% select(mean))))
    param.bias[year,par,] <- ((mean.param[year,par,])-(true.param[year,par,]))/(true.param[year,par,])
    
    #}
  }
}

bias.param.df <- adply(param.bias, c(1,2,3))
colnames(bias.param.df) <- c("year", "param", "sim", "rel.bias") 
bias.param.df$year <- as.numeric(bias.param.df$year)
bias.param.df$sim <- as.numeric(bias.param.df$sim)
bias.param.df <- bias.param.df %>% filter(year > 1)
bias.param.df$param<- rep(p.list, each = (n.years-1), times = n.sims)

#### CI coverage- state ####
low.state <- array(NA, c(n.years,n.sites,n.sims))
high.state <- array(NA, c(n.years,n.sites,n.sims))
CI.state <- array(NA, c(n.years,n.sites,n.sims))

for(year in 2:n.years){
  for(s in 1:n.sims){
    low.state[year,,s] <- c(t((res.state[[year]] %>% filter(sim == s) %>% select(low))))
    high.state[year,,s] <- c(t(res.state[[year]] %>% filter(sim == s) %>% select(high)))
    
    for(i in 1:n.sites){
      CI.state[year,i,s] <- ifelse(low.state[year,i,s] <= true.state[year,i,s] & 
                                     true.state[year,i,s] <= high.state[year,i,s], 1, 0)
      
    }
  }
}

CI.state.df <- adply(CI.state, c(1,2,3))
colnames(CI.state.df) <- c("year", "site", "sim", "CI.coverage") 
CI.state.df$year <- as.numeric(CI.state.df$year)
CI.state.df$site<- as.numeric(CI.state.df$site)
CI.state.df$sim <- as.numeric(CI.state.df$sim)
CI.state.df <- CI.state.df %>% filter(year > 1)

#### CI coverage -parameters ####
n.params <- length(unique(res.params[[2]]$param))
low.param <- array(NA, c(n.years,n.params,n.sims))
high.param <- array(NA, c(n.years,n.params,n.sims))
CI.param <- array(NA, c(n.years,n.params,n.sims))

for(year in 2:n.years){
  for(s in 1:n.sims){
    low.param[year,,s] <- c(t(res.params[[year]] %>% filter(sim == s) %>% select(low)))
    high.param[year,,s] <- c(t(res.params[[year]] %>% filter(sim == s) %>% select(high)))
    for(p in 1:n.params){
      CI.param[year,p,s] <- ifelse(low.param[year,p,s] <= truth.params[p] & 
                                     truth.params[p] <= high.param[year,p,s], 1, 0)
      
    }
  }
}

CI.param.df <- adply(CI.param, c(1,2,3))
colnames(CI.param.df) <- c("year", "param", "sim", "CI.coverage") 
bias.param.df$year <- as.numeric(bias.param.df$year)
bias.param.df$sim <- as.numeric(bias.param.df$sim)
bias.param.df <- bias.param.df %>% filter(year > 1)
bias.param.df$param<- rep(p.list, each = (n.years-1), times = n.sims)

#### Distance Traveled ####
p <- which(apply(params, 1, function(x) return(all(x == c(3,3,3,3,3,3))))) #bad invasion but good management

dist.travel <- adply(d.traveled[1:4,1:n.years, p, 1:n.sims], c(1,2,3))
colnames(dist.travel) <- c("week", "year", "sim", "distance")
dist.travel$week <- as.numeric(dist.travel$week)
dist.travel$year <- as.numeric(dist.travel$year)
dist.travel$sim <- as.numeric(dist.travel$sim)

#### Sites visited ####
site.visit <- adply(rem.vec[1:n.sites, 1:4,1:n.years, p, 1:n.sims], c(1,2,3,4))
colnames(site.visit) <- c("site", "week", "year", "sim", "visit")
site.visit$site <- as.numeric(site.visit$site)
site.visit$week <- as.numeric(site.visit$week)
site.visit$year <- as.numeric(site.visit$year)
site.visit$sim <- as.numeric(site.visit$sim)

#replace Nas with 3
site.visit$visit[is.na(site.visit$visit)] <- 3
site.visit$visit <- as.numeric(site.visit$visit)

#replace 1s with 2 (means we visited and removed)
site.visit$visit[site.visit$visit == 1] <- 2

#replace 0s with 1 (means we visit but didnt remove
site.visit$visit[site.visit$visit == 0] <- 1

#replace 3s with 0 (means we did not visit)
site.visit$visit[site.visit$visit == 3] <- 0

#### Observation Data ####
yM.dat <- adply(yM[1:n.sites,1:n.occs, 1:4,1:n.years, p, 1:n.sims], c(1,2,3,4,5))
colnames(yM.dat) <- c("site", "occasion", "week", "year", "sim", "observation")
yM.dat$site <- as.numeric(yM.dat$site)
yM.dat$occasion <- as.numeric(yM.dat$occasion)
yM.dat$week <- as.numeric(yM.dat$week)
yM.dat$year <- as.numeric(yM.dat$year)
yM.dat$sim <- as.numeric(yM.dat$sim)
yM.dat$observation <- as.numeric(yM.dat$observation)

#### True State ####
S.dat <- adply(State[1:n.sites,1:5,1:n.years, p, 1:n.sims], c(1,2,3,4))
colnames(S.dat) <- c("site", "week", "year", "sim", "state")
S.dat$site <- as.numeric(S.dat$site)
S.dat$week <- as.numeric(S.dat$week)
S.dat$year <- as.numeric(S.dat$year)
S.dat$sim <- as.numeric(S.dat$sim)
S.dat$state <- as.numeric(S.dat$state)

#### SAVE CSVS ####
a <- 4
#1. parameters
res.par.df$a <- a
file_name = paste(path, 'params.csv',sep = '/')
write.csv(res.par.df,file_name)

#2. states
res.states.df <- rbind(res.state[[2]],res.state[[3]],
                       res.state[[4]],res.state[[5]],
                       res.state[[6]],res.state[[7]],
                       res.state[[8]],res.state[[9]],
                       res.state[[10]])

res.states.df$a <- a
file_name = paste(path, 'states.csv',sep = '/')
write.csv(res.states.df,file_name)

#3. rel.bias.state
bias.state.df$a <- a
file_name = paste(path, 'bias_states.csv',sep = '/')
write.csv(bias.state.df,file_name)

#4. rel.bias.param
bias.param.df$a <- a
file_name = paste(path, 'bias_param.csv',sep = '/')
write.csv(bias.param.df,file_name)

#5. CI.state
CI.state.df$a <- a
file_name = paste(path, 'CI_state.csv',sep = '/')
write.csv(CI.state.df,file_name)

#6. CI.param
CI.param.df$a <- a
file_name = paste(path, 'CI_param.csv',sep = '/')
write.csv(CI.param.df,file_name)

#7. distance traveled
dist.travel$a <- a
file_name = paste(path, 'dist_travel.csv',sep = '/')
write.csv(dist.travel,file_name)

#8. sites visited
site.visit$a <- a
file_name = paste(path, 'site_visit.csv',sep = '/')
write.csv(site.visit,file_name)

#9. y.dat
yM.dat$a <- a
file_name = paste(path, 'yM_dat.csv',sep = '/')
write.csv(yM.dat,file_name)

#10. S.dat
S.dat$a <- a
file_name = paste(path, 'S_truthdat.csv',sep = '/')
write.csv(S.dat,file_name)

#11 time.taken
file_name = paste(path, 'time.txt',sep = '/')
write.table(time.taken,file_name)
