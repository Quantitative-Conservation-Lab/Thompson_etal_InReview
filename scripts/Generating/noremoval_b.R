library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)
library(viridis)

#------------------------------------------------------------------------------#
#### Management Strategy ####
#No removal
load("parameters_data_b.RData")

#------------------------------------------------------------------------------#
#### Data and parameters ####
n.sims <-  100 #number of simulations (parameter sets)
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 5 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

B0.gammas <- data.frame(param = 'B0.gamma', truth = B0.gamma, sim = seq(1:n.sims))
B1.gammas <- data.frame(param= 'B1.gamma', truth = B1.gamma, sim = seq(1:n.sims))
B2.gammas <- data.frame(param = 'B2.gamma', truth = B2.gamma, sim = seq(1:n.sims))

B0.phihs <- data.frame(param = 'B0.phi.h', truth = B0.phih, sim = seq(1:n.sims))
B1.phihs <- data.frame(param = 'B1.phi.h', truth = B1.phih, sim = seq(1:n.sims))

B0.epsls <- data.frame(param = 'B0.eps.l', truth = B0.epsl, sim = seq(1:n.sims))
B1.epsls <- data.frame(param = 'B1.eps.l', truth = B1.epsl, sim = seq(1:n.sims))

B0.epshs <- data.frame(param = 'B0.eps.h', truth = B0.epsh, sim = seq(1:n.sims))
B1.epshs <- data.frame(param = 'B1.eps.h', truth = B1.epsh, sim = seq(1:n.sims))

gs <- data.frame(param = 'g', truth = g, sim = seq(1:n.sims))
phiB.ls <- data.frame(param = 'phiB.l', truth = phiB.l, sim = seq(1:n.sims))
phiB.hs <- data.frame(param = 'phiB.h', truth = phiB.h, sim = seq(1:n.sims))
epsB.ls <- data.frame(param = 'epsB.l', truth = epsB.l, sim = seq(1:n.sims))
epsB.hs <- data.frame(param = 'epsB.h', truth = epsB.h, sim = seq(1:n.sims))

B0.p.ls <- data.frame(param = 'B0.p.l', truth = B0.pl, sim = seq(1:n.sims))
B1.p.ls <- data.frame(param = 'B1.p.l', truth = B1.pl, sim = seq(1:n.sims))

B0.p.hs <- data.frame(param = 'B0.p.h', truth = B0.ph, sim = seq(1:n.sims))
B1.p.hs <- data.frame(param = 'B1.p.h', truth = B1.ph, sim = seq(1:n.sims))
deltas <- data.frame(param = 'delta', truth = delta, sim = seq(1:n.sims))

truth.params <- rbind(B0.gammas, B1.gammas, B2.gammas,
                      B0.phihs, B1.phihs,
                      B0.epsls, B1.epsls,
                      B0.epshs, B1.epshs,
                      gs, phiB.ls, phiB.hs, epsB.ls, epsB.hs,
                      B0.p.ls, B1.p.ls, B0.p.hs, B1.p.hs,
                      deltas)

#---- arrays ----#
gamma <- array(NA, c(n.sites, n.weeks, n.years, n.sims))
eps.l <- array(NA, c(n.sites, n.weeks, n.years, n.sims))
eps.h <- array(NA, c(n.sites, n.weeks, n.years, n.sims))
phi.l <- array(NA, c(n.sites, n.weeks, n.years, n.sims))
phi.h<- array(NA, c(n.sites, n.weeks, n.years, n.sims))

TPM<- array(NA, c(n.states,n.sites,n.weeks, n.years + 1,n.sims, n.states)) 

#---Habitat data---#
# effect of habitat quality on occupancy
site.char <- site.char
State.init <- State.init
State <- array(NA,c(n.sites, n.weeks, n.years, n.sims)) #state array

#---Neighbor data---#
N <- array(NA, c(n.sites, n.weeks, n.years,n.sims)) #neighbors array
num.neighbors <- 2 #one upstream, one downstream
neighbors <- matrix(NA, nrow = n.sites, ncol = num.neighbors) #neighbors matrix, each row (site) identifies the neighbors for that site 
neighbors[1,1] <- 2 #site 1 only has site 2 as its neighbor 
neighbors[2:n.sites, 1] <- seq(1,n.sites-1) #filling in upstream neighbors
neighbors[n.sites,2] <- n.sites-1 #end site only has end site -1 as its neighbor
neighbors[1:(n.sites-1), 2] <- seq(2,n.sites) #filling in downstream neighbors
n.neighbors <- rep(2,n.sites)
n.neighbors[1] <- n.neighbors[n.sites] <- 1

