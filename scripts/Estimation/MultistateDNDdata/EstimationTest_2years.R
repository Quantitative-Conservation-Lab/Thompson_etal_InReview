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
#See JAGS model script
#------------------------------------------------------------------------------#
#### Path to save data ####
path <- here::here("results", "test", "2year")
res <- c('results/test/2year') #subset of path for plot save
#------------------------------------------------------------------------------#
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
n.sims <-  100 #number of simulations per parameter set
n.sites <- 40 #number of sites
n.years <- 2 #number of years
n.weeks <- 5 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

#### Loading parameters ####
#if we have 3 layers use this (low, medium, high)
params <- expand.grid(col = c(1,2,3),ste = c(1,2,3),nbr = c(1,2,3),gro = c(1,2,3),rem = c(1,2,3),det = c(1,2,3))

#if we have 2 layers use this (low, high)
#params <- expand.grid(col = c(1,3),ste = c(1,3),nbr = c(1,3),gro = c(1,3),rem = c(1,3),det = c(1,3))
n.params <- length(params$col)
gamma0 <- gamma1 <- gamma2  <-  eps0.l <- eps0.h <- phi0.hh <-
  eps1.l <- eps1.h <- phi1.lh <- phi1.hh <- p0.l <- p0.h <- p1.l <- p1.h <- 
  alpha.l <- alpha.h <- delta <- epsB.l <-epsB.h <-  phiB.lh <- phiB.hh <- rep(NA, n.params)

for(p in 1:n.params){
  gamma0[p] <- col1[[params[p,1]]]$gamma.0
  gamma1[p] <- ste2[[params[p,2]]]$gamma.1
  gamma2[p] <- nbr3[[params[p,3]]]$gamma.2
  
  eps0.l[p] <- gro4[[params[p,4]]]$eps.l0
  eps0.h[p] <- gro4[[params[p,4]]]$eps.h0
  phi0.hh[p] <- gro4[[params[p,4]]]$phi0.hhs
  epsB.l[p] <- gro4[[params[p,4]]]$epsB.l
  epsB.h[p] <- gro4[[params[p,4]]]$epsB.h
  phiB.lh[p] <- gro4[[params[p,4]]]$phiB.lhs
  phiB.hh[p] <- gro4[[params[p,4]]]$phiB.hhs
  
  eps1.l[p] <- rem5[[params[p,5]]]$eps.l1
  eps1.h[p] <- rem5[[params[p,5]]]$eps.h1
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

#Detection probabilities
pM.l <- invlogit(p0.l + p1.l*logsearch.effort + alpha.l) #low state detection 
pM.h <- invlogit(p0.h + p1.h*logsearch.effort + alpha.h) #high state detection 

P.datM <- array(NA, dim = c(n.states, n.params, n.states))
for(p in 1:n.params){
  P.datM[1,p,] <- c(1,0,0)
  P.datM[2,p,] <- c(1-pM.l[p], pM.l[p], 0)
  P.datM[3,p,] <- c(1-pM.h[p], pM.h[p]*(1-delta[p]), pM.h[p]*delta[p])
}

rem.vec <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims)) #removal sites array
start.time <- Sys.time()

#### JAGS arrays ####
#### Empty jags arrays ####
S.init <- array(NA, c(n.sites,n.years, n.sims))
D.init <- array(NA, c(n.sites,n.years, n.sims))

#priors:
eps0.l.mean <- array(NA, c(n.years, n.sims))
eps0.l.sd <- array(NA, c(n.years, n.sims))
eps1.l.mean <- array(NA, c(n.years, n.sims))
eps1.l.sd <- array(NA, c(n.years, n.sims))

eps0.h.mean <- array(NA, c(n.years, n.sims))
eps0.h.sd <- array(NA, c(n.years, n.sims))
eps1.h.mean <- array(NA, c(n.years, n.sims))
eps1.h.sd <- array(NA, c(n.years, n.sims))

