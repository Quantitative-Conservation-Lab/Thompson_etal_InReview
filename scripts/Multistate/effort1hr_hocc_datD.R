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
# Observations (O):  
# 1 absent
# 2 present
# -------------------------------------------------

#### PRIORS ####
  #Erradication:
  eps.l0 ~ dbeta(eps.l0.a,eps.l0.b) #eradication when at low state
  eps.l1 ~ dnorm(eps.l1.mean, eps.l1.tau) #effect of eradication 
  eps.l1.tau <- 1/(eps.l1.sd * eps.l1.sd)
  
  eps.h0 ~ dbeta(eps.h0.a,eps.h0.b) #eradication when at high state
  eps.h1 ~ dnorm(eps.h1.mean, eps.h1.tau) #effect of eradication 
  eps.h1.tau <- 1/(eps.h1.sd * eps.h1.sd)
  
  #Invasion:
  gamma.0 ~dnorm(gamma.0.mean,gamma.0.tau) #intrinsic invasion probability
  gamma.0.tau <- 1/(gamma.0.sd*gamma.0.sd)
  gamma.1 ~dnorm(gamma.1.mean, gamma.1.tau) #effect of site characteristics on invasion probability
  gamma.1.tau <- 1/(gamma.1.sd*gamma.1.sd)
  gamma.2 ~dnorm(gamma.2.mean, gamma.2.tau) #effect of Neighboring invasion state
  gamma.2.tau <- 1/(gamma.2.sd*gamma.2.sd)
  
  #State transition:
  phi.lh ~ dbeta(phi.lh.a, phi.lh.b) #transition from low to high
  phi.hh ~ dbeta(phi.hh.a, phi.hh.b) #transition from high to high
  
  #Detection low state:
  p.l0 ~ dbeta(p.l0.a, p.l0.b) #base detection for low state
  p.l1 ~ dnorm(p.l1.mean, p.l1.tau) #effect of effort 
  p.l1.tau <- 1/(p.l1.sd * p.l1.sd)
  
  #Detection high state:
  p.h0 ~ dbeta(p.h0.a, p.h0.b) #base detection for high state
  p.h1 ~ dnorm(p.h1.mean, p.h1.tau) #effect of effort 
  p.h1.tau <- 1/(p.h1.sd * p.h1.sd)

  logit(pD.l) <- p.l0 + p.l1*logeffort #detection low state
  logit(pD.h) <- p.h0 + p.h1*logeffort #detection high state
  
#--------------------------------------------------#
# STATE TRANSITION
for (i in 1:n.sites){  
  # State transition probabilities: probability of S(t+1) given S(t)
  for (t in 1:n.weeks){
  
    logit(gamma[i,t]) <-gamma.0 + gamma.1*site.char[i] + gamma.2*D[i,t] #invasion probability
    logit(eps.l[i,t]) <- eps.l0 + eps.l1*rem.vec[i,t]
    logit(eps.h[i,t]) <- eps.h0 + eps.h1*rem.vec[i,t]
    
    #index = [current state, location, time, future state]
    #empty stay empty
    ps[1,i,t,1] <- 1-gamma[i,t] #1-gamma = not invasion probability
    
    #empty to low abundance
    ps[1,i,t,2] <- gamma[i,t] #invasion probability
    
    #empty to high abundance
    ps[1,i,t,3] <- 0 #invasion probability

    #low abundance to empty
    ps[2,i,t,1] <- eps.l[i,t] #erradication probability
                                      # rem.vec[i] = 0,1 if 0, then no removal and no erradiction
    
    #low abundance to low abundance
    ps[2,i,t,2] <- (1- eps.l[i,t])*(1-phi.lh) #erradication failure probability
    
    #low abundance to high abundance
    ps[2,i,t,3] <- (1- eps.l[i,t])*(phi.lh)
    
    #high abundance to empty
    ps[3,i,t,1] <- eps.h[i,t] #erradication probability
    
    #high abundance to low abundance
    ps[3,i,t,2] <- (1- eps.h[i,t])*(1-phi.hh) #erradication failure probability
    
    #low abundance to high abundance
    ps[3,i,t,3] <- (1- eps.h[i,t])*(phi.hh)
    
    
    #--------------------------------------------------#
    # OBSERVATION PROBABILITIES 1 (for detection/nondetection data)
    
    for(j in 1:n.occs){

      #Empty and not observed  
      po.datD[1,i,j,t,1] <- 1
      
      #Empty and observed
      po.datD[1,i,j,t,2] <- 0
   
      #Low state and not observed
      po.datD[2,i,j,t,1] <- 1-pD.l #not detected probability
      
      #Low state and observed
      po.datD[2,i,j,t,2] <- pD.l #detection probability
      
      #High state and not observed
      po.datD[3,i,j,t,1] <- 1-pD.h #not detected probability
      
      #High state and observed
      po.datD[3,i,j,t,2] <- pD.h #detection probability
      
    } #j 
  } #t
} #i

  #### Likelihood ####
  for (i in 1:n.sites){
    # Define state at beginning
    State[i,1] <- S.init[i] #we know state at the start?
    D[i,1] <- D.init[i]     #we know neighbor states at the start
    
    for (t in 2:n.weeks){ 
      # State process: state given previous state and transition probability
      State[i,t] ~ dcat(ps[State[i,t-1], i, t-1, ]) 
      
      D[i,t] <- sum(State[neighbors[i,], t])/2 #state of neighbors 
     
    } #t

    for(j in 1:n.occs){
      for(t in 1:n.weeks){
        # Observation process: draw observation given state
        yD[i,j,t] ~ dcat(po.datD[State[i,t], i, j, t,]) #shoult this be t or t-1?
                         
      } #t
    } #j
    
    #Derived parameter:
    State.fin[i] <- State[i,n.weeks] #state after 4 weeks
    
  } #i


} #end model
", fill = TRUE)
sink()

