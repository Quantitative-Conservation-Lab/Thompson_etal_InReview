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
path <- here::here("results", "test", "nocontrol")
res <- c('results/test/nocontrol') #subset of path for plot save

#### Management Strategy ####
load("parameters.RData")

#------------------------------------------------------------------------------#
#### Data and parameters ####
n.sims <-  10 #number of simulations per parameter set
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 52 #number of weeks
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
State <- array(NA,c(n.sites, n.weeks, n.years, n.params,n.sims)) #state array

#---Neighbor data---#
D <- array(NA, c(n.sites, n.weeks, n.years, n.params,n.sims)) #neighbors array
num.neighbors <- 2 #one upstream, one downstream
neighbors <- matrix(NA, nrow = n.sites, ncol = num.neighbors) #neighbors matrix, each row (site) identifies the neighbors for that site 
neighbors[1,1] <- 2 #site 1 only has site 2 as its neighbor 
neighbors[2:n.sites, 1] <- seq(1,n.sites-1) #filling in upstream neighbors
neighbors[n.sites,2] <- n.sites-1 #end site only has end site -1 as its neighbor
neighbors[1:(n.sites-1), 2] <- seq(2,n.sites) #filling in downstream neighbors
n.neighbors <- rep(2,n.sites)
n.neighbors[1] <- n.neighbors[n.sites] <- 1

