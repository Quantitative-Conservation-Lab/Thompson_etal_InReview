library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(plyr)
library(tidyverse)
library(strex)


#Remove at downstream 5 locations but collect monitoring data
#at next 5 downstream locations

start.time <- Sys.time()

#### jags model ####
sink("Flower_mod_datboth.txt")
cat("
model{

# -------------------------------------------------
# Parameters:
# gamma: invasion probability
# eps: erradication probability
# p: probability of observing the plant
# -------------------------------------------------
# States (S):
# 1 empty
# 2 invaded
# 
# Observations (O):  
# 1 absent
# 2 present
# -------------------------------------------------

#### PRIORS ####
  eps.l ~ dbeta(eps.l_a,eps.l_b) #erradication when at low state
  eps.h ~ dbeta(eps.h_a,eps.h_b) #erradication when at high state
  pl ~ dbeta(pl_a,pl_b) #detection low (for multistate data)
  ph ~ dbeta(ph_a,ph_b) #detection high (for multistate data)
  p ~ dbeta(p_a,p_b) #detection probability (for d/nd data)
  delta ~ dbeta(delta_a, delta_b) #probability of obesrving high state given species has been detected and true state is high
  gamma0 ~dnorm(gamma0_a,gamma0_b) #intrinsic invasion probability 
  gamma1 ~ dnorm(gamma1_a, gamma1_b) #effect of neighboring locations on invasion probability
  phi.eh ~ dbeta(phi.eh_a, phi.eh_b) #transition from empty to high
  phi.lh ~ dbeta(phi.lh_a, phi.lh_b) #transition from low to high
  phi.hh ~ dbeta(phi.hh_a, phi.hh_b) #transition from high to high

#--------------------------------------------------#
# STATE TRANSITION
for (i in 1:n.sites){  
  # State transition probabilities: probability of S(t+1) given S(t)
  for (t in 1:n.months){
    #index = [current state, location, time, future state]
    #empty stay empty
    ps[1,i,t,1] <- 1-gamma[i,t] #1-gamma = not invasion probability
    
    #empty to low abundance
    ps[1,i,t,2] <- gamma[i,t]*(1-phi.eh) #invasion probability
    
    #empty to high abundance
    ps[1,i,t,3] <- gamma[i,t]*(phi.eh) #invasion probability

    #low abundance to empty
    ps[2,i,t,1] <- (eps.l*rem.vec[i]) #erradication probability
    
    #low abundance to low abundance
    ps[2,i,t,2] <- (1- eps.l*rem.vec[i])*(1-phi.lh) #erradication failure probability
    
    #low abundance to high abundance
    ps[2,i,t,3] <- (1- eps.l*rem.vec[i])*(phi.lh)
    
    #high abundance to empty
    ps[3,i,t,1] <- (eps.h*rem.vec[i]) #erradication probability
    
    #high abundance to low abundance
    ps[3,i,t,2] <- (1- eps.h*rem.vec[i])*(1-phi.hh) #erradication failure probability
    
    #low abundance to high abundance
    ps[3,i,t,3] <- (1- eps.h*rem.vec[i])*(phi.hh)
    
    #--------------------------------------------------#
    # OBSERVATION PROBABILITIES (for detection/nondetection data)
    
    #empty observed absent   
    po_dat2[1,i,t,1] <- 1
    
    #empty observed present  
    po_dat2[1,i,t,2] <- 0
 
    #invaded observed absent 
    po_dat2[2,i,t,1] <- 1-p #not detected probability
    
    #invaded observed present
    po_dat2[2,i,t,2] <- p #detection probability
    
    #invaded observed absent 
    po_dat2[3,i,t,1] <- 1-p #not detected probability
    
    #invaded observed present
    po_dat2[3,i,t,2] <- p #detection probability
    
    
    #--------------------------------------------------#
    # OBSERVATION PROBABILITIES (for multistate data) 
    # Observation probabilities of given S(t)
    #index = [current state, location, time, current observation]
   
    #empty observed absent   
    po_dat3[1,i,t,1] <- 1
    
    #empty observed low  
    po_dat3[1,i,t,2] <- 0
    
    #empty observed high  
    po_dat3[1,i,t,3] <- 0
 
    #low abundance observed absent 
    po_dat3[2,i,t,1] <- 1-pl #not detected probability
    
    #low abundance observed low abundance
    po_dat3[2,i,t,2] <- pl #detection probability
    
    #low abundance observed high abundance
    po_dat3[2,i,t,3] <- 0 
    
    #high abundance observed absent 
    po_dat3[3,i,t,1] <- 1-ph #not detected probability
    
    #high abundance observed low abundance
    po_dat3[3,i,t,2] <- (1-ph)*(1-delta) #detection probability
    
    #high abundance observed high abundance
    po_dat3[3,i,t,3] <- ph*delta
   

   logit(gamma[i,t]) <- gamma0 + gamma1*D[i,t] #invasion probability

   
  } #t
} #i

  #### Likelihood ####
  for (i in 2:(n.sites-1)){
    # Define state at beginning
    State[i,1] <- S.init[i] #we know state at the start
    D[i,1] <- D.init[i]
    
    for (t in 2:n.months){ #12
      # State process: state given previous state and transition probability
      State[i,t] ~ dcat(ps[State[i,t-1], i, t-1, ]) 
      
      D[i,t] <- State[i-1,t] + State[i+1,t] #state of neighbors 
      
     
    } #t
      
      #Derived parameter:
      
      State.fin[i] <- State[i,n.months] #state after 12 months
  } #i
  
  #Fill in above for edge sites (1 and n.sites)
  State[1,1] <- S.init[1] 
  State[n.sites,1] <- S.init[n.sites] 
  D[1,1] <- D.init[1]
  D[n.sites,1] <- D.init[n.sites]
  
   for (t in 2:n.months){
      State[1,t] ~ dcat(ps[State[1,t-1], 1, t-1, ])
      State[n.sites,t] ~ dcat(ps[State[n.sites,t-1], n.sites, t-1, ])
      D[1,t] <- State[2,t]
      D[n.sites,t] <- State[n.sites-1,t]
    } 

  State.fin[1] <- State[1,n.months]
  State.fin[n.sites] <- State[n.sites,n.months]
  
  
  for(h in 1:n.obs){
  
    # Observation process: draw observation given state
    y2[site.obs2[h]] ~ dcat(po_dat2[State.fin[site.obs2[h]], site.obs2[h], n.months-1, ])
    
    y3[site.obs3[h]] ~ dcat(po_dat3[State.fin[site.obs3[h]], site.obs3[h], n.months-1, ])
    
    
  } #obs sites
  

} #end model
", fill = TRUE)
sink()

#### Data ####
n.rem <- 5 #number of removal locations
n.obs <- 5 #number of detection/non-detection locations
n.sims <- 2 #simulations
eps.l <- 0.6 #erradication when at low state
eps.h <- 0.6 #erradication when at low state

phi.eh <- 0.05  #transition from empty to high
phi.lh <- 0.1 #transition from low to high
phi.hh <- 0.6 #transition from high to high

p <- 0.5 #detection probability (for detection/nondetection data)

pl <- 0.3 #detection probability (for multistate data)
ph <- 0.6 #detection probability (for multistate data)
delta <- 0.5
n.sites <- 20 #number of sites
n.months <- 12 
n.year <- 2 #time steps
n.states <- 3


##### Initial Removal Sites #####
#initially remove at random locations
# site.rem <- array(NA, c(n.rem,n.year,n.sims))
# site.rem[,1,] <- sample(seq(1,n.sites), n.rem)

#initially remove at 5 most downstream locations
site.rem <- array(NA, c(n.rem,n.year,n.sims))
site.rem[,1,] <- seq(1,5)

#vector of locations where removal occurs for year 1. Removal= 1, no removal = 0
rem.vec <- array(0, c(n.sites, n.year, n.sims))
rem.vec[site.rem[,1,],1,] <- 1

#transition probabilities
State <- array(NA, c(n.sites, n.months, n.year, n.sims))

##### Initial True State #####
#Initial state/observation
#start with random states?
#State[1:n.sites,1,1,] <- sample(c(1,2), n.sites, replace = T) 
#Here I am starting with first 5 upstream segments are invaded
State[1:5,1,1,] <- n.states #3
State[6:n.sites,1,1,] <- 1

ps<- array(NA, c(n.states,n.sites,n.months, n.states)) #state transition array

gamma <- array(NA, c(n.sites,n.months,n.year,n.sims)) #invasion
gamma0 <- -2 #intrinsic invasion
gamma1 <- 0.5 #effect of neighboring locations on invasion probability
D <- array(NA, c(n.sites,n.months, n.year,n.sims)) #neighbor states

year <- 1

for(s in 1:n.sims){
  for(i in 2:(n.sites-1)){
    D[i,1,year,s] <- State[i+1,1,year,s] + State[i-1,1,year,s]
    
    gamma[i,1,year,s] <- invlogit(gamma0 + gamma1*D[i,1,year,s]) #invasion probability
    
    ps[1,i,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
    ps[1,i,1,2] <- gamma[i,1,year,s]*(1-phi.eh) #empty to low abundance
    ps[1,i,1,3] <- gamma[i,1,year,s]*(phi.eh)
    
    ps[2,i,1,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
    ps[2,i,1,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
    ps[2,i,1,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
    
    ps[3,i,1,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
    ps[3,i,1,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
    ps[3,i,1,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
    
  }
  
  D[1,1,year,s] <- State[2,1,year,s]
  D[n.sites,1,year,s] <- State[(n.sites-1),1,year,s]
  
  gamma[1,1,year,s] <- invlogit(gamma0 + gamma1*D[1,1,year,s])
  ps[1,1,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
  ps[1,1,1,2] <- gamma[i,1,year,s]*(1-phi.eh) #empty to low abundance
  ps[1,1,1,3] <- gamma[i,1,year,s]*(phi.eh)
  
  ps[2,1,1,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
  ps[2,1,1,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
  ps[2,1,1,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
  
  ps[3,1,1,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
  ps[3,1,1,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
  ps[3,1,1,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
  
  gamma[n.sites,1,year,s] <- invlogit(gamma0 + gamma1*D[n.sites,1,year,s])
  ps[1,n.sites,1,1] <- 1-gamma[i,1,year,s] #empty stay empty
  ps[1,n.sites,1,2] <- gamma[i,1,year,s]*(1-phi.eh) #empty to low abundance
  ps[1,n.sites,1,3] <- gamma[i,1,year,s]*(phi.eh)
  
  ps[2,n.sites,1,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
  ps[2,n.sites,1,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
  ps[2,n.sites,1,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
  
  ps[3,n.sites,1,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
  ps[3,n.sites,1,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
  ps[3,n.sites,1,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
  
}

#observation matrix:
Obs2 <- array(NA, c(n.sites, n.year, n.sims))

#assign year 1 locations for detection/non detection data 
#random for all sites
available.obs2 <- seq(1,n.sites)

site.obs2 <- array(NA, c(n.obs, n.year, n.sims))
site.obs2[,1,] <- sort(sample(available.obs2, n.obs))

po_dat2<- array(NA, c(3,2))
po_dat2[1,1] <- 1
po_dat2[1,2] <- 0
po_dat2[2,1] <- 1-p
po_dat2[2,2] <- p
po_dat2[3,1] <- 1-p
po_dat2[3,2] <- p


#assign year 1 locations for multistate detection data
#find locations where removal is not happening and choose those locations randomly
Obs3 <- array(NA, c(n.sites, n.year, n.sims))
available.obs3 <- setdiff(seq(1,n.sites), site.rem[,1,1])

site.obs3 <- array(NA, c(n.obs, n.year, n.sims))
site.obs3[,1,] <- sort(sample(available.obs3, n.obs))

po_dat3<- array(NA, c(n.states,n.states))
po_dat3[1,1] <- 1
po_dat3[1,2] <- 0
po_dat3[1,3] <- 0

po_dat3[2,1] <- 1-pl
po_dat3[2,2] <- pl
po_dat3[2,3] <- 0

po_dat3[3,1] <- 1-ph
po_dat3[3,2] <- (1-ph)*delta
po_dat3[3,3] <- ph*delta

# JAGS data
gamma0_a <- array(NA, c(n.year,n.sims))
gamma0_b <- array(NA, c(n.year,n.sims))
gamma1_a <- array(NA, c(n.year,n.sims))
gamma1_b <- array(NA, c(n.year,n.sims))

eps.l_a <- array(NA, c(n.year, n.sims))
eps.l_b <- array(NA, c(n.year, n.sims))
eps.h_a <- array(NA, c(n.year, n.sims))
eps.h_b <- array(NA, c(n.year, n.sims))

p_a <- array(NA, c(n.year, n.sims))
p_b <- array(NA, c(n.year, n.sims))

pl_a <- array(NA, c(n.year, n.sims))
pl_b <- array(NA, c(n.year, n.sims))
ph_a <- array(NA, c(n.year, n.sims))
ph_b <- array(NA, c(n.year, n.sims))

delta_a <- array(NA, c(n.year, n.sims))
delta_b <- array(NA, c(n.year, n.sims))

phi.eh_a <- array(NA, c(n.year, n.sims))
phi.eh_b <- array(NA, c(n.year, n.sims))
phi.lh_a <- array(NA, c(n.year, n.sims))
phi.lh_b <- array(NA, c(n.year, n.sims))
phi.hh_a <- array(NA, c(n.year, n.sims))
phi.hh_b <- array(NA, c(n.year, n.sims))

S.init <-  array(NA, c(n.sites, n.year, n.sims))
D.init <- array(NA, c(n.sites,n.year,n.sims))
y2.dat <- array(NA, c(n.sites,n.year, n.sims))
y3.dat <- array(NA, c(n.sites,n.year, n.sims))
rhat_vals <- array(NA, c(n.year, n.sims))
my.data <- list()
outs <- rep(NA,n.sims)
outputsfull <- rep(NA, n.sims)
outputs <- rep(NA, n.sims)
mcmcs <- rep(NA, n.sims)
x <- list()
final.states <- rep(NA, n.sims)
segments <- list()

gamma0.est <- rep(NA, n.sims)
gamma1.est <- rep(NA, n.sims)
eps.l.est <- rep(NA, n.sims)
eps.h.est <- rep(NA, n.sims)
p.est <- rep(NA, n.sims)
pl.est <- rep(NA, n.sims)
ph.est <- rep(NA, n.sims)
delta.est <- rep(NA, n.sims)
phi.eh.est <- rep(NA, n.sims)
phi.lh.est <- rep(NA, n.sims)
phi.hh.est <- rep(NA, n.sims)

all.final.states <- rep(NA, n.sims)
all.gamma0.est <- rep(NA, n.sims)
all.gamma1.est <- rep(NA, n.sims)
all.eps.l.est <- rep(NA, n.sims)
all.eps.h.est <- rep(NA, n.sims)
all.p.est <- rep(NA, n.sims)
all.pl.est <- rep(NA, n.sims)
all.ph.est <- rep(NA, n.sims)
all.delta.est <- rep(NA, n.sims)
all.phi.eh.est <- rep(NA, n.sims)
all.phi.lh.est <- rep(NA, n.sims)
all.phi.hh.est <- rep(NA, n.sims)

final.states.mean <- array(NA, dim = c(n.sites, n.year, n.sims))
site.rem.options <- list()

alpha.gammas <- rep(NA, n.sims)
beta.gammas <- rep(NA, n.sims)

alpha.eps.l <- rep(NA, n.sims)
beta.eps.l <- rep(NA, n.sims)
alpha.eps.h <- rep(NA, n.sims)
beta.eps.h <- rep(NA, n.sims)

alpha.ps <- rep(NA, n.sims)
beta.ps <- rep(NA, n.sims)

alpha.pls <- rep(NA, n.sims)
beta.pls <- rep(NA, n.sims)

alpha.phs <- rep(NA, n.sims)
beta.phs <- rep(NA, n.sims)

alpha.delta <- rep(NA, n.sims)
beta.delta <- rep(NA, n.sims)

alpha.phi.eh <- rep(NA, n.sims)
beta.phi.eh <- rep(NA, n.sims)

alpha.phi.lh <- rep(NA, n.sims)
beta.phi.lh <- rep(NA, n.sims)

alpha.phi.hh <- rep(NA, n.sims)
beta.phi.hh <- rep(NA, n.sims)

max.down <- rep(NA, n.sims)
min.down <- rep(NA, n.sims)
site.obs.next <- array(NA, c(n.obs,n.sims))
next.down <- list()
add.obs <- list()
inbetween.rem <- list()
add.obs1 <- list()
add.obs2 <- list()

####################################################################################
#### Run 1 year ####

year <- 1

#### 1. Simulate truth #####
##### 1b. Months 1+ ####
# State transition
  for(s in 1:n.sims){
    for (t in 2:n.months){ #12
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
        ps[1,i,t,2] <- gamma[i,t,year,s]*(1-phi.eh) #empty to low abundance
        ps[1,i,t,3] <- gamma[i,t,year,s]*(phi.eh)
        
        ps[2,i,t,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
        ps[2,i,t,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
        ps[2,i,t,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
        
        ps[3,i,t,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
        ps[3,i,t,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
        ps[3,i,t,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
        
        #probability calculations for edge
        gamma[1,t,year,s] <- invlogit(gamma0 + gamma1*D[1,t,year,s])
        ps[1,1,t,1] <- 1-gamma[i,t,year,s] #empty stay empty
        ps[1,1,t,2] <- gamma[i,t,year,s]*(1-phi.eh) #empty to low abundance
        ps[1,1,t,3] <- gamma[i,t,year,s]*(phi.eh)
        
        ps[2,1,t,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
        ps[2,1,t,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
        ps[2,1,t,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
        
        ps[3,1,t,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
        ps[3,1,t,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
        ps[3,1,t,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
        
        gamma[n.sites,t,year,s] <- invlogit(gamma0 + gamma1*D[n.sites,t,year,s])
        ps[1,n.sites,t,1] <- 1-gamma[i,t,year,s] #empty stay empty
        ps[1,n.sites,t,2] <- gamma[i,t,year,s]*(1-phi.eh) #empty to low abundance
        ps[1,n.sites,t,3] <- gamma[i,t,year,s]*(phi.eh)
        
        ps[2,n.sites,t,1] <- (eps.l*rem.vec[i,year,s]) #low abundance to empty
        ps[2,n.sites,t,2] <- (1- eps.l*rem.vec[i,year,s])*(1-phi.lh) #low abundance to low abundance
        ps[2,n.sites,t,3] <- (1- eps.l*rem.vec[i,year,s])*(phi.lh) #low abundance to high abundance
        
        ps[3,n.sites,t,1] <- (eps.h*rem.vec[i,year,s]) #high abundance to empty
        ps[3,n.sites,t,2] <- (1- eps.h*rem.vec[i,year,s])*(1-phi.hh) #high abundance to low abundance
        ps[3,n.sites,t,3] <- (1- eps.h*rem.vec[i,year,s])*(phi.hh) #high abundance to high abundance
        
      }
      
    } #t
    
    for(i in 1:n.sites){
      # Observation process: draw O(t) given S(t) 
      Obs2[i,year,s] <- rcat(1,po_dat2[State[i,n.months,year,s], ])
      Obs3[i,year,s] <- rcat(1,po_dat3[State[i,n.months,year,s], ])
    } 
  } #s
  
  
  ##### Initial priors #####
  
  #------------------------Year 1 Priors------------------------#
  if(year == 1){
    gamma0_a[1,] <- 0
    gamma0_b[1,] <- 1
    gamma1_a[1,] <- 0
    gamma1_b[1,] <- 0.1
    
    
    eps.l_a[1,] <- 1
    eps.l_b[1,] <- 1
    eps.h_a[1,] <- 1
    eps.h_b[1,] <- 1
    
    p_a[1,] <- 1
    p_b[1,] <- 1
    
    pl_a[1,] <- 1
    pl_b[1,] <- 1
    ph_a[1,] <- 1
    ph_b[1,] <- 1
    
    delta_a[1,] <- 1
    delta_b[1,] <- 1
    
    phi.eh_a[1,] <- 1
    phi.eh_b[1,] <- 1
    phi.lh_a[1,] <- 1
    phi.lh_b[1,] <- 1
    phi.hh_a[1,] <- 1
    phi.hh_b[1,] <- 1
    
    #random initial states for year 1
    #S.init[,year,] <- sample(c(1,2), n.sites*n.sims, replace = T) 
    
    #initial 5 are invaded but no clue about the rest
    ##### Initial Estimated State #####
    S.init[1:5,year,] <- 3
    S.init[6:n.sites,year,] <- sample(c(1,2), (n.sites-5)*n.sims, replace = T) 
    
  } 

 
  ###### 2b. JAGS data ######
  
  for(s in 1:n.sims){
    y2.dat[site.obs2[,year,s],year,s] <- Obs2[site.obs2[,year,s],year,s]
    y3.dat[site.obs3[,year,s],year,s] <- Obs3[site.obs3[,year,s],year,s]
  }
  
  #D.init 
  for(s in 1:n.sims){
    for(i in 2:(n.sites-1)){
      D.init[i,year,s] <- S.init[i+1,year,s] + S.init[i-1,year,s]
    }
    
    D.init[1,year,s] <- S.init[2,year,s]
    D.init[n.sites,year,s] <- S.init[(n.sites-1),year,s]
    
  }

  
  #Parameters monitored
  parameters.to.save <- c("State.fin", "eps.l",
                          "eps.h","gamma0","gamma1",
                          "pl", "ph", "p", "delta",
                          "phi.eh", "phi.lh", "phi.hh")
  
  
  #settings
  # n.burnin <- 1000
  # n.iter <- 100000 + n.burnin
  # n.chains <- 3
  # n.thin <- 1
  
  n.burnin <- 10
  n.iter <- 100 + n.burnin
  n.chains <- 3
  n.thin <- 1
  
  for(s in 1:n.sims){
    my.data[[s]] <- list(n.sites = n.sites,
                         n.months = n.months, 
                         n.obs = n.obs,
                         S.init = S.init[,year,s],
                         D.init = D.init[,year,s],
                         y2 = y2.dat[,year,s],
                         y3 = y3.dat[,year,s],
                         rem.vec = rem.vec[,year,s],
                         site.obs2 = site.obs2[,year,s], 
                         site.obs3 = site.obs3[,year,s], 
                         
                         #priors
                         gamma0_a = gamma0_a[year,s],
                         gamma0_b = gamma0_b[year,s],
                         gamma1_a = gamma1_a[year,s],
                         gamma1_b = gamma1_b[year,s],
                         eps.l_a = eps.l_a[year,s], 
                         eps.l_b = eps.l_b[year,s],
                         eps.h_a = eps.h_a[year,s], 
                         eps.h_b = eps.h_b[year,s],
                         p_a = p_a[year,s], 
                         p_b = p_b[year,s],
                         pl_a = pl_a[year,s], 
                         pl_b = pl_b[year,s],
                         ph_a = ph_a[year,s], 
                         ph_b = ph_b[year,s],
                         delta_a = delta_a[year,s],
                         delta_b = delta_b[year,s],
                         phi.eh_a = phi.eh_a[year,s],
                         phi.eh_b = phi.eh_b[year,s],
                         phi.lh_a = phi.lh_a[year,s],
                         phi.lh_b = phi.lh_b[year,s],
                         phi.hh_a = phi.hh_a[year,s],
                         phi.hh_b = phi.hh_b[year,s]                  
                         
    )
  }
  
  ###### 2c. Run JAGS #####
  State.init <- array(NA, c(n.sites,n.months))
  State.init[,2:n.months] <- 3
  
  #State.init[,2:n.months] <- State[,2:n.months,year]
  initial.values <- function(){list(State = State.init)}
  
  for(s in 1:n.sims){
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]],inits = initial.values,
                        parameters.to.save = parameters.to.save, model.file = "Flower_mod_datboth.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
  }
  
  #### 3. Decision for year 2 ####
  ###### 3a. Extract parameters #####
  for(s in 1:n.sims){ 
    outputsfull[s]<- paste("outputfull", s, sep = "_")
    assign(outputsfull[s], 
           get(outs[s]))
    
    outputs[s]<- paste("output", s, sep = "_")
    assign(outputs[s], 
           as.data.frame((get(outputsfull[s]))$summary))
    
    assign(outputs[s], 
           cbind(get(outputs[s]), param = rownames(get(outputs[s]))))
  }
  

  
  for(s in 1:n.sims){
    mcmcs[s]<- paste("mcmc", s, sep = "_")
  }
  
  mcmc_1 <- out_1$samples
  mcmc_2 <- out_2$samples
  # mcmc_3 <- out_3$samples
  # mcmc_4 <- out_4$samples
  # mcmc_5 <- out_5$samples
 
  for(s in 1:n.sims){
    MCMCtrace(get(mcmcs[s]), 
            params = 'gamma0', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/gamma0_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]), 
              params = 'gamma1', 
              type = 'density', 
              ind = TRUE, 
              pdf = TRUE, 
              open_pdf = FALSE,
              filename = paste0(res,'/gamma1_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]), 
              params = 'eps.l', 
              type = 'density', 
              ind = TRUE, 
              pdf = TRUE, 
              open_pdf = FALSE,
              filename = paste0(res,'/eps.l_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]), 
              params = 'eps.h', 
              type = 'density', 
              ind = TRUE, 
              pdf = TRUE, 
              open_pdf = FALSE,
              filename = paste0(res,'/eps.h_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]), 
              params = 'p', 
              type = 'density', 
              ind = TRUE, 
              pdf = TRUE, 
              open_pdf = FALSE,
              filename = paste0(res,'/p_sim_', s, '_year', year))
    
    
    MCMCtrace(get(mcmcs[s]), 
              params = 'pl', 
              type = 'density', 
              ind = TRUE, 
              pdf = TRUE, 
              open_pdf = FALSE,
              filename = paste0(res,'/pl_sim_', s, '_year', year))
        
    MCMCtrace(get(mcmcs[s]), 
              params = 'ph', 
              type = 'density', 
              ind = TRUE, 
              pdf = TRUE, 
              open_pdf = FALSE,
              filename = paste0(res,'/ph_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]), 
              params = 'phi.eh', 
              type = 'density', 
              ind = TRUE, 
              pdf = TRUE, 
              open_pdf = FALSE,
              filename = paste0(res,'/phi.eh_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]), 
              params = 'phi.lh', 
              type = 'density', 
              ind = TRUE, 
              pdf = TRUE, 
              open_pdf = FALSE,
              filename = paste0(res,'/phi.lh_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]), 
              params = 'phi.hh', 
              type = 'density', 
              ind = TRUE, 
              pdf = TRUE, 
              open_pdf = FALSE,
              filename = paste0(res,'/phi.hh_sim_', s, '_year', year))
    
    
    }
    
  
  #save outs into a csv file!
  # file_name <- rep(NA, S)
  # for(s in 1:S){
  #   file_name[s] = paste(path, paste0('Output_',s,'year', year, '.csv'),sep = '/')
  #   write.csv(get(outputs[s]),file_name[s])
  # }
  # 
  
  #save rhat outputs
  for(s in 1:n.sims){
    x[[s]] <- as.numeric(unlist(get(outputsfull[s])$Rhat))
    rhat_vals[year,s] <-  sum(x[[s]] > 1.1, na.rm = TRUE)/ length(x[[s]])
  }
  

  #-------Final States -------#
  for(s in 1:n.sims){
    final.states[s]<- paste("final.states", s, sep = "_")
    assign(final.states[s], filter(get(outputs[s]), grepl("^S", param)))
    
    segments[[s]] <- as.numeric(str_nth_number((get(final.states[s]))$param, n = 1))
    
  }
  
  
  for(s in 1:n.sims){
    assign(final.states[s], 
           cbind(get(final.states[s]), segment = segments[[s]])) #adding segment column  
  }

  #-------gamma -------#
  for(s in 1:n.sims){
    gamma0.est[s]<- paste("gamma0.est", s, sep = "_")
    assign(gamma0.est[s], filter(get(outputs[s]), grepl("^gamma0", param)))
    
    gamma1.est[s]<- paste("gamma1.est", s, sep = "_")
    assign(gamma1.est[s], filter(get(outputs[s]), grepl("^gamma1", param)))
    
  }
  
  #-------eps.l -------#
  for(s in 1:n.sims){
    eps.l.est[s]<- paste("eps.l.est", s, sep = "_")
    assign(eps.l.est[s], filter(get(outputs[s]), grepl("^eps.l", param)))
    
    assign(eps.l.est[s], 
           cbind(get(eps.l.est[s]), cv = get(eps.l.est[s])$sd/get(eps.l.est[s])$mean
           ))  
  }
  
  #-------eps.h -------#
  for(s in 1:n.sims){
    eps.h.est[s]<- paste("eps.h.est", s, sep = "_")
    assign(eps.h.est[s], filter(get(outputs[s]), grepl("^eps.h", param)))
    
    assign(eps.h.est[s], 
           cbind(get(eps.h.est[s]), cv = get(eps.h.est[s])$sd/get(eps.h.est[s])$mean
           ))  
  }
  
  #-------p -------#
  for(s in 1:n.sims){
    p.est[s]<- paste("p.est", s, sep = "_")
    assign(p.est[s], filter(get(outputs[s]), grepl("^p", param)))
    
    assign(p.est[s], 
           cbind(get(p.est[s]), cv = get(p.est[s])$sd/get(p.est[s])$mean
           ))  
    
  }
  
  #-------pl -------#
  for(s in 1:n.sims){
    pl.est[s]<- paste("pl.est", s, sep = "_")
    assign(pl.est[s], filter(get(outputs[s]), grepl("^pl", param)))
    
    assign(pl.est[s], 
           cbind(get(pl.est[s]), cv = get(pl.est[s])$sd/get(pl.est[s])$mean
           ))  
    
  }
  
  #-------ph -------#
  for(s in 1:n.sims){
    ph.est[s]<- paste("ph.est", s, sep = "_")
    assign(ph.est[s], filter(get(outputs[s]), grepl("^ph", param)))
    
    assign(ph.est[s], 
           cbind(get(ph.est[s]), cv = get(ph.est[s])$sd/get(ph.est[s])$mean
           ))  
    
  }
  
  #-------phi.eh -------#
  for(s in 1:n.sims){
    phi.eh.est[s]<- paste("phi.eh.est", s, sep = "_")
    assign(phi.eh.est[s], filter(get(outputs[s]), grepl("^phi.eh", param)))
    
    assign(phi.eh.est[s], 
           cbind(get(phi.eh.est[s]), cv = get(phi.eh.est[s])$sd/get(phi.eh.est[s])$mean
           ))  
    
  }
  
  #-------phi.lh -------#
  for(s in 1:n.sims){
    phi.lh.est[s]<- paste("phi.lh.est", s, sep = "_")
    assign(phi.lh.est[s], filter(get(outputs[s]), grepl("^phi.lh", param)))
    
    assign(phi.lh.est[s], 
           cbind(get(phi.lh.est[s]), cv = get(phi.lh.est[s])$sd/get(phi.lh.est[s])$mean
           ))  
    
  }
  
  #-------phi.hh -------#
  for(s in 1:n.sims){
    phi.hh.est[s]<- paste("phi.hh.est", s, sep = "_")
    assign(phi.hh.est[s], filter(get(outputs[s]), grepl("^phi.hh", param)))
    
    assign(phi.hh.est[s], 
           cbind(get(phi.hh.est[s]), cv = get(phi.hh.est[s])$sd/get(phi.hh.est[s])$mean
           ))  
    
  }
  
  #-------delta -------#
  for(s in 1:n.sims){
    delta.est[s]<- paste("delta.est", s, sep = "_")
    assign(delta.est[s], filter(get(outputs[s]), grepl("^delta", param)))
    
    assign(delta.est[s], 
           cbind(get(delta.est[s]), cv = get(delta.est[s])$sd/get(delta.est[s])$mean
           ))  
    
  }
  
  #save annual data
  for(s in 1:n.sims){
    assign(final.states[s], 
           cbind(get(final.states[s]), year = year))
    
    assign(gamma0.est[s], 
           cbind(get(gamma0.est[s]), year = year))
    
    assign(gamma1.est[s], 
           cbind(get(gamma1.est[s]), year = year))
    
    assign(eps.l.est[s], 
           cbind(get(eps.l.est[s]), year = year))
    
    assign(eps.h.est[s], 
           cbind(get(eps.h.est[s]), year = year))
    
    assign(p.est[s], 
           cbind(get(p.est[s]), year = year))
    
    assign(ph.est[s], 
           cbind(get(ph.est[s]), year = year))
    
    assign(pl.est[s], 
           cbind(get(pl.est[s]), year = year))
    
    assign(pl.est[s], 
           cbind(get(pl.est[s]), year = year))
    
    assign(phi.eh.est[s], 
           cbind(get(phi.eh.est[s]), year = year))
    
    assign(phi.lh.est[s], 
           cbind(get(phi.lh.est[s]), year = year))
    
    assign(phi.hh.est[s], 
           cbind(get(phi.hh.est[s]), year = year))
    
    assign(delta.est[s], 
           cbind(get(delta.est[s]), year = year))
    
    all.final.states[s]<- paste("final.states.allsummary", s, sep = "_")
    all.gamma0.est[s]<- paste("gamma0.allsummary", s, sep = "_")
    all.gamma1.est[s]<- paste("gamma1.allsummary", s, sep = "_")
    all.eps.l.est[s]<- paste("eps.l.allsummary", s, sep = "_")
    all.eps.h.est[s]<- paste("eps.h.allsummary", s, sep = "_")
    all.p.est[s]<- paste("p.allsummary", s, sep = "_")
    all.pl.est[s]<- paste("pl.allsummary", s, sep = "_")
    all.ph.est[s]<- paste("ph.allsummary", s, sep = "_")
    all.phi.eh.est[s]<- paste("phi.eh.allsummary", s, sep = "_")
    all.phi.lh.est[s]<- paste("phi.lh.allsummary", s, sep = "_")
    all.phi.hh.est[s]<- paste("phi.hh.allsummary", s, sep = "_")
    all.delta.est[s]<- paste("delta.allsummary", s, sep = "_")
    
  }
  
  #If year 1 we set summary data frame to itself
  for(s in 1:n.sims){
    if(year == 1){
      assign(all.final.states[s], 
             get(final.states[s]))
      
      assign(all.gamma0.est[s], 
             get(gamma0.est[s]))
      
      assign(all.gamma1.est[s], 
             get(gamma1.est[s]))
      
      assign(all.eps.l.est[s], 
             get(eps.l.est[s]))
      
      assign(all.eps.h.est[s], 
             get(eps.h.est[s]))

      assign(all.p.est[s], 
             get(p.est[s]))
            
      assign(all.pl.est[s], 
             get(pl.est[s]))
      
      assign(all.ph.est[s], 
             get(ph.est[s]))
      
      assign(all.phi.eh.est[s], 
             get(phi.eh.est[s]))
      
      assign(all.phi.lh.est[s], 
             get(phi.lh.est[s]))
      
      assign(all.phi.hh.est[s], 
             get(phi.hh.est[s]))
      
      assign(all.delta.est[s], 
             get(delta.est[s]))
  
    }
  }
  


#################################################################################################
