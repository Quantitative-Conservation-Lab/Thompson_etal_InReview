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
path <- here::here("results", "test", "allyears")
res <- c('results/test/allyears') #subset of path for plot save

#### Management Strategy ####
search.hours <- search.hourss[1] #search effort
removal.hours <- removal.hourss[1] #removal hours
n.resource <- 20 #total hours per week
#rule = by highest estimated state

logsearch.effort <- log(search.hours) #log search effort
max.spent <- 2*search.hours + removal.hours[2] #max resources you could spend at a single site

#------------------------------------------------------------------------------#
#### Data and parameters ####
load("parameters.RData")
n.sims <-  10 #number of simulations per parameter set
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 4 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

#### Loading parameters ####
#if we have 3 layers use this (low, medium, high)
#params <- expand.grid(col = c(1,2,3),ste = c(1,2,3),nbr = c(1,2,3),gro = c(1,2,3),rem = c(1,2,3),det = c(1,2,3))

#if we have 2 layers use this (low, high)
params <- expand.grid(col = c(1,3),ste = c(1,3),nbr = c(1,3),gro = c(1,3),rem = c(1,3),det = c(1,3))
n.params <- length(params$col)
gamma0 <- gamma1 <- gamma2  <-  eps0.l <- eps0.h <- phi0.lh <- phi0.hh <-
  eps1.l <- eps1.h <- phi1.lh <- phi1.hh <- p0.l <- p0.h <- p1.l <- p1.h <- 
  alpha.l <- alpha.h <- delta <- rep(NA, n.params)

for(p in 1:n.params){
  gamma0[p] <- col1[[params[p,1]]]$gamma.0
  gamma1[p] <- ste2[[params[p,2]]]$gamma.1
  gamma2[p] <- nbr3[[params[p,3]]]$gamma.2
  
  eps0.l[p] <- gro4[[params[p,4]]]$eps.l0
  eps0.h[p] <- gro4[[params[p,4]]]$eps.h0
  phi0.lh[p] <- gro4[[params[p,4]]]$phi0.lhs
  phi0.hh[p] <- gro4[[params[p,4]]]$phi0.hhs
  
  eps1.l[p] <- rem5[[params[p,5]]]$eps.l1
  eps1.h[p] <- rem5[[params[p,5]]]$eps.h1
  phi1.lh[p] <- rem5[[params[p,5]]]$phi1.lhs
  phi1.hh[p] <- rem5[[params[p,5]]]$phi1.hhs
  
  p0.l[p] <- det6[[params[p,6]]]$p.l0
  p0.h[p] <- det6[[params[p,6]]]$p.h0
  p1.l[p] <- det6[[params[p,6]]]$p.l1
  p1.h[p] <- det6[[params[p,6]]]$p.h1
  alpha.l[p] <- det6[[params[p,6]]]$alpha.l
  alpha.h[p] <- det6[[params[p,6]]]$alpha.h
  delta[p] <- det6[[params[p,6]]]$delta
}

#### 48 week calculations ####
TPM.dormant <- array(0, c(n.states, n.states, n.params))
for(p in 1:n.params){
  diag(TPM.dormant[,,p]) <- 1
}

n.dormant <- 32 #number of weeks where plants are dormant
n.grow <- 48-n.dormant

TPM.grow <- array(NA, c(n.states, n.states, n.grow, n.params))
TPM.48 <- array(NA, c(n.states, n.states, n.params))

#---- arrays ----#
gamma <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))
eps.l <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))
eps.h <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))
phi.lh <- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))
phi.hh<- array(NA, c(n.sites, n.weeks, n.years,n.params, n.sims))

TPM<- array(NA, c(n.states,n.sites,n.weeks, n.years + 1,n.params,n.sims, n.states)) 

#---Habitat data---#
# effect of habitat quality on occupancy
site.char <- site.char
State.init <- State.init
State <- array(NA,c(n.sites, n.weeks, n.years+1, n.params,n.sims)) #state array