start.time <- Sys.time()
####################################################################################
#### Run Simulation ####
p <- 16 #worst case scenario
p <- 49 #best case scenario
year <- 1
#n.years <- 2
for(p in 1:n.params){
for(year in 1:n.years){
  #--------------------------------------------------------------------------------#
  ### Steps: 
  #---1. Simulate the truth
  #---2. Simulate occupancy data collection (include removal data)
  #---3. Go back to step 1 and take into account removal that previously occurred into state process
  
  ##### Week 1 State model only #####
  week <- 1
  
  if(year == 1){
    State[,1,year,p, 1:n.sims] <- State.init #first week state is from data
  }else{
    for(s in 1:n.sims){
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,1,year,p,s] <- rcat(1,TPM[State[i,52,year-1,p,s], i, 52, year-1, p,s,]) 
      }
    }
  }
  
  for(s in 1:n.sims){
    for(i in 1:n.sites){
      D[i,1,year,p,s] <- sum(State[neighbors[i,], 1,year,p,s])/n.neighbors[i] #state of neighbors
    }
  }
    
  gamma[,1,year,p,] <-invlogit(gamma0[p] + gamma1[p]*site.char + gamma2[p]*D[,1,year,p,]) #invasion (week 1)
  eps.l[,1,year,p,] <- invlogit(eps0.l[p]) #eradication low (week 1)
  eps.h[,1,year,p,] <- invlogit(eps0.h[p]) #eradication high (week 1)
  phi.lh[,1,year,p,] <- invlogit(phi0.lh[p]) #transiotion low to high
  phi.hh[,1,year,p,] <- invlogit(phi0.hh[p]) #transition high to high
    
  # TPM used for week 2
  TPM[1,1:n.sites,1,year,p,,1] <- 1-gamma[,1,year,p,] #empty to empty (week 1)
  TPM[1,1:n.sites,1,year,p,,2] <- gamma[,1,year,p,] #empty to low (week 1)
  TPM[1,1:n.sites,1,year,p,,3] <- 0 #empty to high (week 1)
    
  TPM[2,1:n.sites,1,year,p,,1] <- eps.l[,1,year,p,] #low to empty (week 1)
  TPM[2,1:n.sites,1,year,p,,2] <- (1- eps.l[,1,year,p,])*(1-phi.lh[,1,year,p,]) #low to low (week 1)
  TPM[2,1:n.sites,1,year,p,,3] <- (1- eps.l[,1,year,p,])*(phi.lh[,1,year,p,]) #low to high (week 1)
    
  TPM[3,1:n.sites,1,year,p,,1] <- eps.h[,1,year,p,] #high to empty (week 1)
  TPM[3,1:n.sites,1,year,p,,2] <- (1- eps.h[,1,year,p,])*(1-phi.hh[,1,year,p,]) #high to low (week 1)
  TPM[3,1:n.sites,1,year,p,,3] <- (1- eps.h[,1,year,p,])*(phi.hh[,1,year,p,]) #high to high (week 1)

  ###### Weeks 2-52 #####
  for(s in 1:n.sims){
  for(week in 2:12){
  #Between weeks: we need to project 48 weeks forward
    for(i in 1:n.sites){ #State process: state given previous state and transition probability
      State[i,week,year,p,s] <- rcat(1,TPM[State[i,week-1,year,p,s], i, week-1, year, p,s,]) 
    }
      
    for(i in 1:n.sites){ #state of neighbors
      D[i,week,year,p,s] <- sum(State[neighbors[i,], week,year,p,s])/n.neighbors[i] #state of neighbors
    }
    
    gamma[,week,year,p,s] <-invlogit(gamma0[p] + gamma1[p]*site.char + gamma2[p]*D[,week,year,p,s]) #invasion (week 1 year 1)
    eps.l[,week,year,p,s] <- invlogit(eps0.l[p]) #eradication low (week 1 year 1)
    eps.h[,week,year,p,s] <- invlogit(eps0.h[p]) #eradication high (week 1 year 1)
    phi.lh[,week,year,p,s] <- invlogit(phi0.lh[p]) #transiotion low to high
    phi.hh[,week,year,p,s] <- invlogit(phi0.hh[p]) #transition high to high
      
    # TPM used for next week
    TPM[1,1:n.sites,week,year,p,s,1] <- 1-gamma[,week,year,p,s] #empty to empty (week 1 year 1)
    TPM[1,1:n.sites,week,year,p,s,2] <- gamma[,week,year,p,s] #empty to low (week 1 year 1)
    TPM[1,1:n.sites,week,year,p,s,3] <- 0 #empty to high (week 1 year 1)
      
    TPM[2,1:n.sites,week,year,p,s,1] <- eps.l[,week,year,p,s] #low to empty (week 1 year 1)
    TPM[2,1:n.sites,week,year,p,s,2] <- (1- eps.l[,week,year,p,s])*(1-phi.lh[,week,year,p,s]) #low to low (week 1 year 1)
    TPM[2,1:n.sites,week,year,p,s,3] <- (1- eps.l[,week,year,p,s])*(phi.lh[,week,year,p,s]) #low to high (week 1 year 1)
      
    TPM[3,1:n.sites,week,year,p,s,1] <- eps.h[,week,year,p,s] #high to empty (week 1 year 1)
    TPM[3,1:n.sites,week,year,p,s,2] <- (1- eps.h[,week,year,p,s])*(1-phi.hh[,week,year,p,s]) #high to low (week 1 year 1)
    TPM[3,1:n.sites,week,year,p,s,3] <- (1- eps.h[,week,year,p,s])*(phi.hh[,week,year,p,s]) #high to high (week 1 year 1)

    }
    
    #Dormant period:
    State[1:n.sites,13:44,year,p,s] <-  State[1:n.sites,12,year,p,s]
    TPM[1,1:n.sites,44,year,p,s,] <- c(1,0,0) 
    TPM[2,1:n.sites,44,year,p,s,] <- c(0,1,0) 
    TPM[3,1:n.sites,44,year,p,s,] <- c(0,0,1) 

    for(week in 45:52){
      #Between weeks: we need to project 48 weeks forward
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,week,year,p,s] <- rcat(1,TPM[State[i,week-1,year,p,s], i, week-1, year, p,s,]) 
      }
      
      for(i in 1:n.sites){ #state of neighbors
        D[i,week,year,p,s] <- sum(State[neighbors[i,], week,year,p,s])/n.neighbors[i] #state of neighbors
      }
      
      gamma[,week,year,p,s] <-invlogit(gamma0[p] + gamma1[p]*site.char + gamma2[p]*D[,week,year,p,s]) #invasion (week 1 year 1)
      eps.l[,week,year,p,s] <- invlogit(eps0.l[p]) #eradication low (week 1 year 1)
      eps.h[,week,year,p,s] <- invlogit(eps0.h[p]) #eradication high (week 1 year 1)
      phi.lh[,week,year,p,s] <- invlogit(phi0.lh[p]) #transiotion low to high
      phi.hh[,week,year,p,s] <- invlogit(phi0.hh[p]) #transition high to high
      
      # TPM used for next week
      TPM[1,1:n.sites,week,year,p,s,1] <- 1-gamma[,week,year,p,s] #empty to empty (week 1 year 1)
      TPM[1,1:n.sites,week,year,p,s,2] <- gamma[,week,year,p,s] #empty to low (week 1 year 1)
      TPM[1,1:n.sites,week,year,p,s,3] <- 0 #empty to high (week 1 year 1)
      
      TPM[2,1:n.sites,week,year,p,s,1] <- eps.l[,week,year,p,s] #low to empty (week 1 year 1)
      TPM[2,1:n.sites,week,year,p,s,2] <- (1- eps.l[,week,year,p,s])*(1-phi.lh[,week,year,p,s]) #low to low (week 1 year 1)
      TPM[2,1:n.sites,week,year,p,s,3] <- (1- eps.l[,week,year,p,s])*(phi.lh[,week,year,p,s]) #low to high (week 1 year 1)
      
      TPM[3,1:n.sites,week,year,p,s,1] <- eps.h[,week,year,p,s] #high to empty (week 1 year 1)
      TPM[3,1:n.sites,week,year,p,s,2] <- (1- eps.h[,week,year,p,s])*(1-phi.hh[,week,year,p,s]) #high to low (week 1 year 1)
      TPM[3,1:n.sites,week,year,p,s,3] <- (1- eps.h[,week,year,p,s])*(phi.hh[,week,year,p,s]) #high to high (week 1 year 1)
      
    }
  } #ends sim loop
} #year loop 
} #parameter loop


#################################################################################################
#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

##### Plots #####
sum(State[,1,1,p,] == 3)
sum(State[,5,10,p,] == 3)
