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
sink("Flower_multistate_datM.txt")
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
# 2 low abundance
# 3 high abundance 
# 
# Observations Dat M:  
# 1 not detected
# 2 low abundance
# 3 high abundance
# -------------------------------------------------

#### PRIORS ####
  #Erradication:
  eps.l0 ~ dbeta(eps.l0.a,eps.l0.b)T(0.0001,0.9999) #eradication when at low state
  eps.l1 ~ dnorm(eps.l1.mean, eps.l1.tau) #effect of eradication 
  eps.l1.tau <- 1/(eps.l1.sd * eps.l1.sd) #precision parameter
  
  eps.h0 ~ dbeta(eps.h0.a,eps.h0.b)T(0.0001,0.9999) #eradication when at high state
  eps.h1 ~ dnorm(eps.h1.mean, eps.h1.tau) #effect of eradication 
  eps.h1.tau <- 1/(eps.h1.sd * eps.h1.sd) #precision parameter
  
  #Invasion:
  gamma.0 ~dnorm(gamma.0.mean,gamma.0.tau) #intrinsic invasion probability
  gamma.0.tau <- 1/(gamma.0.sd*gamma.0.sd) #precision parameter
  gamma.1 ~dnorm(gamma.1.mean, gamma.1.tau) #effect of site characteristics on invasion probability
  gamma.1.tau <- 1/(gamma.1.sd*gamma.1.sd) #precision parameter
  gamma.2 ~dnorm(gamma.2.mean, gamma.2.tau) #effect of Neighboring invasion state
  gamma.2.tau <- 1/(gamma.2.sd*gamma.2.sd) #precision parameter
  
  #State transition:
  phi0.lh ~ dbeta(phi.lh.a, phi.lh.b)T(0.0001,0.9999) #transition from low to high
  phi1.lh ~ dnorm(phi.lh1.mean, phi.lh1.tau) #effect of removal on transition
  phi.lh1.tau <- 1/(phi.lh1.sd*phi.lh1.sd) #precision parameter
  
  phi0.hh ~ dbeta(phi.hh.a, phi.hh.b)T(0.0001,0.9999) #transition from high to high
  phi1.hh ~ dnorm(phi.hh1.mean, phi.hh1.tau) #effect of removal on transition
  phi.hh1.tau <- 1/(phi.hh1.sd*phi.hh1.sd) #precision parameter
  
  #Detection low state:
  p.l0 ~ dbeta(p.l0.a, p.l0.b)T(0.0001,0.9999) #base detection for low state
  p.l1 ~ dnorm(p.l1.mean, p.l1.tau) #effect of effort 
  p.l1.tau <- 1/(p.l1.sd * p.l1.sd) #precision parameter
  alpha.l ~ dnorm(l.mean,l.tau) #difference in baseline detection between dat D and M
  l.tau <- 1/(l.sd * l.sd) #precision
  
  #Detection high state:
  p.h0 ~ dbeta(p.h0.a, p.h0.b)T(0.0001,0.9999) #base detection for high state
  p.h1 ~ dnorm(p.h1.mean, p.h1.tau) #effect of effort 
  p.h1.tau <- 1/(p.h1.sd * p.h1.sd) #precision parameter
  alpha.h ~ dnorm(h.mean,h.tau) #difference in baseline detection between dat D and M
  h.tau <- 1/(h.sd * h.sd) #precision

  logit(pM.l) <- p.l0 + p.l1*logeffort + alpha.l #detection low state
  logit(pM.h) <- p.h0 + p.h1*logeffort + alpha.h #detection high state
  
  #initial occupancy probabilities
  psi[1:3] ~ ddirch(psi.init) #alpha = rep(1,3)
  
