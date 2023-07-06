library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(plyr)
library(tidyverse)
library(strex)

#### Data ####
n.sims <- 2 #simulations
eps.l <- 0.9 #eradication when at low state
eps.h <- 0.6 #eradication when at high state

phi.lh <- 0.1 #transition from low to high
phi.hh <- 0.6 #transition from high to high

p1.l <- 0.2 #detection probability (for multistate data)
p1.h <- 0.6 #detection probability (for multistate data)

p2.l <- 0.4 #detection probability (for multistate data)
p2.h <- 0.8 #detection probability (for multistate data)
delta <- 0.5
n.sites <- 20 #number of sites
n.rem <- n.sites
n.obs <- n.sites
n.weeks <- 4
n.year <- 5 #time steps
n.states <- 3


ps<- array(NA, c(n.states,n.sites,n.weeks, n.states)) #state transition array

gamma <- array(NA, c(n.sites,n.weeks,n.year,n.sims)) #invasion
gamma0 <- -2 #intrinsic invasion
gamma1 <- 0.5 #effect of neighboring locations on invasion probability

#transition probabilities
State <- array(NA, c(n.sites, n.weeks, n.year, n.sims))

# Observation probabilities 
Obs.multi <- array(NA, c(n.sites, n.weeks, n.year, n.sims))

#observation probabilities for multistate observation data
po_multi<- array(NA, c(n.states,n.states))
po_multi[1,1] <- 1
po_multi[1,2] <- 0
po_multi[1,3] <- 0

po_multi[2,1] <- 1-p2.l
po_multi[2,2] <- p2.l
po_multi[2,3] <- 0

po_multi[3,1] <- 1-p2.h
po_multi[3,2] <- (1-p2.h)*delta
po_multi[3,3] <- p2.h*delta

sites.rem <- array(NA, dim = c(5, n.weeks, n.year, n.sims))

segs.selected <- array(1:n.sites, dim = c(5, n.weeks))


##### Week 1 year 1 #####
#Initial True State 
#first 5 sites are highly invaded, then next 5 sites are low abundance, then none
State[1:5,1,1,] <- 3 #n.states
State[6:10,1,1,] <- 2
State[11:20,1,1,] <- 1
year <- 1
for(s in 1:n.sims){
  for(i in segs.selected[,1]){
    Obs.multi[i,1,year,s] <- rcat(1,po_multi[State[i,1,year,s], ])
  }
}


for(s in 1:n.sims){
  sites.rem[1:length(which(Obs.multi[1:5,1,year,s] > 1)), 1, year, s] <- which(Obs.multi[1:5,1,year,s] > 1)
}

# discard(sites.rem[,1,year,1], is.na)
# discard(sites.rem[,1,year,2], is.na)


##### Week 2+ year 1 #####

#filling in transitions for second week, year 1
for(s in 1:n.sims){
  for(week in 2:n.weeks){
    for(i in 1:(n.sites)){  
      ###### State Transitions ######
      gamma[i,week-1,year,s] <- invlogit(gamma0 + gamma1) #invasion probability
      
      ps[1,i,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
      ps[1,i,week-1,2] <- gamma[i,week-1,year,s] #empty to low abundance
      ps[1,i,week-1,3] <- 0
      
      #Transitions if in removal site locations
      if(i %in% discard(sites.rem[,week-1,year,s], is.na) ){
        ps[2,i,week-1,1] <- eps.l #low abundance to empty
        ps[2,i,week-1,2] <- (1- eps.l*(1-phi.lh)) #low abundance to low abundance
        ps[2,i,week-1,3] <- (1- eps.l*(phi.lh)) #low abundance to high abundance
      
        ps[3,i,week-1,1] <- (eps.h) #high abundance to empty
        ps[3,i,week-1,2] <- (1- eps.h)*(1-phi.hh) #high abundance to low abundance
        ps[3,i,week-1,3] <- (1- eps.h)*(phi.hh) #high abundance to high abundance
      }else{
        ps[2,i,week-1,1] <- 0 #low abundance to empty
        ps[2,i,week-1,2] <- (1-phi.lh) #low abundance to low abundance
        ps[2,i,week-1,3] <- (phi.lh) #low abundance to high abundance
        
        ps[3,i,week-1,1] <- 0
        ps[3,i,week-1,2] <- (1-phi.hh) #high abundance to low abundance
        ps[3,i,week-1,3] <- (phi.hh) #high abundance to high abundance
      }
      
      State[i,week,year,s] <- rcat(1,ps[State[i,week-1,year,s], i, (week-1), ])
  
    }
    
    ###### Observation data ######
    for(i in segs.selected[,week]){
      Obs.multi[i,week,year,s] <- rcat(1,po_multi[State[i,week,year,s], ])
    }
    
    ###### Sites for removal ######
    #if we have no sites for removal then we record that
    if(sum(Obs.multi[,week,year,s] > 1, na.rm = TRUE) == 0){
      sites.rem[1:5, week, year, s] <- rep(NA, 5)
    }else{
      sites.rem[1:length(which(Obs.multi[,week,year,s] > 1)), week, year, s] <- which(Obs.multi[,week,year,s] > 1)
    }
    
  }
}


#### JAGS MODEL ####



#### year 2 ####