phi0.hh.mean <- array(NA, c(n.years, n.sims))
phi0.hh.sd <- array(NA, c(n.years, n.sims))
phi1.hh.mean <- array(NA, c(n.years, n.sims))
phi1.hh.sd <- array(NA, c(n.years, n.sims))

gamma0.mean <- array(NA, c(n.years, n.sims))
gamma0.sd <- array(NA, c(n.years, n.sims))
gamma1.mean <- array(NA, c(n.years, n.sims))
gamma1.sd <- array(NA, c(n.years, n.sims))
gamma2.mean <- array(NA, c(n.years, n.sims))
gamma2.sd <- array(NA, c(n.years, n.sims))

epsB.l.a <- array(NA, c(n.years, n.sims))
epsB.l.b <- array(NA, c(n.years, n.sims))
epsB.h.a <- array(NA, c(n.years, n.sims))
epsB.h.b <- array(NA, c(n.years, n.sims))
phiB.lh.a <- array(NA, c(n.years, n.sims))
phiB.lh.b <- array(NA, c(n.years, n.sims))
phiB.hh.a <- array(NA, c(n.years, n.sims))
phiB.hh.b <- array(NA, c(n.years, n.sims))

p0.l.a <- array(NA, c(n.years, n.sims))
p0.l.b <- array(NA, c(n.years, n.sims))
p1.l.mean <- array(NA, c(n.years, n.sims))
p1.l.sd <- array(NA, c(n.years, n.sims))
l.mean <- array(NA, c(n.years, n.sims))
l.sd <- array(NA, c(n.years, n.sims))

p0.h.a <- array(NA, c(n.years, n.sims))
p0.h.b <- array(NA, c(n.years, n.sims))
p1.h.mean <- array(NA, c(n.years, n.sims))
p1.h.sd <- array(NA, c(n.years, n.sims))
h.mean <- array(NA, c(n.years, n.sims))
h.sd <- array(NA, c(n.years, n.sims))
delta.a <- array(NA, c(n.years, n.sims))
delta.b <-  array(NA, c(n.years, n.sims))

x <- list()
rhat_vals <- array(NA, c(n.years, n.sims))
sites <- list()
my.data <- list()
outs <- rep(NA,n.sims)
outputsfull <- rep(NA, n.sims)
outputs <- rep(NA, n.sims)
mcmcs <- rep(NA, n.sims)

alpha.eps0.l <- rep(NA, n.sims)
beta.eps0.l <- rep(NA, n.sims)
alpha.eps0.h <- rep(NA, n.sims)
beta.eps0.h <- rep(NA, n.sims)
alpha.phi.lh <- rep(NA, n.sims)
beta.phi.lh <- rep(NA, n.sims)
alpha.phi.hh <- rep(NA, n.sims)
beta.phi.hh <- rep(NA, n.sims)
alpha.p0.l <- rep(NA, n.sims)
beta.p0.l <- rep(NA, n.sims)
alpha.p0.h <- rep(NA, n.sims)
beta.p0.h <- rep(NA, n.sims)
alpha.delta <- rep(NA, n.sims)
beta.delta <- rep(NA, n.sims)

State.est <- rep(NA, n.sims)
eps0.l.est <- rep(NA, n.sims)
eps1.l.est <- rep(NA, n.sims)
eps0.h.est <- rep(NA, n.sims)
eps1.h.est <- rep(NA, n.sims)
gamma0.est <- rep(NA, n.sims)
gamma1.est <- rep(NA, n.sims)
gamma2.est <- rep(NA, n.sims)
phi0.lh.est <- rep(NA, n.sims)
phi1.lh.est <- rep(NA, n.sims)
phi0.hh.est <- rep(NA, n.sims)
phi1.hh.est <- rep(NA, n.sims)
p0.l.est <- rep(NA, n.sims)
p1.l.est <- rep(NA, n.sims)
alpha.l.est <- rep(NA, n.sims)
p0.h.est <- rep(NA, n.sims)
p1.h.est <- rep(NA, n.sims)
alpha.h.est <- rep(NA, n.sims)
delta.est <- array(NA, n.sims)

