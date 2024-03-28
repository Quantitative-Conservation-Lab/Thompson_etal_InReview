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
#See JAGSModels.R script

#------------------------------------------------------------------------------#
#### Path to save data ####
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'

res <- 'E:/Chapter3/results/linear/S75_R75_60_b/densplots'
#------------------------------------------------------------------------------#
#### Management Strategy ####
load("parameters_data_b.RData")
#rule = by highest estimated state
n.resource <- 60 #total hours per week

#------------------------------------------------------------------------------#
#### Data and parameters ####
n.sims <-  100 #number of simulations (parameter sets)
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 5 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

hours.dat <- array(NA, dim = c(2,n.sites,n.weeks, n.years, n.sims))
last.explore <- 4

for(y in 1:last.explore){
  for(w in 1:n.weeks){
    for(s in 1:n.sims){
      hours.dat[1,,w,y,s] <- runif(n.sites, 0.1,10)
      hours.dat[2,,w,y,s] <- runif(n.sites, 0.1,10)
    }
  }
}

max.spent <- array(NA, dim = c(n.sites,n.weeks, n.years, n.sims))

for(i in 1:n.sites){
  for(w in 1:n.weeks){
    for(s in 1:n.sims){
      for(y in 1:4){
        max.spent[i,w,y,s] <-  hours.dat[1,i,w,y,s] +  hours.dat[2,i,w,y,s]
      }
    }
  }
}

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
site.char <- read.csv( here::here('data', "site_char.csv"))
site.char <- c(t(site.char$x))

State.init <- read.csv( here::here('data', "state_init.csv"))
State.init <- c(t(State.init$x))

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

#--- removal data and occupancy data ---#
sites.rem.M <- array(NA, c(n.sites, n.weeks, n.years, n.sims)) 

#### Removal Locations ####
sites.rem.M[,1,1:n.years,] <- seq(1,n.sites)

yM <- array(NA, c(n.sites, n.occs, n.weeks, n.years, n.sims)) 
resource.total <- array(0, c(n.weeks, n.years, n.sims)) 

d.traveled <- array(NA, c(n.weeks, n.years, n.sims))
visit <- array(NA, c(n.sites, n.weeks, n.years, n.sims))

#Detection probabilities
pM.l <- array(NA, c(n.sites, n.weeks,n.years, n.sims))
pM.h <- array(NA, c(n.sites, n.weeks,n.years, n.sims))

P.datM <- array(NA, dim = c(n.states, n.sites, n.weeks, n.years, n.sims, n.states))


for(w in 1:n.weeks){
  for(y in 1:n.years){
    for(s in 1:n.sims){
      pM.l[1:n.sites,w,y,s] <- invlogit(B0.pl[s] + B1.pl[s]*log(hours.dat[1,1:n.sites,w,y,s])) #low state detection 
      pM.h[1:n.sites,w,y,s]  <- invlogit(B0.ph[s] + B1.ph[s]*log(hours.dat[1,1:n.sites,w,y,s])) #high state detection 
      
      for(i in 1:n.sites){
        P.datM[1,i,w,y,s,] <- c(1,0,0)
        P.datM[2,i,w,y,s,] <- c(1-pM.l[i,w,y,s], pM.l[i,w,y,s], 0)
        P.datM[3,i,w,y,s,] <- c(1-pM.h[i,w,y,s], pM.h[i,w,y,s]*(1-delta[s]), pM.h[i,w,y,s]*delta[s])
      }
    }
  }
}


rem.vec <- array(NA, c(n.sites, n.weeks, n.years,  n.sims)) #removal sites array
start.time <- Sys.time()

#### JAGS arrays ####
S.init <- array(NA, c(n.sites,n.years, n.sims))
N.init <- array(NA, c(n.sites,n.years, n.sims))

#priors:
B0.eps.l.mean <- array(NA, c(n.years, n.sims))
B0.eps.l.sd <- array(NA, c(n.years, n.sims))
B1.eps.l.mean <- array(NA, c(n.years, n.sims))
B1.eps.l.sd <- array(NA, c(n.years, n.sims))

B0.eps.h.mean <- array(NA, c(n.years, n.sims))
B0.eps.h.sd <- array(NA, c(n.years, n.sims))
B1.eps.h.mean <- array(NA, c(n.years, n.sims))
B1.eps.h.sd <- array(NA, c(n.years, n.sims))

B0.phi.h.mean <- array(NA, c(n.years, n.sims))
B0.phi.h.sd <- array(NA, c(n.years, n.sims))
B1.phi.h.mean <- array(NA, c(n.years, n.sims))
B1.phi.h.sd <- array(NA, c(n.years, n.sims))

B0.gamma.mean <- array(NA, c(n.years, n.sims))
B0.gamma.sd <- array(NA, c(n.years, n.sims))
B1.gamma.mean <- array(NA, c(n.years, n.sims))
B1.gamma.sd <- array(NA, c(n.years, n.sims))
B2.gamma.mean <- array(NA, c(n.years, n.sims))
B2.gamma.sd <- array(NA, c(n.years, n.sims))

epsB.l.a <- array(NA, c(n.years, n.sims))
epsB.l.b <- array(NA, c(n.years, n.sims))
epsB.h.a <- array(NA, c(n.years, n.sims))
epsB.h.b <- array(NA, c(n.years, n.sims))
phiB.l.a <- array(NA, c(n.years, n.sims))
phiB.l.b <- array(NA, c(n.years, n.sims))
phiB.h.a <- array(NA, c(n.years, n.sims))
phiB.h.b <- array(NA, c(n.years, n.sims))
g.a <- array(NA, c(n.years, n.sims))
g.b <- array(NA, c(n.years, n.sims))

B0.p.l.mean <- array(NA, c(n.years, n.sims))
B0.p.l.sd <- array(NA, c(n.years, n.sims))
B1.p.l.mean <- array(NA, c(n.years, n.sims))
B1.p.l.sd <- array(NA, c(n.years, n.sims))
l.mean <- array(NA, c(n.years, n.sims))
l.sd <- array(NA, c(n.years, n.sims))

B0.p.h.mean <- array(NA, c(n.years, n.sims))
B0.p.h.sd <- array(NA, c(n.years, n.sims))
B1.p.h.mean <- array(NA, c(n.years, n.sims))
B1.p.h.sd <- array(NA, c(n.years, n.sims))
h.mean <- array(NA, c(n.years, n.sims))
h.sd <- array(NA, c(n.years, n.sims))
delta.a <- array(NA, c(n.years, n.sims))
delta.b <-  array(NA, c(n.years, n.sims))

x <- list()
rhat_vals <- array(NA, c(n.years, n.sims))
sites <- list()
my.data <- list()
outs <- rep(NA,n.sims)
outputs <- rep(NA, n.sims)
mcmcs <- rep(NA, n.sims)
initial.values <- list()
res.state <- list()
res.params <- list()

S.decision <- array(NA, c(n.sites, n.years, n.sims))

alpha.init <- array(NA, c(n.years, n.sites, n.states, n.sims))
n.chains <- 3
chain <- array(NA, c(n.chains, n.sites, n.states))

B0.p.l.est <- rep(NA, n.sims)
B1.p.l.est <- rep(NA, n.sims)
B0.p.h.est <- rep(NA, n.sims)
B1.p.h.est <- rep(NA, n.sims)

B0.eps.l.est <- rep(NA, n.sims)
B1.eps.l.est <- rep(NA, n.sims)
B0.eps.h.est <- rep(NA, n.sims)
B1.eps.h.est <- rep(NA, n.sims)

