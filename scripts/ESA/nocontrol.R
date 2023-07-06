library(LaplacesDemon)
library(plyr)
library(tidyverse)

#### Data ####
n.sims <- 2 #simulations
eps.l <- 0.6 #erradication when at low state
eps.h <- 0.6 #erradication when at low state

phi.lh <- 0.1 #transition from low to high
phi.hh <- 0.6 #transition from high to high

n.sites <- 20 #number of sites
n.weeks <- 4 
n.year <- 10 #time steps
n.states <- 3

#transition probabilities
State <- array(NA, c(n.sites, n.weeks, n.year, n.sims))

##### Initial True State #####
#first 5 sites are highly invaded, then next 5 sites are low abnundance, then none
State[1:5,1,1,] <- 3 #n.states
State[6:10,1,1,] <- 2
State[11:20,1,1,] <- 1

ps<- array(NA, c(n.states,n.sites,n.weeks, n.states)) #state transition array

gamma <- array(NA, c(n.sites,n.weeks,n.year,n.sims)) #invasion
gamma0 <- -2 #intrinsic invasion
gamma1 <- 0.5 #effect of neighboring locations on invasion probability
D <- array(NA, c(n.sites,n.weeks, n.year,n.sims)) #neighbor states

year <- 1

#filling in transitions for first month, year 1