all.State.est <- rep(NA, n.sims)
all.eps0.l.est <- rep(NA, n.sims)
all.eps1.l.est <- rep(NA, n.sims)
all.eps0.h.est <- rep(NA, n.sims)
all.eps1.h.est <- rep(NA, n.sims)
all.gamma0..est <- rep(NA, n.sims)
all.gamma1.est <- rep(NA, n.sims)
all.gamma2.est <- rep(NA, n.sims)
all.phi0.lh.est <- rep(NA, n.sims)
all.phi1.lh.est <- rep(NA, n.sims)
all.phi0.hh.est <- rep(NA, n.sims)
all.phi1.hh.est <- rep(NA, n.sims)
all.p0.l.est <- rep(NA, n.sims)
all.p1.l.est <- rep(NA, n.sims)
all.alpha.l.est <- rep(NA, n.sims)
all.p0.h.est <- rep(NA, n.sims)
all.p1.h.est <- rep(NA, n.sims)
all.alpha.h.est <- rep(NA, n.sims)
all.delta.est <- array(NA, n.sims)

initial.values <- list()

TPM.est <- array(NA, c(n.states, n.sites,n.sims,n.states))
D.est <- array(NA, c(n.sites,n.sims))
gamma.est <- array(NA, c(n.sites,n.sims))
eps.l.est <- array(NA, c(n.sites,n.sims))
eps.h.est <- array(NA, c(n.sites,n.sims))
phi.lh.est <- array(NA, c(n.sites,n.sims))
phi.hh.est <- array(NA, c(n.sites,n.sims))

prev.state <- array(NA, c(n.sites, n.sims))
States.mean.round <- array(NA, c(n.sites, n.years, n.sims))
States.mean <- array(NA, c(n.sites, n.years, n.sims))
S.end <- array(NA, c(n.sites, n.sims))

res.state <- list()
res.params <- list()

start.time <- Sys.time()
####################################################################################
#### Management ####

p <- which(apply(params, 1, function(x) return(all(x == c(1,1,1,1,3,3))))) #best case parameter
p <- which(apply(params, 1, function(x) return(all(x == c(3,3,3,3,1,1))))) #worst case parameter
p <- which(apply(params, 1, function(x) return(all(x == c(2,2,2,2,2,2))))) #middle of the road parameter
p <- which(apply(params, 1, function(x) return(all(x == c(3,3,3,3,3,3))))) #bad invasion but good management

year <- 1