#### Path Name ####
path <- here::here("results", "Multistate", "e1hr_hocc_datD")
res <- c('results/Multistate/e1hr_hocc_datD') 

#### Data ####
n.sims <-  2 #25 #100
n.sites <- 40 #number of sites
n.years <- 10
n.weeks <- 4
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3

eps.l0 <- 0.3 #base eradication at low state
eps.l1 <- 5 #effect of eradication at low state
eps.h0 <- 0.2 #base eradication at high state
eps.h1 <- 2 #effect of eradication at high state
gamma.0 <- 0.3 #intrinsic invasion probability
gamma.1 <- 0.1 #effect of site characteristics
gamma.2 <- 1 #effect of neighboring invasion state
phi.lh <- 0.1 #transition from low to high
phi.hh <- 0.8 #transition from high to high

p.l0 <- 0.3 #base detection for low state
p.l1 <- 1 #effect of effort

p.h0 <- 0.8 #base detection for high state
p.h1 <- 1 #effect of effort

n.resource <- 20 #total resources we can use each week

#neighbor data
num.neighbors <- 2 #one upstream, one downstream
neighbors <- matrix(NA, nrow = n.sites, ncol = num.neighbors) #neighbors matrix, each row (site) identifies the neighbors for that site 
neighbors[1,1] <- 2
neighbors[2:n.sites, 1] <- seq(1,n.sites-1)
neighbors[n.sites,2] <- n.sites-1
neighbors[1:(n.sites-1), 2] <- seq(2,n.sites)

# effect of habitat quality on occupancy
#set.seed(03222021)
#site.char <- runif(n.sites) 
path2 <- here::here("data")
file_name = paste(path2, 'Site_char_multi.csv',sep = '/')
# write.csv(site.char,file_name)
site.chardat <- read.csv(file_name)
site.char <- site.chardat[,2]

##### week 1 -state ####
#set.seed(03222021)
# State.init <- rep(NA, n.sites)
# 
# for(i in 1:n.sites){
#   State.init[i] <- rbinom(1,1,invlogit(gamma.0 + gamma.1*site.char[i])) #true state
# }
#write.csv(State.init,file_name)

path2 <- here::here("data")
file_name = paste(path2, 'States_init_multi.csv',sep = '/')
State.init <- read.csv(file_name)
State <- array(NA,c(n.sites, n.weeks, n.years+1, n.sims)) #state array
State[,1,1,1:n.sims] <- State.init[,2] + 1 #initial state

D <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #neighbors array
for(s in 1:n.sims){
  for(i in 1:n.sites){
    D[i,1,1,s] <- sum(State[neighbors[i,], 1,1,s])/2 #state of neighbors
}}
 
ps<- array(NA, c(n.states,n.sites,n.weeks, n.years + 1,n.sims, n.states)) #state probability
gamma <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #invasion probability
eps.l <- array(NA, c(n.sites, n.weeks, n.years+1,n.sims)) #eradication at low state
eps.h <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #eradication at high state

gamma[,1,1,] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,1,1,]) #invasion (week 1 year 1)
eps.l[,1,1,] <- invlogit(eps.l0) #eradication low (week 1 year 1)
eps.h[,1,1,] <- invlogit(eps.h0) #eradication high (week 1 year 1)

ps[1,1:n.sites,1,1,,1] <- 1-gamma[,1,1,] #empty to empty (week 1 year 1)
ps[1,1:n.sites,1,1,,2] <- gamma[,1,1,] #empty to low (week 1 year 1)
ps[1,1:n.sites,1,1,,3] <- 0 #empty to high (week 1 year 1)

ps[2,1:n.sites,1,1,,1] <- eps.l[,1,1,] #low to empty (week 1 year 1)
ps[2,1:n.sites,1,1,,2] <- (1- eps.l[,1,1,])*(1-phi.lh) #low to low (week 1 year 1)
ps[2,1:n.sites,1,1,,3] <- (1- eps.l[,1,1,])*(phi.lh) #low to high (week 1 year 1)

ps[3,1:n.sites,1,1,,1] <- eps.h[,1,1,] #high to empty (week 1 year 1)
ps[3,1:n.sites,1,1,,2] <- (1- eps.h[,1,1,])*(1-phi.hh) #high to low (week 1 year 1)
ps[3,1:n.sites,1,1,,3] <- (1- eps.h[,1,1,])*(phi.hh) #high to high (week 1 year 1)

