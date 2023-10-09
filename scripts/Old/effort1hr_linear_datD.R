library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)


#Remove at downstream 5 locations but collect monitoring data
#at next 5 downstream locations

start.time <- Sys.time()

#### JAGS model ####
sink("Flower_multistate_datD.txt")
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
# Observations Dat D:  
# 1 Detected
# 2 Not detected
# -------------------------------------------------

#### PRIORS ####
  #Erradication:
  eps.l0 ~ dbeta(eps.l0.a,eps.l0.b) #eradication when at low state
  eps.l1 ~ dnorm(eps.l1.mean, eps.l1.tau) #effect of eradication 
  eps.l1.tau <- 1/(eps.l1.sd * eps.l1.sd) #precision parameter
  
  eps.h0 ~ dbeta(eps.h0.a,eps.h0.b) #eradication when at high state
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
  phi.lh ~ dbeta(phi.lh.a, phi.lh.b) #transition from low to high
  phi.hh ~ dbeta(phi.hh.a, phi.hh.b) #transition from high to high
  
  #Detection low state:
  p.l0 ~ dbeta(p.l0.a, p.l0.b) #base detection for low state
  p.l1 ~ dnorm(p.l1.mean, p.l1.tau) #effect of effort 
  p.l1.tau <- 1/(p.l1.sd * p.l1.sd) #precision parameter
  
  #Detection high state:
  p.h0 ~ dbeta(p.h0.a, p.h0.b) #base detection for high state
  p.h1 ~ dnorm(p.h1.mean, p.h1.tau) #effect of effort 
  p.h1.tau <- 1/(p.h1.sd * p.h1.sd) #precision parameter

  logit(pD.l) <- p.l0 + p.l1*logeffort #detection low state
  logit(pD.h) <- p.h0 + p.h1*logeffort #detection high state
  
#--------------------------------------------------#
# STATE TRANSITION
for (i in 1:n.sites){  
  # State transition probabilities (TPM): probability of S(t+1) given S(t)
  for (t in 1:n.weeks){
  
    logit(gamma[i,t]) <-gamma.0 + gamma.1*site.char[i] + gamma.2*D[i,t] #invasion probability
    logit(eps.l[i,t]) <- eps.l0 + eps.l1*rem.vec[i,t]*removal.hours #erradication low state
    logit(eps.h[i,t]) <- eps.h0 + eps.h1*rem.vec[i,t]*removal.hours #erradication high state
                                        # rem.vec[i] = 0,1 if 0, then no removal and no erradiction
    
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
    TPM[2,i,t,2] <- (1- eps.l[i,t])*(1-phi.lh) #erradication failure probability
    
    #low abundance to high abundance
    TPM[2,i,t,3] <- (1- eps.l[i,t])*(phi.lh)
    
    #high abundance to empty
    TPM[3,i,t,1] <- eps.h[i,t] #erradication probability
    
    #high abundance to low abundance
    TPM[3,i,t,2] <- (1- eps.h[i,t])*(1-phi.hh) #erradication failure probability
    
    #low abundance to high abundance
    TPM[3,i,t,3] <- (1- eps.h[i,t])*(phi.hh)
    
    
    #--------------------------------------------------#
    # OBSERVATION PROBABILITIES (for detection/nondetection data)
    
    for(j in 1:n.occs){

      #Empty and not observed  
      P.datD[1,i,j,t,1] <- 1
      
      #Empty and observed
      P.datD[1,i,j,t,2] <- 0
   
      #Low state and not observed
      P.datD[2,i,j,t,1] <- 1-pD.l #not detected probability low state
      
      #Low state and observed
      P.datD[2,i,j,t,2] <- pD.l #detection probability low state
      
      #High state and not observed
      P.datD[3,i,j,t,1] <- 1-pD.h #not detected probability high state
      
      #High state and observed
      P.datD[3,i,j,t,2] <- pD.h #detection probability high state
      
    } #j 
  } #t
} #i

  #### Likelihood ####
  for (i in 1:n.sites){
    #----- State Model -----#
    State[i,1] <- S.init[i] # initial state 
    D[i,1] <- D.init[i]     # initial neighboring state
    
    for (t in 2:n.weeks){ 
      # State process: state given previous state and transition probability
      State[i,t] ~ dcat(TPM[State[i,t-1], i, t-1, ]) 
      
      D[i,t] <- sum(State[neighbors[i,], t])/2 #state of neighbors 
     
    } #t loop

    #----- Observation Model -----#
    for(j in 1:n.occs){
      for(t in 1:n.weeks){
        # Observation process: draw observation given current state
        yD[i,j,t] ~ dcat(P.datD[State[i,t], i, j, t,]) 
        
      } #t
    } #j

    #Derived parameter: final estimated state
    State.fin[i] <- State[i,n.weeks] #state after 4 weeks
    
  } #i


} #end model
", fill = TRUE)
sink()

#### Path Name ####
path <- here::here("results", "Multistate", "e1hr_linear_datD")
res <- c('results/Multistate/e1hr_linear_datD') 

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

p.l0 <- 0.3 #base detection for low state
p.l1 <- 1 #effect of effort

p.h0 <- 0.8 #base detection for high state
p.h1 <- 1 #effect of effort

search.hours <- 1.1 #effort is fixed
removal.hours <- 2 #effort is fixed
logsearch.effort <- log(search.hours) #log search effort

resource.total <- array(0, c(n.weeks, n.years,n.sims)) #matrix where we store the amount of resources used each week
n.resource <- 40 #total resources we can use each week (hours)

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
#Randomly order all sites for removal (next year order of sites will be based on some factor)
sites.rem <- array(NA, dim = c(n.sites, n.weeks, n.years, n.sims))

for(s in 1:n.sims){
  sites.rem[,1,1,s] <- seq(1,n.sites)
}

yD <- array(NA,c(n.sites, n.occs, n.weeks, n.years, n.sims)) #detection/non-detection data
rem.vec <- array(NA, c(n.sites, n.weeks, n.years, n.sims)) #removal sites array
P.datD <- array(NA, c(n.states, 2)) #detection probability

pD.l <- invlogit(p.l0 + p.l1*logsearch.effort) #low state detection probability (base detection + effect of effort)
pD.h <- invlogit(p.h0 + p.h1*logsearch.effort) #high state detection probability (base detection + effect of effort)

P.datD[1,1] <- 1 #empty and not detected
P.datD[1,2] <- 0 #empty and detected (no false positives)

P.datD[2,1] <- 1-pD.l #low state and not detected 
P.datD[2,2] <- pD.l #low state and detected

P.datD[3,1] <- 1-pD.h #high state and not detected 
P.datD[3,2] <- pD.h #high state and detected 

