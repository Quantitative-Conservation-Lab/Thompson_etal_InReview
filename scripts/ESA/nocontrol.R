library(LaplacesDemon)
library(plyr)
library(tidyverse)

path <- here::here("results", "ESA", "nocontrol")
res <- c('results/ESA/nocontrol') #subset of path for plot save

#### Data ####
n.sims <- 50 #simulations
eps.l <- 0.9 #eradication when at low state
eps.h <- 0.7 #eradication when at high state

phi.lh <- 0.1 #transition from low to high
phi.hh <- 0.9 #transition from high to high

p2.l <- 0.6 #detection probability (for multistate data)
p2.h <- 0.9 #detection probability (for multistate data)
delta <- 0.5
n.sites <- 5 #number of sites
n.rem <- 3 #number of removal sites per week
n.obs <- 3
n.years <- 10 #time steps
n.states <- 3

ps<- array(NA, c(n.states,n.sites, n.states)) #state transition array

gamma <- array(NA, c(n.sites,n.years,n.sims)) #invasion
gamma0 <- -2 #intrinsic invasion
gamma1 <- 0.5 #effect of neighboring locations on invasion probability

#transition probabilities
State <- array(NA, c(n.sites, n.years, n.sims))

##### Year 1 #####
#Initial True State 
State[1,1,] <- 3 
State[2,1,] <- 3 
State[3,1,] <- 2 
State[4,1,] <- 2 
State[5,1,] <- 1 

D <- array(NA, c(n.sites,n.years,n.sims)) #neighbor states

#### Simulate #####
for(year in 2:n.years){
for(s in 1:n.sims){
  for(i in 1:(n.sites)){
  ##---- Transition from state 1 to other states ----##
    if(i %in% 2:(n.sites-1)){
      D[i,year-1,s] <- State[i+1,year-1,s] + State[i-1,year-1,s] 
      gamma[i,year-1,s] <- invlogit(gamma0 + gamma1*D[i,year-1,s]) #invasion probability
        
      ps[1,i,1] <- 1-gamma[i,year-1,s] #empty stay empty
      ps[1,i,2] <- gamma[i,year-1,s] #empty to low abundance
      ps[1,i,3] <- 0
      
      #edge transitions
    }else{
      D[1,year-1,s] <- State[2,year-1,s]
      D[n.sites,year-1,s] <- State[(n.sites-1),year-1,s]
        
      gamma[1,year-1,s] <- invlogit(gamma0 + gamma1*D[1,year-1,s])
      ps[1,1,1] <- 1-gamma[i,year-1,s] #empty stay empty
      ps[1,1,2] <- gamma[i,year-1,s]
      ps[1,1,3] <- 0
        
      gamma[n.sites,year-1,s] <- invlogit(gamma0 + gamma1*D[n.sites,year-1,s])
      ps[1,n.sites,1] <- 1-gamma[i,year-1,s] #empty stay empty
      ps[1,n.sites,2] <- gamma[i,year-1,s]
      ps[1,n.sites,3] <- gamma[i,year-1,s]
    }
  ##---- Transition from state 2 and 3 to other states ----##  
    ps[2,i,1] <- 0 #low abundance to empty
    ps[2,i,2] <- (1-phi.lh) #low abundance to low abundance
    ps[2,i,3] <- (phi.lh) #low abundance to high abundance
        
    ps[3,i,1] <- 0
    ps[3,i,2] <- (1-phi.hh) #high abundance to low abundance
    ps[3,i,3] <- (phi.hh) #high abundance to high abundance
      
    State[i,year,s] <- rcat(1,ps[State[i,year-1,s], i, ])
      
  }#site loop
  } #sims loop
} #year loop

#############################################################################
#### Results ####
#results for each sim
States.df <- adply(State, c(1,2,3))

colnames(States.df) <- c("site", "year", "sim", "state")              

file_name = paste(path, 'States_nocontrol.csv',sep = '/')
write.csv(States.df,file_name)


#mean across simulations
Mean.States.df <- aggregate(state ~ site+year,
          data = as.data.frame(States.df), FUN = mean)


file_name = paste(path, 'Mean.States_nocontrol.csv',sep = '/')
write.csv(Mean.States.df ,file_name)