for(year in 1:n.years){
  
  #### 1. Simulation ####
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
    }
    
  } #ends year > 1
  
  eps.l[,1,year,p,] <- invlogit(eps0.l[p]) #eradication low 
  eps.h[,1,year,p,] <- invlogit(eps0.h[p]) #eradication high
  phi.hh[,1,year,p,] <- invlogit(phi0.hh[p]) #transition high to high
  
  # TPM used for week 2
  TPM[1,1:n.sites,1,year,p,,1] <- 1 #empty to empty 
  TPM[1,1:n.sites,1,year,p,,2] <- 0 
  TPM[1,1:n.sites,1,year,p,,3] <- 0 
  
  TPM[2,1:n.sites,1,year,p,,1] <- eps.l[,1,year,p,] #low to empty (week 1)
  TPM[2,1:n.sites,1,year,p,,2] <- (1- eps.l[,1,year,p,]) #low to low (week 1)
  TPM[2,1:n.sites,1,year,p,,3] <- 0 #low to high (week 1)
  
  TPM[3,1:n.sites,1,year,p,,1] <- eps.h[,1,year,p,] #high to empty (week 1)
  TPM[3,1:n.sites,1,year,p,,2] <- (1- eps.h[,1,year,p,])*(1-phi.hh[,1,year,p,]) #high to low (week 1)
  TPM[3,1:n.sites,1,year,p,,3] <- (1- eps.h[,1,year,p,])*(phi.hh[,1,year,p,]) #high to high (week 1)
  
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
        eps.l[,week,year,p,s] <- invlogit(eps0.l[p] + eps1.l[p]*prev.rem.vec*removal.hours) #low eradication
        eps.h[,week,year,p,s] <- invlogit(eps0.h[p] + eps1.h[p]*prev.rem.vec*removal.hours) #high eradication
        
        #transition rates
        phi.hh[,week,year,p,s] <- invlogit(phi0.hh[p] - phi1.hh[p]*prev.rem.vec*removal.hours)
        
        TPM[1,1:n.sites,week,year,p,s,1] <- 1
        TPM[1,1:n.sites,week,year,p,s,2] <- 0
        TPM[1,1:n.sites,week,year,p,s,3] <- 0 
        
        TPM[2,1:n.sites,week,year,p,s,1] <- eps.l[,week,year,p,s] 
        TPM[2,1:n.sites,week,year,p,s,2] <- (1- eps.l[,week,year,p,s]) 
        TPM[2,1:n.sites,week,year,p,s,3] <- 0 
        
        TPM[3,1:n.sites,week,year,p,s,1] <- eps.h[,week,year,p,s] #high to empty (eradication)
        TPM[3,1:n.sites,week,year,p,s,2] <- (1- eps.h[,week,year,p,s])*(1-phi.hh[,week,year,p,s]) #high to low
        TPM[3,1:n.sites,week,year,p,s,3] <- (1- eps.h[,week,year,p,s])*(phi.hh[,week,year,p,s]) #high to high
        
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
      D[i,5,year,p,s] <- sum(State[neighbors[i,], 5,year,p,s])/n.neighbors[i] #state of neighbors
    }
    
    gamma[,5,year,p,s] <-invlogit(gamma0[p] + gamma1[p]*site.char + gamma2[p]*D[,5,year,p,s]) #invasion 
    
    # TPM used for next week
    TPM[1,1:n.sites,5,year,p,s,1] <- 1-gamma[,5,year,p,s] #empty to empty 
    TPM[1,1:n.sites,5,year,p,s,2] <- gamma[,5,year,p,s] #empty to low 
    TPM[1,1:n.sites,5,year,p,s,3] <- 0 #empty to high 
    
    TPM[2,1:n.sites,5,year,p,s,1] <- epsB.l[p] #low to empty 
    TPM[2,1:n.sites,5,year,p,s,2] <- (1- epsB.l[p])*(1-phiB.lh[p]) #low to low 
    TPM[2,1:n.sites,5,year,p,s,3] <- (1- epsB.l[p])*(phiB.lh[p]) #low to high 
    
    TPM[3,1:n.sites,5,year,p,s,1] <- epsB.h[p] #high to empty 
    TPM[3,1:n.sites,5,year,p,s,2] <- (1- epsB.h[p])*(1-phiB.hh[p]) #high to low
    TPM[3,1:n.sites,5,year,p,s,3] <- (1- epsB.h[p])*(phiB.hh[p]) #high to high
    
    
  } #ends sim loop
  
  
} #year loop 
  
  #--------------------------------------------------------------------------------#
  #### 2. Learning: ####
  
  ##### 2a. Update priors #####
  ###### year 1 priors #####
  #------------------------Year 1 Priors------------------------#
  if(year == 2){

    # --- eps.l ---  eradication low state -------------------- #
    #eps.l0 = base eradication at low state (beta distribution)
    eps0.l.mean[year,] <- 0 #mean
    eps0.l.sd[year,] <- 10 #sd
    
    #eps.l1 = effect of eradication at low state (normal distribution)
    eps1.l.mean[year,] <- 0 #mean
    eps1.l.sd[year,] <-  10 #sd
    
    # --- eps.h ---  eradication high state ------------------- #
    #eps.h0 = base eradication at high state (beta distribution)
    eps0.h.mean[year,] <- 0 #mean
    eps0.h.sd[year,] <- 10 #sd
    
    #eps.h1 = effect of eradication at high state (normal distribution)
    eps1.h.mean[year,] <- 0 #mean
    eps1.h.sd[year,] <-  10 #sd
    
    # --- phi ---  transition rates -------------------------- #
    #phi.hh = transition high to high (beta distribution)
    phi0.hh.mean[year,] <- 0 #alpha shape
    phi0.hh.sd[year,] <- 10 #beta shape
    
    #effect of removal on transition from high to high
    phi1.hh.mean[year,] <- 0 #mean
    phi1.hh.sd[year,] <- 10 #sd
    
    # --- gamma ---  invasion: Between weeks ------------------- #  
    #gamma.0 = intrinsic invasion (normal distribution)
    gamma0.mean[year,] <- 0 #mean
    gamma0.sd[year, ] <- 10 #sd
    
    #gamma.1 = effect of site characteristics (normal distribution)
    gamma1.mean[year,] <- 0 #mean
    gamma1.sd[year,] <- 10 #sd
    
    #gamma.2 = effect of neighboring state (normal distribution)
    gamma2.mean[year,] <- 0 #mean
    gamma2.sd[year,] <- 10 #sd

    # --- eps ---  eradication: Between weeks ---------------- # 
    epsB.l.a[year,] <- 1
    epsB.l.b[year,] <- 1
    epsB.h.a[year,] <- 1
    epsB.h.b[year,] <- 1
    
    # --- phi ---  transition rates: Between weeks ------------ #  
    phiB.lh.a[year,] <- 1
    phiB.lh.b[year,] <- 1
    phiB.hh.a[year,] <- 1
    phiB.hh.b[year,] <- 1
    
    
    # --- p.l ---  detection low state ----------------------- #
    #p.l.0 = base detection low state (beta distribution)
    p0.l.a[year,] <- 1 #alpha shape
    p0.l.b[year,] <- 1 #beta shape
    
    #p.l.1 = effect of effort (normal distribution)
    p1.l.mean[year,] <- 0 #mean
    p1.l.sd[year,] <- 10 #sd
    
    # --- alpha.l --- difference in baseline detection btwn dat D and M -- #  
    l.mean[year,] <- 0 #mean
    l.sd[year,] <- 1 #sd
    
    # --- p.h ---  detection high state ---------------------- #
    #p.h.0 = base detection high state (beta distribution)
    p0.h.a[year,] <- 1 #alpha shape
    p0.h.b[year,] <- 1 #beta shape
    
    #p.h.1 = effect of effort (normal distribution)
    p1.h.mean[year,] <- 0 #mean
    p1.h.sd[year,] <- 10 #sd
    
    # --- alpha.h --- difference in baseline detection btwn dat D and M -- #   
    h.mean[year,] <- 0 #mean
    h.sd[year,] <- 1 #sd
    
    #---delta -- ability to perfectly detect high invasion state #
    #beta distribution
    delta.a[year,] <- 1
    delta.b[year,] <- 1
    
    # --- S.init and D.init ---  Initial states ------------ #
    alpha.init1 <- rep(1,n.states) #initial state probability vector
  } 
  
  #--------------------------------------------------------------------------------#
  ###### 2b. JAGS data ######
  
  #sites where removal occurred
  rem.vec.dat <- rem.vec[,,1:2,p,] 
  rem.vec.dat[is.na(rem.vec.dat)] <- 0 #replaces na with 0
  
  #Parameters monitored
  parameters.to.save <- c("eps0.l", "eps1.l", "eps0.h", "eps1.h", 
                          "phi0.hh", "phi1.hh","gamma0", "gamma1","gamma2",
                          "epsB.l", "epsB.h", "phiB.lh", "phiB.hh",
                          "p0.l", "p1.l", "p0.h", "p1.h", "alpha.l",
                          "alpha.h", "psi", "delta", "State.fin")
  #settings
  n.burnin <- 5000
  n.iter <- 50000 + n.burnin
  n.chains <- 3
  n.thin <- 1
  
  for(s in 1:n.sims){
    my.data[[s]] <- list( #constants
      n.sites = n.sites,
      n.weeks = n.weeks,
      n.occs = n.occs, 
      neighbors = neighbors,
      
      #data
      yM= yM[,,,1:2,p,s],
      site.char = site.char,
      logeffort = logsearch.effort,
      alpha.init1 = alpha.init1,
      rem.vec = rem.vec.dat[,,,s],
      removal.hours = removal.hours,
      n.neighbors = n.neighbors,
      
      #priors
      eps0.l.mean =  eps0.l.mean[year,s],
      eps0.l.sd =  eps0.l.sd[year,s],
      eps1.l.mean =  eps1.l.mean[year,s],
      eps1.l.sd =  eps1.l.sd[year,s],
      eps0.h.mean =  eps0.h.mean[year,s],
      eps0.h.sd =  eps0.h.sd[year,s],
      eps1.h.mean =  eps1.h.mean[year,s],
      eps1.h.sd = eps1.h.sd[year,s],
      
      phi0.hh.mean =  phi0.hh.mean[year,s],
      phi0.hh.sd =  phi0.hh.sd[year,s],
      phi1.hh.mean =  phi1.hh.mean[year,s],
      phi1.hh.sd =  phi1.hh.sd[year,s],
      
      gamma0.mean =  gamma0.mean[year,s],
      gamma0.sd =  gamma0.sd[year,s],
      gamma1.mean =  gamma1.mean[year,s],
      gamma1.sd =  gamma1.sd[year,s],
      gamma2.mean =  gamma2.mean[year,s],
      gamma2.sd =  gamma2.sd[year,s],
      
      epsB.l.a =  epsB.l.a[year,s],
      epsB.l.b =  epsB.l.b[year,s],
      epsB.h.a =  epsB.h.a[year,s],
      epsB.h.b =  epsB.h.b[year,s],
      phiB.lh.a =  phiB.lh.a[year,s],
      phiB.lh.b =  phiB.lh.b[year,s],
      phiB.hh.a =  phiB.hh.a[year,s],
      phiB.hh.b =  phiB.hh.b[year,s],
      
      p0.l.a =  p0.l.a[year,s],
      p0.l.b =  p0.l.b[year,s],
      p1.l.mean =  p1.l.mean[year,s],
      p1.l.sd =  p1.l.sd[year,s],
      l.mean = l.mean[year,s],
      l.sd =  l.sd[year,s],
      
      p0.h.a =  p0.h.a[year,s],
      p0.h.b =  p0.h.b[year,s],
      p1.h.mean =  p1.h.mean[year,s],
      p1.h.sd =   p1.h.sd[year,s],
      h.mean =  h.mean[year,s],
      h.sd =  h.sd[year,s],
      delta.a =  delta.a[year,s],
      delta.b =   delta.b[year,s]
    )
  }
  
  ###### 2c. Run JAGS #####
  
  State.start <- array(NA, c(n.sites,n.weeks,2,n.sims)) #State initial values
  
  for(s in 1:n.sims){
    for(i in 1:n.sites){
      for(week in 1:n.weeks){
        for(y in 1:2){
          if(rem.vec.dat[i,week,y,s] == 1){
            State.start[i,week,y,s] <- max(yM[i,,week,y,p,s], na.rm = T)
          }else{
            State.start[i,week,y,s] <- 2
          }
        }
      }
    }
  }
  
  #Initial values
  for(s in 1:n.sims){
    initial.values[[s]] <- function()list(State = State.start[,,,s])
  }
  
  #Running the model
  for(s in 1:n.sims){
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]],inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_datM_est1.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
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
  
  
#################################################################################################
end.time <- Sys.time()
time.taken <- end.time - start.time
  
  #### Results ####
  cbind.res.parameters <- cbind.res %>% filter(param %in% parameters.to.save)
  
  truth.params <- c(eps0.l[p], eps1.l[p], eps0.h[p], eps1.h[p], phi0.hh[p], phi1.hh[p],
                    gamma0[p], gamma1[p],gamma2[p],epsB.l[p], epsB.h[p], phiB.lh[p], phiB.hh[p],
                    p0.l[p], p1.l[p], p0.h[p], p1.h[p], alpha.l[p],alpha.h[p], delta[p])
  
  cbind.res.parameters$truth <- rep(truth.params, n.sims)
  colnames(cbind.res.parameters)[c(3,7)] <- c("low", "high")
  res.params[[year]] <- cbind.res.parameters
  
  #State params
  cbind.res.state<- cbind.res %>% filter(str_detect(param, '^S'))
  
  truth.state <- State[,5,2,p,1]
  
  for(s in 2:n.sims){
    truth.state <- c(truth.state, State[,5,2,p,s])
  }
  
  cbind.res.state$Segment <- as.numeric(gsub("\\D", "", cbind.res.state$param))
  
  cbind.res.state$truth <- truth.state
  colnames(cbind.res.state)[c(3,7)] <- c("low", "high")
  
  cbind.res.state$nobs <- NA
  Y.nobs <- yM[,,,2,p,]
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
  