##### week 1 -occ ####
#Randomly order all sites (next year order of sites will be based on some factor)
sites.rem <- array(NA, dim = c(n.sites, n.weeks, n.years, n.sims))

for(s in 1:n.sims){
  sites.rem[,1,1,s] <- sample(seq(1,n.sites), n.sites, replace = F)
}

###### effort ####
#effort is fixed
search.hours <- 1.1
removal.hours <- 2
logsearch.effort <- log(search.hours)
resource.total <- array(0, c(n.weeks, n.years,n.sims))

yD <- array(NA,c(n.sites, n.occs, n.weeks, n.years, n.sims)) #detection/non-detection data
rem.vec <- array(NA, c(n.sites, n.weeks, n.years, n.sims)) #removal sites array
po.datD <- array(NA, c(n.states, 2)) #detection probability

pD.l <- invlogit(p.l0 + p.l1*logsearch.effort)
pD.h <- invlogit(p.h0 + p.h1*logsearch.effort)

po.datD[1,1] <- 1
po.datD[1,2] <- 0

po.datD[2,1] <- 1-pD.l #not detected probability
po.datD[2,2] <- pD.l #detection probability

po.datD[3,1] <- 1-pD.h #not detected probability
po.datD[3,2] <- pD.h #detection probability

#simulate occupancy data for year 1 across sims
year <- 1

for(s in 1:n.sims){
  for(week in 1:n.weeks){
    if(week > 1){
      
      n.pre.visit <- length(which(rem.vec[,week-1,year,s] >= 0)) #number of sites that were sampled last week
      #put last weeks sampling sites at the end of the sampling queue 
      sites.rem[,week,year,s] <- c(sites.rem[,(week-1),year,s][-1:-n.pre.visit],
                                   sites.rem[,(week-1),year,s][1:n.pre.visit])
      
      prev.rem.vec2 <- replace(rem.vec[,week-1,year,s], is.na(rem.vec[,week-1,year,s]), 0)
      
      for(i in 1:n.sites){
        State[i,week,year,s] <- rcat(1,ps[State[i,week-1,year,s], i, week-1, year, s,]) 
      }
      
      for(i in 1:n.sites){
        D[i,week,year,s] <- sum(State[neighbors[i,], week,year,s])/2 #state of neighbors
      }
      
      #create transition matrix that will be used for next time
      gamma[,week,year,s] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,week,year,s]) #week or week-1?
      eps.l[,week,year,s] <- invlogit(eps.l0 + eps.l1*prev.rem.vec2)
      eps.h[,week,year,s] <- invlogit(eps.h0 + eps.h1*prev.rem.vec2)
      
      ps[1,1:n.sites,week,year,s,1] <- 1-gamma[,week,year,s]
      ps[1,1:n.sites,week,year,s,2] <- gamma[,week,year,s]
      ps[1,1:n.sites,week,year,s,3] <- 0 
      
      ps[2,1:n.sites,week,year,s,1] <- eps.l[,week,year,s]
      ps[2,1:n.sites,week,year,s,2] <- (1- eps.l[,week,year,s])*(1-phi.lh) #eradication failure probability
      ps[2,1:n.sites,week,year,s,3] <- (1- eps.l[,week,year,s])*(phi.lh)
      
      ps[3,1:n.sites,week,year,s,1] <- eps.h[,week,year,s] #eradication probability
      ps[3,1:n.sites,week,year,s,2] <- (1- eps.h[,week,year,s])*(1-phi.hh) #eradication failure probability
      ps[3,1:n.sites,week,year,s,3] <- (1- eps.h[,week,year,s])*(phi.hh)
      
    }
    for(i in sites.rem[,week,year,s]){
      #while we still have resources to spend:
      if(resource.total[week,year,s] < n.resource){
        
        #first occasion occupancy data
        yD[i,1,week, year, s] <- rcat(1, po.datD[State[i,week,year,s], ])
        
          
        #second occasion occupancy data
        if(yD[i,1,week, year, s]==2){ #if already seen (2), do not search again and remove
          yD[i,2, week,year, s] <- NA 
          rem.vec[i,week,year,s] <- 1
          resource.total[week,year,s] <- resource.total[week,year,s] + search.hours + removal.hours
            
        }else{
          yD[i,2, week, year, s] <- rcat(1, po.datD[State[i,week,year,s], ])
            
          if(yD[i,2, week, year, s]==2){ #if seen (2) the second time
             rem.vec[i,week,year,s] <- 1
             resource.total[week,year,s] <- resource.total[week,year,s] + 2*search.hours + removal.hours
          } 
            
           #if we don't detect anything
           if(yD[i,2, week, year, s]==1){
             rem.vec[i,week,year,s] <- 0
             resource.total[week,year,s] <- resource.total[week,year,s] + 2*search.hours
           } 
        }
      #if we do not have any more resources to spend:
      }else{
        #if we do not have enough data
        yD[i,1:2, week, year, s] <- NA
        rem.vec[i,week,year,s] <- NA
      }
      
    } #ends site loop
  } #ends week loop
} #ends sims loop