#---Neighbor data---#
D <- array(NA, c(n.sites, n.weeks, n.years+1, n.params,n.sims)) #neighbors array
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
pM.l <- invlogit(p0.l + p1.l*logsearch.effort + alpha.l) #low state detection 
pM.h <- invlogit(p0.h + p1.h*logsearch.effort + alpha.h) #high state detection 

P.datM <- array(NA, dim = c(n.states, n.params, n.states))
for(p in 1:n.params){
  P.datM[1,p,] <- c(1,0,0)
  P.datM[2,p,] <- c(1-pM.l[p], pM.l[p], 0)
  P.datM[3,p,] <- c(1-pM.h[p], 0, pM.h[p])
}

rem.vec <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims)) #removal sites array

start.time <- Sys.time()
####################################################################################
#### Run Simulation ####

year <- 1
#n.years <- 2
for(p in 1:n.params){
for(year in 1:n.years){
  #--------------------------------------------------------------------------------#
  #### 1. Simulate the truth ####
  
  ### Steps: 
  #---1. Simulate the truth
  #---2. Simulate occupancy data collection (include removal data)
  #---3. Go back to step 1 and take into account removal that previously occurred into state process
  
  ##### Week 1 State model only #####
  week <- 1
  ###### Week 1 year 1 #####
  if(year == 1){
    
    State[,1,year,p, 1:n.sims] <- State.init #first week state is from data
    
    for(s in 1:n.sims){
      for(i in 1:n.sites){
        D[i,1,1,p,s] <- sum(State[neighbors[i,], 1,1,p,s])/n.neighbors[i] #state of neighbors
      }
    }
    
    gamma[,1,1,p,] <-invlogit(gamma0[p] + gamma1[p]*site.char + gamma2[p]*D[,1,1,p,]) #invasion (week 1 year 1)
    eps.l[,1,1,p,] <- invlogit(eps0.l[p]) #eradication low (week 1 year 1)
    eps.h[,1,1,p,] <- invlogit(eps0.h[p]) #eradication high (week 1 year 1)
    phi.lh[,1,1,p,] <- invlogit(phi0.lh[p]) #transiotion low to high
    phi.hh[,1,1,p,] <- invlogit(phi1.lh[p]) #transition high to high
    
    # TPM used for week 2
    TPM[1,1:n.sites,1,1,p,,1] <- 1-gamma[,1,1,p,] #empty to empty (week 1 year 1)
    TPM[1,1:n.sites,1,1,p,,2] <- gamma[,1,1,p,] #empty to low (week 1 year 1)
    TPM[1,1:n.sites,1,1,p,,3] <- 0 #empty to high (week 1 year 1)
    
    TPM[2,1:n.sites,1,1,p,,1] <- eps.l[,1,1,p,] #low to empty (week 1 year 1)
    TPM[2,1:n.sites,1,1,p,,2] <- (1- eps.l[,1,1,p,])*(1-phi.lh[,1,1,p,]) #low to low (week 1 year 1)
    TPM[2,1:n.sites,1,1,p,,3] <- (1- eps.l[,1,1,p,])*(phi.lh[,1,1,p,]) #low to high (week 1 year 1)
    
    TPM[3,1:n.sites,1,1,p,,1] <- eps.h[,1,1,p,] #high to empty (week 1 year 1)
    TPM[3,1:n.sites,1,1,p,,2] <- (1- eps.h[,1,1,p,])*(1-phi.hh[,1,1,p,]) #high to low (week 1 year 1)
    TPM[3,1:n.sites,1,1,p,,3] <- (1- eps.h[,1,1,p,])*(phi.hh[,1,1,p,]) #high to high (week 1 year 1)
    
  } #ends year = 1 loop
  
  ###### Week 1 year >1 #####
  #for all years > 1 we need to project 48 weeks forward
  
  if(year > 1){
    for(s in 1:n.sims){
      
      
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,week,year,s] <- rcat(1,TPM.48[State[i,4,(year-1),s], ]) 
      }
      
      for(i in 1:n.sites){
        D[i,week,year,s] <- sum(State[neighbors[i,], week,year,s])/n.neighbors[i] #state of neighbors
      }
      
      #--- Data for the TPM for the next week: week 2 ---#
      #prev.rem.vec = vector of 0 and 1s indicating where removal previously occurred
      prev.rem.vec <- replace(rem.vec[,4,(year-1),s], is.na(rem.vec[,4,(year-1),s]), 0) 
      
      #invasion probability =  base invasion + effect of site habitat + effect of neighbor being invaded
      gamma[,week,year,s] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,week,year,s]) 
      
      # eradication probability = base + effect of previous removal (removal*removal hours)
      eps.l[,week,year,s] <- invlogit(eps.l0 + eps.l1*prev.rem.vec*removal.hours[2]) #low eradication 
      eps.h[,week,year,s] <- invlogit(eps.h0 + eps.h1*prev.rem.vec*removal.hours[2]) #high eradication
      
      #transition rates
      phi.lh[,week,year,s] <- invlogit(phi0.lh - phi1.lh*prev.rem.vec*removal.hours[2])
      phi.hh[,week,year,s] <- invlogit(phi0.hh - phi1.hh*prev.rem.vec*removal.hours[2])
      
      TPM[1,1:n.sites,week,year,s,1] <- 1-gamma[,week,year,s] #empty to empty
      TPM[1,1:n.sites,week,year,s,2] <- gamma[,week,year,s] #empty to low
      TPM[1,1:n.sites,week,year,s,3] <- 0 #empty to high
      
      TPM[2,1:n.sites,week,year,s,1] <- eps.l[,week,year,s] #low to empty (eradication)
      TPM[2,1:n.sites,week,year,s,2] <- (1- eps.l[,week,year,s])*(1-phi.lh[,week,year,s]) #low to low (eradication failure)
      TPM[2,1:n.sites,week,year,s,3] <- (1- eps.l[,week,year,s])*(phi.lh[,week,year,s]) #low to high 
      
      TPM[3,1:n.sites,week,year,s,1] <- eps.h[,week,year,s] #high to empty (eradication)
      TPM[3,1:n.sites,week,year,s,2] <- (1- eps.h[,week,year,s])*(1-phi.hh[,week,year,s]) #high to low 
      TPM[3,1:n.sites,week,year,s,3] <- (1- eps.h[,week,year,s])*(phi.hh[,week,year,s]) #high to high
      
    } #ends s loop
  } #ends year > 1 loop
  
  ##### Week 1+ State and Observation model #####
  for(s in 1:n.sims){
    for(week in 1:n.weeks){
      
      ###### State process ######
      if(week > 1){
        for(i in 1:n.sites){ #State process: state given previous state and transition probability
          State[i,week,year,p,s] <- rcat(1,TPM[State[i,week-1,year,p,s], i, week-1, year, p,s,]) 
        }
        
        for(i in 1:n.sites){ #state of neighbors
          D[i,week,year,p,s] <- sum(State[neighbors[i,], week,year,p,s])/n.neighbors[i] #state of neighbors
        }
        
        #--- Data for the TPM for the next week: week 2+ ---#
        #prev.rem.vec = vector of 0 and 1s indicating where removal previously occurred
        prev.rem.vec <- replace(rem.vec[,week-1,year,p,s], is.na(rem.vec[,week-1,year,p,s]), 0)
        
        #invasion probability =  base invasion + effect of site habitat + effect of neighbor being invaded
        gamma[,week,year,p,s] <-invlogit(gamma0[p] + gamma1[p]*site.char + gamma2[p]*D[,week,year,p,s]) 
        
        # eradication probability = base + effect of previous removal (removal*removal hours)
        eps.l[,week,year,p,s] <- invlogit(eps0.l[p] + eps1.l[p]*prev.rem.vec*removal.hours) #low eradication
        eps.h[,week,year,p,s] <- invlogit(eps0.h[p] + eps1.h[p]*prev.rem.vec*removal.hours) #high eradication
        
        #transition rates
        phi.lh[,week,year,p,s] <- invlogit(phi0.lh[p] - phi1.lh[p]*prev.rem.vec*removal.hours)
        phi.hh[,week,year,p,s] <- invlogit(phi0.hh[p] - phi1.hh[p]*prev.rem.vec*removal.hours)
        
        TPM[1,1:n.sites,week,year,p,s,1] <- 1-gamma[,week,year,p,s] #empty to empty
        TPM[1,1:n.sites,week,year,p,s,2] <- gamma[,week,year,p,s] #empty to low
        TPM[1,1:n.sites,week,year,p,s,3] <- 0 #empty to high
        
        TPM[2,1:n.sites,week,year,p,s,1] <- eps.l[,week,year,p,s] #low to empty (eradication)
        TPM[2,1:n.sites,week,year,p,s,2] <- (1- eps.l[,week,year,p,s])*(1-phi.lh[,week,year,p,s]) #low to low (eradication failure)
        TPM[2,1:n.sites,week,year,p,s,3] <- (1- eps.l[,week,year,p,s])*(phi.lh[,week,year,p,s]) #low to high
        
        TPM[3,1:n.sites,week,year,p,s,1] <- eps.h[,week,year,p,s] #high to empty (eradication)
        TPM[3,1:n.sites,week,year,p,s,2] <- (1- eps.h[,week,year,p,s])*(1-phi.hh[,week,year,p,s]) #high to low
        TPM[3,1:n.sites,week,year,p,s,3] <- (1- eps.h[,week,year,p,s])*(phi.hh[,week,year,p,s]) #high to high
        
        #week: Identify the sites where removal will occur 
        n.pre.visit <- length(which(rem.vec[,week-1,year,p,s] >= 0)) #number of sites that were sampled last week
        #put last weeks sampling sites at the end of the sampling queue 
        sites.rem.M[,week,year,p,s] <- c(sites.rem.M[,(week-1),year,p,s][-1:-n.pre.visit],
                                       sites.rem.M[,(week-1),year,p,s][1:n.pre.visit])
      } #week > 1
      
      #### START HERE ####
      ##### Observation process #######
      # Observation process: draw observation given current state
      
      for(i in sites.rem.M[,week,year,s]){ #order of sites where removal occurs
        
        #A. while we still have resources to spend:
        if(resource.total[week,year,s] < (n.resource- max.spent)){
          
          #1. first occasion occupancy data (1 = not detected, 2 = detected)
          yM[i,1,week, year, s] <- rcat(1, P.datM[State[i,week,year,s], ])
          
          #2. second occasion occupancy data
          #2a. if seen in first occasion, do not search again and remove the rush
          if(yM[i,1,week, year, s] > 1){ 
            yM[i,2, week,year, s] <- NA #no occupancy data because we did not need to search again
            rem.vec[i,week,year,s] <- 1 #notes that removal occurred that week at that site
            
            #Calculating resources used = resources already used + search hours + removal hours
            resource.total[week,year,s] <- resource.total[week,year,s] + search.hours + removal.hours[2]
            
          }else{
            #2b. If not seen the first occasion, we need to search again:
            #Second occasion occupancy data
            yM[i,2, week, year, s] <- rcat(1, P.datM[State[i,week,year,s], ])
            
            #2bi. If seen at the second occasion:
            if(yM[i,2, week, year, s] > 1){ #if seen (state observed > 1) the second time
              rem.vec[i,week,year,s] <- 1 #notes that removal occurred that week at that site
              
              #Calculating resources used = resources already used + 2*search hours + removal hours
              resource.total[week,year,s] <- resource.total[week,year,s] + 2*search.hours + removal.hours[2] #removal.hours[State[i,week,year,s]]
            } 
            
            #2bi. If we do not detect flowering rush during the second occasion:
            if(yM[i,2, week, year, s]==1){ #if not seen (state observed = 1)
              rem.vec[i,week,year,s] <- 0 #notes removal did not occur
              
              #Calculating resources used = resources already used + 2*search hours
              resource.total[week,year,s] <- resource.total[week,year,s] + 2*search.hours 
            } 
          }
          
          #B. if we do not have any more resources to spend:
        }else{
          yM[i,1:2, week, year, s] <- NA #no occupancy data
          rem.vec[i,week,year,s] <- NA #removal did not occur
        }
        
      } #ends site loop
    } #ends week loop
  } #ends sims loop  
  
}  
  
  #--------------------------------------------------------------------------------#
  ###### 3b. Make decision  #####
  ##---- making the decision for next year: ----##
  if(year < n.years){
    
    #Removal locations: rank sites by state
    for(s in 1:n.sims){
      sites.rem.M[,1,year+1,s] <- order(States.mean[,year,s], decreasing = T)
    }
    
  }else{
    #during the final year, we project the final state
    for(s in 1:n.sims){
      
      #simulating truth at the end
      for(i in 1:n.sites){
        State[i,1,year+1,s] <- rcat(1,TPM[State[i,4,year,s], i, 4, year, s,]) 
      }
      
      #estimating final state via results from estimation model
      for(i in 1:n.sites){
        D.est[i,s] <- sum(States.mean.round[neighbors[i,],year,s])/2 #state of neighbors
        
        gamma.est[i,s] <-invlogit(get(gamma.0.est[s])$mean + get(gamma.1.est[s])$mean*site.char[i] + get(gamma.2.est[s])$mean*D.est[i,s]) 
        eps.l.est[i,s] <- invlogit(get(eps.l0.est[s])$mean + get(eps.l1.est[s])$mean*rem.vec.dat[i,4,s]*removal.hours[2]) 
        eps.h.est[i,s] <- invlogit(get(eps.h0.est[s])$mean + get(eps.h1.est[s])$mean*rem.vec.dat[i,4,s]*removal.hours[2]) 
        phi.lh.est[i,s] <- invlogit(get(phi0.lh.est[s])$mean + get(phi1.lh.est[s])$mean*rem.vec.dat[i,4,s]*removal.hours[2])
        phi.hh.est[i,s] <- invlogit(get(phi0.hh.est[s])$mean + get(phi1.hh.est[s])$mean*rem.vec.dat[i,4,s]*removal.hours[2])
        
        
        TPM.est[1,i,s,1] <- 1-gamma.est[i,s]
        TPM.est[1,i,s,2] <- gamma.est[i,s]
        TPM.est[1,i,s,3] <- 0
        TPM.est[2,i,s,1] <- eps.l.est[i,s]
        TPM.est[2,i,s,2] <- (1- eps.l.est[i,s])*(1-phi.lh.est[i,s])
        TPM.est[2,i,s,3] <- (1- eps.l.est[i,s])*phi.lh.est[i,s] 
        TPM.est[3,i,s,1] <- eps.h.est[i,s]
        TPM.est[3,i,s,2] <- (1- eps.h.est[i,s])*(1-phi.hh.est[i,s])
        TPM.est[3,i,s,3] <- (1- eps.h.est[i,s])*phi.hh.est[i,s]
        
      }
      
      for(i in 1:n.sites){
        
        #if we visited the site for observation data
        if(!is.na(rem.vec[i,4,year,s])){ 
          S.end[i,s] <- max(yM[i,,4,year,s], na.rm = T) 
          
        }else{
          S.end[i,s] <- rcat(1,TPM.est[States.mean.round[i,year,s], i, s,]) 
        }
        
      } #sites loop
      
    } #sims loop
  } #final year loop
  
} #end adaptive management 