#### JAGS arrays ####
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
phi.hh.a <- array(NA, c(n.years, n.sims))
phi.hh.b <- array(NA, c(n.years, n.sims))

p.l0.a <- array(NA, c(n.years, n.sims))
p.l0.b <- array(NA, c(n.years, n.sims))
p.l1.mean <- array(NA, c(n.years, n.sims))
p.l1.sd <- array(NA, c(n.years, n.sims))
p.h0.a <- array(NA, c(n.years, n.sims))
p.h0.b <- array(NA, c(n.years, n.sims))
p.h1.mean <- array(NA, c(n.years, n.sims))
p.h1.sd <- array(NA, c(n.years, n.sims))

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
phi.lh.est <- rep(NA, n.sims)
phi.hh.est <- rep(NA, n.sims)
p.l0.est <- rep(NA, n.sims)
p.l1.est <- rep(NA, n.sims)
p.h0.est <- rep(NA, n.sims)
p.h1.est <- rep(NA, n.sims)

all.State.est <- rep(NA, n.sims)
all.eps.l0.est <- rep(NA, n.sims)
all.eps.l1.est <- rep(NA, n.sims)
all.eps.h0.est <- rep(NA, n.sims)
all.eps.h1.est <- rep(NA, n.sims)
all.gamma.0.est <- rep(NA, n.sims)
all.gamma.1.est <- rep(NA, n.sims)
all.gamma.2.est <- rep(NA, n.sims)
all.phi.lh.est <- rep(NA, n.sims)
all.phi.hh.est <- rep(NA, n.sims)
all.p.l0.est <- rep(NA, n.sims)
all.p.l1.est <- rep(NA, n.sims)
all.p.h0.est <- rep(NA, n.sims)
all.p.h1.est <- rep(NA, n.sims)

initial.values <- list()

TPM.est <- array(NA, c(n.states, n.sites,n.sims,n.states))
D.est <- array(NA, c(n.sites,n.sims))
gamma.est <- array(NA, c(n.sites,n.sims))
eps.l.est <- array(NA, c(n.sites,n.sims))
eps.h.est <- array(NA, c(n.sites,n.sims))
prev.state <- array(NA, c(n.sites, n.sims))
States.mean.round <- array(NA, c(n.sites, n.years, n.sims))
States.mean <- array(NA, c(n.sites, n.years, n.sims))
S.end <- array(NA, c(n.sites, n.sims))

####################################################################################
#### Run Adaptive Management ####

year <- 1
#n.years <- 2

