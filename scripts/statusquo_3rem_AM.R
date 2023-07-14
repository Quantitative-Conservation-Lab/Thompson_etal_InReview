library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(plyr)
library(tidyverse)
library(strex)

#### JAGS MODEL ####

start.time <- Sys.time()

sink("Flower_mod_dat_1.txt")
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
# 2 low state
# 3 high state
# 
# Observations (O):  
# 1 not observed
# 2 observed low state
# 3 observed high state
# -------------------------------------------------

#### PRIORS ####
  eps.l ~ dbeta(eps.l_a,eps.l_b) #erradication when at low state
  eps.h ~ dbeta(eps.h_a,eps.h_b) #erradication when at high state
  gamma0 ~dnorm(gamma0_a,gamma0_b) #intrinsic invasion probability 
  gamma1 ~ dnorm(gamma1_a, gamma1_b) #effect of neighboring locations on invasion probability
  phi.lh ~ dbeta(phi.lh_a, phi.lh_b) #transition from low to high
  phi.hh ~ dbeta(phi.hh_a, phi.hh_b) #transition from high to high
  
  rho.l ~ dbeta(pl_a,pl_b) #base detection for low state
  alpha.l ~ dnorm(l_mean,l_tau) #difference in baseline detection probability between observation1 and 2, low state
  rho.h ~ dbeta(ph_a,ph_b) #base detection for high state
  alpha.h ~ dnorm(h_mean, h_tau) #difference in baseline detection probability between observation1 and 2, high state
  delta ~ dbeta(delta_a, delta_b) #probability of observing the high state given species has been detected and true state is high


  #detection parameters
  l_tau <- 1/(l_sd * l_sd) #precision
  h_tau <- 1/(h_sd * h_sd) #precision

  
  
  logit(pmulti.l) <- alpha.l + rho.l 
  logit(pmulti.h) <- alpha.h + rho.h
  
#--------------------------------------------------#
# STATE TRANSITION
for (i in 1:n.sites){  
  # State transition probabilities: probability of S(t+1) given S(t)
  for (t in 1:n.weeks){
    #index = [current state, location, time, future state]
    #empty stay empty
    ps[1,i,t,1] <- 1-gamma[i,t] #1-gamma = not invasion probability
    
    #empty to low abundance
    ps[1,i,t,2] <- gamma[i,t] #invasion probability
    
    #empty to high abundance
    ps[1,i,t,3] <- 0 #invasion probability

    #low abundance to empty
    ps[2,i,t,1] <- (eps.l*rem.vec[i,t]) #erradication probability
                                      # rem.vec[i,t] = 0,1 if 0, then no removal and no erradiction
    
    #low abundance to low abundance
    ps[2,i,t,2] <- (1- eps.l*rem.vec[i,t])*(1-phi.lh) #erradication failure probability
    
    #low abundance to high abundance
    ps[2,i,t,3] <- (1- eps.l*rem.vec[i,t])*(phi.lh)
    
    #high abundance to empty
    ps[3,i,t,1] <- (eps.h*rem.vec[i,t]) #erradication probability
    
    #high abundance to low abundance
    ps[3,i,t,2] <- (1- eps.h*rem.vec[i,t])*(1-phi.hh) #erradication failure probability
    
    #low abundance to high abundance
    ps[3,i,t,3] <- (1- eps.h*rem.vec[i,t])*(phi.hh)

    
    #--------------------------------------------------#
    # OBSERVATION PROBABILITIES (for multistate data) 
    # Observation probabilities of given S(t)
    #index = [current state, location, time, current observation]
   
    #Empty and not observed    
    po_multi[1,i,t,1] <- 1
    
    #Empty and observed low 
    po_multi[1,i,t,2] <- 0
    
    #Empty and observed high  
    po_multi[1,i,t,3] <- 0
 
    #Low state and not observed   
    po_multi[2,i,t,1] <- 1-pmulti.l #not detected probability
    
    #Low state and observed low 
    po_multi[2,i,t,2] <- pmulti.l #detection probability
    
    #Low state and observed high 
    po_multi[2,i,t,3] <- 0 
    
    #High state and not observed   
    po_multi[3,i,t,1] <- 1-pmulti.h #not detected probability
    
    #High state and observed low 
    po_multi[3,i,t,2] <- (1-pmulti.h)*(1-delta) #detection probability
    
    #high abundance observed high abundance
    po_multi[3,i,t,3] <- pmulti.h*delta
   

   logit(gamma[i,t]) <- gamma1*D[i,t] + gamma0 #invasion probability

   
  } #t
} #i

  #### Likelihood ####
  for (i in 2:(n.sites-1)){
    # Define state at beginning
    State[i,1] <- S.init[i] #we know state at the start
    D[i,1] <- D.init[i]
    
    y.multi[i,1] ~ dcat(po_multi[State[i,1], i, 1,])
    
    
    
    for (t in 2:n.weeks){ #12
      # State process: state given previous state and transition probability
      State[i,t] ~ dcat(ps[State[i,t-1], i, t-1, ]) 
      
      D[i,t] <- State[i-1,t] + State[i+1,t] #state of neighbors 
      y.multi[i,t] ~ dcat(po_multi[State[i,t], i, t,])
     
    } #t
      
      #Derived parameter:
      
      State.fin[i] <- State[i,n.weeks] #state after 12 months
  } #i
  
  #Fill in above for edge sites (1 and n.sites)
  State[1,1] <- S.init[1] 
  State[n.sites,1] <- S.init[n.sites] 
  D[1,1] <- D.init[1]
  D[n.sites,1] <- D.init[n.sites]
  
  y.multi[1,1] ~ dcat(po_multi[State[1,1], 1, 1,])
  y.multi[n.sites,1] ~ dcat(po_multi[State[n.sites,1], n.sites, 1,])
  
  
   for (t in 2:n.weeks){
      State[1,t] ~ dcat(ps[State[1,t-1], 1, t-1, ])
      State[n.sites,t] ~ dcat(ps[State[n.sites,t-1], n.sites, t-1, ])
      D[1,t] <- State[2,t]
      D[n.sites,t] <- State[n.sites-1,t]
      
      y.multi[1,t] ~ dcat(po_multi[State[1,t], 1, t,])
      y.multi[n.sites,t] ~ dcat(po_multi[State[n.sites,t], n.sites, t,])
      
    } 

  State.fin[1] <- State[1,n.weeks]
  State.fin[n.sites] <- State[n.sites,n.weeks]
  
  

} #end model
", fill = TRUE)
sink()