#--------------------------------------------------#
# STATE TRANSITION
for (i in 1:n.sites){  
  # State transition probabilities (TPM): probability of S(t+1) given S(t)
  for (t in 1:n.weeks){
  
    logit(gamma[i,t]) <-gamma.0 + gamma.1*site.char[i] + gamma.2*D[i,t] #invasion probability
    logit(eps.l[i,t]) <- eps.l0 + eps.l1*rem.vec[i,t]*removal.hours[2] #erradication low state
    logit(eps.h[i,t]) <- eps.h0 + eps.h1*rem.vec[i,t]*removal.hours[2] #erradication high state
                                        # rem.vec[i] = 0,1 if 0, then no removal and no erradiction
    
    logit(phi.lh[i,t]) <- phi0.lh - phi1.lh*rem.vec[i,t]*removal.hours[2]
    logit(phi.hh[i,t]) <- phi0.hh - phi1.hh*rem.vec[i,t]*removal.hours[2]
    
    #index = [current state, location, time, future state]
    #empty stay empty
    TPM[1,i,t,1] <- 1-gamma[i,t] #1-gamma = not invasion probability
    
    #empty to low abundance
    TPM[1,i,t,2] <- gamma[i,t] #invasion probability
    
    #empty to high abundance
    TPM[1,i,t,3] <- 0 #invasion probability

    #low abundance to empty
    TPM[2,i,t,1] <- eps.l[i,t] #erradication probability
                                      
    #low abundance to low abundance
    TPM[2,i,t,2] <- (1- eps.l[i,t])*(1-phi.lh[i,t]) #erradication failure probability
    
    #low abundance to high abundance
    TPM[2,i,t,3] <- (1- eps.l[i,t])*(phi.lh[i,t])
    
    #high abundance to empty
    TPM[3,i,t,1] <- eps.h[i,t] #erradication probability
    
    #high abundance to low abundance
    TPM[3,i,t,2] <- (1- eps.h[i,t])*(1-phi.hh[i,t]) #erradication failure probability
    
    #high abundance to high abundance
    TPM[3,i,t,3] <- (1- eps.h[i,t])*(phi.hh[i,t])
    
    #--------------------------------------------------#
    # OBSERVATION PROBABILITIES (for multi state detection/nondetection data)
    
    for(j in 1:n.occs){

      #Empty and not observed  
      P.datM[1,i,j,t,1] <- 1
      
      #Empty and observed low 
      P.datM[1,i,j,t,2] <- 0
      
      #Empty and observed high
      P.datM[1,i,j,t,3] <- 0
   
      #Low state and not observed
      P.datM[2,i,j,t,1] <- 1-pM.l #not detected probability low state
      
      #Low state and observed low
      P.datM[2,i,j,t,2] <- pM.l #detection probability low state
      
      #Low state and observed high
      P.datM[2,i,j,t,3] <- 0 #detection probability low state
      
      #High state and not observed
      P.datM[3,i,j,t,1] <- 1-pM.h #not detected probability high state
      
      #High state and observed low
      P.datM[3,i,j,t,2] <- 0
      
      #High state and observed high
      P.datM[3,i,j,t,3] <- pM.h
      
    } #j 
  } #t
} #i

  #### Likelihood ####
  for (i in 1:n.sites){
      
    #-- Initial State: --# 
    
      State[i,1] ~ dcat(psi) #psi is written above in the priors
    
      D[i,1] <- sum(State[neighbors[i,], 1])/n.neighbors[i] #state of neighbors 
    
    #-- State Model: --#
    for (t in 2:n.weeks){ 
      # State process: state given previous state and transition probability
      State[i,t] ~ dcat(TPM[State[i,t-1], i, t-1, ]) 
      
      #State of neighbors
      D[i,t] <- sum(State[neighbors[i,], t])/n.neighbors[i] #state of neighbors 
       
     
    } #t loop

    #----- Observation Model -----#
    for(j in 1:n.occs){
      for(t in 1:n.weeks){
        # Observation process: draw observation given current state
        yM[i,j,t] ~ dcat(P.datM[State[i,t], i, j, t,]) 
        
      } #t
    } #j

    #Derived parameter: final estimated state
    State.fin[i] <- State[i,n.weeks] #state after 4 weeks
    
  } #i


} #end model
", fill = TRUE)
sink()

#------------------------------------------------------------------------------#
#### Path to save data ####
path <- here::here("results", "test", "1year")
res <- c('results/test/1year') #subset of path for plot save

#------------------------------------------------------------------------------#

#### Data and parameters ####
load("parameters.RData")

n.sims <-  10 #number of simulations
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 4 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

##### STATE VALUES ####
gamma.0 <- gamma.0s[1] #intrinsic invasion probability
gamma.1 <- gamma.1s[1] #effect of site characteristics
gamma.2 <- gamma.2s[1] #effect of neighboring invasion state

eps.l0 <- eps.l0s[1] #base eradication at low state
eps.l1 <- eps.l1s[1] #effect of eradication at low state
eps.h0 <- eps.h0s[1] #base eradication at high state
eps.h1 <- eps.h1s[1] #effect of eradication at high state
phi0.lh <- phi0.lhs[1] #transition from low to high base
phi1.lh <- phi1.lhs[1] #effect of removal on transition to low and high
phi0.hh <- phi0.hhs[1] #transition from high to high base
phi1.hh <- phi1.hhs[1] #effect of removal on transition to high and high