#################################################################################################
#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

##### Plots #####
ggplot(res.params[[1]]) +
  geom_point(mapping = aes(x = sim, y = mean, col = as.factor(sim)))+
  geom_errorbar(aes(x = sim, ymin = low, ymax = high, col = as.factor(sim)))+
  #scale_color_brewer(palette = "Dark2")+
  geom_point(data=res.params[[1]], aes(x = sim, y = truth),color = "black", shape = 22) +
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

time.taken


#### Relative bias ####
mean.state <- array(NA, c(n.years,n.sites,n.sims))
true.state <- array(NA, c(n.years,n.sites,n.sims))
rel.bias <- array(NA, c(n.years,n.sites,n.sims))

for(year in 1:n.years){
  for(s in 1:n.sims){
    for(i in 1:n.sites){
      mean.state[year,i,s] <- as.numeric(res.state[[year]] %>% filter(Segment == i & sim == s) %>% select(mean))
      true.state[year,i,s] <- as.numeric(res.state[[year]] %>% filter(Segment == i & sim == s) %>% select(truth))
      rel.bias[year,i,s] <- ((mean.state[year,i,s])-(true.state[year,i,s]))/(true.state[year,i,s])

    }
  }
}

mean(rel.bias[1,,], na.rm = T)
mean(rel.bias[2,,], na.rm = T)
mean(rel.bias[3,,], na.rm = T)
mean(rel.bias[4,,], na.rm = T)
mean(rel.bias[5,,], na.rm = T)
mean(rel.bias[6,,], na.rm = T)
mean(rel.bias[7,,], na.rm = T)