#### Data ####
n.sims <- 2 #simulations
eps.l <- 0.9 #eradication when at low state
eps.h <- 0.7 #eradication when at high state

phi.lh <- 0.05 #transition from low to high
phi.hh <- 0.9 #transition from high to high

p1.l <- 0.2 #detection probability (for multistate data)
p1.h <- 0.6 #detection probability (for multistate data)

p2.l <- 0.4 #detection probability (for multistate data)
p2.h <- 0.8 #detection probability (for multistate data)
delta <- 0.5
n.sites <- 20 #number of sites
n.rem <- n.sites
n.obs <- n.sites
n.weeks <- 4
n.years <- 10 #time steps
n.states <- 3


ps<- array(NA, c(n.states,n.sites,n.weeks, n.states)) #state transition array

gamma <- array(NA, c(n.sites,n.weeks,n.yearss,n.sims)) #invasion
gamma0 <- -2 #intrinsic invasion
gamma1 <- 0.5 #effect of neighboring locations on invasion probability

#transition probabilities
State <- array(NA, c(n.sites, n.weeks, n.yearss, n.sims))

# Observation probabilities 
Obs.multi <- array(NA, c(n.sites, n.weeks, n.yearss, n.sims))

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

sites.rem <- array(NA, dim = c(5, n.weeks, n.yearss, n.sims))

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


D <- array(NA, c(n.sites,n.weeks, n.yearss,n.sims)) #neighbor states

#### JAGS data ####
gamma0_a <- array(NA, c(n.years,n.sims))
gamma0_b <- array(NA, c(n.years,n.sims))
gamma1_a <- array(NA, c(n.years,n.sims))
gamma1_b <- array(NA, c(n.years,n.sims))

eps.l_a <- array(NA, c(n.years, n.sims))
eps.l_b <- array(NA, c(n.years, n.sims))
eps.h_a <- array(NA, c(n.years, n.sims))
eps.h_b <- array(NA, c(n.years, n.sims))

phi.lh_a <- array(NA, c(n.years, n.sims))
phi.lh_b <- array(NA, c(n.years, n.sims))
phi.hh_a <- array(NA, c(n.years, n.sims))
phi.hh_b <- array(NA, c(n.years, n.sims))

