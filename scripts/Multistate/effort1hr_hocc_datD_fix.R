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
  # State transition probabilities: probability of S(t+1) given S(t)
  for (t in 1:n.weeks){
  
    logit(gamma[i,t]) <-gamma.0 + gamma.1*site.char[i] + gamma.2*D[i,t] #invasion probability
    logit(eps.l[i,t]) <- eps.l0 + eps.l1*rem.vec[i,t] #erradication low state
    logit(eps.h[i,t]) <- eps.h0 + eps.h1*rem.vec[i,t] #erradication high state
    
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

    State[i,1] <- S.init[i] # initial state 
    D[i,1] <- D.init[i]     # initial neighboring state
    
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
gamma.0 <- 0.2 #intrinsic invasion probability
gamma.1 <- 0.2 #effect of site characteristics
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

#### uncomment at school ####
# effect of habitat quality on occupancy
set.seed(03222021)
site.char <- runif(n.sites) 
#path2 <- here::here("data")
#file_name = paste(path2, 'Site_char_multi.csv',sep = '/')
# write.csv(site.char,file_name)
#site.chardat <- read.csv(file_name)
site.char <- site.char #site.chardat[,2]

#Code that generated initial true state
State.init <- rep(NA, n.sites)
rate.init <- rep(NA, n.sites)
occ.init <- rep(NA, n.sites)
init.matrix <- array(NA, c(n.sites, n.states))
for(i in 1:n.sites){
  rate.init[i] <- mean(rbinom(100000,1,invlogit(gamma.0 + gamma.1*site.char[i]))) #invasion rate
  p.high <- 0.5 #say the probability of being in high state is 0.5

  occ.init[i] <- round(mean(rbern(100000,rate.init[i]))) #being invaded or not

  init.matrix[i,1] <- (1-rate.init[i])*occ.init[i] + (1-occ.init[i]) #empty
  init.matrix[i,2] <- (rate.init[i])*occ.init[i]*(1-p.high) #low state
  init.matrix[i,3] <- (rate.init[i])*occ.init[i]*(p.high) #high state

  State.init[i] <- rcat(1,init.matrix[i,1:3])
}
State.init
#write.csv(State.init,file_name)

#path2 <- here::here("data")
#file_name = paste(path2, 'States_init_multi.csv',sep = '/')
#State.init <- read.csv(file_name)
State <- array(NA,c(n.sites, n.weeks, n.years+1, n.sims)) #state array
D <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #neighbors array

ps<- array(NA, c(n.states,n.sites,n.weeks, n.years + 1,n.sims, n.states)) #state probability
gamma <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #invasion probability
eps.l <- array(NA, c(n.sites, n.weeks, n.years+1,n.sims)) #eradication at low state
eps.h <- array(NA, c(n.sites, n.weeks, n.years+1, n.sims)) #eradication at high state

#Randomly order all sites for removal (next year order of sites will be based on some factor)
sites.rem <- array(NA, dim = c(n.sites, n.weeks, n.years, n.sims))

for(s in 1:n.sims){
  sites.rem[,1,1,s] <- sample(seq(1,n.sites), n.sites, replace = F)
}

#####effort ####
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

ps.est <- array(NA, c(n.states, n.sites,n.sims,n.states))
D.est <- array(NA, c(n.sites,n.sims))
gamma.est <- array(NA, c(n.sites,n.sims))
eps.l.est <- array(NA, c(n.sites,n.sims))
eps.h.est <- array(NA, c(n.sites,n.sims))
prev.state <- array(NA, c(n.sites, n.sims))
States.mean.round <- array(NA, c(n.sites, n.years, n.sims))
States.mean <- array(NA, c(n.sites, n.years, n.sims))

####################################################################################
#### Run Adaptive Management ####

year <- 1
#n.years <- 2

for(year in 1:n.years){
  #--------------------------------------------------------------------------------#
  #### 1. Simulate the truth ####
  ##### Week 1 State model only #####
  week <- 1
  if(year == 1){
    State[,1,year,1:n.sims] <- State.init
    
    for(s in 1:n.sims){
      for(i in 1:n.sites){
        D[i,1,1,s] <- sum(State[neighbors[i,], 1,1,s])/2 #state of neighbors
      }
    }
    
    gamma[,1,1,] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,1,1,]) #invasion (week 1 year 1)
    eps.l[,1,1,] <- invlogit(eps.l0) #eradication low (week 1 year 1)
    eps.h[,1,1,] <- invlogit(eps.h0) #eradication high (week 1 year 1)
    
    # TPM used for week 2
    ps[1,1:n.sites,1,1,,1] <- 1-gamma[,1,1,] #empty to empty (week 1 year 1)
    ps[1,1:n.sites,1,1,,2] <- gamma[,1,1,] #empty to low (week 1 year 1)
    ps[1,1:n.sites,1,1,,3] <- 0 #empty to high (week 1 year 1)
    
    ps[2,1:n.sites,1,1,,1] <- eps.l[,1,1,] #low to empty (week 1 year 1)
    ps[2,1:n.sites,1,1,,2] <- (1- eps.l[,1,1,])*(1-phi.lh) #low to low (week 1 year 1)
    ps[2,1:n.sites,1,1,,3] <- (1- eps.l[,1,1,])*(phi.lh) #low to high (week 1 year 1)
    
    ps[3,1:n.sites,1,1,,1] <- eps.h[,1,1,] #high to empty (week 1 year 1)
    ps[3,1:n.sites,1,1,,2] <- (1- eps.h[,1,1,])*(1-phi.hh) #high to low (week 1 year 1)
    ps[3,1:n.sites,1,1,,3] <- (1- eps.h[,1,1,])*(phi.hh) #high to high (week 1 year 1)
    
  } #ends year = 1 loop
  
  if(year > 1){
    for(s in 1:n.sims){
      for(i in 1:n.sites){
        State[i,week,year,s] <- rcat(1,ps[State[i,4,(year-1),s], i, 4, (year-1), s,]) 
      }
        
      for(i in 1:n.sites){
        D[i,week,year,s] <- sum(State[neighbors[i,], week,year,s])/2 #state of neighbors
      }
      
    
    prev.rem.vec2 <- replace(rem.vec[,4,(year-1),s], is.na(rem.vec[,4,(year-1),s]), 0)
    
    # TPM used for week 2
    gamma[,week,year,s] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,week,year,s]) 
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
    
    } #ends s loop
  } #ends year > 1 loop
  
  ##### Week 1+ and Observation model #####
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
        gamma[,week,year,s] <-invlogit(gamma.0 + gamma.1*site.char + gamma.2*D[,week,year,s]) 
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
          if(yD[i,1,week, year, s] > 1){ #if already seen (state > 1), do not search again and remove
            yD[i,2, week,year, s] <- NA 
            rem.vec[i,week,year,s] <- 1
            resource.total[week,year,s] <- resource.total[week,year,s] + search.hours + removal.hours
            
          }else{
            yD[i,2, week, year, s] <- rcat(1, po.datD[State[i,week,year,s], ])
            
            if(yD[i,2, week, year, s] > 1){ #if seen (state > 1) the second time
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
      
      #--- Initial states and initial neighboring states -----#
      #### Unsure if correct ####
      for(s in 1:n.sims){
        for(i in 1:n.sites){
          S.init[i,year,s] <- max(yD[i,,1,year,1], na.rm = T)
          
          if(S.init[i,year,s] == -Inf){
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
    
    #projecting initial states and initial neighboring states
    #Initial states and initial neighboring states
    
    for(i in 1:n.sites){
      D.est[i,s] <- sum(States.mean.round[neighbors[i,],(year-1),s])/2 #state of neighbors
    
      gamma.est[i,s] <-invlogit(get(gamma.0.est[s])$mean + get(gamma.1.est[s])$mean*site.char[i] + get(gamma.2.est[s])$mean*D.est[i,s]) 
      eps.l.est[i,s] <- invlogit(get(eps.l0.est[s])$mean + get(eps.l1.est[s])$mean*rem.vec.dat[i,4,s]) 
      eps.h.est[i,s] <- invlogit(get(eps.h0.est[s])$mean + get(eps.h1.est[s])$mean*rem.vec.dat[i,4,s]) 
  
      ps.est[1,i,s,1] <- 1-gamma.est[i,s]
      ps.est[1,i,s,2] <- gamma.est[i,s]
      ps.est[1,i,s,3] <- 0
      
      ps.est[2,i,s,1] <- eps.l.est[i,s]
      ps.est[2,i,s,2] <- (1- eps.l.est[i,s])*(1-get(phi.lh.est[s])$mean)
      ps.est[2,i,s,3] <- (1- eps.l.est[i,s])*get(phi.lh.est[s])$mean
      
      ps.est[3,i,s,1] <- eps.h.est[i,s]
      ps.est[3,i,s,2] <- (1- eps.h.est[i,s])*(1-get(phi.hh.est[s])$mean)
      ps.est[3,i,s,3] <- (1- eps.h.est[i,s])*get(phi.hh.est[s])$mean
  
    }
    
    for(i in 1:n.sites){
       S.init[i,year,s] <- max(yD[i,,1,year,1], na.rm = T)
        
      if(S.init[i,year,s] == -Inf){
        S.init[i,year,s] <- rcat(1,ps.est[States.mean.round[i,(year-1),s], i, s,]) 

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
  State.start <- array(NA, c(n.sites,n.weeks,n.sims))
  
  State.start[,2:n.weeks,] <- 2 #State[,2:n.weeks,year,]
  
  for(s in 1:n.sims){
    initial.values[[s]] <- function()list(State = State.start[,,s])
  }
  
    

  for(s in 1:n.sims){
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]],inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_multistate_datD.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
  }
  
  #--------------------------------------------------------------------------------#
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
  ##### FIX HERE ####
   rand5 <- c(1,2) #sample(seq(1:n.sims), 5, replace = F)

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
  
  States.mean.long <- gather(States.mean.wide, site, state, 1:n.sites, factor_key=TRUE)
  States.mean.long$site <- as.numeric(States.mean.long$site)
  
  States.mean.long$year <- year
  
  if(year == 1){
    States.mean.years <- States.mean.long
  }else{
    States.mean.years <- rbind(States.mean.years, States.mean.long)
  }
  
  #--------------------------------------------------------------------------------#
  ###### 3b. Make decision  #####
  #Removal locations: rank sites by state
  
  if(year < n.years){
   
     for(s in 1:n.sims){
      sites.rem[,1,year+1,s] <- order(States.mean[,year,s], decreasing = T)
    }
    
  }else{
    #### FIX ####
    #during the final year, we estimate the final states
    for(s in 1:n.sims){
      #locations where removal occured at final year
      rem.vec.sim <- rem.vec[,n.years,]
      rem.vec.sim[,s][is.na(rem.vec.sim[,s])] <- 0 #replaces nas with 0
      previous.rem[,n.years,s] <- rem.vec.sim[,s]
      
      #simulating final year....
      for(i in 1:n.sites){
        psi[i,n.years+1,s]  <- invlogit(psi0 + psi1*previous.rem[i,n.years,s]+ psi2*site.char[i] + psi3*State[i,n.years, s])
        State[i,n.years+1,s] <- rbinom(1,1,psi[i,n.years+1,s]) #true state
      }
    }
  }

  
} #end adaptive management 

#################################################################################################

#### FIX ####
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