#
State[,4,year,]

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
my.data <- list()
outs <- rep(NA,n.sims)
outputsfull <- rep(NA, n.sims)
outputs <- rep(NA, n.sims)
mcmcs <- rep(NA, n.sims)

eps.l0.as <- rep(NA, n.sims)
eps.l0.bs<- rep(NA, n.sims)
eps.l1.means <- rep(NA, n.sims)
eps.l1.sds <- rep(NA, n.sims)
eps.h0.as <- rep(NA, n.sims)
eps.h0.bs <- rep(NA, n.sims)
eps.h1.means <- rep(NA, n.sims)
eps.h1.sds <- rep(NA, n.sims)
gamma.0.means <- rep(NA, n.sims)
gamma.0.sds <- rep(NA, n.sims)
gamma.1.means <- rep(NA, n.sims)
gamma.1.sds <- rep(NA, n.sims)
gamma.2.means <- rep(NA, n.sims)
gamma.2.sds <- rep(NA, n.sims)
phi.lh.as <- rep(NA, n.sims)
phi.lh.bs <- rep(NA, n.sims)
phi.hh.as <- rep(NA, n.sims)
phi.hh.bs <- rep(NA, n.sims)
p.l0.as <- rep(NA, n.sims)
p.l0.bs <- rep(NA, n.sims)
p.l1.means <- rep(NA, n.sims)
p.l1.sds <- rep(NA, n.sims)
p.h0.as <- rep(NA, n.sims)
p.h0.bs <- rep(NA, n.sims)
p.h1.means <- rep(NA, n.sims)
p.h1.sds <- rep(NA, n.sims)

sites <- list()
States.mean.round <- array(NA, c(n.sites, n.weeks, n.years, n.sims))
States.mean <- array(NA, c(n.sites, n.weeks, n.years, n.sims))

all.eps.l0.as <- rep(NA, n.sims)
all.eps.l0.bs<- rep(NA, n.sims)
all.eps.l1.means <- rep(NA, n.sims)
all.eps.l1.taus <- rep(NA, n.sims)
all.eps.h0.as <- rep(NA, n.sims)
all.eps.h0.bs <- rep(NA, n.sims)
all.eps.h1.means <- rep(NA, n.sims)
all.eps.h1.sds <- rep(NA, n.sims)
all.gamma.0.means <- rep(NA, n.sims)
all.gamma.0.sds <- rep(NA, n.sims)
all.gamma.1.means <- rep(NA, n.sims)
all.gamma.1.sds <- rep(NA, n.sims)
all.gamma.2.means <- rep(NA, n.sims)
all.gamma.2.sds <- rep(NA, n.sims)
all.phi.lh.as <- rep(NA, n.sims)
all.phi.lh.bs <- rep(NA, n.sims)
all.phi.hh.as <- rep(NA, n.sims)
all.phi.hh.bs <- rep(NA, n.sims)
all.p.l0.as <- rep(NA, n.sims)
all.p.l0.bs <- rep(NA, n.sims)
all.p.l1.means <- rep(NA, n.sims)
all.p.l1.sds <- rep(NA, n.sims)
all.p.h0.as <- rep(NA, n.sims)
all.p.h0.bs <- rep(NA, n.sims)
all.p.h1.means <- rep(NA, n.sims)
all.p.h1.sds <- rep(NA, n.sims)

initial.values <- list()

prev.state <- array(NA, c(n.sites, n.sims))

####################################################################################
#### Run Adaptive Management ####

year <- 1
#n.years <- 2