logsearch.effort.L <- rep(NA, n.sims)
logsearch.effort.H <- rep(NA, n.sims)
logsearch.effort <- rep(NA, n.sims)

removal.L <- rep(NA, n.sims)
removal.H <- rep(NA, n.sims)
removal.hours <- rep(NA, n.sims)

start.time <- Sys.time()
####################################################################################
#### Simulations ####
sim.start <- c(NA, 1, seq(3, n.years)) 
sim.end <- c(NA, c(seq(2, n.years)))

#year <- 2

for(year in 2:n.years){
  
  for(y in sim.start[year]:sim.end[year]){
    #### 1. Simulation ####
    #--------------------------------------------------------------------------------#
    ### Steps: 
    #---1. Simulate the truth
    #---2. Simulate occupancy data collection (include removal data)
    #---3. Go back to step 1 and take into account removal that previously occurred into state process
    
    #first estimation process we run two years at a time
    
    ##### Week 1 State  #####
    week <- 1
    
    if(y == 1){
      State[,1,y,1:n.sims] <- State.init #first week state is from data
    }else{
      for(s in 1:n.sims){
        for(i in 1:n.sites){ #State process: state given previous state and transition probability
          State[i,1,y,s] <- rcat(1,TPM[State[i,5,y-1,s], i, 5, y-1, s,]) 
        }
      }
      
    } #ends year > 1
    
    eps.l[,1,y,] <- invlogit(B0.epsl) #eradication low 
    eps.h[,1,y,] <- invlogit(B0.epsh) #eradication high
    phi.h[,1,y,] <- invlogit(B0.phih) #transition high to high
    
    # TPM used for week 2
    TPM[1,1:n.sites,1,y,,1] <- 1 #empty to empty 
    TPM[1,1:n.sites,1,y,,2] <- 0 
    TPM[1,1:n.sites,1,y,,3] <- 0 
    
    TPM[2,1:n.sites,1,y,,1] <- eps.l[,1,y,] #low to empty (week 1)
    TPM[2,1:n.sites,1,y,,2] <- (1- eps.l[,1,y,]) #low to low (week 1)
    TPM[2,1:n.sites,1,y,,3] <- 0 #low to high (week 1)
    
    TPM[3,1:n.sites,1,y,,1] <- eps.h[,1,y,] #high to empty (week 1)
    TPM[3,1:n.sites,1,y,,2] <- (1- eps.h[,1,y,])*(1-phi.h[,1,y,]) #high to low (week 1)
    TPM[3,1:n.sites,1,y,,3] <- (1- eps.h[,1,y,])*(phi.h[,1,y,]) #high to high (week 1)
    
    ##### Week 2-4 State #####
    for(s in 1:n.sims){
      for(week in 1:4){
        
        if(week > 1){
          for(i in 1:n.sites){ #State process: state given previous state and transition probability
            State[i,week,y,s] <- rcat(1,TPM[State[i,week-1,y,s], i, week-1, y, s,]) 
          }
          
          #--- Data for the TPM for the next week: week 2+ ---#
          #prev.rem.vec = vector of 0 and 1s indicating where removal previously occurred
          prev.rem.vec <- replace(rem.vec[,week-1,y,s], is.na(rem.vec[,week-1,y,s]), 0)
          
          # eradication probability = base + effect of previous removal (removal*removal hours)
          eps.l[,week,y,s] <- invlogit(B0.epsl[s] + B1.epsl[s]*prev.rem.vec*hours.dat[2,i,week,y,s]) #low eradication
          eps.h[,week,y,s] <- invlogit(B0.epsh[s] + B1.epsh[s]*prev.rem.vec*hours.dat[2,i,week,y,s]) #high eradication
          
          #transition rates
          phi.h[,week,y,s] <- invlogit(B0.phih[s] + B1.phih[s]*prev.rem.vec*hours.dat[2,i,week,y,s])
          
          TPM[1,1:n.sites,week,y,s,1] <- 1
          TPM[1,1:n.sites,week,y,s,2] <- 0
          TPM[1,1:n.sites,week,y,s,3] <- 0 
          
          TPM[2,1:n.sites,week,y,s,1] <- eps.l[,week,y,s] 
          TPM[2,1:n.sites,week,y,s,2] <- (1- eps.l[,week,y,s]) 
          TPM[2,1:n.sites,week,y,s,3] <- 0 
          
          TPM[3,1:n.sites,week,y,s,1] <- eps.h[,week,y,s] #high to empty (eradication)
          TPM[3,1:n.sites,week,y,s,2] <- (1- eps.h[,week,y,s])*(1-phi.h[,week,y,s]) #high to low
          TPM[3,1:n.sites,week,y,s,3] <- (1- eps.h[,week,y,s])*(phi.h[,week,y,s]) #high to high
          
          #week: Identify the sites where removal will occur 
          n.pre.visit <- length(which(rem.vec[,week-1,y,s] >= 0)) #number of sites that were sampled last week
          #put last weeks sampling sites at the end of the sampling queue 
          sites.rem.M[,week,y,s] <- c(sites.rem.M[,(week-1),y,s][-1:-n.pre.visit],
                                      sites.rem.M[,(week-1),y,s][1:n.pre.visit])
        } #week > 1
        
        
        ##### Observation process #######
        # Observation process: draw observation given current state
        
        for(h in 1:n.sites){ #order of sites where removal occurs
          i <- sites.rem.M[h,week,y,s]
          
          #A. while we still have resources to spend:
          if(resource.total[week,y,s] < (n.resource- max.spent[i,week,y,s])){
            
            #1. first occasion occupancy data (1 = not detected, 2 = detected)
            yM[i,1,week, y,s] <- rcat(1, P.datM[State[i,week,y,s],i,week,y,s,])
            
            #2. second occasion occupancy data
            #2a. if seen in first occasion, do not search again and remove the rush
            if(yM[i,1,week, y, s] > 1){ 
              yM[i,2, week,y, s] <- NA #no occupancy data because we did not need to search again
              rem.vec[i,week,y,s] <- 1 #notes that removal occurred that week at that site
              
              if(i == sites.rem.M[1,week,y,s]){
                #Calculating resources used = resources already used + search hours + removal hours
                resource.total[week,y,s] <- resource.total[week,y,s] + hours.dat[1,i,week,y,s] + hours.dat[2,i,week,y,s]
              }else{
                resource.total[week,y,s] <- resource.total[week,y,s] + hours.dat[1,i,week,y,s] + hours.dat[2,i,week,y,s] + 
                  0.1*abs(sites.rem.M[h,week,y,s]  -sites.rem.M[h-1,week,y,s]) #hours traveling 
              }
              
            }else{
              #2b. If not seen the first occasion, we need to search again:
              #Second occasion occupancy data
              yM[i,2, week, y, s] <- rcat(1, P.datM[State[i,week,y,s],i,week,y,s,])
              
              #2bi. If seen at the second occasion:
              if(yM[i,2, week, y, s] > 1){ #if seen (state observed > 1) the second time
                rem.vec[i,week,y,s] <- 1 #notes that removal occurred that week at that site
                if(i == sites.rem.M[1,week,y,s]){
                  #Calculating resources used = resources already used + search hours + removal hours
                  resource.total[week,y,s] <- resource.total[week,y,s] + hours.dat[1,i,week,y,s] + hours.dat[2,i,week,y,s] 
                }else{
                  resource.total[week,y,s] <- resource.total[week,y,s] + hours.dat[1,i,week,y,s] + hours.dat[2,i,week,y,s] + 
                    0.1*abs(sites.rem.M[h,week,y,s]  -sites.rem.M[h-1,week,y,s]) #hours traveling 
                } 
              }
              
              #2bi. If we do not detect flowering rush during the second occasion:
              if(yM[i,2, week, y, s]==1){ #if not seen (state observed = 1)
                rem.vec[i,week,y,s] <- 0 #notes removal did not occur
                
                if(i == sites.rem.M[1,week,y,s]){
                  #Calculating resources used = resources already used + search hours
                  resource.total[week,y,s] <- resource.total[week,y,s] + hours.dat[1,i,week,y,s] 
                }else{
                  resource.total[week,y,s] <- resource.total[week,y,s] + hours.dat[1,i,week,y,s] + 
                    0.1*abs(sites.rem.M[h,week,y,s]  -sites.rem.M[h-1,week,y,s]) #hours traveling 
                } 
                
                
              } 
            }
            
            #B. if we do not have any more resources to spend:
          }
        } #ends site loop
        
        #Calculating distance traveled: 
        #if we visit all sites:
        if(sum(is.na(rem.vec[,week,y,s])) == 0){
          v <- sites.rem.M[,week,y,s] #vector 
          index.na <- n.sites+1
        }else{
          #first location we do not go to that week:
          first.na <- intersect(sites.rem.M[,week,y,s], which(is.na(rem.vec[,week,y,s])))[1]
          index.na <- which(first.na == sites.rem.M[,week,y,s])
          v <- sites.rem.M[1:(index.na-1),week,y,s] #vector 
        }
        
        l.v <- length(v) #length of visited sites vector
        
        #Vector of sites we visited
        visit[1:l.v, week, y,s] <- sites.rem.M[1:(index.na-1),week,y,s]
        
        #Calculating stepwise distance traveled
        d.traveled[week,y,s] <- abs(visit[1, week, y,s] - visit[2, week, y,s])
        
        if(l.v > 2){
          for(si in 2:(l.v-1)){
            d.traveled[week,y,s] <- d.traveled[week,y,s] + 
              abs(visit[si, week, y,s] - visit[si+1, week, y,s])
          }
        }
        
        
      } #ends week loop
      
      ###### Week 5 #####
      #Between weeks: we need to project 48 weeks forward
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,5,y,s] <- rcat(1,TPM[State[i,4,y,s], i, 4, y,s,]) 
      }
      
      for(i in 1:n.sites){ #state of neighbors
        N[i,5,y,s] <- (sum(State[neighbors[i,], 5,y,s])-2)/n.neighbors[i] #state of neighbors
      }
      
      gamma[,5,y,s] <-invlogit(B0.gamma[s] + B1.gamma[s]*site.char + B2.gamma[s]*N[,5,y,s]) #invasion 
      
      # TPM used for next week
      TPM[1,1:n.sites,5,y,s,1] <- 1-gamma[,5,y,s] #empty to empty 
      TPM[1,1:n.sites,5,y,s,2] <- gamma[,5,y,s]*(1-g[s]) #empty to low 
      TPM[1,1:n.sites,5,y,s,3] <- gamma[,5,y,s]*(g[s]) #empty to high 
      
      TPM[2,1:n.sites,5,y,s,1] <- epsB.l[s] #low to empty 
      TPM[2,1:n.sites,5,y,s,2] <- (1- epsB.l[s])*(phiB.l[s]) #low to low 
      TPM[2,1:n.sites,5,y,s,3] <- (1- epsB.l[s])*(1-phiB.l[s]) #low to high 
      
      TPM[3,1:n.sites,5,y,s,1] <- epsB.h[s] #high to empty 
      TPM[3,1:n.sites,5,y,s,2] <- (1- epsB.h[s])*(1-phiB.h[s]) #high to low
      TPM[3,1:n.sites,5,y,s,3] <- (1- epsB.h[s])*(phiB.h[s]) #high to high
      
      
    } #ends sim loop
    
    
  } #year loop 
  
  #--------------------------------------------------------------------------------#
  #### 2. Learning: ####
  
  ##### 2a. Update priors #####
  ###### 1st Estimation priors #####
  #------------------------1st Est Priors------------------------#
  if(year == 2){
    # --- eps.l ---  eradication low state -------------------- #
    #B0.eps.l = base eradication at low state (beta distribution)
    B0.eps.l.mean[year,] <-  -2 #mean
    B0.eps.l.sd[year,] <- 0.5 #sd
    
    #B1.eps.l = effect of eradication at low state (normal distribution)
    B1.eps.l.mean[year,] <- 3 #mean
    B1.eps.l.sd[year,] <-  0.5 #sd
    
    # --- eps.h ---  eradication high state ------------------- #
    #B0.eps.h = base eradication at high state (beta distribution)
    B0.eps.h.mean[year,] <- -3 #mean
    B0.eps.h.sd[year,] <- 0.5 #sd
    
    #B1.eps.h = effect of eradication at high state (normal distribution)
    B1.eps.h.mean[year,] <- 2 #mean
    B1.eps.h.sd[year,] <-  0.5 #sd
    
    # --- phi ---  transition rates -------------------------- #
    #B0.phi.h = transition high to high (beta distribution)
    B0.phi.h.mean[year,] <- 2 #alpha shape
    B0.phi.h.sd[year,] <- 0.5 #beta shape
    
    #B1.phi.h of removal on transition from high to high
    B1.phi.h.mean[year,] <- 1 #mean
    B1.phi.h.sd[year,] <- 0.5 #sd
    
    # --- gamma ---  invasion: Between weeks ------------------- #  
    #B0.gamma = intrinsic invasion (normal distribution)
    B0.gamma.mean[year,] <- 0 #mean
    B0.gamma.sd[year, ] <- 0.5 #sd
    
    #B1.gamma = effect of site characteristics (normal distribution)
    B1.gamma.mean[year,] <- 1 #mean
    B1.gamma.sd[year,] <- 0.5 #sd
    
    #B2.gamma = effect of neighboring state (normal distribution)
    B2.gamma.mean[year,] <- 2 #mean
    B2.gamma.sd[year,] <- 0.5 #sd
    
    # --- eps ---  eradication: Between weeks ---------------- # 
    epsB.l.a[year,] <- 2
    epsB.l.b[year,] <- 15
    epsB.h.a[year,] <- 1
    epsB.h.b[year,] <- 20
    
    # --- phi ---  transition rates: Between weeks ------------ #  
    phiB.l.a[year,] <- 2
    phiB.l.b[year,] <- 15
    phiB.h.a[year,] <- 14
    phiB.h.b[year,] <- 6
    
    # --- g --- Given colonization, probability of becoming high state -- #
    g.a[year,] <- 12
    g.b[year,] <- 12
    
    # --- p.l ---  detection low state ----------------------- #
    #B0.p.l = base detection low state (normal distribution)
    B0.p.l.mean[year,] <- 0 
    B0.p.l.sd[year,] <- 0.5
    
    #B1.p.l = effect of effort (normal distribution)
    B1.p.l.mean[year,] <- 2 #mean
    B1.p.l.sd[year,] <- 0.5 #sd
    
    # --- p.h ---  detection high state ---------------------- #
    #B0.p.h = base detection high state (beta distribution)
    B0.p.h.mean[year,] <- 0 #mean
    B0.p.h.sd[year,] <- 0.5 #sd
    
    #B1.p.h = effect of effort (normal distribution)
    B1.p.h.mean[year,] <- 3 #mean
    B1.p.h.sd[year,] <- 0.5 #sd
    
    #---delta -- ability to perfectly detect high invasion state #
    #beta distribution
    delta.a[year,] <- 1
    delta.b[year,] <- 1
    
    # --- S.init and D.init ---  Initial states ------------ #
    alpha.init1 <- rep(1,n.states) #initial state probability vector
    
  } else{
    ###### 2+ Estimation priors #####
    # --- eps.l ---  eradication low state -------------------- #
    #B0.eps.l = base eradication at low state 
    B0.eps.l.mean[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param, '^B0.eps.l')) %>% select(mean)))
    B0.eps.l.sd[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param, '^B0.eps.l')) %>% select(sd)))
    
    #B1.eps.l = effect of eradication at low state 
    B1.eps.l.mean[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B1.eps.l')) %>% select(mean)))
    B1.eps.l.sd[year,] <-  c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B1.eps.l')) %>% select(sd)))
    
    # --- eps.h ---  eradication high state ------------------- #
    #B0.eps.h = base eradication at high state 
    B0.eps.h.mean[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B0.eps.h')) %>% select(mean)))
    B0.eps.h.sd[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B0.eps.h')) %>% select(sd)))
    
    #B1.eps.h = effect of eradication at high state 
    B1.eps.h.mean[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B1.eps.h')) %>% select(mean)))
    B1.eps.h.sd[year,] <-  c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B1.eps.h')) %>% select(sd)))
    
    # --- phi ---  transition rates -------------------------- #
    #phi.h = transition high to high 
    B0.phi.h.mean[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B0.phi.h')) %>% select(mean)))
    B0.phi.h.sd[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B0.phi.h')) %>% select(sd)))
    
    #effect of removal on transition from high to high
    B1.phi.h.mean[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B1.phi.h')) %>% select(mean)))
    B1.phi.h.sd[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B1.phi.h')) %>% select(sd)))
    
    # --- gamma ---  invasion: Between weeks ------------------- #  
    #B0.gamma = intrinsic invasion 
    B0.gamma.mean[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B0.gamma')) %>% select(mean)))
    B0.gamma.sd[year, ] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B0.gamma')) %>% select(sd)))
    
    #B1.gamma = effect of site characteristics 
    B1.gamma.mean[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B1.gamma')) %>% select(mean)))
    B1.gamma.sd[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B1.gamma')) %>% select(sd)))
    
    #B2.gamma= effect of neighboring state 
    B2.gamma.mean[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B2.gamma')) %>% select(mean)))
    B2.gamma.sd[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B2.gamma')) %>% select(sd)))
    
    # --- eps ---  eradication: Between weeks ---------------- # 
    epsBl.mean <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^epsB.l')) %>% select(mean)))
    epsBl.sd <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^epsB.l')) %>% select(sd)))
    
    epsB.l.a[year,] <- (epsBl.mean^2 - epsBl.mean^3 - (epsBl.mean*epsBl.sd^2) )/ (epsBl.sd^2)
    epsB.l.b[year,] <- (epsB.l.a[year,s]*(1-epsBl.mean))/ (epsBl.mean)
    
    epsBh.mean <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^epsB.h')) %>% select(mean)))
    epsBh.sd <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^epsB.h')) %>% select(sd)))
    
    epsB.h.a[year,] <- (epsBh.mean^2 - epsBh.mean^3 - (epsBh.mean*epsBh.sd^2) )/ (epsBh.sd^2)
    epsB.h.b[year,] <- (epsB.h.a[year,s]*(1-epsBh.mean))/ (epsBh.mean)
    
    # --- phi ---  transition rates: Between weeks ------------ #  
    phiBl.mean <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^phiB.l')) %>% select(mean)))
    phiBl.sd <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^phiB.l')) %>% select(sd)))
    
    phiB.l.a[year,] <- (phiBl.mean^2 - phiBl.mean^3 - (phiBl.mean*phiBl.sd^2) )/ (phiBl.sd^2)
    phiB.l.b[year,] <- (phiB.l.a[year,s]*(1-phiBl.mean))/ (phiBl.mean)
    
    phiBh.mean <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^phiB.h')) %>% select(mean)))
    phiBh.sd <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^phiB.h')) %>% select(sd)))
    
    phiB.h.a[year,] <- (phiBh.mean^2 - phiBh.mean^3 - (phiBh.mean*phiBh.sd^2) )/ (phiBh.sd^2)
    phiB.h.b[year,] <- (phiB.h.a[year,]*(1-phiBh.mean))/ (phiBh.mean)
    
    # --- g --- Given colonization, probability of becoming high state -- #
    g.mean <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^g')) %>% select(mean)))
    g.sd <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^g')) %>% select(sd)))
    
    g.a[year,] <- (g.mean^2 - g.mean^3 - (g.mean*g.sd^2) )/ (g.sd^2)
    g.b[year,] <- (g.a[year,s]*(1-g.mean))/ (g.mean)
    
    # --- p.l ---  detection low state ----------------------- #
    #B0.p.l = base detection low state (beta distribution)
    B0.p.l.mean[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B0.p.l')) %>% select(mean)))
    B0.p.l.sd[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B0.p.l')) %>% select(sd)))
    
    #B1.p.l = effect of effort (normal distribution)
    B1.p.l.mean[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B1.p.l')) %>% select(mean)))
    B1.p.l.sd[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B1.p.l')) %>% select(sd)))
    
    # --- p.h ---  detection high state ---------------------- #
    #B0.p.h = base detection high state (beta distribution)
    B0.p.h.mean[year,] <- c(t(res.params[[year-1]] %>% filter( str_detect(param,  '^B0.p.h')) %>% select(mean)))
    B0.p.h.sd[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B0.p.h')) %>% select(sd)))
    
    #B1.p.h = effect of effort (normal distribution)
    B1.p.h.mean[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B1.p.h')) %>% select(mean)))
    B1.p.h.sd[year,] <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^B1.p.h')) %>% select(sd)))
    
    #---delta -- ability to perfectly detect high invasion state #
    #beta distribution
    delta.mean <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^delta')) %>% select(mean)))
    delta.sd <- c(t(res.params[[year-1]] %>% filter(str_detect(param,  '^delta')) %>% select(sd)))
    
    delta.a[year,] <- (delta.mean^2 - delta.mean^3 - (delta.mean*delta.sd^2) )/ (delta.sd^2)
    delta.b[year,] <- (delta.a[year,s]*(1-delta.mean))/ (delta.mean)
    
    # --- S.init and D.init ---  Initial states ------------ #
    for(s in 1:n.sims){
      for(i in 1:n.sites){
        for(c in 1:n.chains){
          v <- which(grepl("^State", names(get(mcmcs[s])[[c]][1,])))[1] #find which index of mcmc output is state
          chain[c,i,1] <- sum(get(mcmcs[s])[[c]][,(v-1)+i] == 1) #number of mcmc iterations that site i, week 5 = 1
          chain[c,i,2] <- sum(get(mcmcs[s])[[c]][,(v-1)+i] == 2)
          chain[c,i,3] <- sum(get(mcmcs[s])[[c]][,(v-1)+i] == 3)
        }
      }
      alpha.init[year,,1,s] <- sum(chain[,,1]) / ((length(get(mcmcs[s])[[1]][,1]))*n.chains)
      alpha.init[year,,2,s] <- sum(chain[,,2]) / ((length(get(mcmcs[s])[[1]][,1]))*n.chains)
      alpha.init[year,,3,s] <- sum(chain[,,3]) / ((length(get(mcmcs[s])[[1]][,1]))*n.chains)
      
      
    } #ends s loop
  }
  
  #--------------------------------------------------------------------------------#
  ###### 2b. JAGS data ######
  #sites where removal occurred
  #####  DATA for Estimation 1 ######
  if(year == 2){
    rem.vec.dat <- rem.vec[,,1:2,] 
    rem.vec.dat[is.na(rem.vec.dat)] <- 0 #replaces na with 0
    
    for(s in 1:n.sims){
      my.data[[s]] <- list( 
        #constants
        n.sites = n.sites, n.weeks = n.weeks, n.occs = n.occs,  neighbors = neighbors,
        
        #data
        yM= yM[,,,1:2,s],
        site.char = site.char,
        hours = hours.dat[,1:n.sites,1:n.weeks, 1:2, s],
        rem.vec = rem.vec.dat[,,,s],
        n.neighbors = n.neighbors,
        
        #priors
        alpha.init1 = alpha.init1,
        
        B0.eps.l.mean =  B0.eps.l.mean[year,s], B0.eps.l.sd =  B0.eps.l.sd[year,s], B1.eps.l.mean =  B1.eps.l.mean[year,s],
        B1.eps.l.sd =  B1.eps.l.sd[year,s], B0.eps.h.mean =  B0.eps.h.mean[year,s], B0.eps.h.sd =  B0.eps.h.sd[year,s],
        B1.eps.h.mean =  B1.eps.h.mean[year,s], B1.eps.h.sd = B1.eps.h.sd[year,s],
        
        B0.phi.h.mean =  B0.phi.h.mean[year,s], B0.phi.h.sd =  B0.phi.h.sd[year,s], B1.phi.h.mean =  B1.phi.h.mean[year,s],
        B1.phi.h.sd =  B1.phi.h.sd[year,s],
        
        B0.gamma.mean =  B0.gamma.mean[year,s], B0.gamma.sd =  B0.gamma.sd[year,s], B1.gamma.mean =  B1.gamma.mean[year,s],
        B1.gamma.sd =  B1.gamma.sd[year,s], B2.gamma.mean =  B2.gamma.mean[year,s], B2.gamma.sd =  B2.gamma.sd[year,s],
        
        epsB.l.a =  epsB.l.a[year,s], epsB.l.b =  epsB.l.b[year,s], epsB.h.a =  epsB.h.a[year,s],
        epsB.h.b =  epsB.h.b[year,s], phiB.l.a =  phiB.l.a[year,s], phiB.l.b =  phiB.l.b[year,s],
        phiB.h.a =  phiB.h.a[year,s], phiB.h.b =  phiB.h.b[year,s], g.a = g.a[year,s], g.b = g.b[year,s], 
        
        B0.p.l.mean =  B0.p.l.mean[year,s], B0.p.l.sd =  B0.p.l.sd[year,s], B1.p.l.mean =  B1.p.l.mean[year,s], 
        B1.p.l.sd =  B1.p.l.sd[year,s], 
        
        B0.p.h.mean =  B0.p.h.mean[year,s], B0.p.h.sd =  B0.p.h.sd[year,s], B1.p.h.mean =  B1.p.h.mean[year,s],
        B1.p.h.sd =   B1.p.h.sd[year,s], 
        delta.a =  delta.a[year,s],delta.b =   delta.b[year,s]
      )
    }
    
    State.start <- array(NA, c(n.sites,n.weeks,2,n.sims)) #State initial values
    
    for(s in 1:n.sims){for(i in 1:n.sites){for(week in 1:n.weeks){for(y in 1:2){
      State.start[i,week,y,s] <- State[i,week,y,s] #max(yM[i,,week,y,s], na.rm = T)
    }}}}
    
    #Initial values
    for(s in 1:n.sims){
      initial.values[[s]] <- function()list(State = State.start[,,,s])
    }
    
    file.name <- "Flower_datM_est1_explore.txt"
    
  }
  
  ##### DATA for Estimation 2- last explore #######  
  if(year %in% c(3:last.explore)){
    rem.vec.dat <- rem.vec[,,year,] 
    rem.vec.dat[is.na(rem.vec.dat)] <- 0 #replaces na with 0
    
    for(s in 1:n.sims){
      my.data[[s]] <- list( 
        #constants
        n.sites = n.sites, n.weeks = n.weeks, n.occs = n.occs, neighbors = neighbors,
        
        #data
        yM= yM[,,,year,s],
        site.char = site.char,
        rem.vec = rem.vec.dat[,,s],
        hours = hours.dat[,1:n.sites,1:n.weeks, year, s],
        n.neighbors = n.neighbors,
        
        #priors
        alpha.init = alpha.init[year,,,s],
        
        B0.eps.l.mean =  B0.eps.l.mean[year,s], B0.eps.l.sd =  B0.eps.l.sd[year,s], B1.eps.l.mean =  B1.eps.l.mean[year,s],
        B1.eps.l.sd =  B1.eps.l.sd[year,s], B0.eps.h.mean =  B0.eps.h.mean[year,s], B0.eps.h.sd =  B0.eps.h.sd[year,s],
        B1.eps.h.mean =  B1.eps.h.mean[year,s], B1.eps.h.sd = B1.eps.h.sd[year,s],
        
        B0.phi.h.mean =  B0.phi.h.mean[year,s], B0.phi.h.sd =  B0.phi.h.sd[year,s], B1.phi.h.mean =  B1.phi.h.mean[year,s],
        B1.phi.h.sd =  B1.phi.h.sd[year,s],
        
        B0.gamma.mean =  B0.gamma.mean[year,s], B0.gamma.sd =  B0.gamma.sd[year,s], B1.gamma.mean =  B1.gamma.mean[year,s],
        B1.gamma.sd =  B1.gamma.sd[year,s], B2.gamma.mean =  B2.gamma.mean[year,s], B2.gamma.sd =  B2.gamma.sd[year,s],
        
        epsB.l.a =  epsB.l.a[year,s], epsB.l.b =  epsB.l.b[year,s], epsB.h.a =  epsB.h.a[year,s],
        epsB.h.b =  epsB.h.b[year,s], phiB.l.a =  phiB.l.a[year,s], phiB.l.b =  phiB.l.b[year,s],
        phiB.h.a =  phiB.h.a[year,s], phiB.h.b =  phiB.h.b[year,s], g.a = g.a[year,s], g.b = g.b[year,s], 
        
        B0.p.l.mean =  B0.p.l.mean[year,s], B0.p.l.sd =  B0.p.l.sd[year,s], B1.p.l.mean =  B1.p.l.mean[year,s], 
        B1.p.l.sd =  B1.p.l.sd[year,s], 
        
        B0.p.h.mean =  B0.p.h.mean[year,s], B0.p.h.sd =  B0.p.h.sd[year,s], B1.p.h.mean =  B1.p.h.mean[year,s],
        B1.p.h.sd =   B1.p.h.sd[year,s], 
        delta.a =  delta.a[year,s],delta.b =   delta.b[year,s]
        
      )
    }
    
    State.start <- array(NA, c(n.sites,n.weeks,n.sims)) #State initial values
    
    for(s in 1:n.sims){for(i in 1:n.sites){for(week in 1:n.weeks){
      State.start[i,week,s] <- State[i,week,year,s] #max(yM[i,,week,y,s], na.rm = T)
    }}}
    
    #Initial values
    for(s in 1:n.sims){
      initial.values[[s]] <- function()list(State = State.start[,,s] , StateB = State.start[,1,s])
    }
    
    file.name <- "Flower_datM_est2_explore.txt"
  }
  
  ##### DATA for > last explore #######
  if(year > last.explore){
    rem.vec.dat <- rem.vec[,,year,] 
    rem.vec.dat[is.na(rem.vec.dat)] <- 0 #replaces na with 0
    
    for(s in 1:n.sims){
      my.data[[s]] <- list( 
        #constants
        n.sites = n.sites, n.weeks = n.weeks, n.occs = n.occs, neighbors = neighbors,
        
        #data
        yM= yM[,,,year,s],
        site.char = site.char,
        logeffort = logsearch.effort[s],
        rem.vec = rem.vec.dat[,,s],
        removal.hours = removal.hours[s],
        n.neighbors = n.neighbors,
        
        #priors
        alpha.init = alpha.init[year,,,s],
        
        B0.eps.l.mean =  B0.eps.l.mean[year,s], B0.eps.l.sd =  B0.eps.l.sd[year,s], B1.eps.l.mean =  B1.eps.l.mean[year,s],
        B1.eps.l.sd =  B1.eps.l.sd[year,s], B0.eps.h.mean =  B0.eps.h.mean[year,s], B0.eps.h.sd =  B0.eps.h.sd[year,s],
        B1.eps.h.mean =  B1.eps.h.mean[year,s], B1.eps.h.sd = B1.eps.h.sd[year,s],
        
        B0.phi.h.mean =  B0.phi.h.mean[year,s], B0.phi.h.sd =  B0.phi.h.sd[year,s], B1.phi.h.mean =  B1.phi.h.mean[year,s],
        B1.phi.h.sd =  B1.phi.h.sd[year,s],
        
        B0.gamma.mean =  B0.gamma.mean[year,s], B0.gamma.sd =  B0.gamma.sd[year,s], B1.gamma.mean =  B1.gamma.mean[year,s],
        B1.gamma.sd =  B1.gamma.sd[year,s], B2.gamma.mean =  B2.gamma.mean[year,s], B2.gamma.sd =  B2.gamma.sd[year,s],
        
        epsB.l.a =  epsB.l.a[year,s], epsB.l.b =  epsB.l.b[year,s], epsB.h.a =  epsB.h.a[year,s],
        epsB.h.b =  epsB.h.b[year,s], phiB.l.a =  phiB.l.a[year,s], phiB.l.b =  phiB.l.b[year,s],
        phiB.h.a =  phiB.h.a[year,s], phiB.h.b =  phiB.h.b[year,s], g.a = g.a[year,s], g.b = g.b[year,s], 
        
        B0.p.l.mean =  B0.p.l.mean[year,s], B0.p.l.sd =  B0.p.l.sd[year,s], B1.p.l.mean =  B1.p.l.mean[year,s], 
        B1.p.l.sd =  B1.p.l.sd[year,s], 
        
        B0.p.h.mean =  B0.p.h.mean[year,s], B0.p.h.sd =  B0.p.h.sd[year,s], B1.p.h.mean =  B1.p.h.mean[year,s],
        B1.p.h.sd =   B1.p.h.sd[year,s], 
        delta.a =  delta.a[year,s],delta.b =   delta.b[year,s]
        
      )
    }
    
    State.start <- array(NA, c(n.sites,n.weeks,n.sims)) #State initial values
    
    for(s in 1:n.sims){for(i in 1:n.sites){for(week in 1:n.weeks){
      State.start[i,week,s] <- State[i,week,year,s] #max(yM[i,,week,y,s], na.rm = T)
    }}}
    
    #Initial values
    for(s in 1:n.sims){
      initial.values[[s]] <- function()list(State = State.start[,,s] , StateB = State.start[,1,s])
    }
    
    file.name <- "Flower_datM_est2.txt"
    
  }
  
  #Parameters monitored
  parameters.to.save <- c("B0.eps.l", "B1.eps.l", "B0.eps.h", "B1.eps.h", 
                          "B0.phi.h", "B1.phi.h","B0.gamma", "B1.gamma","B2.gamma",
                          "epsB.l", "epsB.h", "phiB.l", "phiB.h","g",
                          "B0.p.l", "B1.p.l", "B0.p.h", "B1.p.h", 
                          "delta", "State.fin")
  
  n.burnin <- 2000
  n.iter <- 20000 
  n.chains <- n.chains
  n.thin <- 1
  
  
  ###### 2c. Run JAGS #####
  for(s in 1:n.sims){
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]],inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = file.name ,
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
  
  #parameter results:
  cbind.res.parameters <- cbind.res %>% filter(param %in% parameters.to.save)
  
  cbind.res.parameters <- left_join(cbind.res.parameters, truth.params)
  
  colnames(cbind.res.parameters)[c(3,7)] <- c("low", "high")
  res.params[[year]] <- cbind.res.parameters
  res.params[[year]]$year <- year
  
  #state results:
  cbind.res.state<- cbind.res %>% filter(str_detect(param, '^S'))
  
  truth.state <- State[,5,year,1]
  
  for(s in 2:n.sims){
    truth.state <- c(truth.state, State[,5,year,s])
  }
  
  cbind.res.state$Segment <- as.numeric(gsub("\\D", "", cbind.res.state$param))
  
  cbind.res.state$truth <- truth.state 
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
  res.state[[year]]$year <- year

  subsims <- sample(1:100,5, replace = F)
  
  for(subs in subsims){
    for(par in 1:length(unique(cbind.res.parameters$param))){
      MCMCtrace(get(mcmcs[subs]),
                params = unique(cbind.res.parameters$param[par]),
                type = 'both',
                ind = TRUE,
                pdf = TRUE,
                open_pdf = FALSE,
                wd = res,
                filename = paste0('trace',unique(cbind.res.parameters$param[par]),'_sim', subs, '_year', year))
    }
  }

  ###### 3b. Make Decision #####
  #remove linear - assigned prior to simulation
  
  
  ###### 3c. Update efforts #####
  if(year == last.explore){
    for(s in 1:n.sims){
      B0.p.l.est[s] <- as.numeric(res.params[[year]] %>% filter(param == 'B0.p.l' & sim == s) %>% select(mean))
      B1.p.l.est[s] <- unlist(as.numeric(res.params[[year]] %>% filter(param == 'B1.p.l' & sim == s) %>% select(mean)))
      B0.p.h.est[s] <- as.numeric(res.params[[year]] %>% filter(param == 'B0.p.h' & sim == s) %>% select(mean))
      B1.p.h.est[s] <- unlist(as.numeric(res.params[[year]] %>% filter(param == 'B1.p.h' & sim == s) %>% select(mean)))
      
      logsearch.effort.L[s] <- (logit(0.75) - B0.p.l.est[s])/(B1.p.l.est[s])
      logsearch.effort.H[s] <- (logit(0.75) - B0.p.h.est[s])/(B1.p.h.est[s])
      
      B0.eps.l.est[s] <- as.numeric(res.params[[year]] %>% filter(param == 'B0.eps.l' & sim == s) %>% select(mean))
      B1.eps.l.est[s] <- unlist(as.numeric(res.params[[year]] %>% filter(param == 'B1.eps.l' & sim == s) %>% select(mean)))
      B0.eps.h.est[s] <- as.numeric(res.params[[year]] %>% filter(param == 'B0.eps.h' & sim == s) %>% select(mean))
      B1.eps.h.est[s] <- unlist(as.numeric(res.params[[year]] %>% filter(param == 'B1.eps.h' & sim == s) %>% select(mean)))
     
      removal.L[s] <- (logit(0.75) - B0.eps.l.est[s])/(B1.eps.l.est[s])
      removal.H[s] <- (logit(0.75) - B0.eps.h.est[s])/(B1.eps.h.est[s])
    
      logsearch.effort[s] <- mean(logsearch.effort.L[s], logsearch.effort.H[s])
      removal.hours[s] <- mean(removal.L[s], removal.H[s])
      
      hours.dat[1,,1:n.weeks,(last.explore+1):n.years,s] <- exp(logsearch.effort[s])
      hours.dat[2,,1:n.weeks,(last.explore+1):n.years,s] <- removal.hours[s] 
      
      
      max.spent[1:n.sites,1:n.weeks,(last.explore+1):n.years,s] <- min(n.resource, 
                                                                       exp(logsearch.effort[s])
                                                                       + mean(removal.L[s], removal.H[s]))
      
      
      pM.l[1,1,(last.explore+1),s] <- invlogit(B0.pl[s] + B1.pl[s]*logsearch.effort[s]) #low state detection 
      pM.h[1,1,(last.explore+1),s]  <- invlogit(B0.ph[s] + B1.ph[s]*logsearch.effort[s]) #high state detection 
      
      for(i in 1:n.sites){
        for(w in 1:n.weeks){
          for(y2 in (last.explore+1): n.years){
            P.datM[1,i,w,y2,s,] <- c(1,0,0)
            P.datM[2,i,w,y2,s,] <- c(1-pM.l[1,1,(last.explore+1),s], pM.l[1,1,(last.explore+1),s], 0)
            P.datM[3,i,w,y2,s,] <- c(1-pM.h[1,1,(last.explore+1),s],pM.h[1,1,(last.explore+1),s]*(1-delta[s]), pM.h[1,1,(last.explore+1),s]*delta[s])
          }
        } 
      }
      
    }
  }
  
  
  
  
} #End Simulations  
#################################################################################################
end.time <- Sys.time()
time.taken <- end.time - start.time
#### SAVE SOME data ####
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
###### 1. Estimated parameters #####
res.par.df <- rbind(res.params[[2]], res.params[[3]], res.params[[4]],
                    res.params[[5]], res.params[[6]], res.params[[7]],
                    res.params[[8]], res.params[[9]], res.params[[10]])

sum(res.par.df$Rhat > 1.1)/ length(res.par.df$mean)
res.par.df$sim <- res.par.df$sim + 100
file_name = paste(path, 'params.csv',sep = '/')
write.csv(res.par.df,file_name)

###### 2. Estimated states #####
res.states.df <- rbind(res.state[[2]],res.state[[3]],
                       res.state[[4]],res.state[[5]],
                       res.state[[6]],res.state[[7]],
                       res.state[[8]],res.state[[9]],
                       res.state[[10]])

res.states.df$sim <- res.states.df$sim + 100
file_name = paste(path, 'states.csv',sep = '/')
write.csv(res.states.df,file_name)

###### 3. True states #####
S.dat <- as.data.frame.table(State)
colnames(S.dat) <- c("site", "week", "year", "sim", "state")
S.dat <-  as.data.frame(sapply(S.dat,as.numeric))

S.dat$sim <- S.dat$sim + 100
file_name = paste(path, 'states_truth.csv',sep = '/')
write.csv(S.dat,file_name)

##### plots #####
ggplot(res.params[[2]]) +
  geom_point(mapping = aes(x = sim, y = mean))+
  geom_errorbar(aes(x = sim, ymin = low, ymax = high))+
  geom_point(data=res.params[[2]], aes(x = sim, y = truth),color = "red", shape = 22) +
  facet_wrap(~param, scales = "free") +
  xlab("Simulation")+ylab("State") + 
  guides(color = guide_legend(title = "Simulation"))   

ggplot(res.params[[year]]) +
  geom_point(mapping = aes(x = sim, y = mean))+
  geom_errorbar(aes(x = sim, ymin = low, ymax = high))+
  geom_point(data=res.params[[year]], aes(x = sim, y = truth),color = "red", shape = 22) +
  facet_wrap(~param, scales = "free") +
  xlab("Simulation")+ylab("State") + 
  guides(color = guide_legend(title = "Simulation"))   

##### parameters through time ####

truth.paramslist <- list()

for(s in 1:n.sims){
  truth.paramslist[[s]] <- truth.params %>% filter(sim == s)
  truth.paramslist[[s]]$mean <- c(1,1,2,
                                  2,0,1,0,-2,0, 
                                  (3/15), (3/15), 14/30, 12/24, 3.5/35,
                                  0,0,0,0,0.5)
  
  truth.paramslist[[s]]$low <- c(qnorm(0.025, 1, 0.05), qnorm(0.025, 1, 0.05), qnorm(0.025, 2, 0.05),
                                 qnorm(0.025, 2, 0.05), 0, qnorm(0.025, 1, 0.05), 0, qnorm(0.025, -2, 0.05),0,
                                 qbeta(0.025, 3, 12), qbeta(0.025, 3, 12),qbeta(0.025, 14, 6), qbeta(0.025, 12, 12),qbeta(0.025, 3.5,31.5),
                                 qnorm(0.025, 0,1), 0, qnorm(0.025, 0,1),0, qbeta(0.025, 1,1))
  
  truth.paramslist[[s]]$high <- c(qnorm(0.975, 1, 0.05), qnorm(0.975, 1, 0.05), qnorm(0.975, 2, 0.05),
                                  qnorm(0.975, 2, 0.05), 0, qnorm(0.975, 1, 0.05), 0, qnorm(0.975, -2, 0.05),0,
                                  qbeta(0.975, 3, 12), qbeta(0.975, 3, 12),qbeta(0.975, 14, 6), qbeta(0.975, 12, 12),qbeta(0.975, 3.5,31.5),
                                  qnorm(0.975, 0,1), 0, qnorm(0.975, 0,1),0, qbeta(0.975, 1,1))
  
  truth.paramslist[[s]]$year <- 1
  truth.paramslist[[s]]<- truth.paramslist[[s]] %>% select(mean, low, high, param, sim, truth, year)
  
  
}

y1.priors <- truth.paramslist[[1]]

for(s in 2:n.sims){
  y1.priors <- rbind(y1.priors,truth.paramslist[[2]] )
}

res.par.df.summary <- res.par.df %>% select(mean, low, high, param, sim, truth, year)
res.par.df.summary <- rbind(y1.priors, res.par.df.summary)

res.par.df.summary <- res.par.df.summary %>% filter(!param %in% c('B1.gamma','B1.phi.h', 'phiB.h'))

res.par.df.summary.sub <- res.par.df.summary %>% filter(sim == 7)

# ggplot(res.par.df.summary.sub) + 
#   geom_ribbon(aes(x = year, ymin = low, ymax = high), fill = 'grey70', alpha = 0.8)+
#   geom_point(aes(x = year, y = mean), color = 'black', size = 0.5) +
#   geom_line(aes(x = year, y = mean), color = 'black', size = 1) +
#   geom_point(aes(x = year, y = truth), color = 'red', size = 0.5)+
#   scale_x_continuous(breaks=c(1,5,10))+
#   facet_wrap(~param, scales = "free")

###### 4. Summary of parameters #####
file_name = paste(path, 'par_summary.csv',sep = '/')
res.par.df.summary$sim <- res.par.df.summary$sim + 100
write.csv(res.par.df.summary,file_name)


##### 5. State Bias #####
mean.state <- array(NA, c(n.years,n.sites,n.sims))
true.state <- array(NA, c(n.years,n.sites,n.sims))
state.bias <- array(NA, c(n.years,n.sites,n.sims))

for(year in 2:n.years){
  for(i in 1:n.sites){
    mean.state[year,i,] <- c(t(res.state[[year]] %>% filter(Segment == i) %>% select(mean)))
    true.state[year,i,] <- c(t(res.state[[year]] %>% filter(Segment == i) %>% select(truth)))
    state.bias[year,i,] <- ((mean.state[year,i,])-(true.state[year,i,]))/(true.state[year,i,])
  }
}

bias.state.df <- adply(state.bias, c(1,2,3))
colnames(bias.state.df) <- c("year", "site", "sim", "rel.bias") 
bias.state.df$year <- as.numeric(bias.state.df$year)
bias.state.df$site<- as.numeric(bias.state.df$site)
bias.state.df$sim <- as.numeric(bias.state.df$sim)
bias.state.df <- bias.state.df %>% filter(year > 1)
bias.state.df$sim <- bias.state.df$sim + 100
file_name = paste(path, 'bias_states.csv',sep = '/')
write.csv(bias.state.df,file_name)

##### 6. Parameter Bias #####
p.list <- c(t(res.params[[year]] %>% filter(sim == s) %>% select(param)))
n.params <- length(p.list)

mean.param <- array(NA, c(n.years,n.params, n.sims))
true.param <- array(NA, c(n.years,n.params, n.sims))
param.bias <- array(NA, c(n.years,n.params, n.sims))

for(year in 2:n.years){
  for(par in 1:n.params){
    mean.param[year,par,] <- c(t((res.params[[year]] %>% filter(param == p.list[par]) %>% select(mean))))
    true.param[year,par,] <- c(t((res.params[[year]] %>% filter(param == p.list[par]) %>% select(truth))))
    param.bias[year,par,] <- ((mean.param[year,par,])-(true.param[year,par,]))/(true.param[year,par,])
  }
}

bias.param.df <- adply(param.bias, c(1,2,3))
colnames(bias.param.df) <- c("year", "param", "sim", "rel.bias") 
bias.param.df$year <- as.numeric(bias.param.df$year)
bias.param.df$sim <- as.numeric(bias.param.df$sim)
bias.param.df <- bias.param.df %>% filter(year > 1)
bias.param.df$param<- rep(p.list, each = (n.years-1), times = n.sims)
bias.param.df$sim <- bias.param.df$sim + 100

file_name = paste(path, 'bias_params.csv',sep = '/')
write.csv(bias.param.df,file_name)

##### 7. State CI coverage #####
low.state <- array(NA, c(n.years,n.sites,n.sims))
high.state <- array(NA, c(n.years,n.sites,n.sims))
CI.state <- array(NA, c(n.years,n.sites,n.sims))

for(year in 2:n.years){
  for(s in 1:n.sims){
    low.state[year,,s] <- c(t((res.state[[year]] %>% filter(sim == s) %>% select(low))))
    high.state[year,,s] <- c(t(res.state[[year]] %>% filter(sim == s) %>% select(high)))
    
    for(i in 1:n.sites){
      CI.state[year,i,s] <- ifelse(low.state[year,i,s] <= true.state[year,i,s] & 
                                     true.state[year,i,s] <= high.state[year,i,s], 1, 0)
    }
  }
}

CI.state.df <- adply(CI.state, c(1,2,3))
colnames(CI.state.df) <- c("year", "site", "sim", "CI.coverage") 
CI.state.df$year <- as.numeric(CI.state.df$year)
CI.state.df$site<- as.numeric(CI.state.df$site)
CI.state.df$sim <- as.numeric(CI.state.df$sim)
CI.state.df <- CI.state.df %>% filter(year > 1)
CI.state.df$sim <- CI.state.df$sim + 100
file_name = paste(path, 'CI_state.csv',sep = '/')
write.csv(CI.state.df,file_name)

##### 8. CI coverage -parameters #####
n.params <- length(unique(res.params[[2]]$param))
low.param <- array(NA, c(n.years,n.params,n.sims))
high.param <- array(NA, c(n.years,n.params,n.sims))
truth.param <- array(NA, c(n.years,n.params,n.sims))
CI.param <- array(NA, c(n.years,n.params,n.sims))

for(year in 2:n.years){
  for(s in 1:n.sims){
    low.param[year,,s] <- c(t(res.params[[year]] %>% filter(sim == s) %>% select(low)))
    high.param[year,,s] <- c(t(res.params[[year]] %>% filter(sim == s) %>% select(high)))
    truth.param[year,,s] <- c(t(res.params[[year]] %>% filter(sim == s) %>% select(truth)))
    for(p in 1:n.params){
      CI.param[year,p,s] <- ifelse(low.param[year,p,s] <= truth.param[year,p,s] & 
                                     truth.param[year,p,s] <= high.param[year,p,s], 1, 0)
      
    }
  }
}

CI.param.df <- adply(CI.param, c(1,2,3))
colnames(CI.param.df) <- c("year", "param", "sim", "CI.coverage") 
CI.param.df$year <- as.numeric(CI.param.df$year)
CI.param.df$sim <- as.numeric(CI.param.df$sim)
CI.param.df <- CI.param.df %>% filter(year > 1)
CI.param.df$param<- rep(p.list, each = (n.years-1), times = n.sims)
CI.param.df$sim  <- CI.param.df$sim  + 100

file_name = paste(path, 'CI_param.csv',sep = '/')
write.csv(CI.param.df,file_name)

###### 9. Distance traveled #####
dist.travel <- as.data.frame.table(d.traveled)
colnames(dist.travel) <- c("week", "year", "sim", "distance")
dist.travel <-  as.data.frame(sapply(dist.travel,as.numeric))
dist.travel$sim <- dist.travel$sim + 100

file_name = paste(path, 'dist_travel.csv',sep = '/')
write.csv(dist.travel,file_name)

##### 10. Sites visited #####
site.visit <- as.data.frame.table(rem.vec)
colnames(site.visit) <- c("site", "week", "year", "sim", "visit")
site.visit <-  as.data.frame(sapply(site.visit,as.numeric))

#replace Nas with 3
site.visit$visit[is.na(site.visit$visit)] <- 3
site.visit$visit <- as.numeric(site.visit$visit)

#replace 1s with 2 (means we visited and removed)
site.visit$visit[site.visit$visit == 1] <- 2

#replace 0s with 1 (means we visit but didnt remove
site.visit$visit[site.visit$visit == 0] <- 1

#replace 3s with 0 (means we did not visit)
site.visit$visit[site.visit$visit == 3] <- 0

site.visit$sim <- site.visit$sim + 100
file_name = paste(path, 'sites_visit',sep = '/')
write.csv(site.visit,file_name)

##### 11. Observation data ####
yM.dat <- as.data.frame.table(yM)
colnames(yM.dat) <- c("site", "occasion", "week", "year", "sim", "observation")
yM.dat <-  as.data.frame(sapply(yM.dat,as.numeric))
yM.dat$sim <- yM.dat$sim + 100
file_name = paste(path, 'y_dat',sep = '/')
write.csv(yM.dat,file_name)

##### 12. Timing #####
file_name = paste(path, 'time.txt',sep = '/')
write.table(time.taken,file_name)

#### Quick res ####
S.fin <- S.dat %>% filter(week == 5 & year == 10)
mean(S.fin$state)