##### plots #####
  ggplot(res.params[[1]]) +
    geom_point(mapping = aes(x = sim, y = mean, col = as.factor(sim)))+
    geom_errorbar(aes(x = sim, ymin = low, ymax = high, col = as.factor(sim)))+
    #scale_color_brewer(palette = "Dark2")+
    geom_point(data=res.params[[1]], aes(x = sim, y = truth),color = "black", shape = 22) +
    facet_wrap(~param, scales = "free") +
    xlab("Simulation")+ylab("State") + 
    guides(color = guide_legend(title = "Simulation"))    

ggplot(res.params[[year]]) +
  geom_point(mapping = aes(x = param, y = Rhat, col = as.factor(sim)))+
  geom_hline(yintercept = 1.1, color = 'red')

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

#### Trace.plots ####
for(s in 1:n.sims){
  for(p in 1:length(unique(cbind.res.parameters$param))){
    MCMCtrace(get(mcmcs[s]),
              params = unique(cbind.res.parameters$param[p]),
              type = 'both',
              ind = TRUE,
              pdf = TRUE,
              open_pdf = FALSE,
              filename = paste0(res,'/densplots/trace',unique(cbind.res.parameters$param[p]),'_sim', s, '_year', year))
}
}


#### Relative bias ####
mean.state <- array(NA, c(n.years,n.sites,n.sims))
true.state <- array(NA, c(n.years,n.sites,n.sims))
rel.bias <- array(NA, c(n.years,n.sites,n.sims))