################################################################################
#### Simulation ####
year <- 1
start.time <- Sys.time()
for(year in 1:n.years){
  #--------------------------------------------------------------------------------#
  ### Steps: 
  #---1. Simulate the truth
  #---2. Simulate occupancy data collection (include removal data)
  #---3. Go back to step 1 and take into account removal that previously occurred into state process
  
  ##### Week 1 #####
  week <- 1
  
  if(year == 1){
    State[,1,year,1:n.sims] <- State.init #first week state is from data
  }else{
    for(s in 1:n.sims){
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,1,year,s] <- rcat(1,TPM[State[i,5,year-1,s], i, 5, year-1, s,]) 
      }
    }
  }
  
  eps.l[,1,year,] <- invlogit(B0.epsl) #eradication low 
  eps.h[,1,year,] <- invlogit(B0.epsh) #eradication high
  phi.h[,1,year,] <- invlogit(B0.phih) #transition high to high
  
  # TPM used for week 2
  TPM[1,1:n.sites,1,year,,1] <- 1 #empty to empty 
  TPM[1,1:n.sites,1,year,,2] <- 0 
  TPM[1,1:n.sites,1,year,,3] <- 0 
  
  TPM[2,1:n.sites,1,year,,1] <- eps.l[,1,year,] #low to empty (week 1)
  TPM[2,1:n.sites,1,year,,2] <- (1- eps.l[,1,year,]) #low to low (week 1)
  TPM[2,1:n.sites,1,year,,3] <- 0 #low to high (week 1)
  
  TPM[3,1:n.sites,1,year,,1] <- eps.h[,1,year,] #high to empty (week 1)
  TPM[3,1:n.sites,1,year,,2] <- (1- eps.h[,1,year,])*(1-phi.h[,1,year,]) #high to low (week 1)
  TPM[3,1:n.sites,1,year,,3] <- (1- eps.h[,1,year,])*(phi.h[,1,year,]) #high to high (week 1)
  
  ###### Weeks 2-4 #####
  for(s in 1:n.sims){
    for(week in 2:4){
      #Between weeks: we need to project 48 weeks forward
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,week,year,s] <- rcat(1,TPM[State[i,week-1,year,s], i, week-1, year, s,]) 
      }
      
      eps.l[,week,year,] <- invlogit(B0.epsl) #eradication low 
      eps.h[,week,year,] <- invlogit(B0.epsh) #eradication high
      phi.h[,week,year,] <- invlogit(B0.phih) #transition high to high
      
      # TPM used for next week
      TPM[1,1:n.sites,week,year,s,1] <- 1
      TPM[1,1:n.sites,week,year,s,2] <- 0
      TPM[1,1:n.sites,week,year,s,3] <- 0 
      
      TPM[2,1:n.sites,week,year,s,1] <- eps.l[,week,year,s] #low to empty 
      TPM[2,1:n.sites,week,year,s,2] <- (1- eps.l[,week,year,s])
      TPM[2,1:n.sites,week,year,s,3] <- 0
      
      TPM[3,1:n.sites,week,year,s,1] <- eps.h[,week,year,s] #high to empty 
      TPM[3,1:n.sites,week,year,s,2] <- (1- eps.h[,week,year,s])*(1-phi.h[,week,year,s]) #high to low 
      TPM[3,1:n.sites,week,year,s,3] <- (1- eps.h[,week,year,s])*(phi.h[,week,year,s]) #high to high 
    }
    
    ###### Week 5 #####
    #Between weeks: we need to project 48 weeks forward
    for(i in 1:n.sites){ #State process: state given previous state and transition probability
      State[i,5,year,s] <- rcat(1,TPM[State[i,4,year,s], i, 4, year, s,]) 
    }
    
    for(i in 1:n.sites){ #state of neighbors
      N[i,5,year,s] <- (sum(State[neighbors[i,], 5,year,s])-2)/n.neighbors[i] #state of neighbors
    }
    
    gamma[,5,year,s] <-invlogit(B0.gamma[s] + B1.gamma[s]*site.char + B2.gamma[s]*N[,5,year,s]) #invasion 
    
    # TPM used for next week
    TPM[1,1:n.sites,5,year,s,1] <- 1-gamma[,5,year,s] #empty to empty 
    TPM[1,1:n.sites,5,year,s,2] <- gamma[,5,year,s]*(1-g[s]) #empty to low 
    TPM[1,1:n.sites,5,year,s,3] <- gamma[,5,year,s]*(g[s]) #empty to high 
    
    TPM[2,1:n.sites,5,year,s,1] <- epsB.l[s] #low to empty 
    TPM[2,1:n.sites,5,year,s,2] <- (1- epsB.l[s])*(phiB.l[s]) #low to low 
    TPM[2,1:n.sites,5,year,s,3] <- (1- epsB.l[s])*(1-phiB.l[s]) #low to high 
    
    TPM[3,1:n.sites,5,year,s,1] <- epsB.h[s] #high to empty 
    TPM[3,1:n.sites,5,year,s,2] <- (1- epsB.h[s])*(1-phiB.h[s]) #high to low
    TPM[3,1:n.sites,5,year,s,3] <- (1- epsB.h[s])*(phiB.h[s]) #high to high
    
  } #ends sim loop
} #year loop 
#} #parameter loop

#################################################################################################
#### Path to save data ####
path <- 'E:\\Chapter3\\results\\noremoval\\noremoval'

#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

file_name = paste(path, 'time.txt',sep = '/')
write.table(time.taken,file_name)

#### TRUE STATE ####
S.dat <- as.data.frame.table(State)
colnames(S.dat) <- c("site", "week", "year", "sim","state")
S.dat <-  as.data.frame(sapply(S.dat,as.numeric))
S.dat$sim <- S.dat$sim + 100

file_name = paste(path, 'states_truth.csv',sep = '/')
write.csv(S.dat,file_name)

#### Path to save data ####
path <- 'E:\\Chapter3\\results\\noremoval\\noremoval_b'

#### QUICK TEST ####
S.fin <- S.dat %>% filter(week == 5 & year == 10)
mean(S.fin$state)
