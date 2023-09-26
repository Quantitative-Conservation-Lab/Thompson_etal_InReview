library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)

start.time <- Sys.time()

#### Path Name ####
path <- here::here("results", "Multistate", "nocontrol")
res <- c('results/Multistate/nocontrol') 

#### Data and parameters ####
n.sims <-  2 #25 #100
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 4 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

eps.l0 <- 0.3 #base eradication at low state
eps.l1 <- 5 #effect of eradication at low state
eps.h0 <- 0.2 #base eradication at high state
eps.h1 <- 2 #effect of eradication at high state
gamma.0 <- 0.2 #intrinsic invasion probability
gamma.1 <- 0.2 #effect of site characteristics
gamma.2 <- 1 #effect of neighboring invasion state
phi.lh <- 0.1 #transition from low to high
phi.hh <- 0.8 #transition from high to high


#---Habitat data---#
# effect of habitat quality on occupancy
#set.seed(03222021)
#site.char <- runif(n.sites) 
#Loading habitat data:
path2 <- here::here("data")
file_name = paste(path2, 'Site_char_multi.csv',sep = '/')
# write.csv(site.char,file_name)
site.chardat <- read.csv(file_name)
site.char <- site.chardat[,2]


#---Initial state data---#
#Code that generated initial true state
# State.init <- rep(NA, n.sites)
# rate.init <- rep(NA, n.sites)
# occ.init <- rep(NA, n.sites)
# init.matrix <- array(NA, c(n.sites, n.states))
# for(i in 1:n.sites){
#   rate.init[i] <- mean(rbinom(100000,1,invlogit(gamma.0 + gamma.1*site.char[i]))) #invasion rate
#   p.high <- 0.5 #say the probability of being in high state is 0.5
# 
#   occ.init[i] <- round(mean(rbern(100000,rate.init[i]))) #being invaded or not
# 
#   init.matrix[i,1] <- (1-rate.init[i])*occ.init[i] + (1-occ.init[i]) #empty
#   init.matrix[i,2] <- (rate.init[i])*occ.init[i]*(1-p.high) #low state
#   init.matrix[i,3] <- (rate.init[i])*occ.init[i]*(p.high) #high state
# 
#   State.init[i] <- rcat(1,init.matrix[i,1:3])
# }

#write.csv(State.init,file_name)
path2 <- here::here("data") 
file_name = paste(path2, 'States_init_multi.csv',sep = '/')
State.init <- read.csv(file_name) #loading initial state data
State.init <- State.init[,2]
State <- array(NA,c(n.sites, n.weeks, n.years+1, n.sims)) #state array

#---Neighbor data---#
D <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #neighbors array
num.neighbors <- 2 #one upstream, one downstream
neighbors <- matrix(NA, nrow = n.sites, ncol = num.neighbors) #neighbors matrix, each row (site) identifies the neighbors for that site 
neighbors[1,1] <- 2 #site 1 only has site 2 as its neighbor 
neighbors[2:n.sites, 1] <- seq(1,n.sites-1) #filling in upstream neighbors
neighbors[n.sites,2] <- n.sites-1 #end site only has end site -1 as its neighbor
neighbors[1:(n.sites-1), 2] <- seq(2,n.sites) #filling in downstream neighbors

TPM<- array(NA, c(n.states,n.sites,n.weeks, n.years + 1,n.sims, n.states)) #state probability
gamma <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #invasion probability
eps.l <- array(NA, c(n.sites, n.weeks, n.years+1,n.sims)) #eradication at low state
eps.h <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #eradication at high state

#--- Initial removal sites ----#
#Removal does not occur in no control
sites.rem <- array(NA, dim = c(n.sites, n.weeks, n.years, n.sims))
rem.vec <- array(0, dim = c(n.sites, n.weeks, n.years, n.sims))
removal.hours <- 0

####################################################################################

year <- 1
#n.years <- 2