##### OBSERVATION VALUES ####
p.l0 <- p.l0s[1] #base detection for low state
p.l1 <- p.l1s[1] #effect of effort
alpha.l <- alpha.ls[1] #difference in baseline detection between dat D and M

p.h0 <- p.h0s[1] #base detection for high state
p.h1 <- p.h1s[1] #effect of effort
alpha.h <- alpha.hs[1] #difference in baseline detection between dat D and M

TPM.48 <- TPM.48s[,,1] #TPM matrix for 48 week period

search.hours <- search.hourss[1] #search effort

removal.hours <- c(0, 2, 3) #it removal takes 2 hours if in low state and 3 hours if in high state
n.resource <- 20 #total hours per week

#---- arrays ----#
gamma <- eps.l <- eps.h <- phi.lh <- phi.hh <- array(NA, c(n.sites, n.weeks, n.years, n.sims))

TPM<- array(NA, c(n.states,n.sites,n.weeks, n.years + 1,n.sims, n.states)) 

#---Habitat data---#
# effect of habitat quality on occupancy
site.char <- site.char
State.init <- State.init
State <- array(NA,c(n.sites, n.weeks, n.years+1, n.sims)) #state array

#---Neighbor data---#
D <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #neighbors array
num.neighbors <- 2 #one upstream, one downstream
neighbors <- matrix(NA, nrow = n.sites, ncol = num.neighbors) #neighbors matrix, each row (site) identifies the neighbors for that site 
neighbors[1,1] <- 2 #site 1 only has site 2 as its neighbor 
neighbors[2:n.sites, 1] <- seq(1,n.sites-1) #filling in upstream neighbors
neighbors[n.sites,2] <- n.sites-1 #end site only has end site -1 as its neighbor
neighbors[1:(n.sites-1), 2] <- seq(2,n.sites) #filling in downstream neighbors
n.neighbors <- rep(2,n.sites)
n.neighbors[1] <- n.neighbors[n.sites] <- 1

#--- removal data and occupancy data ---#
sites.rem.M <- array(NA, c(n.sites, n.weeks, n.years, n.sims)) 
#Removal for first time...
for(s in 1: n.sims){
  sites.rem.M[,1,1,s] <- sample(n.sites, n.sites, replace = F)
}

yM <- array(NA, c(n.sites, n.occs, n.weeks, n.years, n.sims)) 
resource.total <- array(0, c(n.weeks, n.years, n.sims)) 

logsearch.effort <- log(search.hours) #log search effort
max.spent <- 2*search.hours + removal.hours[2] #max resources you could spend at a single site

pM.l <- invlogit(p.l0 + p.l1*logsearch.effort + alpha.l) #low state detection probability (base detection + effect of effort)

pM.h <- invlogit(p.h0 + p.h1*logsearch.effort + alpha.h) #high state detection probability (base detection + effect of effort)


P.datM <- array(NA, dim = c(n.states, n.states))
P.datM[1,] <- c(1,0,0)
P.datM[2,] <- c(1-pM.l, pM.l, 0)
P.datM[3,] <- c(1-pM.h, 0, pM.h)

rem.vec <- array(NA, c(n.sites, n.weeks, n.years, n.sims)) #removal sites array

#### JAGS arrays ####
#### Empty jags arrays ####
S.init <- array(NA, c(n.sites,n.years, n.sims))
D.init <- array(NA, c(n.sites,n.years, n.sims))

#priors:
eps.l0.a <- array(NA, c(n.years, n.sims))
eps.l0.b <- array(NA, c(n.years, n.sims))
eps.l1.mean <- array(NA, c(n.years, n.sims))
eps.l1.sd <- array(NA, c(n.years, n.sims))

eps.h0.a <- array(NA, c(n.years, n.sims))
eps.h0.b <- array(NA, c(n.years, n.sims))
eps.h1.mean <- array(NA, c(n.years, n.sims))
eps.h1.sd <- array(NA, c(n.years, n.sims))

gamma.0.mean <- array(NA, c(n.years, n.sims))
gamma.0.sd <- array(NA, c(n.years, n.sims))
gamma.1.mean <- array(NA, c(n.years, n.sims))
gamma.1.sd <- array(NA, c(n.years, n.sims))
gamma.2.mean <- array(NA, c(n.years, n.sims))
gamma.2.sd <- array(NA, c(n.years, n.sims))