pl_a <- array(NA, c(n.years, n.sims))
pl_b <- array(NA, c(n.years, n.sims))
l_mean <- array(NA, c(n.years, n.sims))
l_sd <- array(NA, c(n.years, n.sims))
ph_a <- array(NA, c(n.years, n.sims))
ph_b <- array(NA, c(n.years, n.sims))
h_mean <- array(NA, c(n.years, n.sims))
h_sd <- array(NA, c(n.years, n.sims))

delta_a <- array(NA, c(n.years, n.sims))
delta_b <- array(NA, c(n.years, n.sims))

S.init <-  array(NA, c(n.sites, n.years, n.sims))
D.init <- array(NA, c(n.sites,n.years,n.sims))
rem.vec <- array(NA, dim = c(n.sites,n.weeks, n.years, n.sims))

rhat_vals <- array(NA, c(n.years, n.sims))
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
phi.lh.est <- rep(NA, n.sims)
phi.hh.est <- rep(NA, n.sims)

rho.l.est <- rep(NA, n.sims)
alpha.l.est <- rep(NA, n.sims)
rho.h.est <- rep(NA, n.sims)
alpha.h.est <- rep(NA, n.sims)
delta.est <- rep(NA, n.sims)

all.final.states <- rep(NA, n.sims)
all.gamma0.est <- rep(NA, n.sims)
all.gamma1.est <- rep(NA, n.sims)
all.eps.l.est <- rep(NA, n.sims)
all.eps.h.est <- rep(NA, n.sims)
all.phi.lh.est <- rep(NA, n.sims)
all.phi.hh.est <- rep(NA, n.sims)

all.rho.l.est <- rep(NA, n.sims)
all.alpha.l.est <- rep(NA, n.sims)
all.rho.h.est <- rep(NA, n.sims)
all.alpha.h.est <- rep(NA, n.sims)
all.delta.est <- rep(NA, n.sims)

final.states.mean <- array(NA, dim = c(n.sites, n.years, n.sims))
site.rem.options <- list()

alpha.gammas <- rep(NA, n.sims)
beta.gammas <- rep(NA, n.sims)

alpha.eps.l <- rep(NA, n.sims)
beta.eps.l <- rep(NA, n.sims)
alpha.eps.h <- rep(NA, n.sims)
beta.eps.h <- rep(NA, n.sims)

alpha.phi.lh <- rep(NA, n.sims)
beta.phi.lh <- rep(NA, n.sims)

alpha.phi.hh <- rep(NA, n.sims)
beta.phi.hh <- rep(NA, n.sims)

alpha.rhols <- rep(NA, n.sims)
beta.rhols <- rep(NA, n.sims)
alpha.rhohs <- rep(NA, n.sims)
beta.rhohs <- rep(NA, n.sims)

alpha.lmeans <- rep(NA, n.sims)
alpha.lsds <- rep(NA, n.sims)
alpha.hmeans <- rep(NA, n.sims)
alpha.hsds <- rep(NA, n.sims)

alpha.delta <- rep(NA, n.sims)
beta.delta <- rep(NA, n.sims)

max.down <- rep(NA, n.sims)
min.down <- rep(NA, n.sims)
site.obs.next <- array(NA, c(n.obs,n.sims))
next.down <- list()
add.obs <- list()
inbetween.rem <- list()
add.obs1 <- list()
add.obs2 <- list()
initial.values <- list() #initial value list
final.states.mean <- array(NA, dim = c(n.sites, n.years, n.sims))


####################################################################################
#### Run ####
year <- 1