for(year in 1:1){
  for(s in 1:n.sims){
    for(i in 1:n.sites){
      mean.state[year,i,s] <- as.numeric(res.state[[year]] %>% filter(Segment == i & sim == s) %>% select(mean))
      true.state[year,i,s] <- as.numeric(res.state[[year]] %>% filter(Segment == i & sim == s) %>% select(truth))
      rel.bias[year,i,s] <- ((mean.state[year,i,s])-(true.state[year,i,s]))/(true.state[year,i,s])
      
    }
  }
}

mean(rel.bias[1,,], na.rm = T)

#### CI coverage ####
low.state <- array(NA, c(n.years,n.sites,n.sims))
high.state <- array(NA, c(n.years,n.sites,n.sims))
CI.cov <- array(NA, c(n.years,n.sites,n.sims))

for(year in 1:1){
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

#### CI coverage -parameters ####
n.params <- length(unique(res.params[[1]]$param))

low.param <- array(NA, c(n.years,n.params,n.sims))
high.param <- array(NA, c(n.years,n.params,n.sims))
CI.param <- array(NA, c(n.years,n.params,n.sims))

parms.list <- unique(res.params[[1]]$param)

for(year in 1:1){
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

#### final states ####
mean(res.state[[1]]$mean)
mean(res.state[[1]]$truth)


  