for(year in 1:n.years){
  #--------------------------------------------------------------------------------#
  #### 1. Simulate the truth ####
  
  ##### Week 1 State model only #####
  week <- 1
  if(year == 1){
    State[,1,year,1:n.sims] <- State.init #first week state is from data
    
    for(s in 1:n.sims){
      for(i in 1:n.sites){
        D[i,1,1,s] <- sum(State[neighbors[i,], 1,1,s])/2 #state of neighbors
      }
    }
    
    gamma[,1,1,] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,1,1,]) #invasion (week 1 year 1)
    eps.l[,1,1,] <- invlogit(eps.l0) #eradication low (week 1 year 1)
    eps.h[,1,1,] <- invlogit(eps.h0) #eradication high (week 1 year 1)
    
    # TPM used for week 2
    TPM[1,1:n.sites,1,1,,1] <- 1-gamma[,1,1,] #empty to empty (week 1 year 1)
    TPM[1,1:n.sites,1,1,,2] <- gamma[,1,1,] #empty to low (week 1 year 1)
    TPM[1,1:n.sites,1,1,,3] <- 0 #empty to high (week 1 year 1)
    
    TPM[2,1:n.sites,1,1,,1] <- eps.l[,1,1,] #low to empty (week 1 year 1)
    TPM[2,1:n.sites,1,1,,2] <- (1- eps.l[,1,1,])*(1-phi.lh) #low to low (week 1 year 1)
    TPM[2,1:n.sites,1,1,,3] <- (1- eps.l[,1,1,])*(phi.lh) #low to high (week 1 year 1)
    
    TPM[3,1:n.sites,1,1,,1] <- eps.h[,1,1,] #high to empty (week 1 year 1)
    TPM[3,1:n.sites,1,1,,2] <- (1- eps.h[,1,1,])*(1-phi.hh) #high to low (week 1 year 1)
    TPM[3,1:n.sites,1,1,,3] <- (1- eps.h[,1,1,])*(phi.hh) #high to high (week 1 year 1)
    
  } #ends year = 1 loop
  
  if(year > 1){
    for(s in 1:n.sims){
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,week,year,s] <- rcat(1,TPM[State[i,4,(year-1),s], i, 4, (year-1), s,]) 
      }
        
      for(i in 1:n.sites){
        D[i,week,year,s] <- sum(State[neighbors[i,], week,year,s])/2 #state of neighbors
      }
      
    #--- Data for the TPM for the next week: week 2 ---#
    
    #invasion probability =  base invasion + effect of site habitat + effect of neighbor being invaded
    gamma[,week,year,s] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,week,year,s]) 
    
    # eradication probability = base + effect of previous removal (removal*removal hours)
    eps.l[,week,year,s] <- invlogit(eps.l0 + eps.l1*prev.rem.vec*removal.hours) #low eradication 
    eps.h[,week,year,s] <- invlogit(eps.h0 + eps.h1*prev.rem.vec*removal.hours) #high eradication
    
    TPM[1,1:n.sites,week,year,s,1] <- 1-gamma[,week,year,s] #empty to empty
    TPM[1,1:n.sites,week,year,s,2] <- gamma[,week,year,s] #empty to low
    TPM[1,1:n.sites,week,year,s,3] <- 0 #empty to high
    
    TPM[2,1:n.sites,week,year,s,1] <- eps.l[,week,year,s] #low to empty (eradication)
    TPM[2,1:n.sites,week,year,s,2] <- (1- eps.l[,week,year,s])*(1-phi.lh) #low to low (eradication failure)
    TPM[2,1:n.sites,week,year,s,3] <- (1- eps.l[,week,year,s])*(phi.lh) #low to high 
    
    TPM[3,1:n.sites,week,year,s,1] <- eps.h[,week,year,s] #high to empty (eradication)
    TPM[3,1:n.sites,week,year,s,2] <- (1- eps.h[,week,year,s])*(1-phi.hh) #high to low 
    TPM[3,1:n.sites,week,year,s,3] <- (1- eps.h[,week,year,s])*(phi.hh) #high to high
    
    } #ends s loop
  } #ends year > 1 loop
  
  ##### Week 1+ State #####
  for(s in 1:n.sims){
    for(week in 2:n.weeks){
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,week,year,s] <- rcat(1,TPM[State[i,week-1,year,s], i, week-1, year, s,]) 
      }
        
      for(i in 1:n.sites){ #state of neighbors
        D[i,week,year,s] <- sum(State[neighbors[i,], week,year,s])/2 #state of neighbors
      }
        
      #--- Data for the TPM for the next week: week 2+ ---#
      #prev.rem.vec = vector of 0 and 1s indicating where removal previously occurred
      prev.rem.vec <- replace(rem.vec[,week-1,year,s], is.na(rem.vec[,week-1,year,s]), 0)
        
      #invasion probability =  base invasion + effect of site habitat + effect of neighbor being invaded
      gamma[,week,year,s] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,week,year,s]) 
        
      # eradication probability = base + effect of previous removal (removal*removal hours)
      eps.l[,week,year,s] <- invlogit(eps.l0 + eps.l1*prev.rem.vec*removal.hours) #low eradication
      eps.h[,week,year,s] <- invlogit(eps.h0 + eps.h1*prev.rem.vec*removal.hours) #high eradication
        
      TPM[1,1:n.sites,week,year,s,1] <- 1-gamma[,week,year,s] #empty to empty
      TPM[1,1:n.sites,week,year,s,2] <- gamma[,week,year,s] #empty to low
      TPM[1,1:n.sites,week,year,s,3] <- 0 #empty to high
        
      TPM[2,1:n.sites,week,year,s,1] <- eps.l[,week,year,s] #low to empty (eradication)
      TPM[2,1:n.sites,week,year,s,2] <- (1- eps.l[,week,year,s])*(1-phi.lh) #low to low (eradication failure)
      TPM[2,1:n.sites,week,year,s,3] <- (1- eps.l[,week,year,s])*(phi.lh) #low to high
        
      TPM[3,1:n.sites,week,year,s,1] <- eps.h[,week,year,s] #high to empty (eradication)
      TPM[3,1:n.sites,week,year,s,2] <- (1- eps.h[,week,year,s])*(1-phi.hh) #high to low
      TPM[3,1:n.sites,week,year,s,3] <- (1- eps.h[,week,year,s])*(phi.hh) #high to high
        
      #week: Identify the sites where removal will occur 
      n.pre.visit <- length(which(rem.vec[,week-1,year,s] >= 0)) #number of sites that were sampled last week
      #put last weeks sampling sites at the end of the sampling queue 
      sites.rem[,week,year,s] <- c(sites.rem[,(week-1),year,s][-1:-n.pre.visit],
                                     sites.rem[,(week-1),year,s][1:n.pre.visit])
    }
  } #ends sims loop  

}

#Final state
for(s in 1:n.sims){
  for(i in 1:n.sites){
    State[i,1,year+1,s] <- rcat(1,TPM[State[i,4,year,s], i, 4, year, s,]) 
  }
}


#################################################################################################
#### Save True Data ####
#results for each sim
States.df <- adply(State, c(1,2,3,4))

colnames(States.df) <- c("site", "week", "year", "sim", "state")              

file_name = paste(path, 'States_nocontrol.csv',sep = '/')
write.csv(States.df,file_name)


#mean across simulations
Mean.States.df <- aggregate(state ~ site+week+year,
                            data = as.data.frame(States.df), FUN = mean)

file_name = paste(path, 'Mean.States_nocontrol.csv',sep = '/')
write.csv(Mean.States.df ,file_name)


#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

file_name = paste(path, 'nocontrol_time.txt',sep = '/')
write.table(time.taken,file_name)
