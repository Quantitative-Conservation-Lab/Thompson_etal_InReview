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

##### Initial True State #####
#first 5 sites are highly invaded, then next 5 sites are low abundance, then none
State[1:5,1,1,] <- 3 #n.states
State[6:10,1,1,] <- 2
State[11:20,1,1,] <- 1
year <- 1

##### Week 1 observations #####
for(s in 1:n.sims){
  for(i in 1:5){
    Obs.multi[i,1,year,s] <- rcat(1,po_multi[State[i,1,year,s], ])
  }
}

site.rem.sim1.year1 <- list()
site.rem.sim1.year2 <- list()
site.rem.sim1.year3 <- list()
site.rem.sim1.year4 <- list()
site.rem.sim1.year5 <- list()

site.rem.sim2.year1 <- list()
site.rem.sim2.year2 <- list()
site.rem.sim2.year3 <- list()
site.rem.sim2.year4 <- list()
site.rem.sim2.year5 <- list()

sites.year <- array(NA, dim = c(n.year, n.sims))

sites.year[,1] <- c("site.rem.sim1.year1", 
                    "site.rem.sim1.year2",
                    "site.rem.sim1.year3",
                    "site.rem.sim1.year4", 
                    "site.rem.sim1.year5")

sites.year[,2] <- c("site.rem.sim2.year1", 
                    "site.rem.sim2.year2",
                    "site.rem.sim2.year3",
                    "site.rem.sim2.year4", 
                    "site.rem.sim2.year5")

for(s in 1:n.sims){
  assign(sites.year[year,s][[1]], which(Obs.multi[1:5,1,1,s] > 1))
}

##### Week 2 year 1 #####

ps<- array(NA, c(n.states,n.sites,n.weeks, n.states)) #state transition array

gamma <- array(NA, c(n.sites,n.weeks,n.year,n.sims)) #invasion
gamma0 <- -2 #intrinsic invasion
gamma1 <- 0.5 #effect of neighboring locations on invasion probability


#filling in transitions for second week, year 1
week <- 2

for(s in 1:n.sims){
  for(i in 1:(n.sites)){  
    
    gamma[i,1,year,s] <- invlogit(gamma0 + gamma1) #invasion probability
    
    ps[1,i,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
    ps[1,i,1,2] <- gamma[i,1,year,s] #empty to low abundance
    ps[1,i,1,3] <- 0
    
    if(i %in% get(sites.year[year,s][[week-1]])){
      ps[2,i,1,1] <- eps.l #low abundance to empty
      ps[2,i,1,2] <- (1- eps.l*(1-phi.lh)) #low abundance to low abundance
      ps[2,i,1,3] <- (1- eps.l*(phi.lh)) #low abundance to high abundance
    
      ps[3,i,1,1] <- (eps.h) #high abundance to empty
      ps[3,i,1,2] <- (1- eps.h)*(1-phi.hh) #high abundance to low abundance
      ps[3,i,1,3] <- (1- eps.h)*(phi.hh) #high abundance to high abundance
    }else{
      ps[2,i,1,1] <- 0 #low abundance to empty
      ps[2,i,1,2] <- (1-phi.lh) #low abundance to low abundance
      ps[2,i,1,3] <- (phi.lh) #low abundance to high abundance
      
      ps[3,i,1,1] <- 0
      ps[3,i,1,2] <- (1-phi.hh) #high abundance to low abundance
      ps[3,i,1,3] <- (phi.hh) #high abundance to high abundance
    }
    
    State[i,week,year,s] <- rcat(1,ps[State[i,week-1,year,s], i, week-1, ])

  }
  

  
}

#observation data for week 2
for(s in 1:n.sims){
  for(i in 6:11){
    Obs.multi[i,week,year,s] <- rcat(1,po_multi[State[i,week,year,s], ])
  }
}


#looking at sim 1
get(sites.year[year,1][[1]])

State[,1:2,year,1]
