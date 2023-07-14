library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(plyr)
library(tidyverse)
library(strex)

#### JAGS MODEL ####

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
n.years <- 5 #time steps
n.states <- 3


ps<- array(NA, c(n.states,n.sites,n.weeks, n.states)) #state transition array

gamma <- array(NA, c(n.sites,n.weeks,n.years,n.sims)) #invasion
gamma0 <- -2 #intrinsic invasion
gamma1 <- 0.5 #effect of neighboring locations on invasion probability

#transition probabilities
State <- array(NA, c(n.sites, n.weeks, n.years, n.sims))

# Observation probabilities 
Obs.multi <- array(NA, c(n.sites, n.weeks, n.years, n.sims))

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

sites.rem <- array(NA, dim = c(5, n.weeks, n.years, n.sims))

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


# ##### Week 2+ year 1 #####
# 
# #filling in transitions for second week, year 1
# for(s in 1:n.sims){
#   for(week in 2:n.weeks){
#     for(i in 1:(n.sites)){  
#       ###### State Transitions ######
#       gamma[i,week-1,year,s] <- invlogit(gamma0 + gamma1) #invasion probability
#       
#       ps[1,i,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
#       ps[1,i,week-1,2] <- gamma[i,week-1,year,s] #empty to low abundance
#       ps[1,i,week-1,3] <- 0
#       
#       #Transitions if in removal site locations
#       if(i %in% discard(sites.rem[,week-1,year,s], is.na) ){
#         ps[2,i,week-1,1] <- eps.l #low abundance to empty
#         ps[2,i,week-1,2] <- (1- eps.l*(1-phi.lh)) #low abundance to low abundance
#         ps[2,i,week-1,3] <- (1- eps.l*(phi.lh)) #low abundance to high abundance
#       
#         ps[3,i,week-1,1] <- (eps.h) #high abundance to empty
#         ps[3,i,week-1,2] <- (1- eps.h)*(1-phi.hh) #high abundance to low abundance
#         ps[3,i,week-1,3] <- (1- eps.h)*(phi.hh) #high abundance to high abundance
#       }else{
#         ps[2,i,week-1,1] <- 0 #low abundance to empty
#         ps[2,i,week-1,2] <- (1-phi.lh) #low abundance to low abundance
#         ps[2,i,week-1,3] <- (phi.lh) #low abundance to high abundance
#         
#         ps[3,i,week-1,1] <- 0
#         ps[3,i,week-1,2] <- (1-phi.hh) #high abundance to low abundance
#         ps[3,i,week-1,3] <- (phi.hh) #high abundance to high abundance
#       }
#       
#       State[i,week,year,s] <- rcat(1,ps[State[i,week-1,year,s], i, (week-1), ])
#   
#     }
#     
#     ###### Observation data ######
#     for(i in segs.selected[,week]){
#       Obs.multi[i,week,year,s] <- rcat(1,po_multi[State[i,week,year,s], ])
#     }
#     
#     ###### Sites for removal ######
#     #if we have no sites for removal then we record that
#     if(sum(Obs.multi[,week,year,s] > 1, na.rm = TRUE) == 0){
#       sites.rem[1:5, week, year, s] <- rep(NA, 5)
#     }else{
#       sites.rem[1:length(which(Obs.multi[,week,year,s] > 1)), week, year, s] <- which(Obs.multi[,week,year,s] > 1)
#     }
#     
#   }
# }

#### Week 2+ year 1  with space #####
D <- array(NA, c(n.sites,n.weeks, n.years,n.sims)) #neighbor states


#filling in transitions for second week, year 1
for(s in 1:n.sims){
  for(week in 2:n.weeks){
    for(i in 1:(n.sites)){
      ###### State Transitions ######
      ###### edge transitions #####
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
    
  }
}

#checking
# discard(sites.rem[,4,year,2], is.na)
# Obs.multi[, 4, 1, 2]
# 
# State[,4,1,2]

#### JAGS DATA ####
my.data <- list()
initial.values <- list() #initial value list
outs <- rep(NA,n.sims)
#creating data for JAGS model
rem.vec <- array(NA, dim = c(n.sites,n.weeks, n.years, n.sims))

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

#check
# sites.rem[,1,year,1]
# rem.vec[,1,year,1]

n.burnin <- 10
n.iter <- 100 + n.burnin
n.chains <- 3
n.thin <- 1

S.init <-  array(NA, c(n.sites, n.years, n.sims))
S.init[1:5,year,] <- 3
S.init[6:n.sites,year,] <- sample(c(1,2), (n.sites-5)*n.sims, replace = T)


#D.init 
D.init <-  array(NA, c(n.sites, n.years, n.sims))
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
                        "rho.l", "alpha.l", "rho.h", "alpha.h",
                        "delta","phi.lh", "phi.hh")


for(s in 1:n.sims){
  my.data[[s]] <- list(n.sites = n.sites,
                       n.weeks = n.weeks, 
                       S.init = S.init[,year,s],
                       D.init = D.init[,year,s],
                       y.multi = Obs.multi[,,year,s],
                       rem.vec = rem.vec[,,year,s],
                       
                       #priors
                       gamma0_a = 0,
                       gamma0_b = 1,
                       gamma1_a = 0,
                       gamma1_b = 0.1,
                       eps.l_a = 1, 
                       eps.l_b = 1,
                       eps.h_a = 1, 
                       eps.h_b = 1,
                       phi.lh_a = 1,
                       phi.lh_b = 1,
                       phi.hh_a = 1,
                       phi.hh_b = 1,
                       pl_a = 1, 
                       pl_b = 1,
                       l_mean= 0,
                       l_sd= 10,
                       ph_a = 1, 
                       ph_b = 1,
                       h_mean= 0,
                       h_sd= 10,
                       delta_a = 1,
                       delta_b = 1                  
                       
  )
}

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

# 
# for(s in 1:n.sims){
#   initial.values[[s]] <- function()list()}


for(s in 1:n.sims){
  
  outs[s]<- paste("out", s, sep = "_")
  assign(outs[s],
         jagsUI::jags(data = my.data[[s]], inits = initial.values[[s]],
                      parameters.to.save = parameters.to.save, model.file = "Flower_mod_dat_1.txt",
                      n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
}

as.vector(round(out_1$summary[1:20,1]))
State[,4,1,1]