phi.lh.a <- array(NA, c(n.years, n.sims))
phi.lh.b <- array(NA, c(n.years, n.sims))
phi.lh1.mean <- array(NA, c(n.years, n.sims))
phi.lh1.sd <- array(NA, c(n.years, n.sims))

phi.hh.a <- array(NA, c(n.years, n.sims))
phi.hh.b <- array(NA, c(n.years, n.sims))
phi.hh1.mean <- array(NA, c(n.years, n.sims))
phi.hh1.sd <- array(NA, c(n.years, n.sims))

p.l0.a <- array(NA, c(n.years, n.sims))
p.l0.b <- array(NA, c(n.years, n.sims))
p.l1.mean <- array(NA, c(n.years, n.sims))
p.l1.sd <- array(NA, c(n.years, n.sims))
l.mean <- array(NA, c(n.years, n.sims))
l.sd <- array(NA, c(n.years, n.sims))
p.h0.a <- array(NA, c(n.years, n.sims))
p.h0.b <- array(NA, c(n.years, n.sims))
p.h1.mean <- array(NA, c(n.years, n.sims))
p.h1.sd <- array(NA, c(n.years, n.sims))
h.mean <- array(NA, c(n.years, n.sims))
h.sd <- array(NA, c(n.years, n.sims))

x <- list()
rhat_vals <- array(NA, c(n.years, n.sims))
sites <- list()
my.data <- list()
outs <- rep(NA,n.sims)
outputsfull <- rep(NA, n.sims)
outputs <- rep(NA, n.sims)
mcmcs <- rep(NA, n.sims)

alpha.eps.l0 <- rep(NA, n.sims)
beta.eps.l0 <- rep(NA, n.sims)
alpha.eps.h0 <- rep(NA, n.sims)
beta.eps.h0 <- rep(NA, n.sims)
alpha.phi.lh <- rep(NA, n.sims)
beta.phi.lh <- rep(NA, n.sims)
alpha.phi.hh <- rep(NA, n.sims)
beta.phi.hh <- rep(NA, n.sims)
alpha.p.l0 <- rep(NA, n.sims)
beta.p.l0 <- rep(NA, n.sims)
alpha.p.h0 <- rep(NA, n.sims)
beta.p.h0 <- rep(NA, n.sims)

State.est <- rep(NA, n.sims)
eps.l0.est <- rep(NA, n.sims)
eps.l1.est <- rep(NA, n.sims)
eps.h0.est <- rep(NA, n.sims)
eps.h1.est <- rep(NA, n.sims)
gamma.0.est <- rep(NA, n.sims)
gamma.1.est <- rep(NA, n.sims)
gamma.2.est <- rep(NA, n.sims)
phi0.lh.est <- rep(NA, n.sims)
phi1.lh.est <- rep(NA, n.sims)
phi0.hh.est <- rep(NA, n.sims)
phi1.hh.est <- rep(NA, n.sims)
p.l0.est <- rep(NA, n.sims)
p.l1.est <- rep(NA, n.sims)
alpha.l.est <- rep(NA, n.sims)
p.h0.est <- rep(NA, n.sims)
p.h1.est <- rep(NA, n.sims)
alpha.h.est <- rep(NA, n.sims)

all.State.est <- rep(NA, n.sims)
all.eps.l0.est <- rep(NA, n.sims)
all.eps.l1.est <- rep(NA, n.sims)
all.eps.h0.est <- rep(NA, n.sims)
all.eps.h1.est <- rep(NA, n.sims)
all.gamma.0.est <- rep(NA, n.sims)
all.gamma.1.est <- rep(NA, n.sims)
all.gamma.2.est <- rep(NA, n.sims)
all.phi0.lh.est <- rep(NA, n.sims)
all.phi1.lh.est <- rep(NA, n.sims)
all.phi0.hh.est <- rep(NA, n.sims)
all.phi1.hh.est <- rep(NA, n.sims)
all.p.l0.est <- rep(NA, n.sims)
all.p.l1.est <- rep(NA, n.sims)
all.alpha.l.est <- rep(NA, n.sims)
all.p.h0.est <- rep(NA, n.sims)
all.p.h1.est <- rep(NA, n.sims)
all.alpha.h.est <- rep(NA, n.sims)

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
#### Run Adaptive Management ####