#### CI coverage ####
low.state <- array(NA, c(n.years,n.sites,n.sims))
high.state <- array(NA, c(n.years,n.sites,n.sims))
CI.cov <- array(NA, c(n.years,n.sites,n.sims))

for(year in 1:n.years){
  for(s in 1:n.sims){
    for(i in 1:n.sites){
      low.state[year,i,s] <- as.numeric(res.state[[year]] %>% filter(Segment == i & sim == s) %>% select(low))
      high.state[year,i,s] <- as.numeric(res.state[[year]] %>% filter(Segment == i & sim == s) %>% select(high))
      CI.cov[year,i,s] <- ifelse(low.state[year,i,s] <= true.state[year,i,s] & 
                                   true.state[year,i,s] <= high.state[year,i,s], 1, 0)
      
    }
  }
}

mean(CI.cov[1,,], na.rm = T)
mean(CI.cov[2,,], na.rm = T)
mean(CI.cov[3,,], na.rm = T)
mean(CI.cov[4,,], na.rm = T)
mean(CI.cov[5,,], na.rm = T)
mean(CI.cov[6,,], na.rm = T)
mean(CI.cov[7,,], na.rm = T)

#### CI coverage -parameters ####
n.params <- length(unique(res.params[[1]]$param))

low.param <- array(NA, c(n.years,n.params,n.sims))
high.param <- array(NA, c(n.years,n.params,n.sims))
CI.param <- array(NA, c(n.years,n.params,n.sims))

parms.list <- unique(res.params[[1]]$param)

for(year in 1:n.years){
  for(s in 1:n.sims){
    for(p in 1:n.params){
      low.param[year,p,s] <- as.numeric(res.params[[year]] %>% filter(param == parms.list[p] & sim == s) %>% select(low))
      high.param[year,p,s] <- as.numeric(res.params[[year]] %>% filter(param == parms.list[p] & sim == s) %>% select(high))
      CI.param[year,p,s] <- ifelse(low.param[year,p,s] <= truth.params[p] & 
                                   truth.params[p] <= high.param[year,p,s], 1, 0)
      
    }
  }
}

mean(CI.param[1,,], na.rm = T)
mean(CI.param[2,,], na.rm = T)
mean(CI.param[3,,], na.rm = T)
mean(CI.param[4,,], na.rm = T)
mean(CI.param[5,,], na.rm = T)
mean(CI.param[6,,], na.rm = T)
mean(CI.param[7,,], na.rm = T)

#### final states ####
mean(res.state[[1]]$mean)
mean(res.state[[1]]$truth)

mean(res.state[[year]]$mean)
mean(res.state[[year]]$truth)