for(year in 1:n.years){

#### 1. Simulate truth #####
for(s in 1:n.sims){
#----- year 1 simulations -----#
if(year == 1 ){
  for(week in 2:n.weeks){
    for(i in 1:(n.sites)){
      ##---- edge transitions ----##
      if(i %in% 2:(n.sites-1)){
        D[i,week-1,year,s] <- State[i+1,week-1,year,s] + State[i-1,week-1,year,s] 
        gamma[i,week-1,year,s] <- invlogit(gamma0 + gamma1*D[i,week-1,year,s]) #invasion probability
        
        ps[1,i,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
        ps[1,i,week-1,2] <- gamma[i,week-1,year,s] #empty to low abundance
        ps[1,i,week-1,3] <- 0
      }else{
        D[1,week-1,year,s] <- State[2,week-1,year,s]
        D[n.sites,week-1,year,s] <- State[(n.sites-1),week-1,year,s]
        
        gamma[1,week-1,year,s] <- invlogit(gamma0 + gamma1*D[1,week-1,year,s])
        ps[1,1,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
        ps[1,1,week-1,2] <- gamma[i,week-1,year,s]
        ps[1,1,week-1,3] <- 0
        
        gamma[n.sites,week-1,year,s] <- invlogit(gamma0 + gamma1*D[n.sites,week-1,year,s])
        ps[1,n.sites,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
        ps[1,n.sites,week-1,2] <- gamma[i,week-1,year,s]
        ps[1,n.sites,week-1,3] <- gamma[i,week-1,year,s]
      }
      
      ##---- Removal site transitions ----##
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
    
    ##---- Observation data ----##
    for(i in segs.selected[,week]){
      Obs.multi[i,week,year,s] <- rcat(1,po_multi[State[i,week,year,s], ])
    }
    
    ##---- Sites for removal ----##
    #if we have no sites for removal then we record that
    if(sum(Obs.multi[,week,year,s] >= 2, na.rm = TRUE) == 0){
      sites.rem[1:5, week, year, s] <- rep(NA, 5)
    }else{
      sites.rem[1:length(which(Obs.multi[,week,year,s] >= 2)), week, year, s] <- which(Obs.multi[,week,year,s] >= 2)
    }
    
  } #ends week loop
 
} #ends year == 1 

#----- year > 1 simulations -----#
if(year > 1){
  
  ##### week 1 ####
  week <- 1
  
  for(i in 1:(n.sites)){
    ## State Transitions 
    ## edge transitions
    if(i %in% 2:(n.sites-1)){
      D[i,4,year-1,s] <- State[i+1,4,year-1,s] + State[i-1,4,year-1,s] 
      gamma[i,4,year-1,s] <- invlogit(gamma0 + gamma1*D[i,4,year-1,s]) #invasion probability
      
      ps[1,i,4,1] <- 1-gamma[i,4,year-1,s] #empty stay empty
      ps[1,i,4,2] <- gamma[i,4,year-1,s] #empty to low abundance
      ps[1,i,4,3] <- 0
    }else{
      D[1,4,year-1,s] <- State[2,4,year-1,s]
      D[n.sites,4,year-1,s] <- State[(n.sites-1),4,year-1,s]
      
      gamma[1,4,year-1,s] <- invlogit(gamma0 + gamma1*D[1,4,year-1,s])
      ps[1,1,4,1] <- 1-gamma[i,4,year-1,s] #empty stay empty
      ps[1,1,4,2] <- gamma[i,4,year-1,s]
      ps[1,1,4,3] <- 0
      
      gamma[n.sites,4,year-1,s] <- invlogit(gamma0 + gamma1*D[n.sites,4,year-1,s])
      ps[1,n.sites,4,1] <- 1-gamma[i,4,year-1,s] #empty stay empty
      ps[1,n.sites,4,2] <- gamma[i,4,year-1,s]
      ps[1,n.sites,4,3] <- gamma[i,4,year-1,s]
    }
    
    ##removal site transitions 
    #Transitions if in removal site locations
    if(i %in% discard(sites.rem[,4,year-1,s], is.na) ){
      ps[2,i,4,1] <- eps.l #low abundance to empty
      ps[2,i,4,2] <- (1- eps.l*(1-phi.lh)) #low abundance to low abundance
      ps[2,i,4,3] <- (1- eps.l*(phi.lh)) #low abundance to high abundance
      
      ps[3,i,4,1] <- (eps.h) #high abundance to empty
      ps[3,i,4,2] <- (1- eps.h)*(1-phi.hh) #high abundance to low abundance
      ps[3,i,4,3] <- (1- eps.h)*(phi.hh) #high abundance to high abundance
    }else{
      ps[2,i,4,1] <- 0 #low abundance to empty
      ps[2,i,4,2] <- (1-phi.lh) #low abundance to low abundance
      ps[2,i,4,3] <- (phi.lh) #low abundance to high abundance
      
      ps[3,i,4,1] <- 0
      ps[3,i,4,2] <- (1-phi.hh) #high abundance to low abundance
      ps[3,i,4,3] <- (phi.hh) #high abundance to high abundance
    }
    
    State[i,week,year,s] <- rcat(1,ps[State[i,4,year-1,s], i, 4, ])
    
  }
  
  ## Observation data 
  for(i in segs.selected[,week]){
    Obs.multi[i,week,year,s] <- rcat(1,po_multi[State[i,week,year,s], ])
  }
  
  ## Sites for removal
  #if we have no sites for removal then we record that
  if(sum(Obs.multi[,week,year,s] >= 2, na.rm = TRUE) == 0){
    sites.rem[1:5, week, year, s] <- rep(NA, 5)
  }else{
    sites.rem[1:length(which(Obs.multi[,week,year,s] >= 2)), week, year, s] <- which(Obs.multi[,week,year,s] >= 2)
  }
  
  ##### week 2+ ####
  for(week in 2:n.weeks){
    for(i in 1:(n.sites)){
      ###### State Transitions ######
      ##---- edge transitions ----##
      if(i %in% 2:(n.sites-1)){
        D[i,week-1,year,s] <- State[i+1,week-1,year,s] + State[i-1,week-1,year,s] 
        gamma[i,week-1,year,s] <- invlogit(gamma0 + gamma1*D[i,week-1,year,s]) #invasion probability
        
        ps[1,i,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
        ps[1,i,week-1,2] <- gamma[i,week-1,year,s] #empty to low abundance
        ps[1,i,week-1,3] <- 0
      }else{
        D[1,week-1,year,s] <- State[2,week-1,year,s]
        D[n.sites,week-1,year,s] <- State[(n.sites-1),week-1,year,s]
        
        gamma[1,week-1,year,s] <- invlogit(gamma0 + gamma1*D[1,week-1,year,s])
        ps[1,1,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
        ps[1,1,week-1,2] <- gamma[i,week-1,year,s]
        ps[1,1,week-1,3] <- 0
        
        gamma[n.sites,week-1,year,s] <- invlogit(gamma0 + gamma1*D[n.sites,week-1,year,s])
        ps[1,n.sites,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
        ps[1,n.sites,week-1,2] <- gamma[i,week-1,year,s]
        ps[1,n.sites,week-1,3] <- gamma[i,week-1,year,s]
      }
      
      ###### removal site transitions #####
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
    if(sum(Obs.multi[,week,year,s] >= 2, na.rm = TRUE) == 0){
      sites.rem[1:5, week, year, s] <- rep(NA, 5)
    }else{
      sites.rem[1:length(which(Obs.multi[,week,year,s] >= 2)), week, year, s] <- which(Obs.multi[,week,year,s] >= 2)
    }
    
  } #ends week loop
  
} #ends year > 1 things
  
} #ends simulations


#check:
#discard(sites.rem[,1,year,2], is.na)
#Obs.multi[, 1, year, 2]

##### Initial priors #####

#------------------------Year 1 Priors------------------------#
if(year == 1){
  #State process
  gamma0_a[1,] <- 0
  gamma0_b[1,] <- 1
  gamma1_a[1,] <- 0
  gamma1_b[1,] <- 0.1
  
  phi.lh_a[1,] <- 1
  phi.lh_b[1,] <- 1
  phi.hh_a[1,] <- 1
  phi.hh_b[1,] <- 1
  
  eps.l_a[1,] <- 1
  eps.l_b[1,] <- 1
  eps.h_a[1,] <- 1
  eps.h_b[1,] <- 1
  
  #Observation process
  
  pl_a[1,] <- 1
  pl_b[1,] <- 1
  l_mean[1,] <- 0
  l_sd[1,] <- 10
  
  ph_a[1,] <- 1
  ph_b[1,] <- 1
  h_mean[1,] <- 0
  h_sd[1,] <- 10
  
  delta_a[1,] <- 1
  delta_b[1,] <- 1
  
  S.init[1:5,year,] <- 3
  S.init[6:n.sites,year,] <- sample(c(1,2), (n.sites-5)*n.sims, replace = T)
  
  for(s in 1:n.sims){
    for(i in 2:(n.sites-1)){
      D.init[i,year,s] <- S.init[i+1,year,s] + S.init[i-1,year,s]
    }
    
    D.init[1,year,s] <- S.init[2,year,s]
    D.init[n.sites,year,s] <- S.init[(n.sites-1),year,s]
    
  }
  
  
} else{
  for(s in 1:n.sims){
    ##### Year 1+ prior #####
    #State process
    #-------gamma priors: invasion probability -------#
    
    gamma0_a[year,s] <- get(gamma0.est[s])$mean
    gamma0_b[year,s] <- get(gamma0.est[s])$sd
    gamma1_a[year,s] <- get(gamma1.est[s])$mean
    gamma1_b[year,s] <- get(gamma1.est[s])$sd
    
    #-------phi priors: transition probabilities -------# 
    ## Transition low to high ##
    alpha.phi.lh[s]<- paste("alpha.phi.lh", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.phi.lh[s],
           (1 - get(phi.lh.est[s])$mean*(1 + get(phi.lh.est[s])$cv^2))/(get(phi.lh.est[s])$cv^2))
    
    beta.phi.lh[s]<- paste("beta.phi.lh", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.phi.lh[s],
           get(alpha.phi.lh[s])*(1 - get(phi.lh.est[s])$mean)/get(phi.lh.est[s])$mean)
    
    #assigning these values for the next jags run:
    phi.lh_a[year,s] <- get(alpha.phi.lh[s])
    phi.lh_b[year,s] <- get(beta.phi.lh[s])
  
    ## Transition high to high ##
    alpha.phi.hh[s]<- paste("alpha.phi.hh", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.phi.hh[s],
           (1 - get(phi.hh.est[s])$mean*(1 + get(phi.hh.est[s])$cv^2))/(get(phi.hh.est[s])$cv^2))
    
    beta.phi.hh[s]<- paste("beta.phi.hh", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.phi.hh[s],
           get(alpha.phi.hh[s])*(1 - get(phi.hh.est[s])$mean)/get(phi.hh.est[s])$mean)
    
    #assigning these values for the next jags run:
    phi.hh_a[year,s] <- get(alpha.phi.hh[s])
    phi.hh_b[year,s] <- get(beta.phi.hh[s])
    
    
    #-------eps priors: eradication probability -------#
    ## Low ##
    alpha.eps.l[s]<- paste("alpha.eps.l", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.eps.l[s],
           (1 - get(eps.l.est[s])$mean*(1 + get(eps.l.est[s])$cv^2))/(get(eps.l.est[s])$cv^2))
    
    beta.eps.l[s]<- paste("beta.eps.l", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.eps.l[s],
           get(alpha.eps.l[s])*(1 - get(eps.l.est[s])$mean)/get(eps.l.est[s])$mean)
    
    #assigning these values for the next jags run:
    eps.l_a[year,s] <- get(alpha.eps.l[s])
    eps.l_b[year,s] <- get(beta.eps.l[s])
    
    ## High ##
    alpha.eps.h[s]<- paste("alpha.eps.h", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.eps.h[s],
           (1 - get(eps.h.est[s])$mean*(1 + get(eps.h.est[s])$cv^2))/(get(eps.h.est[s])$cv^2))
    
    beta.eps.h[s]<- paste("beta.eps.h", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.eps.h[s],
           get(alpha.eps.h[s])*(1 - get(eps.h.est[s])$mean)/get(eps.h.est[s])$mean)
    
    #assigning these values for the next jags run:
    eps.h_a[year,s] <- get(alpha.eps.h[s])
    eps.h_b[year,s] <- get(beta.eps.h[s])
    

    #Observation process
    #-------rho priors: base detection -------#
    ## Low ##
    alpha.rhols[s]<- paste("alpha.pl", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.rhols[s],
           (1 - get(rho.l.est[s])$mean*(1 + get(rho.l.est[s])$cv^2))/(get(rho.l.est[s])$cv^2))
    
    beta.rhols[s]<- paste("beta.pl", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.rhols[s],
           get(alpha.rhols[s])*(1 - get(rho.l.est[s])$mean)/get(rho.l.est[s])$mean)
    
    #assigning these values for the next jags run:
    pl_a[year,s] <- get(alpha.rhols[s])
    pl_b[year,s] <- get(beta.rhols[s])

    ## High ##
    alpha.rhohs[s]<- paste("alpha.ph", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.rhohs[s],
           (1 - get(rho.h.est[s])$mean*(1 + get(rho.h.est[s])$cv^2))/(get(rho.h.est[s])$cv^2))
    
    beta.rhohs[s]<- paste("beta.ph", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.rhohs[s],
           get(alpha.rhohs[s])*(1 - get(rho.h.est[s])$mean)/get(rho.h.est[s])$mean)
    
    #assigning these values for the next jags run:
    ph_a[year,s] <- get(alpha.rhohs[s])
    ph_b[year,s] <- get(beta.rhohs[s])
    
    
    #-------alpha priors: difference in baseline detection -------#
    ## Low ##
    l_mean[year,] <- get(alpha.l.est[s])$mean
    l_sd[year,] <- get(alpha.l.est[s])$sd
    
    ## High ##
    h_mean[year,] <- get(alpha.h.est[s])$mean
    h_sd[year,] <- get(alpha.h.est[s])$sd
    
    #-------delta priors -------#
    #delta = probability of observing the high state given species has been detected and true state is high
    alpha.delta[s]<- paste("alpha.delta", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.delta[s],
           (1 - get(delta.est[s])$mean*(1 + get(delta.est[s])$cv^2))/(get(delta.est[s])$cv^2))
    
    beta.delta[s]<- paste("beta.delta", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.delta[s],
           get(alpha.delta[s])*(1 - get(delta.est[s])$mean)/get(delta.est[s])$mean)
    
    #assigning these values for the next jags run:
    delta_a[year,s] <- get(alpha.delta[s])
    delta_b[year,s] <- get(beta.delta[s])
    
  }
  
  #-------Initial estimated state -------#
  #### FIX ####
  S.init[6:n.sites,year,] <- final.states.mean[6:n.sites,year-1,]
  
  S.init[1:5,year,] <- Obs.multi[1:5,1,year,]
  
  #S.init[,year,] <- State[,1,year,]
  
  for(s in 1:n.sims){
    for(i in 2:(n.sites-1)){
      D.init[i,year,s] <- S.init[i+1,year,s] + S.init[i-1,year,s]
    }
    
    D.init[1,year,s] <- S.init[2,year,s]
    D.init[n.sites,year,s] <- S.init[(n.sites-1),year,s]
    
  }
  
} #ends priors loops

###### 2b. JAGS data ######
#turning sites.rem into vectors of 1s and 0s
for(s in 1:n.sims){
  for(i in 1:n.sites){
    for(week in 1:n.weeks){
      if(i %in% sites.rem[,week,year,s]){
        rem.vec[i,week,year,s] <- 1
      } else{rem.vec[i,week,year,s] <- 0}
    }
  }
}
  


#Parameters monitored
parameters.to.save <- c("State.fin", "eps.l",
                        "eps.h","gamma0","gamma1",
                        "rho.l", "alpha.l", "rho.h", "alpha.h",
                        "delta","phi.lh", "phi.hh")


#settings: this works fine
# n.burnin <- 10000
# n.iter <- 1000000 + n.burnin
# n.chains <- 3
# n.thin <- 1

n.burnin <- 1000
n.iter <- 10000 + n.burnin
n.chains <- 3
n.thin <- 1

for(s in 1:n.sims){
  my.data[[s]] <- list(n.sites = n.sites,
                       n.weeks = n.weeks, 
                       S.init = S.init[,year,s],
                       D.init = D.init[,year,s],
                       y.multi = Obs.multi[,,year,s],
                       rem.vec = rem.vec[,,year,s],
                       
                       #priors
                       gamma0_a = gamma0_a[year,s],
                       gamma0_b = gamma0_b[year,s],
                       gamma1_a = gamma1_a[year,s],
                       gamma1_b = gamma1_b[year,s],
                       eps.l_a = eps.l_a[year,s], 
                       eps.l_b = eps.l_b[year,s],
                       eps.h_a = eps.h_a[year,s], 
                       eps.h_b = eps.h_b[year,s],
                       phi.lh_a = phi.lh_a[year,s],
                       phi.lh_b = phi.lh_b[year,s],
                       phi.hh_a = phi.hh_a[year,s],
                       phi.hh_b = phi.hh_b[year,s],
                       pl_a = pl_a[year,s], 
                       pl_b = pl_b[year,s],
                       l_mean= l_mean[year,s],
                       l_sd= l_sd[year,s],
                       ph_a = ph_a[year,s], 
                       ph_b = ph_b[year,s],
                       h_mean= h_mean[year,s],
                       h_sd= h_sd[year,s],
                       delta_a = delta_a[year,s],
                       delta_b = delta_b[year,s]                  
                       
  )
}

###### 2c. Run JAGS #####
##### Run year 1 #####
if(year == 1){
  State.start <- array(NA, c(n.sites,n.weeks,n.sims))
    
  State.start[1:5,2:4,] <- 3
  State.start[6:20,2,] <- 2
  State.start[6:20,3,] <- 2
  State.start[6:20,4,] <- 3
    
    
  for(s in 1:n.sims){
    initial.values[[s]] <- function()list(State = State.start[,,s],
                                          eps.l = 0.5,
                                          eps.h = 0.5,
                                          phi.lh = 0.5,
                                          phi.hh = 0.5
    )}
  
  for(s in 1:n.sims){
    
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]], inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_mod_dat_1.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
  }
    
}else{
    
  ##### Run year > 1 #####
  State.start <- array(NA, c(n.sites,n.weeks,n.sims))
  
  #just try for only data with > 3
  for(s in 1:n.sims){
    for(week in 2:n.weeks){
      if(sum(which(Obs.multi[,week,year,s] == 3)) >= 1){
        State.start[which(Obs.multi[,week,year,s] == 3),week,s] <- 3
      }
    }
  }

  
  
  for(s in 1:n.sims){
    initial.values[[s]] <- function()list(State = State.start[,,s],
                                          eps.l = 0.5,
                                          eps.h = 0.5,
                                          phi.lh = 0.5,
                                          phi.hh = 0.5
    )}
  
  for(s in 1:n.sims){
    
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]], inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_mod_dat_1.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
  }
  
}

#### 3. Extract estimation results ####
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

#-------rho.l.est -------#
for(s in 1:n.sims){
  rho.l.est[s]<- paste("rho.l.est", s, sep = "_")
  assign(rho.l.est[s], filter(get(outputs[s]), grepl("^rho.l", param)))
  
  assign(rho.l.est[s], 
         cbind(get(rho.l.est[s]), cv = get(rho.l.est[s])$sd/get(rho.l.est[s])$mean
         ))  
  
}

#-------rho.h.est -------#
for(s in 1:n.sims){
  rho.h.est[s]<- paste("rho.h.est", s, sep = "_")
  assign(rho.h.est[s], filter(get(outputs[s]), grepl("^rho.h", param)))
  
  assign(rho.h.est[s], 
         cbind(get(rho.h.est[s]), cv = get(rho.h.est[s])$sd/get(rho.h.est[s])$mean
         ))  
  
}

#-------alpha.l.est -------#

for(s in 1:n.sims){
  alpha.l.est[s]<- paste("alpha.l.est", s, sep = "_")
  assign(alpha.l.est[s], filter(get(outputs[s]), grepl("^alpha.l", param)))
  
}

#-------alpha.h.est -------#

for(s in 1:n.sims){
  alpha.h.est[s]<- paste("alpha.h.est", s, sep = "_")
  assign(alpha.h.est[s], filter(get(outputs[s]), grepl("^alpha.h", param)))
  
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
  
  assign(rho.l.est[s], 
         cbind(get(rho.l.est[s]), year = year))
  
  assign(rho.h.est[s], 
         cbind(get(rho.h.est[s]), year = year))
  
  assign(alpha.l.est[s], 
         cbind(get(alpha.l.est[s]), year = year))
  
  assign(alpha.h.est[s], 
         cbind(get(alpha.h.est[s]), year = year))
  
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
  all.phi.lh.est[s]<- paste("phi.lh.allsummary", s, sep = "_")
  all.phi.hh.est[s]<- paste("phi.hh.allsummary", s, sep = "_")
  all.rho.l.est[s]<- paste("rho.l.allsummary", s, sep = "_")
  all.rho.h.est[s]<- paste("rho.h.allsummary", s, sep = "_")
  all.alpha.l.est[s]<- paste("alpha.l.allsummary", s, sep = "_")
  all.alpha.h.est[s]<- paste("alpha.h.allsummary", s, sep = "_")
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
    
    assign(all.phi.lh.est[s], 
           get(phi.lh.est[s]))
    
    assign(all.phi.hh.est[s], 
           get(phi.hh.est[s]))
    
    assign(all.rho.l.est[s], 
           get(rho.l.est[s]))
    
    assign(all.rho.h.est[s], 
           get(rho.h.est[s]))
    
    assign(all.alpha.l.est[s], 
           get(alpha.l.est[s]))
    
    assign(all.alpha.h.est[s], 
           get(alpha.h.est[s]))
    
    assign(all.delta.est[s], 
           get(delta.est[s]))
    
  }
}

for(s in 1:n.sims){
  final.states.mean[,year,s] <- round((get(final.states[s]))$mean)
}

  
}


#################################################################################################

cbind(State[,1,1,1],State[,12,,1])