for(s in 1:n.sims){
  for(i in 2:(n.sites-1)){  #for all locations, not the edges
    D[i,1,year,s] <- State[i+1,1,year,s] + State[i-1,1,year,s] 
    
    gamma[i,1,year,s] <- invlogit(gamma0 + gamma1*D[i,1,year,s]) #invasion probability
    
    ps[1,i,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
    ps[1,i,1,2] <- gamma[i,1,year,s] #empty to low abundance
    ps[1,i,1,3] <- 0
    
    ps[2,i,1,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
    ps[2,i,1,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
    ps[2,i,1,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
    
    ps[3,i,1,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
    ps[3,i,1,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
    ps[3,i,1,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
    
  }
  
  #for edges location
  D[1,1,year,s] <- State[2,1,year,s]
  D[n.sites,1,year,s] <- State[(n.sites-1),1,year,s]
  
  gamma[1,1,year,s] <- invlogit(gamma0 + gamma1*D[1,1,year,s])
  ps[1,1,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
  ps[1,1,1,2] <- gamma[i,1,year,s]
  ps[1,1,1,3] <- 0
  
  ps[2,1,1,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
  ps[2,1,1,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
  ps[2,1,1,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
  
  ps[3,1,1,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
  ps[3,1,1,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
  ps[3,1,1,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
  
  gamma[n.sites,1,year,s] <- invlogit(gamma0 + gamma1*D[n.sites,1,year,s])
  ps[1,n.sites,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
  ps[1,n.sites,1,2] <- gamma[i,1,year,s]
  ps[1,n.sites,1,3] <- gamma[i,1,year,s]
  
  ps[2,n.sites,1,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
  ps[2,n.sites,1,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
  ps[2,n.sites,1,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
  
  ps[3,n.sites,1,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
  ps[3,n.sites,1,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
  ps[3,n.sites,1,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
  
}


####################################################################################
#### Run ####

for(year in 1:n.year){

#### 1. Simulate truth #####
##### 1b. Year 1+, month 1 ######
if(year > 1){
  for(s in 1:n.sims){
    for (i in 2:(n.sites-1)){
      # State process: 
      State[i,1,year,s] <- rcat(1,ps[State[i,n.weeks,year-1,s], i, n.weeks, ])
      State[1,1,year,s] <- rcat(1,ps[State[1,n.weeks,year-1,s], 1, n.weeks, ])
      State[n.sites,1,year,s] <- rcat(1,ps[State[n.sites,n.weeks,year-1,s], n.sites, n.weeks, ])
    }
    for (i in 2:(n.sites-1)){ 
      D[1,1,year,s] <- State[2,1,year,s]
      D[i,1,year,s] <- State[i-1,1,year,s] + State[i+1,1,year,s]
      D[n.sites,1,year,s] <- State[n.sites-1,1,year,s]
      
      #probability calculations
      gamma[i,1,year,s] <- invlogit(gamma0 + gamma1*D[i,1,year,s]) #invasion probability
      
      ps[1,i,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
      ps[1,i,1,2] <- gamma[i,1,year,s]
      ps[1,i,1,3] <- 0
      
      ps[2,i,1,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
      ps[2,i,1,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
      ps[2,i,1,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
      
      ps[3,i,1,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
      ps[3,i,1,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
      ps[3,i,1,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
      
      #probability calculations for edge
      gamma[1,1,year,s] <- invlogit(gamma0 + gamma1*D[1,1,year,s])
      ps[1,1,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
      ps[1,1,1,2] <- gamma[i,1,year,s] #empty to low abundance
      ps[1,1,1,3] <- 0
      
      ps[2,1,1,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
      ps[2,1,1,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
      ps[2,1,1,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
      
      ps[3,1,1,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
      ps[3,1,1,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
      ps[3,1,1,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
      
      gamma[n.sites,1,year,s] <- invlogit(gamma0 + gamma1*D[n.sites,1,year,s])
      ps[1,n.sites,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
      ps[1,n.sites,1,2] <- gamma[i,1,year,s] #empty to low abundance
      ps[1,n.sites,1,3] <- 0
      
      ps[2,n.sites,1,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
      ps[2,n.sites,1,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
      ps[2,n.sites,1,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
      
      ps[3,n.sites,1,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
      ps[3,n.sites,1,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
      ps[3,n.sites,1,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
    }
  }
} #ends year > 1 things

##### 1b. Months 1+ ####
# State transition
for(s in 1:n.sims){
  for (t in 2:n.weeks){ #12
    for (i in 2:(n.sites-1)){
      # State process: 
      State[i,t,year,s] <- rcat(1,ps[State[i,t-1,year,s], i, t-1, ])
      
      #Edge state process 
      State[1,t,year,s] <- rcat(1,ps[State[1,t-1,year,s], 1, t-1, ])
      State[n.sites,t,year,s] <- rcat(1,ps[State[n.sites,t-1,year,s], n.sites, t-1, ])
    }
    for (i in 2:(n.sites-1)){
      D[1,t,year,s] <- State[2,t,year,s]
      D[i,t,year,s] <- State[i-1,t,year,s] + State[i+1,t,year,s]
      D[n.sites,t,year,s] <- State[n.sites-1,t,year,s]
      
      #probability calculations
      gamma[i,t,year,s] <- invlogit(gamma0 + gamma1*D[i,t,year,s]) #invasion probability
      
      ps[1,i,t,1] <- 1-gamma[i,t,year,s] #empty stay empty
      ps[1,i,t,2] <- gamma[i,t,year,s] #empty to low abundance
      ps[1,i,t,3] <- 0
      
      ps[2,i,t,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
      ps[2,i,t,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
      ps[2,i,t,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
      
      ps[3,i,t,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
      ps[3,i,t,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
      ps[3,i,t,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
      
      #probability calculations for edge
      gamma[1,t,year,s] <- invlogit(gamma0 + gamma1*D[1,t,year,s])
      ps[1,1,t,1] <- 1-gamma[i,t,year,s] #empty stay empty
      ps[1,1,t,2] <- gamma[i,t,year,s] #empty to low abundance
      ps[1,1,t,3] <- 0
      
      ps[2,1,t,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
      ps[2,1,t,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
      ps[2,1,t,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
      
      ps[3,1,t,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
      ps[3,1,t,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
      ps[3,1,t,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
      
      gamma[n.sites,t,year,s] <- invlogit(gamma0 + gamma1*D[n.sites,t,year,s])
      ps[1,n.sites,t,1] <- 1-gamma[i,t,year,s] #empty stay empty
      ps[1,n.sites,t,2] <- gamma[i,t,year,s] #empty to low abundance
      ps[1,n.sites,t,3] <- 0
      
      ps[2,n.sites,t,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
      ps[2,n.sites,t,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
      ps[2,n.sites,t,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
      
      ps[3,n.sites,t,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
      ps[3,n.sites,t,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
      ps[3,n.sites,t,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
      
    }
    
  } #t
  
} #s
}

#final result
State[,4,n.year,]