for(year in 1:n.years){
  #### 1. Simulate truth #####
  #### FIX ####
  if(year > 1){ #we simulated year 1 data above
    
  }
    ###### State Transitions ######


    ###### Occupancy Data ######
}
  #### 2. Learning: ####
  
  ##### 2a. Update priors #####
  
  #------------------------Year 1 Priors------------------------#
  if(year == 1){
    
    # --- eps.l ---  eradication low state --- #
      #eps.l0 = base eradication at low state (beta distribution)
      eps.l0.a[year,] <- 1 #alpha shape
      eps.l0.b[year,] <- 1 #beta shape
      
      #eps.l1 = effect of eradication at low state (normal distribution)
      eps.l1.mean[year,] <- 0 #mean
      eps.l1.sd[year,] <-  10 #sd
    
    # --- eps.h ---  eradication high state --- #
      #eps.h0 = base eradication at high state (beta distribution)
      eps.h0.a[year,] <- 1 #alpha shape
      eps.h0.b[year,] <- 1 #beta shape
    
      #eps.h1 = effect of eradication at high state (normal distribution)
      eps.h1.mean[year,] <- 0 #mean
      eps.h1.sd[year,] <- 10 #sd
    
    # --- gamma ---  invasion --- #  
      #gamma.0 = intrinsic invasion (normal distribution)
      gamma.0.mean[year,] <- 0 #mean
      gamma.0.sd[year, ] <- 10 #sd
      
      #gamma.1 = effect of site characteristics (normal distribution)
      gamma.1.mean[year,] <- 0 #mean
      gamma.1.sd[year,] <- 10 #sd
    
      #gamma.2 = effect of neighboring state (normal distribution)
      gamma.2.mean[year,] <- 0 #mean
      gamma.2.sd[year,] <- 10 #sd
    
    
    # --- phi ---  transition rates --- #
      #phi.lh = transition low to high (beta distribution)
      phi.lh.a[year,] <- 1 #alpha shape
      phi.lh.b[year,] <- 1 #beta shape
      
      #phi.hh = transition high to high (beta distribution)
      phi.hh.a[year,] <- 1 #alpha shape
      phi.hh.b[year,] <- 1 #beta shape
   
    # --- p.l ---  detection low state --- #
      #p.l.0 = base detection low state (beta distribution)
      p.l0.a[year,] <- 1 #alpha shape
      p.l0.b[year,] <- 1 #beta shape
      
      #p.l.1 = effect of effort (normal distribution)
      p.l1.mean[year,] <- 0 #mean
      p.l1.sd[year,] <- 10 #sd
    
    # --- p.h ---  detection high state --- #
      #p.h.0 = base detection high state (beta distribution)
      p.h0.a[year,] <- 1 #alpha shape
      p.h0.b[year,] <- 1 #beta shape
      
      #p.h.1 = effect of effort (normal distribution)
      p.h1.mean[year,] <- 0 #mean
      p.h1.sd[year,] <- 10 #sd
      
      #### Unsure if correct ####
      #Initial states and initial neighboring states
      for(s in 1:n.sims){
        for(i in 1:n.sites){
          S.init[i,year,s] <- max(yD[i,,1,year,1], na.rm = T)
          
          if(S.init[i,year,s] == -Inf){
            S.init[i,year,s] <- sample(c(1,2,3),1)
          }
        }
        
        for(i in 1:n.sites){
          D.init[i,year,s] <- sum(S.init[neighbors[i,], year,s])/2 #state of neighbors
        }
      }

    
  } else{
    #------------------------Year 1+ Priors------------------------#
    for(s in 1:n.sims){
     
     #### FIX ####
  
    }
  }
 
  ###### 2b. JAGS data ######

  #sites where removal occurred
  rem.vec.dat <- rem.vec[,,year,] 
  rem.vec.dat[is.na(rem.vec.dat)] <- 0 #replaces na with 0

  #Parameters monitored
  parameters.to.save <- c("eps.l0", "eps.l1", "eps.h0", "eps.h1", "gamma.0", "gamma.1",
                          "gamma.2", "phi.lh", "phi.hh", "p.l0", "p.l1", "p.h0", "p.h1", 
                          "State.fin")
                          
  #settings
  n.burnin <- 10 #00
  n.iter <- 100 #00 + n.burnin
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
  #### FIX ####
  
  #### invalid parent nodes ####
  initial.values[[s]] <- function(){list()}
    

  for(s in 1:n.sims){
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]],inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_multistate_datD.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
  }
  
  
  #### 3. Decision for next year ####
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
  
  ###### 3a. Save data from MCMC  #####
  for(s in 1:n.sims){
    mcmcs[s]<- paste("mcmc", s, sep = "_")
    assign(mcmcs[s], get(outs[s])$samples)
  }
  
   #select random 5 sims for sampling
   rand5 <- c(1,2) #sample(seq(1:n.sims), 5, replace = F)
  
   for(s in rand5){

    MCMCtrace(get(mcmcs[s]),
              params = 'a0',
              type = 'density',
              ind = TRUE,
              pdf = TRUE,
              open_pdf = FALSE,
              filename = paste0(res,'/a0_sim_', s, '_year', year))
     
    MCMCtrace(get(mcmcs[s]),
               params = 'a1',
               type = 'density',
               ind = TRUE,
               pdf = TRUE,
               open_pdf = FALSE,
               filename = paste0(res,'/a1_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]),
              params = 'psi0',
              type = 'density',
              ind = TRUE,
              pdf = TRUE,
              open_pdf = FALSE,
              filename = paste0(res,'/psi0_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]),
              params = 'psi1',
              type = 'density',
              ind = TRUE,
              pdf = TRUE,
              open_pdf = FALSE,
              filename = paste0(res,'/psi1_sim_', s, '_year', year))
    
    MCMCtrace(get(mcmcs[s]),
              params = 'psi2',
              type = 'density',
              ind = TRUE,
              pdf = TRUE,
              open_pdf = FALSE,
              filename = paste0(res,'/psi2_sim_', s, '_year', year))

    
    MCMCtrace(get(mcmcs[s]),
              params = 'psi3',
              type = 'density',
              ind = TRUE,
              pdf = TRUE,
              open_pdf = FALSE,
              filename = paste0(res,'/psi3_sim_', s, '_year', year))
    
  }

  #save rhat outputs
  #remove state ones
  for(s in 1:n.sims){
    x[[s]] <- as.numeric(unlist(get(outputsfull[s])$Rhat[1:6]))
    rhat_vals[year,s] <-  sum(x[[s]] > 1.1, na.rm = TRUE)/ length(x[[s]])
  }
  

  #-------State-------# #estimated state
  for(s in 1:n.sims){
    State.est[s]<- paste("State.est", s, sep = "_")
    assign(State.est[s], filter(get(outputs[s]), grepl("State", param)))
    
    sites[[s]] <- as.numeric(str_nth_number((get(State.est[s]))$param, n = 1))
    
  }
  
  
  for(s in 1:n.sims){
    assign(State.est[s], 
           cbind(get(State.est[s]), site = sites[[s]])) #adding site column  
  }
  
  
  #-------psi -------# #occupancy probability 
  for(s in 1:n.sims){
    psi.est[s]<- paste("psi.est", s, sep = "_")
    assign(psi.est[s], filter(get(outputs[s]), grepl("psi.est", param)))
    
    sites[[s]] <- as.numeric(str_nth_number((get(psi.est[s]))$param, n = 1))
    
  }
  
  
  for(s in 1:n.sims){
    assign(psi.est[s], 
           cbind(get(psi.est[s]), site = sites[[s]])) #adding site column  
  }
  
  #-------psi0-------# #base occupancy rate
  for(s in 1:n.sims){
    psi0s[s]<- paste("psi0", s, sep = "_")
    assign(psi0s[s], filter(get(outputs[s]), grepl("psi0", param)))
    
    assign(psi0s[s], 
           cbind(get(psi0s[s]), cv = get(psi0s[s])$sd/get(psi0s[s])$mean
           ))  
    
  }
  
  #-------psi1-------# #effect on removal previously taking place
  for(s in 1:n.sims){
    psi1s[s]<- paste("psi1", s, sep = "_")
    assign(psi1s[s], filter(get(outputs[s]), grepl("psi1", param)))
    
  }
  
  #-------psi2-------# #effect of habitat
  for(s in 1:n.sims){
    psi2s[s]<- paste("psi2", s, sep = "_")
    assign(psi2s[s], filter(get(outputs[s]), grepl("psi2", param)))
    
  }
   
   #-------psi3-------# #effect of habitat
   for(s in 1:n.sims){
     psi3s[s]<- paste("psi3", s, sep = "_")
     assign(psi3s[s], filter(get(outputs[s]), grepl("psi3", param)))
     
   }
  
  #-------a0-------# #baseline detection probability
  for(s in 1:n.sims){
    a0s[s]<- paste("a0", s, sep = "_")
    assign(a0s[s], filter(get(outputs[s]), grepl("a0", param)))
    
    assign(a0s[s], 
           cbind(get(a0s[s]), cv = get(a0s[s])$sd/get(a0s[s])$mean
           ))  
    
  }
  
  #-------a1-------# #effect of effort 
  for(s in 1:n.sims){
    a1s[s]<- paste("a1", s, sep = "_")
    assign(a1s[s], filter(get(outputs[s]), grepl("a1", param)))
    
  }
  
  #save annual data
  for(s in 1:n.sims){
    assign(State.est[s], 
           cbind(get(State.est[s]), year = year))
    
    assign(psi.est[s], 
           cbind(get(psi.est[s]), year = year))
    
    
    assign(psi0s[s], 
           cbind(get(psi0s[s]), year = year))
    
    assign(psi1s[s], 
           cbind(get(psi1s[s]), year = year))
    
    assign(psi2s[s], 
           cbind(get(psi2s[s]), year = year))
    
    assign(psi3s[s], 
           cbind(get(psi3s[s]), year = year))
    
    assign(a0s[s], 
           cbind(get(a0s[s]), year = year))
    
    assign(a1s[s], 
           cbind(get(a1s[s]), year = year))
    
  }
  
  
  for(s in 1:n.sims){
    
    all.state.est[s]<- paste("States.allsummary", s, sep = "_")
    all.psi.est[s]<- paste("psi.allsummary", s, sep = "_")
    all.psi0[s]<- paste("psi0.allsummary", s, sep = "_")
    all.psi1[s]<- paste("psi1.allsummary", s, sep = "_")
    all.psi2[s]<- paste("psi2.allsummary", s, sep = "_")
    all.psi3[s]<- paste("psi3.allsummary", s, sep = "_")
    
    all.a0[s]<- paste("a0.allsummary", s, sep = "_")
    all.a1[s]<- paste("a1.allsummary", s, sep = "_")

    
    #If year 1 we set summary data frame to itself
    if(year == 1){
      assign(all.state.est[s], 
             get(State.est[s]))
      
      assign(all.psi.est[s], 
             get(psi.est[s]))
      
      assign(all.psi0[s], 
             get(psi0s[s]))
      
      assign(all.psi1[s], 
             get(psi1s[s]))
      
      assign(all.psi2[s], 
             get(psi2s[s]))
      
      assign(all.psi3[s], 
             get(psi3s[s]))
      
      assign(all.a0[s], 
             get(a0s[s]))
      
      assign(all.a1[s], 
             get(a1s[s]))
      
    }else{ #if beyond first year, we append previous summary to new summary
      assign(all.state.est[s], 
             rbind(get(all.state.est[s]), get(State.est[s])))
      
      assign(all.psi.est[s], 
             rbind(get(all.psi.est[s]), get(psi.est[s])))
      
      assign(all.psi0[s], 
             rbind(get(all.psi0[s]), get(psi0s[s])))
      
      assign(all.psi1[s], 
             rbind(get(all.psi1[s]), get(psi1s[s])))
      
      assign(all.psi2[s], 
             rbind(get(all.psi2[s]), get(psi2s[s])))
      
      assign(all.psi3[s], 
             rbind(get(all.psi3[s]), get(psi3s[s])))
      
      assign(all.a0[s], 
             rbind(get(all.a0[s]), get(a0s[s])))
      
      assign(all.a1[s], 
             rbind(get(all.a1[s]), get(a1s[s])))
      
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
  
  States.mean.long <- gather(States.mean.wide, site, state, 1:n.sites, factor_key=TRUE)
  States.mean.long$site <- as.numeric(States.mean.long$site)
  
  States.mean.long$year <- year
  
  if(year == 1){
    States.mean.years <- States.mean.long
  }else{
    States.mean.years <- rbind(States.mean.years, States.mean.long)
  }
  
  ###### 3b. Make decision  #####
  #Effort level: remove at effort where detection probability is estimated to be 0.8
  #Removal locations: rank sites by occupancy probability, remove until resource is expelled
  
  #1. find effort where detection probability = 0.5
  
  det.p <- log(0.5/(1-0.5))
  
  if(year < n.years){
    for(s in 1:n.sims){
      a0.sim[s] <- get(a0s[s])$mean #cannot be negative
      a1.sim[s] <-  abs(get(a1s[s])$mean) #cannot be negative
      
      logsearch.effort[,year+1,s] <- (det.p - a0.sim[s])/a1.sim[s]
      
    }
    
    
    
    mean.psis <- array(NA, c(n.sites, n.years, n.sims))
    
    #2. find locations
    for(s in 1:n.sims){
      mean.psis[,year,s] <- get(psi.est[s])$mean
      sites.rem[,year+1,s] <- order(mean.psis[,year,s], decreasing = T)
    }
    
  }else{
    #during the final year, we estimate the final states
    for(s in 1:n.sims){
      #locations where removal occured at final year
      rem.vec.sim <- rem.vec[,n.years,]
      rem.vec.sim[,s][is.na(rem.vec.sim[,s])] <- 0 #replaces nas with 0
      previous.rem[,n.years,s] <- rem.vec.sim[,s]
      
      for(i in 1:n.sites){
        psi[i,n.years+1,s]  <- invlogit(psi0 + psi1*previous.rem[i,n.years,s]+ psi2*site.char[i] + psi3*State[i,n.years, s])
        State[i,n.years+1,s] <- rbinom(1,1,psi[i,n.years+1,s]) #true state
      }
    }
  }

  
} #end adaptive management 

#################################################################################################
#### Save True Data ####
#results for each sim
States.df <- adply(State, c(1,2,3))

colnames(States.df) <- c("site", "year", "sim", "state")              

file_name = paste(path, 'States_e5_hocc.csv',sep = '/')
write.csv(States.df,file_name)


#mean across simulations
Mean.States.df <- aggregate(state ~ site+year,
                            data = as.data.frame(States.df), FUN = mean)


file_name = paste(path, 'Mean.States_e5_hocc.csv',sep = '/')
write.csv(Mean.States.df ,file_name)

#observation data -multi
y.obs.df <- adply(y.obs, c(1,2,3,4))

colnames(y.obs.df) <- c("site", "occasion", "year", "sim", "observed.state")              

file_name = paste(path, 'y.obs_e5_hocc.csv',sep = '/')
write.csv(y.obs.df,file_name)


rem.site.df <- y.obs.df %>% filter(observed.state == 1)
file_name = paste(path, 'rem.site_e5_hocc.csv',sep = '/')
write.csv(rem.site.df,file_name)

#### sites visited ####
sites.visit <- adply(rem.vec, c(1,2,3))

colnames(sites.visit) <- c("site", "year", "sim", "rem.val")   

sites.visit <- sites.visit %>% filter(!is.na(rem.val))

#visit no remove
sites.visit.norem <- sites.visit %>% filter(rem.val == 0)
sites.visit.norem$rem.val <- 1
sites.visit.norem <- aggregate(rem.val ~ year + sim,
                               data = as.data.frame(sites.visit.norem), FUN = sum)



sites.visit.norem.avg <- aggregate(rem.val ~ year,
                                   data = as.data.frame(sites.visit.norem), FUN = mean)

colnames(sites.visit.norem.avg)[2] <- "num.visit.norem"

#visit remove
sites.visit.rem <- sites.visit %>% filter(rem.val == 1)

sites.visit.rem<- aggregate(rem.val ~ year + sim,
                            data = as.data.frame(sites.visit.rem), FUN = sum)

sites.visit.rem.avg <- aggregate(rem.val ~ year,
                                 data = as.data.frame(sites.visit.rem), FUN = mean)


colnames(sites.visit.rem.avg)[2] <- "num.visit.rem"

sites.df <- cbind(sites.visit.norem.avg, num.visit.rem = sites.visit.rem.avg$num.visit.rem)

file_name = paste(path, 'sites.visit_e5_hocc.csv',sep = '/')
write.csv(sites.df,file_name)

#### Estimated Data ####
##### Estimated States ####
States.est.df <- States.mean.years %>% select(site,year,sim,state)

file_name = paste(path, 'States.est_e5_hocc.csv',sep = '/')
write.csv(States.est.df,file_name)


#mean across simulations
Mean.States.est.df <- aggregate(state ~ site+year,
                                data = as.data.frame(States.est.df), FUN = mean)

file_name = paste(path, 'Mean.States.est_e5_hocc.csv',sep = '/')
write.csv(Mean.States.est.df ,file_name)

##### Estimated effort ####
logsearch.effort.df <- adply(logsearch.effort[1,,], c(1,2))

colnames(logsearch.effort.df) <- c("year", "sim", "effort")              

file_name = paste(path, 'logeffort_e5_hocc.csv',sep = '/')
write.csv(logsearch.effort.df,file_name)

##### Estimated parameters ####
###### psi ######

psis <- list()

for(s in 1:n.sims){
  assign(all.psi.est[s], 
         cbind(get(all.psi.est[s]), sim = s))
  
  psis[[s]] <- get(all.psi.est[s])
}

psis.df <- do.call("rbind", psis)

file_name = paste(path, 'psis.est_e5_hocc.csv',sep = '/')
write.csv(psis.df,file_name)

###### psi0 ######
psi0s.est <- list()

for(s in 1:n.sims){
  assign(all.psi0[s], 
         cbind(get(all.psi0[s]), sim = s))
  
  psi0s.est[[s]] <- get(all.psi0[s])
}

psi0s.est.df <- do.call("rbind", psi0s.est)

file_name = paste(path, 'psi0s.est.est_e5_hocc.csv',sep = '/')
write.csv(psi0s.est.df,file_name)

###### psi1 ######
psi1s.est <- list()

for(s in 1:n.sims){
  assign(all.psi1[s], 
         cbind(get(all.psi1[s]), sim = s))
  
  psi1s.est[[s]] <- get(all.psi1[s])
}

psi1s.est.df <- do.call("rbind", psi1s.est)

file_name = paste(path, 'psi1s.est.est_e5_hocc.csv',sep = '/')
write.csv(psi1s.est.df,file_name)

###### psi2 ######
psi2s.est <- list()

for(s in 1:n.sims){
  assign(all.psi2[s], 
         cbind(get(all.psi2[s]), sim = s))
  
  psi2s.est[[s]] <- get(all.psi2[s])
}

psi2s.est.df <- do.call("rbind", psi2s.est)

file_name = paste(path, 'psi2s.est.est_e5_hocc.csv',sep = '/')
write.csv(psi2s.est.df,file_name)

###### psi3 ######
psi3s.est <- list()

for(s in 1:n.sims){
  assign(all.psi3[s], 
         cbind(get(all.psi3[s]), sim = s))
  
  psi3s.est[[s]] <- get(all.psi3[s])
}

psi3s.est.df <- do.call("rbind", psi3s.est)

file_name = paste(path, 'psi3s.est.est_e5_hocc.csv',sep = '/')
write.csv(psi3s.est.df,file_name)

###### a0 ######
a0s.est <- list()

for(s in 1:n.sims){
  assign(all.a0[s], 
         cbind(get(all.a0[s]), sim = s))
  
  a0s.est[[s]] <- get(all.a0[s])
}

a0s.est.df <- do.call("rbind", a0s.est)

file_name = paste(path, 'a0s.est.est_e5_hocc.csv',sep = '/')
write.csv(a0s.est.df,file_name)

###### a1 ######
a1s.est <- list()

for(s in 1:n.sims){
  assign(all.a1[s], 
         cbind(get(all.a1[s]), sim = s))
  
  a1s.est[[s]] <- get(all.a1[s])
}

a1s.est.df <- do.call("rbind", a1s.est)

file_name = paste(path, 'a1s.est.est_e5_hocc.csv',sep = '/')
write.csv(a1s.est.df,file_name)

###### rhat vals ######
file_name = paste(path, 'rhat.vals_e5_hocc.csv',sep = '/')
write.csv(rhat_vals,file_name)

#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

file_name = paste(path, 'e5_hocc_time.txt',sep = '/')
write.table(time.taken,file_name)

round((Mean.States.df %>% filter(year == n.years))[,3])
round((Mean.States.df %>% filter(year == n.years+1))[,3])


#round((Mean.States.df %>% filter(year == n.years))[,3])
#round((Mean.States.est.df %>% filter(year == n.years))[,3])

sum(round((Mean.States.df %>% filter(year == n.years+1))[,3]))