for(year in 1:n.years){
  #--------------------------------------------------------------------------------#
  #### 1. Simulate the truth ####
  
  ### Steps: 
  #---1. Simulate the truth
  #---2. Simulate occupancy data collection (include removal data)
  #---3. Go back to step 1 and take into account removal that previously occurred into state process
  
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
    #prev.rem.vec = vector of 0 and 1s indicating where removal previously occurred
    prev.rem.vec <- replace(rem.vec[,4,(year-1),s], is.na(rem.vec[,4,(year-1),s]), 0) 
    
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
  
  ##### Week 1+ State and Observation model #####
  for(s in 1:n.sims){
    for(week in 1:n.weeks){
      
      ###### State process ######
      
      if(week > 1){
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
      
      ##### Observation process #######
      # Observation process: draw observation given current state
      
      for(i in sites.rem[,week,year,s]){ #order of sites where removal occurs
        
        #A. while we still have resources to spend:
        if(resource.total[week,year,s] < n.resource){
          
          #1. first occasion occupancy data (1 = not detected, 2 = detected)
          yD[i,1,week, year, s] <- rcat(1, P.datD[State[i,week,year,s], ])
          
          #2. second occasion occupancy data
          #2a. if seen in first occasion, do not search again and remove the rush
          if(yD[i,1,week, year, s] > 1){ 
            yD[i,2, week,year, s] <- NA #no occupancy data because we did not need to search again
            rem.vec[i,week,year,s] <- 1 #notes that removal occurred that week at that site
            
            #Calculating resources used = resources already used + search hours + removal hours
            resource.total[week,year,s] <- resource.total[week,year,s] + search.hours + removal.hours
            
          }else{
            #2b. If not seen the first occasion, we need to search again:
            #Second occasion occupancy data
            yD[i,2, week, year, s] <- rcat(1, P.datD[State[i,week,year,s], ])
            
            #2bi. If seen at the second occasion:
            if(yD[i,2, week, year, s] > 1){ #if seen (state observed > 1) the second time
              rem.vec[i,week,year,s] <- 1 #notes that removal occurred that week at that site
              
              #Calculating resources used = resources already used + 2*search hours + removal hours
              resource.total[week,year,s] <- resource.total[week,year,s] + 2*search.hours + removal.hours
            } 
            
            #2bi. If we do not detect flowering rush during the second occasion:
            if(yD[i,2, week, year, s]==1){ #if not seen (state observed = 1)
              rem.vec[i,week,year,s] <- 0 #notes removal did not occur
              
              #Calculating resources used = resources already used + 2*search hours
              resource.total[week,year,s] <- resource.total[week,year,s] + 2*search.hours 
            } 
          }
        
        #B. if we do not have any more resources to spend:
        }else{
          yD[i,1:2, week, year, s] <- NA #no occupancy data
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
      #phi.lh = transition low to high (beta distribution)
      phi.lh.a[year,] <- 1 #alpha shape
      phi.lh.b[year,] <- 1 #beta shape
      
      #phi.hh = transition high to high (beta distribution)
      phi.hh.a[year,] <- 1 #alpha shape
      phi.hh.b[year,] <- 1 #beta shape
   
    # --- p.l ---  detection low state ----------------------- #
      #p.l.0 = base detection low state (beta distribution)
      p.l0.a[year,] <- 1 #alpha shape
      p.l0.b[year,] <- 1 #beta shape
      
      #p.l.1 = effect of effort (normal distribution)
      p.l1.mean[year,] <- 0 #mean
      p.l1.sd[year,] <- 10 #sd
    
    # --- p.h ---  detection high state ---------------------- #
      #p.h.0 = base detection high state (beta distribution)
      p.h0.a[year,] <- 1 #alpha shape
      p.h0.b[year,] <- 1 #beta shape
      
      #p.h.1 = effect of effort (normal distribution)
      p.h1.mean[year,] <- 0 #mean
      p.h1.sd[year,] <- 10 #sd
      
      # --- S.init and D.init ---  Initial states ------------ #
      #### Unsure if correct ####
      for(s in 1:n.sims){
        for(i in 1:n.sites){
          if(!is.na(rem.vec[i,1,year,s])){ #if we visited the site for observation data
            S.init[i,year,s] <- max(yD[i,,1,year,s], na.rm = T) #Initial state = max observed detection
            
            #Note that we observe states = 1 or 2 where true states are 1,2,3 
            #So if we just assigned S.init = 2, now randomly assign if it's true state is 2 or 3
            if(S.init[i,year,s] == 2){
              S.init[i,year,s] <- sample(c(2,3), 1)
            }
            
          }else{ #if we did not visit the site for observation data, randomly sample 
            S.init[i,year,s] <- rcat(1,c(0.5, 0.25, 0.25)) #sample(c(1,2,3),1)
          }
        }
        
        for(i in 1:n.sites){
          D.init[i,year,s] <- sum(S.init[neighbors[i,], year,s])/2 #state of neighbors
        }
      }

    
      
  } else{
    
    ###### year 1+ priors #####
    for(s in 1:n.sims){
    #------------------------Year 1+ Priors------------------------#
    # --- eps.l ---  eradication low state ----------------------- #
    #eps.l0 = base eradication at low state (beta distribution)
    alpha.eps.l0[s] <- paste("alpha.eps.l0", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.eps.l0[s],
           (1 - get(eps.l0.est[s])$mean*(1 + get(eps.l0.est[s])$cv^2))/(get(eps.l0.est[s])$cv^2))
    
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    beta.eps.l0[s]<- paste("beta.eps.l0", s, sep = "_")
    
    assign(beta.eps.l0[s],
           get(alpha.eps.l0[s])*(1 - get(eps.l0.est[s])$mean)/get(eps.l0.est[s])$mean)
    
    eps.l0.a[year,s] <- get(alpha.eps.l0[s]) #alpha shape
    eps.l0.b[year,s] <- get(beta.eps.l0[s]) #beta shape
    
    #eps.l1 = effect of eradication at low state (normal distribution)
    eps.l1.mean[year,s] <- get(eps.l1.est[s])$mean #mean
    eps.l1.sd[year,s] <-  get(eps.l1.est[s])$sd #sd
    
    # --- eps.h ---  eradication high state ------------------------- #
    #eps.h0 = base eradication at high state (beta distribution)
    alpha.eps.h0[s] <- paste("alpha.eps.h0", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.eps.h0[s],
           (1 - get(eps.h0.est[s])$mean*(1 + get(eps.h0.est[s])$cv^2))/(get(eps.h0.est[s])$cv^2))
    
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    beta.eps.h0[s]<- paste("beta.eps.h0", s, sep = "_")
    
    assign(beta.eps.h0[s],
           get(alpha.eps.h0[s])*(1 - get(eps.h0.est[s])$mean)/get(eps.h0.est[s])$mean)
    
    eps.h0.a[year,s] <- get(alpha.eps.h0[s]) #alpha shape
    eps.h0.b[year,s] <- get(beta.eps.h0[s]) #beta shape
    
    #eps.h1 = effect of eradication at high state (normal distribution)
    eps.h1.mean[year,s] <- get(eps.h1.est[s])$mean #mean
    eps.h1.sd[year,s] <-  get(eps.h1.est[s])$sd #sd
    
    # --- gamma ---  invasion -------------------------------------- #  
    #gamma.0 = intrinsic invasion (normal distribution)
    gamma.0.mean[year,s] <- get(gamma.0.est[s])$mean #mean
    gamma.0.sd[year,s ] <- get(gamma.0.est[s])$sd
    
    #gamma.1 = effect of site characteristics (normal distribution)
    gamma.1.mean[year,s] <- get(gamma.1.est[s])$mean #mean
    gamma.1.sd[year,s ] <- get(gamma.1.est[s])$sd
    
    #gamma.2 = effect of neighboring state (normal distribution)
    gamma.2.mean[year,s] <- get(gamma.2.est[s])$mean #mean
    gamma.2.sd[year,s ] <- get(gamma.2.est[s])$sd
    
    # --- phi ---  transition rates ------------------------------- #
    #phi.lh = transition low to high (beta distribution)
    alpha.phi.lh[s] <- paste("alpha.phi.lh", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.phi.lh[s],
           (1 - get(phi.lh.est[s])$mean*(1 + get(phi.lh.est[s])$cv^2))/(get(phi.lh.est[s])$cv^2))
    
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    beta.phi.lh[s]<- paste("beta.phi.lh", s, sep = "_")
    
    assign(beta.phi.lh[s],
           get(alpha.phi.lh[s])*(1 - get(phi.lh.est[s])$mean)/get(phi.lh.est[s])$mean)
    
    
    phi.lh.a[year,s] <- get(alpha.phi.lh[s]) #alpha shape
    phi.lh.b[year,s] <- get(beta.phi.lh[s]) #beta shape
    
    #phi.hh = transition high to high (beta distribution)
    alpha.phi.hh[s] <- paste("alpha.phi.hh", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.phi.hh[s],
           (1 - get(phi.hh.est[s])$mean*(1 + get(phi.hh.est[s])$cv^2))/(get(phi.hh.est[s])$cv^2))
    
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    beta.phi.hh[s]<- paste("beta.phi.hh", s, sep = "_")
    
    assign(beta.phi.hh[s],
           get(alpha.phi.hh[s])*(1 - get(phi.hh.est[s])$mean)/get(phi.hh.est[s])$mean)
    
    
    phi.hh.a[year,s] <- get(alpha.phi.hh[s]) #alpha shape
    phi.hh.b[year,s] <- get(beta.phi.hh[s]) #beta shape
    
    # --- p.l ---  detection low state ----------------------------- #
    #p.l.0 = base detection low state (beta distribution)
    alpha.p.l0[s] <- paste("alpha.p.l.0", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.p.l0[s],
           (1 - get(p.l0.est[s])$mean*(1 + get(p.l0.est[s])$cv^2))/(get(p.l0.est[s])$cv^2))
    
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    beta.p.l0[s]<- paste("beta.p.l0", s, sep = "_")
    
    assign(beta.p.l0[s],
           get(alpha.p.l0[s])*(1 - get(p.l0.est[s])$mean)/get(p.l0.est[s])$mean)
    
    p.l0.a[year,s] <- get(alpha.p.l0[s]) #alpha shape
    p.l0.b[year,s] <- get(beta.p.l0[s]) #beta shape
    
    #p.l.1 = effect of effort (normal distribution)
    p.l1.mean[year,s] <- get(p.l1.est[s])$mean #mean
    p.l1.sd[year,s] <- get(p.l1.est[s])$sd #sd
    
    # --- p.h ---  detection high state -------------------------- #
    alpha.p.h0[s] <- paste("alpha.p.h.0", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.p.h0[s],
           (1 - get(p.h0.est[s])$mean*(1 + get(p.h0.est[s])$cv^2))/(get(p.h0.est[s])$cv^2))
    
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    beta.p.h0[s]<- paste("beta.p.h0", s, sep = "_")
    
    assign(beta.p.h0[s],
           get(alpha.p.h0[s])*(1 - get(p.h0.est[s])$mean)/get(p.h0.est[s])$mean)
    
    p.h0.a[year,s] <- get(alpha.p.h0[s]) #alpha shape
    p.h0.b[year,s] <- get(beta.p.h0[s]) #beta shape
    
    #p.h.1 = effect of effort (normal distribution)
    p.h1.mean[year,s] <- get(p.h1.est[s])$mean #mean
    p.h1.sd[year,s] <- get(p.h1.est[s])$sd #sd
    
    # --- S.init and D.init ---  Initial states -------------------- #
    #projecting initial states and initial neighboring states
    #Initial states and initial neighboring states
    
    #Here we are projecting the states for each site based on parameter information gained from the estimation process
    for(i in 1:n.sites){
      D.est[i,s] <- sum(States.mean.round[neighbors[i,],(year-1),s])/2 #state of neighbors
      
      #Invasion
      gamma.est[i,s] <-invlogit(get(gamma.0.est[s])$mean + get(gamma.1.est[s])$mean*site.char[i] + get(gamma.2.est[s])$mean*D.est[i,s]) 
      
      #Eradication
      eps.l.est[i,s] <- invlogit(get(eps.l0.est[s])$mean + get(eps.l1.est[s])$mean*rem.vec.dat[i,4,s]*removal.hours) 
      eps.h.est[i,s] <- invlogit(get(eps.h0.est[s])$mean + get(eps.h1.est[s])$mean*rem.vec.dat[i,4,s]*removal.hours) 
  
      #Transition probability matrix
      TPM.est[1,i,s,1] <- 1-gamma.est[i,s]
      TPM.est[1,i,s,2] <- gamma.est[i,s]
      TPM.est[1,i,s,3] <- 0
      
      TPM.est[2,i,s,1] <- eps.l.est[i,s]
      TPM.est[2,i,s,2] <- (1- eps.l.est[i,s])*(1-get(phi.lh.est[s])$mean)
      TPM.est[2,i,s,3] <- (1- eps.l.est[i,s])*get(phi.lh.est[s])$mean
      
      TPM.est[3,i,s,1] <- eps.h.est[i,s]
      TPM.est[3,i,s,2] <- (1- eps.h.est[i,s])*(1-get(phi.hh.est[s])$mean)
      TPM.est[3,i,s,3] <- (1- eps.h.est[i,s])*get(phi.hh.est[s])$mean
  
    }
    
    for(i in 1:n.sites){
      #if we visited the site for observation data
      if(!is.na(rem.vec[i,1,year,s])){ 
        S.init[i,year,s] <- max(yD[i,,1,year,s], na.rm = T) #Initial state = max observed detection
        
        #Note that we observe states = 1 or 2 where true states are 1,2,3 
        #So if we just assigned S.init = 2, now randomly assign if it's true state is 2 or 3
        if(S.init[i,year,s] == 2){
          S.init[i,year,s] <- sample(c(2,3), 1)
        }
        
      }else{ #if we did not visit the site for observation data, randomly sample 
        S.init[i,year,s] <- rcat(1,TPM.est[States.mean.round[i,(year-1),s], i, s,]) 
        }
      }
      
      for(i in 1:n.sites){
        D.init[i,year,s] <- sum(S.init[neighbors[i,], year,s])/2 #state of neighbors
      }
    
    } #ends simulation loop 
    
  } #ends year 1+ priors
  
  #--------------------------------------------------------------------------------#
  ###### 2b. JAGS data ######

  #sites where removal occurred
  rem.vec.dat <- rem.vec[,,year,] 
  rem.vec.dat[is.na(rem.vec.dat)] <- 0 #replaces na with 0

  #Parameters monitored
  parameters.to.save <- c("eps.l0", "eps.l1", "eps.h0", "eps.h1", "gamma.0", "gamma.1",
                          "gamma.2", "phi.lh", "phi.hh", "p.l0", "p.l1", "p.h0", "p.h1", 
                          "State.fin")
                          
  #settings
  n.burnin <- 10000
  n.iter <- 100000 + n.burnin
  n.chains <- 3
  n.thin <- 1
  
  for(s in 1:n.sims){
    my.data[[s]] <- list( #constants
                         n.sites = n.sites,
                         n.weeks = n.weeks,
                         n.occs = n.occs, 
                         neighbors = neighbors,

                         #data
                         yD= yD[,,,year,s],
                         site.char = site.char,
                         logeffort = logsearch.effort,
                         S.init = S.init[,year,s], 
                         D.init = D.init[,year,s],
                         rem.vec = rem.vec.dat[,,s],
                         removal.hours = removal.hours,
                         
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
                         phi.hh.a = phi.hh.a[year,s],
                         phi.hh.b = phi.hh.b[year,s],
                         p.l0.a = p.l0.a[year,s],
                         p.l0.b = p.l0.b[year,s],
                         p.l1.mean = p.l1.mean[year,s],
                         p.l1.sd = p.l1.sd[year,s],
                         p.h0.a = p.h0.a[year,s],
                         p.h0.b = p.h0.b[year,s],
                         p.h1.mean = p.h1.mean[year,s],
                         p.h1.sd = p.h1.sd[year,s]
                
    )
  }
  
  ###### 2c. Run JAGS #####
  
  State.start <- array(NA, c(n.sites,n.weeks,n.sims)) #State initial values
  
  State.start[,2:n.weeks,] <- 2 #State[,2:n.weeks,year,]
  
  #Initial values
  for(s in 1:n.sims){
    initial.values[[s]] <- function()list(State = State.start[,,s])
  }
  
    
  #Running the model
  for(s in 1:n.sims){
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]],inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_multistate_datD.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
  }
  
  #--------------------------------------------------------------------------------#
  #### 3. Decision for next year ####

  ###### 3a. Save data from MCMC  #####
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
    assign(mcmcs[s], get(outs[s])$samples)
  }
  
  #select random 5 sims for density plot figures
  ##### FIX HERE ####
   rand5 <- c(1,2) #sample(seq(1:n.sims), 5, replace = F)
  
  #Saving density:
   for(s in rand5){

    MCMCtrace(get(mcmcs[s]), params = 'eps.l0', type = 'density', ind = TRUE, pdf = TRUE,
              open_pdf = FALSE, filename = paste0(res,'/densplots/eps.l0_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'eps.l1', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/eps.l1_sim_', s, '_year', year))
    
     MCMCtrace(get(mcmcs[s]), params = 'eps.h0', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/eps.h0_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'eps.h1', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/eps.h1_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'gamma.0', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/gamma.0_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'gamma.1', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/gamma.1_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'gamma.2', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/gamma.2_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'phi.lh', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/phi.lh_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'phi.hh', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/phi.hh_sim_', s, '_year', year))
    
     MCMCtrace(get(mcmcs[s]), params = 'p.l0', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/p.l0_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'p.l1', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/p.l1_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'p.h0', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/p.h0_sim_', s, '_year', year))
     
     MCMCtrace(get(mcmcs[s]), params = 'p.h1', type = 'density', ind = TRUE, pdf = TRUE,
               open_pdf = FALSE, filename = paste0(res,'/densplots/p.h1_sim_', s, '_year', year))
     
  }

  #save rhat outputs
  #remove state ones
  for(s in 1:n.sims){
    x[[s]] <- as.numeric(unlist(get(outputsfull[s])$Rhat[1:13])) #ignore the state.fin rhat values 
    rhat_vals[year,s] <-  sum(x[[s]] > 1.1, na.rm = TRUE)/ length(x[[s]]) #proportion of saved parameters that failed to converge
  }
  
  #----- EXTRACTING PARAMETERS FROM THE MODEL ----- #
  #-------State.fin -------# #estimated final state
  for(s in 1:n.sims){
    State.est[s]<- paste("State.est", s, sep = "_")
    assign(State.est[s], filter(get(outputs[s]), grepl("State", param)))
    
    sites[[s]] <- as.numeric(str_nth_number((get(State.est[s]))$param, n = 1))
    
  }
  
  
  for(s in 1:n.sims){
    assign(State.est[s], 
           cbind(get(State.est[s]), site = sites[[s]])) #adding site column  
  }
  
  # --- eps.l ---  eradication low state --- #
  #eps.l0 = base eradication at low state (beta distribution)
  for(s in 1:n.sims){
    eps.l0.est[s]<- paste("eps.l0", s, sep = "_")
    assign(eps.l0.est[s], filter(get(outputs[s]), grepl("eps.l0", param)))
    
    assign(eps.l0.est[s], 
           cbind(get(eps.l0.est[s]), cv = get(eps.l0.est[s])$sd/get(eps.l0.est[s])$mean
           ))  
  }
  
  #eps.l1 = effect of eradication at low state (normal distribution)
  for(s in 1:n.sims){
    eps.l1.est[s]<- paste("eps.l1", s, sep = "_")
    assign(eps.l1.est[s], filter(get(outputs[s]), grepl("eps.l1", param)))
  }
  
  
  # --- eps.h ---  eradication high state --- #
  #eps.h0 = base eradication at high state (beta distribution)
  for(s in 1:n.sims){
    eps.h0.est[s]<- paste("eps.h0", s, sep = "_")
    assign(eps.h0.est[s], filter(get(outputs[s]), grepl("eps.h0", param)))
    
    assign(eps.h0.est[s], 
           cbind(get(eps.h0.est[s]), cv = get(eps.h0.est[s])$sd/get(eps.h0.est[s])$mean
           ))  
  }
  
  #eps.h1 = effect of eradication at high state (normal distribution)
  for(s in 1:n.sims){
    eps.h1.est[s]<- paste("eps.h1", s, sep = "_")
    assign(eps.h1.est[s], filter(get(outputs[s]), grepl("eps.h1", param)))
  }
  
  # --- gamma ---  invasion --- #  
  #gamma.0 = intrinsic invasion (normal distribution)
  for(s in 1:n.sims){
    gamma.0.est[s]<- paste("gamma.0", s, sep = "_")
    assign(gamma.0.est[s], filter(get(outputs[s]), grepl("gamma.0", param)))
  }
  
  #gamma.1 = effect of site characteristics (normal distribution)
  for(s in 1:n.sims){
    gamma.1.est[s]<- paste("gamma.1", s, sep = "_")
    assign(gamma.1.est[s], filter(get(outputs[s]), grepl("gamma.1", param)))
  }
  
  #gamma.2 = effect of neighboring state (normal distribution)
  for(s in 1:n.sims){
    gamma.2.est[s]<- paste("gamma.2", s, sep = "_")
    assign(gamma.2.est[s], filter(get(outputs[s]), grepl("gamma.2", param)))
  }
  
  # --- phi ---  transition rates --- #
  #phi.lh = transition low to high (beta distribution)
  for(s in 1:n.sims){
    phi.lh.est[s]<- paste("phi.lh", s, sep = "_")
    assign(phi.lh.est[s], filter(get(outputs[s]), grepl("phi.lh", param)))
    
    assign(phi.lh.est[s], 
           cbind(get(phi.lh.est[s]), cv = get(phi.lh.est[s])$sd/get(phi.lh.est[s])$mean
           ))  
  }
  
  #phi.hh = transition high to high (beta distribution)
  for(s in 1:n.sims){
    phi.hh.est[s]<- paste("phi.hh", s, sep = "_")
    assign(phi.hh.est[s], filter(get(outputs[s]), grepl("phi.hh", param)))
    
    assign(phi.hh.est[s], 
           cbind(get(phi.hh.est[s]), cv = get(phi.hh.est[s])$sd/get(phi.hh.est[s])$mean
           ))  
  }
  
  # --- p.l ---  detection low state --- #
  #p.l.0 = base detection low state (beta distribution)
  for(s in 1:n.sims){
    p.l0.est[s]<- paste("p.l0", s, sep = "_")
    assign(p.l0.est[s], filter(get(outputs[s]), grepl("p.l0", param)))
    
    assign(p.l0.est[s], 
           cbind(get(p.l0.est[s]), cv = get(p.l0.est[s])$sd/get(p.l0.est[s])$mean
           ))  
  }
  
  
  #p.l.1 = effect of effort (normal distribution)
  for(s in 1:n.sims){
    p.l1.est[s]<- paste("p.l1", s, sep = "_")
    assign(p.l1.est[s], filter(get(outputs[s]), grepl("p.l1", param)))
  }
  
  # --- p.h ---  detection high state --- #
  #p.h.0 = base detection high state (beta distribution)
  for(s in 1:n.sims){
    p.h0.est[s]<- paste("p.h0", s, sep = "_")
    assign(p.h0.est[s], filter(get(outputs[s]), grepl("p.h0", param)))
    
    assign(p.h0.est[s], 
           cbind(get(p.h0.est[s]), cv = get(p.h0.est[s])$sd/get(p.h0.est[s])$mean
           ))  
  }
  
  #p.h.1 = effect of effort (normal distribution)
  for(s in 1:n.sims){
    p.h1.est[s]<- paste("p.h1", s, sep = "_")
    assign(p.h1.est[s], filter(get(outputs[s]), grepl("p.h1", param)))
  }
  
  
  #save annual data
  for(s in 1:n.sims){
    assign(State.est[s], 
           cbind(get(State.est[s]), year = year))
    
    assign(eps.l0.est[s], 
           cbind(get(eps.l0.est[s]), year = year))
    
    assign(eps.l1.est[s], 
           cbind(get(eps.l1.est[s]), year = year))
    
    assign(eps.h0.est[s], 
           cbind(get(eps.h0.est[s]), year = year))
    
    assign(eps.h1.est[s], 
           cbind(get(eps.h1.est[s]), year = year))
    
    assign(gamma.0.est[s], 
           cbind(get(gamma.0.est[s]), year = year))
    
    assign(gamma.1.est[s], 
           cbind(get(gamma.1.est[s]), year = year))
    
    assign(gamma.2.est[s], 
           cbind(get(gamma.2.est[s]), year = year))
    
    assign(phi.lh.est[s], 
           cbind(get(phi.lh.est[s]), year = year))
    
    assign(phi.hh.est[s], 
           cbind(get(phi.hh.est[s]), year = year))
    
    assign(p.l0.est[s], 
           cbind(get(p.l0.est[s]), year = year))
    
    assign(p.l1.est[s], 
           cbind(get(p.l1.est[s]), year = year))
    
    assign(p.h0.est[s], 
           cbind(get(p.h0.est[s]), year = year))
    
    assign(p.h1.est[s], 
           cbind(get(p.h1.est[s]), year = year))
    
  }
  
  
  for(s in 1:n.sims){
    
    all.State.est[s]<- paste("States.allsummary", s, sep = "_")
    all.eps.l0.est[s]<- paste("eps.l0.allsummary", s, sep = "_")
    all.eps.l1.est[s]<- paste("eps.l1.allsummary", s, sep = "_")
    all.eps.h0.est[s]<- paste("eps.h0.allsummary", s, sep = "_")
    all.eps.h1.est[s]<- paste("eps.h1.allsummary", s, sep = "_")
    all.gamma.0.est[s]<- paste("gamma.0.allsummary", s, sep = "_")
    all.gamma.1.est[s]<- paste("gamma.1.allsummary", s, sep = "_")
    all.gamma.2.est[s]<- paste("gamma.2.allsummary", s, sep = "_")
    all.phi.lh.est[s]<- paste("phi.lh.allsummary", s, sep = "_")
    all.phi.hh.est[s]<- paste("phi.hh.allsummary", s, sep = "_")
    all.p.l0.est[s]<- paste("p.l0.allsummary", s, sep = "_")
    all.p.l1.est[s]<- paste("p.l1.allsummary", s, sep = "_")
    all.p.h0.est[s]<- paste("p.h0.allsummary", s, sep = "_")
    all.p.h1.est[s]<- paste("p.h1.allsummary", s, sep = "_")
    
    
    #If year 1 we set summary data frame to itself
    if(year == 1){
      assign(all.State.est[s], 
             get(State.est[s]))
      
      assign(all.eps.l0.est[s], 
             get(eps.l0.est[s]))
      
      assign(all.eps.l1.est[s], 
             get(eps.l1.est[s]))
      
      assign(all.eps.h0.est[s], 
             get(eps.h0.est[s]))
      
      assign(all.eps.h1.est[s], 
             get(eps.h1.est[s]))
      
      assign(all.gamma.0.est[s], 
             get(gamma.0.est[s]))
      
      assign(all.gamma.1.est[s], 
             get(gamma.1.est[s]))
      
      assign(all.gamma.2.est[s], 
             get(gamma.2.est[s]))
      
      assign(all.phi.lh.est[s], 
             get(phi.lh.est[s]))
      
      assign(all.phi.hh.est[s], 
             get(phi.hh.est[s]))
      
      assign(all.p.l0.est[s], 
             get(p.l0.est[s]))
      
      assign(all.p.l1.est[s], 
             get(p.l1.est[s]))
      
      assign(all.p.h0.est[s], 
             get(p.h0.est[s]))
      
      assign(all.p.h1.est[s], 
             get(p.h1.est[s]))
      
      
    }else{ #if beyond first year, we append previous summary to new summary
      assign(all.State.est[s], 
             rbind(get(all.State.est[s]), get(State.est[s])))
      
      assign(all.eps.l0.est[s], 
             rbind(get(all.eps.l0.est[s]), get(eps.l0.est[s])))
      
      assign(all.eps.l1.est[s], 
             rbind(get(all.eps.l1.est[s]), get(eps.l1.est[s])))
      
      assign(all.eps.h0.est[s], 
             rbind(get(all.eps.h0.est[s]), get(eps.h0.est[s])))
      
      assign(all.eps.h1.est[s], 
             rbind(get(all.eps.h1.est[s]), get(eps.h1.est[s])))
      
      assign(all.gamma.0.est[s], 
             rbind(get(all.gamma.0.est[s]), get(gamma.0.est[s])))
      
      assign(all.gamma.1.est[s], 
             rbind(get(all.gamma.1.est[s]), get(gamma.1.est[s])))
      
      assign(all.gamma.2.est[s], 
             rbind(get(all.gamma.2.est[s]), get(gamma.2.est[s])))
    
      assign(all.phi.lh.est[s], 
             rbind(get(all.phi.lh.est[s]), get(phi.lh.est[s])))
      
      assign(all.phi.hh.est[s], 
             rbind(get(all.phi.hh.est[s]), get(phi.hh.est[s])))
      
      assign(all.p.l0.est[s], 
             rbind(get(all.p.l0.est[s]), get(p.l0.est[s])))
      
      assign(all.p.l1.est[s], 
             rbind(get(all.p.l1.est[s]), get(p.l1.est[s])))
      
      assign(all.p.h0.est[s], 
             rbind(get(all.p.h0.est[s]), get(p.h0.est[s])))      
      
      assign(all.p.h1.est[s], 
             rbind(get(all.p.h1.est[s]), get(p.h1.est[s])))
      
      
    }
  }
  
  #save states data
  
  for(s in 1:n.sims){
    States.mean.round[,year,s] <- round((get(State.est[s]))$mean)
    States.mean[,year,s] <- get(State.est[s])$mean #not rounded
  }
  
  States.mean.wide <- data.frame(t(States.mean[,year,]))
  colnames(States.mean.wide) <- seq(1:n.sites)
  States.mean.wide$sim <- seq(1:n.sims)  
  
  States.mean.long <- gather(States.mean.wide, site, state, all_of(n.sites), factor_key=TRUE)
  States.mean.long$site <- as.numeric(States.mean.long$site)
  
  States.mean.long$year <- year
  
  if(year == 1){
    States.mean.years <- States.mean.long
  }else{
    States.mean.years <- rbind(States.mean.years, States.mean.long)
  }
  
  #--------------------------------------------------------------------------------#
  ###### 3b. Make decision  #####
  
  if(year < n.years){

    #Removal locations: rank sites linear up to down
     for(s in 1:n.sims){
      sites.rem[,1,year+1,s] <- seq(1,n.sites)
    }
    
  }else{
    #during the final year, we project the final state
    for(s in 1:n.sims){
      
      #simulating truth at the end
      for(i in 1:n.sites){
        State[i,1,year+1,s] <- rcat(1,TPM[State[i,4,year,s], i, 4, year, s,]) 
      }
      
      #estimating final state via results from estimation model
      for(i in 1:n.sites){
        D.est[i,s] <- sum(States.mean.round[neighbors[i,],4,s])/2 #state of neighbors
        
        gamma.est[i,s] <-invlogit(get(gamma.0.est[s])$mean + get(gamma.1.est[s])$mean*site.char[i] + get(gamma.2.est[s])$mean*D.est[i,s]) 
        eps.l.est[i,s] <- invlogit(get(eps.l0.est[s])$mean + get(eps.l1.est[s])$mean*rem.vec.dat[i,4,s]*removal.hours) 
        eps.h.est[i,s] <- invlogit(get(eps.h0.est[s])$mean + get(eps.h1.est[s])$mean*rem.vec.dat[i,4,s]*removal.hours) 
        
        TPM.est[1,i,s,1] <- 1-gamma.est[i,s]
        TPM.est[1,i,s,2] <- gamma.est[i,s]
        TPM.est[1,i,s,3] <- 0
        TPM.est[2,i,s,1] <- eps.l.est[i,s]
        TPM.est[2,i,s,2] <- (1- eps.l.est[i,s])*(1-get(phi.lh.est[s])$mean)
        TPM.est[2,i,s,3] <- (1- eps.l.est[i,s])*get(phi.lh.est[s])$mean
        TPM.est[3,i,s,1] <- eps.h.est[i,s]
        TPM.est[3,i,s,2] <- (1- eps.h.est[i,s])*(1-get(phi.hh.est[s])$mean)
        TPM.est[3,i,s,3] <- (1- eps.h.est[i,s])*get(phi.hh.est[s])$mean
        
      }
      
      for(i in 1:n.sites){
      
        #if we visited the site for observation data
        if(!is.na(rem.vec[i,4,year,s])){ 
          S.end[i,s] <- max(yD[i,,4,year,s], na.rm = T) 
          
          #Note that we observe states = 1 or 2 where true states are 1,2,3 
          #So if we just assigned S.init = 2, now randomly assign if it's true state is 2 or 3
          if( S.end[i,s] == 2){
            S.end[i,s] <- sample(c(2,3), 1)
          }
          
        }else{
          S.end[i,s] <- rcat(1,TPM.est[States.mean.round[i,4,s], i, s,]) 
        }
        
      } #sites loop
      
    } #sims loop
  } #final year loop

} #end adaptive management 

#################################################################################################
#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

file_name = paste(path, 'e1_linear_time.txt',sep = '/')
write.table(time.taken,file_name)

#### Save True Data ####
#results for each sim
States.df <- adply(State, c(1,2,3,4))

colnames(States.df) <- c("site", "week", "year", "sim", "state")              

file_name = paste(path, 'States_e1_linear.csv',sep = '/')
write.csv(States.df,file_name)

#mean across simulations
Mean.States.df <- aggregate(state ~ site+week+year,
                            data = as.data.frame(States.df), FUN = mean)

file_name = paste(path, 'Mean.States_e1_linear.csv',sep = '/')
write.csv(Mean.States.df ,file_name)

#observation data -multi
yD.df <- adply(yD, c(1,2,3,4,5))

colnames(yD.df) <- c("site", "occasion", "week", "year", "sim", "observed.state")              

file_name = paste(path, 'y.obs_e1_linear.csv',sep = '/')
write.csv(yD.df,file_name)


rem.site.df <- yD.df %>% filter(observed.state > 1)
file_name = paste(path, 'rem.site_e1_linear.csv',sep = '/')
write.csv(rem.site.df,file_name)

#### sites visited ####
sites.visit <- adply(rem.vec, c(1,2,4,3))

colnames(sites.visit) <- c("site", "week", "year", "sim", "rem.val")   

sites.visit <- sites.visit %>% filter(!is.na(rem.val))

#visit no remove
sites.visit.norem <- sites.visit %>% filter(rem.val == 0)
sites.visit.norem$rem.val <- 1
sites.visit.norem <- aggregate(rem.val ~ week + year + sim,
                               data = as.data.frame(sites.visit.norem), FUN = sum)



sites.visit.norem.avg <- aggregate(rem.val ~ week+ year,
                                   data = as.data.frame(sites.visit.norem), FUN = mean)

colnames(sites.visit.norem.avg)[3] <- "num.visit.norem"

#visit remove
sites.visit.rem <- sites.visit %>% filter(rem.val == 1)

sites.visit.rem<- aggregate(rem.val ~ week+ year + sim,
                            data = as.data.frame(sites.visit.rem), FUN = sum)

sites.visit.rem.avg <- aggregate(rem.val ~ week + year,
                                 data = as.data.frame(sites.visit.rem), FUN = mean)


colnames(sites.visit.rem.avg)[3] <- "num.visit.rem"

sites.df <- cbind(sites.visit.norem.avg, num.visit.rem = sites.visit.rem.avg$num.visit.rem)

file_name = paste(path, 'sites.visit_e1_linear.csv',sep = '/')
write.csv(sites.df,file_name)

#### Estimated Data ####
##### Estimated States ####
States.est.df <- States.mean.years %>% select(site,year,sim,state)

file_name = paste(path, 'States.est_e1_linear.csv',sep = '/')
write.csv(States.est.df,file_name)


#mean across simulations
Mean.States.est.df <- aggregate(state ~ site+year,
                                data = as.data.frame(States.est.df), FUN = mean)

file_name = paste(path, 'Mean.States.est_e1_linear.csv',sep = '/')
write.csv(Mean.States.est.df ,file_name)

##### Estimated parameters ####
## --- eps.l0 -----------------------------------------------#
eps.l0s <- list()

for(s in 1:n.sims){
  assign(all.eps.l0.est[s], 
         cbind(get(all.eps.l0.est[s]), sim = s))
  
  eps.l0s[[s]] <- get(all.eps.l0.est[s])
}

eps.l0s.df <- do.call("rbind", eps.l0s)

file_name = paste(path, 'eps.l0.est_e1_linear.csv',sep = '/')
write.csv(eps.l0s.df,file_name)

## --- eps.l1 -----------------------------------------------#
eps.l1s <- list()

for(s in 1:n.sims){
  assign(all.eps.l1.est[s], 
         cbind(get(all.eps.l1.est[s]), sim = s))
  
  eps.l1s[[s]] <- get(all.eps.l1.est[s])
}

eps.l1s.df <- do.call("rbind", eps.l1s)

file_name = paste(path, 'eps.l1.est_e1_linear.csv',sep = '/')
write.csv(eps.l1s.df,file_name)
## --- eps.h0 -----------------------------------------------#
eps.h0s <- list()

for(s in 1:n.sims){
  assign(all.eps.h0.est[s], 
         cbind(get(all.eps.h0.est[s]), sim = s))
  
  eps.h0s[[s]] <- get(all.eps.h0.est[s])
}

eps.h0s.df <- do.call("rbind", eps.h0s)

file_name = paste(path, 'eps.h0.est_e1_linear.csv',sep = '/')
write.csv(eps.h0s.df,file_name)

## --- eps.h1 -----------------------------------------------#
eps.h1s <- list()

for(s in 1:n.sims){
  assign(all.eps.h1.est[s], 
         cbind(get(all.eps.h1.est[s]), sim = s))
  
  eps.h1s[[s]] <- get(all.eps.h1.est[s])
}

eps.h1s.df <- do.call("rbind", eps.h1s)

file_name = paste(path, 'eps.h1.est_e1_linear.csv',sep = '/')
write.csv(eps.h1s.df,file_name)

## --- gamma.0 -----------------------------------------------#
gamma.0s <- list()

for(s in 1:n.sims){
  assign(all.gamma.0.est[s], 
         cbind(get(all.gamma.0.est[s]), sim = s))
  
  gamma.0s[[s]] <- get(all.gamma.0.est[s])
}

gamma.0s.df <- do.call("rbind", gamma.0s)

file_name = paste(path, 'gamma.0.est_e1_linear.csv',sep = '/')
write.csv(gamma.0s.df,file_name)

## --- gamma.1 -----------------------------------------------#
gamma.1s <- list()

for(s in 1:n.sims){
  assign(all.gamma.1.est[s], 
         cbind(get(all.gamma.1.est[s]), sim = s))
  
  gamma.1s[[s]] <- get(all.gamma.1.est[s])
}

gamma.1s.df <- do.call("rbind", gamma.1s)

file_name = paste(path, 'gamma.1.est_e1_linear.csv',sep = '/')
write.csv(gamma.1s.df,file_name)

## --- gamma.2 -----------------------------------------------#
gamma.2s <- list()

for(s in 1:n.sims){
  assign(all.gamma.2.est[s], 
         cbind(get(all.gamma.2.est[s]), sim = s))
  
  gamma.2s[[s]] <- get(all.gamma.2.est[s])
}

gamma.2s.df <- do.call("rbind", gamma.2s)

file_name = paste(path, 'gamma.2.est_e1_linear.csv',sep = '/')
write.csv(gamma.2s.df,file_name)

## --- phi.lh -----------------------------------------------#
phi.lhs <- list()

for(s in 1:n.sims){
  assign(all.phi.lh.est[s], 
         cbind(get(all.phi.lh.est[s]), sim = s))
  
  phi.lhs[[s]] <- get(all.phi.lh.est[s])
}

phi.lhs.df <- do.call("rbind", phi.lhs)

file_name = paste(path, 'phi.lh.est_e1_linear.csv',sep = '/')
write.csv(phi.lhs.df,file_name)

## --- phi.hh -----------------------------------------------#
phi.hhs <- list()

for(s in 1:n.sims){
  assign(all.phi.hh.est[s], 
         cbind(get(all.phi.hh.est[s]), sim = s))
  
  phi.hhs[[s]] <- get(all.phi.hh.est[s])
}

phi.hhs.df <- do.call("rbind", phi.hhs)

file_name = paste(path, 'phi.hh.est_e1_linear.csv',sep = '/')
write.csv(phi.hhs.df,file_name)

## --- p.l0 -----------------------------------------------#
p.l0.s <- list()

for(s in 1:n.sims){
  assign(all.p.l0.est[s], 
         cbind(get(all.p.l0.est[s]), sim = s))
  
  p.l0.s[[s]] <- get(all.p.l0.est[s])
}

p.l0.s.df <- do.call("rbind", p.l0.s)

file_name = paste(path, 'p.l0.est_e1_linear.csv',sep = '/')
write.csv(p.l0.s.df,file_name)

## --- p.l1 -----------------------------------------------#
p.l1.s <- list()

for(s in 1:n.sims){
  assign(all.p.l1.est[s], 
         cbind(get(all.p.l1.est[s]), sim = s))
  
  p.l1.s[[s]] <- get(all.p.l1.est[s])
}

p.l1.s.df <- do.call("rbind", p.l1.s)

file_name = paste(path, 'p.l1.est_e1_linear.csv',sep = '/')
write.csv(p.l1.s.df,file_name)

## --- p.h0 -----------------------------------------------#
p.h0.s <- list()

for(s in 1:n.sims){
  assign(all.p.h0.est[s], 
         cbind(get(all.p.h0.est[s]), sim = s))
  
  p.h0.s[[s]] <- get(all.p.h0.est[s])
}

p.h0.s.df <- do.call("rbind", p.h0.s)

file_name = paste(path, 'p.h0.est_e1_linear.csv',sep = '/')
write.csv(p.h0.s.df,file_name)

## --- p.h1 -----------------------------------------------#
p.h1.s <- list()

for(s in 1:n.sims){
  assign(all.p.h1.est[s], 
         cbind(get(all.p.h1.est[s]), sim = s))
  
  p.h1.s[[s]] <- get(all.p.h1.est[s])
}

p.h1.s.df <- do.call("rbind", p.h1.s)

file_name = paste(path, 'p.h1.est_e1_linear.csv',sep = '/')
write.csv(p.h1.s.df,file_name)

##### rhat vals ######
file_name = paste(path, 'rhat.vals_e1_linear.csv',sep = '/')
write.csv(rhat_vals,file_name)