year <- 1

  #--------------------------------------------------------------------------------#
  #### 1. Simulate the truth ####
  ### Steps: 
  #---1. Simulate the truth
  #---2. Simulate occupancy data collection (include removal data)
  #---3. Go back to step 1 and take into account removal that previously occurred into state process
  
  ##### Week 1 State model only #####
  week <- 1
  ###### Week 1 year 1 #####
  if(year == 1){
    #State[site,week,year,sim]
    State[,1,year,1:n.sims] <- State.init #first week state is from data
    
    for(s in 1:n.sims){
      for(i in 1:n.sites){
        #D[site,week,year,sim]
        D[i,1,1,s] <- sum(State[neighbors[i,], 1,1,s])/n.neighbors[i] #state of neighbors
      }
    }
    
    #[site,week,year,sim]
    gamma[,1,1,] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,1,1,]) #invasion (week 1 year 1)
    eps.l[,1,1,] <- invlogit(eps.l0) #eradication low (week 1 year 1)
    eps.h[,1,1,] <- invlogit(eps.h0) #eradication high (week 1 year 1)
    phi.lh[,1,1,] <- invlogit(phi0.lh) #transiotion low to high
    phi.hh[,1,1,] <- invlogit(phi1.lh) #transition high to high
    
    # TPM used for week 2
    #[from state, site, week, year, sim, to state]
    TPM[1,1:n.sites,1,1,,1] <- 1-gamma[,1,1,] #empty to empty (week 1 year 1)
    TPM[1,1:n.sites,1,1,,2] <- gamma[,1,1,] #empty to low (week 1 year 1)
    TPM[1,1:n.sites,1,1,,3] <- 0 #empty to high (week 1 year 1)
    
    TPM[2,1:n.sites,1,1,,1] <- eps.l[,1,1,] #low to empty (week 1 year 1)
    TPM[2,1:n.sites,1,1,,2] <- (1- eps.l[,1,1,])*(1-phi.lh[,1,1,]) #low to low (week 1 year 1)
    TPM[2,1:n.sites,1,1,,3] <- (1- eps.l[,1,1,])*(phi.lh[,1,1,]) #low to high (week 1 year 1)
    
    TPM[3,1:n.sites,1,1,,1] <- eps.h[,1,1,] #high to empty (week 1 year 1)
    TPM[3,1:n.sites,1,1,,2] <- (1- eps.h[,1,1,])*(1-phi.hh[,1,1,]) #high to low (week 1 year 1)
    TPM[3,1:n.sites,1,1,,3] <- (1- eps.h[,1,1,])*(phi.hh[,1,1,]) #high to high (week 1 year 1)
    
  } #ends year = 1 loop

  ##### Week 1+ State and Observation model #####
  for(s in 1:n.sims){
    for(week in 1:n.weeks){
      
      ###### State process ######
      if(week > 1){
        for(i in 1:n.sites){ #State process: state given previous state and transition probability
          State[i,week,year,s] <- rcat(1,TPM[State[i,week-1,year,s], i, week-1, year, s,]) 
        }
        
        for(i in 1:n.sites){ #state of neighbors
          D[i,week,year,s] <- sum(State[neighbors[i,], week,year,s])/n.neighbors[i] #state of neighbors
        }
        
        #--- Data for the TPM for the next week: week 2+ ---#
        #prev.rem.vec = vector of 0 and 1s indicating where removal previously occurred
        prev.rem.vec <- replace(rem.vec[,week-1,year,s], is.na(rem.vec[,week-1,year,s]), 0)
        
        #invasion probability =  base invasion + effect of site habitat + effect of neighbor being invaded
        gamma[,week,year,s] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,week,year,s]) 
        
        # eradication probability = base + effect of previous removal (removal*removal hours)
        eps.l[,week,year,s] <- invlogit(eps.l0 + eps.l1*prev.rem.vec*removal.hours[2]) #low eradication
        eps.h[,week,year,s] <- invlogit(eps.h0 + eps.h1*prev.rem.vec*removal.hours[2]) #high eradication
        
        #transition rates
        phi.lh[,week,year,s] <- invlogit(phi0.lh - phi1.lh*prev.rem.vec*removal.hours[2])
        phi.hh[,week,year,s] <- invlogit(phi0.hh - phi1.hh*prev.rem.vec*removal.hours[2])
        
        TPM[1,1:n.sites,week,year,s,1] <- 1-gamma[,week,year,s] #empty to empty
        TPM[1,1:n.sites,week,year,s,2] <- gamma[,week,year,s] #empty to low
        TPM[1,1:n.sites,week,year,s,3] <- 0 #empty to high
        
        TPM[2,1:n.sites,week,year,s,1] <- eps.l[,week,year,s] #low to empty (eradication)
        TPM[2,1:n.sites,week,year,s,2] <- (1- eps.l[,week,year,s])*(1-phi.lh[,week,year,s]) #low to low (eradication failure)
        TPM[2,1:n.sites,week,year,s,3] <- (1- eps.l[,week,year,s])*(phi.lh[,week,year,s]) #low to high
        
        TPM[3,1:n.sites,week,year,s,1] <- eps.h[,week,year,s] #high to empty (eradication)
        TPM[3,1:n.sites,week,year,s,2] <- (1- eps.h[,week,year,s])*(1-phi.hh[,week,year,s]) #high to low
        TPM[3,1:n.sites,week,year,s,3] <- (1- eps.h[,week,year,s])*(phi.hh[,week,year,s]) #high to high
        
        #week: Identify the sites where removal will occur 
        n.pre.visit <- length(which(rem.vec[,week-1,year,s] >= 0)) #number of sites that were sampled last week
        #put last weeks sampling sites at the end of the sampling queue 
        sites.rem.M[,week,year,s] <- c(sites.rem.M[,(week-1),year,s][-1:-n.pre.visit],
                                       sites.rem.M[,(week-1),year,s][1:n.pre.visit])
      } #week > 1
      
      ##### Observation process #######
      # Observation process: draw observation given current state
      
      for(i in sites.rem.M[,week,year,s]){ #order of sites where removal occurs
        
        #A. while we still have resources to spend:
        if(resource.total[week,year,s] < (n.resource- max.spent)){
          
          #1. first occasion occupancy data (1 = not detected, 2 = detected)
          yM[i,1,week, year, s] <- rcat(1, P.datM[State[i,week,year,s], ])
          
          #2. second occasion occupancy data
          #2a. if seen in first occasion, do not search again and remove the rush
          if(yM[i,1,week, year, s] > 1){ 
            yM[i,2, week,year, s] <- NA #no occupancy data because we did not need to search again
            rem.vec[i,week,year,s] <- 1 #notes that removal occurred that week at that site
            
            #Calculating resources used = resources already used + search hours + removal hours
            resource.total[week,year,s] <- resource.total[week,year,s] + search.hours + removal.hours[2]
            
          }else{
            #2b. If not seen the first occasion, we need to search again:
            #Second occasion occupancy data
            yM[i,2, week, year, s] <- rcat(1, P.datM[State[i,week,year,s], ])
            
            #2bi. If seen at the second occasion:
            if(yM[i,2, week, year, s] > 1){ #if seen (state observed > 1) the second time
              rem.vec[i,week,year,s] <- 1 #notes that removal occurred that week at that site
              
              #Calculating resources used = resources already used + 2*search hours + removal hours
              resource.total[week,year,s] <- resource.total[week,year,s] + 2*search.hours + removal.hours[2] #removal.hours[State[i,week,year,s]]
            } 
            
            #2bi. If we do not detect flowering rush during the second occasion:
            if(yM[i,2, week, year, s]==1){ #if not seen (state observed = 1)
              rem.vec[i,week,year,s] <- 0 #notes removal did not occur
              
              #Calculating resources used = resources already used + 2*search hours
              resource.total[week,year,s] <- resource.total[week,year,s] + 2*search.hours 
            } 
          }
          
          #B. if we do not have any more resources to spend:
        }else{
          yM[i,1:2, week, year, s] <- NA #no occupancy data
          rem.vec[i,week,year,s] <- NA #removal did not occur
        }
        
      } #ends site loop
    } #ends week loop
  } #ends sims loop  
  
  #--------------------------------------------------------------------------------#
  #### 2. Learning: ####
  
  ##### 2a. Update priors #####
  ###### year 1 priors #####
  #------------------------Year 1 Priors------------------------#
  if(year == 1){
    
    # --- eps.l ---  eradication low state -------------------- #
    #eps.l0 = base eradication at low state (beta distribution)
    eps.l0.a[year,] <- 1 #alpha shape
    eps.l0.b[year,] <- 1 #beta shape
    
    #eps.l1 = effect of eradication at low state (normal distribution)
    eps.l1.mean[year,] <- 0 #mean
    eps.l1.sd[year,] <-  10 #sd
    
    # --- eps.h ---  eradication high state ------------------- #
    #eps.h0 = base eradication at high state (beta distribution)
    eps.h0.a[year,] <- 1 #alpha shape
    eps.h0.b[year,] <- 1 #beta shape
    
    #eps.h1 = effect of eradication at high state (normal distribution)
    eps.h1.mean[year,] <- 0 #mean
    eps.h1.sd[year,] <- 10 #sd
    
    # --- gamma ---  invasion -------------------------------- #  
    #gamma.0 = intrinsic invasion (normal distribution)
    gamma.0.mean[year,] <- 0 #mean
    gamma.0.sd[year, ] <- 10 #sd
    
    #gamma.1 = effect of site characteristics (normal distribution)
    gamma.1.mean[year,] <- 0 #mean
    gamma.1.sd[year,] <- 10 #sd
    
    #gamma.2 = effect of neighboring state (normal distribution)
    gamma.2.mean[year,] <- 0 #mean
    gamma.2.sd[year,] <- 10 #sd
    
    
    # --- phi ---  transition rates -------------------------- #
    #phi.lh = base transition low to high (beta distribution)
    phi.lh.a[year,] <- 1 #alpha shape
    phi.lh.b[year,] <- 1 #beta shape
    
    #effect of removal on transition from low to high
    phi.lh1.mean[year,] <- 0 #mean
    phi.lh1.sd[year,] <- 10 #sd
    
    #phi.hh = transition high to high (beta distribution)
    phi.hh.a[year,] <- 1 #alpha shape
    phi.hh.b[year,] <- 1 #beta shape
    
    #effect of removal on transition from high to high
    phi.hh1.mean[year,] <- 0 #mean
    phi.hh1.sd[year,] <- 10 #sd
    
    # --- p.l ---  detection low state ----------------------- #
    #p.l.0 = base detection low state (beta distribution)
    p.l0.a[year,] <- 1 #alpha shape
    p.l0.b[year,] <- 1 #beta shape
    
    #p.l.1 = effect of effort (normal distribution)
    p.l1.mean[year,] <- 0 #mean
    p.l1.sd[year,] <- 10 #sd
    
    
    # --- alpha.l --- difference in baseline detection btwn dat D and M -- #  
    l.mean[year,] <- 0 #mean
    l.sd[year,] <- 1 #sd
    
    # --- p.h ---  detection high state ---------------------- #
    #p.h.0 = base detection high state (beta distribution)
    p.h0.a[year,] <- 1 #alpha shape
    p.h0.b[year,] <- 1 #beta shape
    
    #p.h.1 = effect of effort (normal distribution)
    p.h1.mean[year,] <- 0 #mean
    p.h1.sd[year,] <- 10 #sd
    
    # --- alpha.h --- difference in baseline detection btwn dat D and M -- #   
    h.mean[year,] <- 0 #mean
    h.sd[year,] <- 1 #sd
    
    ##### UNSURE ####
    # --- S.init and D.init ---  Initial states ------------ #
    psi.init <- rep(1,n.states) #initial state probability vector
  } 
  
  #--------------------------------------------------------------------------------#
  ###### 2b. JAGS data ######
  
  #sites where removal occurred
  rem.vec.dat <- rem.vec[,,year,] 
  rem.vec.dat[is.na(rem.vec.dat)] <- 0 #replaces na with 0
  
  #Parameters monitored
  parameters.to.save <- c("eps.l0", "eps.l1", "eps.h0", "eps.h1", "gamma.0", "gamma.1",
                          "gamma.2", "phi0.lh", "phi1.lh", "phi0.hh", "phi1.hh",
                          "p.l0", "p.l1", "p.h0", "p.h1", "alpha.l", "alpha.h", "psi", "State.fin")
  #settings
  n.burnin <- 1000
  n.iter <- 10000 + n.burnin
  n.chains <- 3
  n.thin <- 1
  
  for(s in 1:n.sims){
    my.data[[s]] <- list( #constants
      n.sites = n.sites,
      n.weeks = n.weeks,
      n.occs = n.occs, 
      neighbors = neighbors,
      
      #data
      yM= yM[,,,year,s],
      site.char = site.char,
      logeffort = logsearch.effort,
      psi.init = psi.init,
      rem.vec = rem.vec.dat[,,s],
      removal.hours = removal.hours,
      n.neighbors = n.neighbors,
      
      #priors
      eps.l0.a = eps.l0.a[year,s], 
      eps.l0.b = eps.l0.a[year,s], 
      eps.l1.mean = eps.l1.mean[year,s],
      eps.l1.sd= eps.l1.sd[year,s],
      eps.h0.a = eps.h0.a[year,s],
      eps.h0.b= eps.h0.b[year,s],
      eps.h1.mean= eps.h1.mean[year,s],
      eps.h1.sd= eps.h1.sd[year,s],
      gamma.0.mean= gamma.0.mean[year,s],
      gamma.0.sd= gamma.0.sd[year,s],
      gamma.1.mean= gamma.1.mean[year,s],
      gamma.1.sd= gamma.1.sd[year,s],
      gamma.2.mean = gamma.2.mean[year,s],
      gamma.2.sd = gamma.2.sd[year,s],
      phi.lh.a = phi.lh.a[year,s],
      phi.lh.b = phi.lh.b[year,s],
      phi.lh1.mean = phi.lh1.mean[year,s],
      phi.lh1.sd = phi.lh1.sd[year,s],
      phi.hh.a = phi.hh.a[year,s],
      phi.hh.b = phi.hh.b[year,s],
      phi.hh1.mean = phi.hh1.mean[year,s],
      phi.hh1.sd = phi.hh1.sd[year,s],
      p.l0.a = p.l0.a[year,s],
      p.l0.b = p.l0.b[year,s],
      p.l1.mean = p.l1.mean[year,s],
      p.l1.sd = p.l1.sd[year,s],
      l.mean = l.mean[year,s], 
      l.sd = l.sd[year,s],
      p.h0.a = p.h0.a[year,s],
      p.h0.b = p.h0.b[year,s],
      p.h1.mean = p.h1.mean[year,s],
      p.h1.sd = p.h1.sd[year,s],
      h.mean = h.mean[year,s], 
      h.sd = h.sd[year,s]
    )
  }
  
  ###### 2c. Run JAGS #####
  
  State.start <- array(NA, c(n.sites,n.weeks,n.sims)) #State initial values
  
  for(s in 1:n.sims){
    for(i in 1:n.sites){
      for(week in 1:n.weeks){
        if(rem.vec.dat[i,week,s] == 1){
          State.start[i,week,s] <- max(yM[i,,week,year,s], na.rm = T)
        }else{
          State.start[i,week,s] <- 2
        }
      }
    }
  }
  
  #Initial values
  for(s in 1:n.sims){
    initial.values[[s]] <- function()list(State = State.start[,,s])
  }
  
  #Running the model
  for(s in 1:n.sims){
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]],inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_multistate_datM.txt",
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
  
  truth.params <- c(eps.l0, eps.l1, eps.h0, eps.h1, gamma.0, gamma.1, gamma.2, 
                    phi0.lh, phi1.lh, phi0.hh, phi1.hh, p.l0, p.l1, p.h0, p.h1,
                    alpha.l, alpha.h)
  
  cbind.res.parameters$truth <- rep(truth.params, n.sims)
  colnames(cbind.res.parameters)[c(3,7)] <- c("low", "high")
  res.params[[year]] <- cbind.res.parameters
  
  #State params
  cbind.res.state<- cbind.res %>% filter(str_detect(param, '^S'))
  
  truth.state4 <- State[,4,year,1]
  
  for(s in 2:n.sims){
    truth.state4 <- c(truth.state4, State[,4,year,s])
  }
  
  
  cbind.res.state$Segment <- as.numeric(gsub("\\D", "", cbind.res.state$param))
  
  cbind.res.state$truth <- truth.state4 
  colnames(cbind.res.state)[c(3,7)] <- c("low", "high")
  
  cbind.res.state$nobs <- NA
  Y.nobs <- yM[,,,year,]
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
ggplot(res.params[[year]]) +
  geom_point(mapping = aes(x = sim, y = mean, col = as.factor(sim)))+
  geom_errorbar(aes(x = sim, ymin = low, ymax = high, col = as.factor(sim)))+
  #scale_color_brewer(palette = "Dark2")+
  geom_point(data=res.params[[year]], aes(x = sim, y = truth),color = "black", shape = 22) +
  facet_wrap(~param, scales = "free") +
  xlab("Simulation")+ylab("State") + 
  guides(color = guide_legend(title = "Simulation"))  

ggplot(res.params[[year]]) +
  geom_point(mapping = aes(x = param, y = Rhat, col = as.factor(sim)))+
  geom_hline(yintercept = 1.1, color = 'red')

##### Estimated State #####
ggplot(res.state[[year]]) +
  geom_point(mapping = aes(x = sim, y = mean, col = as.factor(nobs)))+
  scale_color_brewer(palette = "YlOrRd")+
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

  