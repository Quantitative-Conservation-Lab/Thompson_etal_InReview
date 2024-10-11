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
load("parameters_data.RData")

n.resource <- 40 #total hours per week
#------------------------------------------------------------------------------#
#### Data and parameters ####
n.sims <-  100 #number of simulations (parameter sets)
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 5 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states
n.alts <- 2

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
gamma <- array(NA, c(n.sites, n.weeks, n.years, n.sims,n.alts))
eps.l <- array(NA, c(n.sites, n.weeks, n.years, n.sims,n.alts))
eps.h <- array(NA, c(n.sites, n.weeks, n.years, n.sims,n.alts))
phi.l <- array(NA, c(n.sites, n.weeks, n.years, n.sims,n.alts))
phi.h<- array(NA, c(n.sites, n.weeks, n.years, n.sims,n.alts))

TPM<- array(NA, c(n.states,n.sites,n.weeks, n.years + 1,n.sims,n.alts,n.states)) 

#---Habitat data---#
# effect of habitat quality on occupancy
site.char <- read.csv( here::here('data', "site_char.csv"))
site.char <- c(t(site.char$x))

State.init <- rep(1,n.sites)
State.init[17:24] <- c(2,2,3,3,3,3,2,2)

State <- array(NA,c(n.sites, n.weeks, n.years, n.sims, n.alts)) #state array

#---Neighbor data---#
N <- array(NA, c(n.sites, n.weeks, n.years,n.sims,n.alts)) #neighbors array
num.neighbors <- 2 #one upstream, one downstream
neighbors <- matrix(NA, nrow = n.sites, ncol = num.neighbors) #neighbors matrix, each row (site) identifies the neighbors for that site 
neighbors[1,1] <- 2 #site 1 only has site 2 as its neighbor 
neighbors[2:n.sites, 1] <- seq(1,n.sites-1) #filling in upstream neighbors
neighbors[n.sites,2] <- n.sites-1 #end site only has end site -1 as its neighbor
neighbors[1:(n.sites-1), 2] <- seq(2,n.sites) #filling in downstream neighbors
n.neighbors <- rep(2,n.sites)
n.neighbors[1] <- n.neighbors[n.sites] <- 1

#--- removal data and occupancy data ---#
sites.rem.M <- array(NA, c(n.sites, n.weeks, n.years, n.sims,n.alts)) 

#### First Removal Locations ####
for(a in 1:n.alts){
  for(s in 1: n.sims){
    sites.rem.M[,1,1,s,a] <- sample(n.sites, n.sites, replace = F)
    sites.rem.M[,1,2,s,a] <- sample(n.sites, n.sites, replace = F)
  } 
}

yM <- array(NA, c(n.sites, n.occs, n.weeks, n.years, n.sims,n.alts)) 
resource.total <- array(0, c(n.weeks, n.years, n.sims,n.alts)) 

d.traveled <- array(NA, c(n.weeks, n.years, n.sims,n.alts))
visit <- array(NA, c(n.sites, n.weeks, n.years, n.sims,n.alts))

#Detection probabilities
pM.l <- array(NA, c(n.sites, n.weeks,n.years, n.sims))
pM.h <- array(NA, c(n.sites, n.weeks,n.years, n.sims))

P.datM <- array(NA, dim = c(n.states, n.sites, n.weeks, n.years, n.sims, n.alts, n.states))

#If we did not have perfect detection in the generating scenarios we would do something like this:
logsearch.L <- (logit(0.25) - B0.pl)/(B1.pl)
logsearch.H <- (logit(0.25) - B0.ph)/(B1.ph)

logeffortsearch <- rep(NA, n.sims)

for(s in 1:n.sims){
  logeffortsearch[s] <- mean(c(logsearch.L[s], logsearch.H[s]))  
}


for(w in 1:n.weeks){
  for(y in 1:n.years){
    for(s in 1:n.sims){
      pM.l[1:n.sites,w,y,s] <- invlogit(B0.pl[s] + B1.pl[s]*logeffortsearch[s]) #low state detection 
      pM.h[1:n.sites,w,y,s]  <- invlogit(B0.ph[s] + B1.ph[s]*logeffortsearch[s]) #high state detection 
      for(a in 1:n.alts){
        for(i in 1:n.sites){
          P.datM[1,i,w,y,s,a,] <- c(1,0,0)
          P.datM[2,i,w,y,s,a,] <- c(1-pM.l[i,w,y,s], pM.l[i,w,y,s], 0)
          P.datM[3,i,w,y,s,a,] <- c(1-pM.h[i,w,y,s], pM.h[i,w,y,s]*(1-delta[s]), pM.h[i,w,y,s]*delta[s])
        } 
      }
      
    }
  }
}


removal.L.5 <- (logit(0.5) - B0.epsl)/(B1.epsl)
removal.H.5 <- (logit(0.5) - B0.epsh)/(B1.epsh)
removal.5 <- rep(NA, n.sims)
for(s in 1:n.sims){
  removal.5[s] <- mean(removal.L.5[s], removal.H.5[s])
}
removal.L.75 <- (logit(0.75) - B0.epsl)/(B1.epsl)
removal.H.75 <- (logit(0.75) - B0.epsh)/(B1.epsh)

removal.75 <- rep(NA, n.sims)
for(s in 1:n.sims){
  removal.75[s] <- mean(removal.L.75[s], removal.H.75[s])
}

removal.hours <- array(NA, c(n.sims, n.alts))
removal.hours[,1] <- removal.5
removal.hours[,2] <- removal.75

max.spent <- array(NA, c(n.sites,n.weeks, n.years,n.sims,n.alts))

for(s in 1:n.sims){
  for(a in 1:n.alts){
    max.spent[,,,s,a] <- (removal.hours[a]) 
  }
}

rem.vec <- array(NA, c(n.sites, n.weeks, n.years,  n.sims,n.alts)) #removal sites array

start.time <- Sys.time()

#------------------------------------------------------------------------------#

for(year in 1:n.years){
  for(a in 1:n.alts){

    #### 1. Simulation ####
    #--------------------------------------------------------------------------------#
    ### Steps: 
    #---1. Simulate the truth
    #---2. Simulate occupancy data collection (include removal data)
    #---3. Go back to step 1 and take into account removal that previously occurred into state process
    
    #first estimation process we run two years at a time
    
    ##### Week 1 State  #####
    week <- 1
    
    if(year == 1){
      State[,1,year, 1:n.sims,a] <- State.init #first week state is from data
      sites.rem.M[,1,year,s,a] <- seq(1:n.sites)
    }else{
      for(s in 1:n.sims){
        for(i in 1:n.sites){ #State process: state given previous state and transition probability
          State[i,1,year,s,a] <- rcat(1,TPM[State[i,5,year-1,s,a], i, 5, year-1, s,a,]) 
        }
        
        #### Decision rule ####
        sites.rem.M[,1,year,s,a] <- seq(1:n.sites)
      }
      
    } #ends year > 1
    
    eps.l[,1,year,,a] <- invlogit(B0.epsl) #eradication low 
    eps.h[,1,year,,a] <- invlogit(B0.epsh) #eradication high
    phi.h[,1,year,,a] <- invlogit(B0.phih) #transition high to high
    
    # TPM used for week 2
    TPM[1,1:n.sites,1,year,,a,1] <- 1 #empty to empty 
    TPM[1,1:n.sites,1,year,,a,2] <- 0 
    TPM[1,1:n.sites,1,year,,a,3] <- 0 
    
    TPM[2,1:n.sites,1,year,,a,1] <- eps.l[,1,year,,a] #low to empty (week 1)
    TPM[2,1:n.sites,1,year,,a,2] <- (1- eps.l[,1,year,,a]) #low to low (week 1)
    TPM[2,1:n.sites,1,year,,a,3] <- 0 #low to high (week 1)
    
    TPM[3,1:n.sites,1,year,,a,1] <- eps.h[,1,year,,a] #high to empty (week 1)
    TPM[3,1:n.sites,1,year,,a,2] <- (1- eps.h[,1,year,,a])*(1-phi.h[,1,year,,a]) #high to low (week 1)
    TPM[3,1:n.sites,1,year,,a,3] <- (1- eps.h[,1,year,,a])*(phi.h[,1,year,,a]) #high to high (week 1)
    
    ##### Week 2-4 State #####
    for(s in 1:n.sims){
      for(week in 1:4){
        
        if(week > 1){
          for(i in 1:n.sites){ #State process: state given previous state and transition probability
            State[i,week,year,s,a] <- rcat(1,TPM[State[i,week-1,year,s,a], i, week-1, year, s,a,]) 
          }
          
          #--- Data for the TPM for the next week: week 2+ ---#
          #prev.rem.vec = vector of 0 and 1s indicating where removal previously occurred
          prev.rem.vec <- replace(rem.vec[,week-1,year,s,a], is.na(rem.vec[,week-1,year,s,a]), 0)
          
          # eradication probability = base + effect of previous removal (removal*removal hours)
          eps.l[,week,year,s,a] <- invlogit(B0.epsl[s] + B1.epsl[s]*prev.rem.vec*removal.hours[s,a]) #low eradication
          eps.h[,week,year,s,a] <- invlogit(B0.epsh[s] + B1.epsh[s]*prev.rem.vec*removal.hours[s,a]) #high eradication
          
          #transition rates
          phi.h[,week,year,s,a] <- invlogit(B0.phih[s] + B1.phih[s]*prev.rem.vec*removal.hours[s,a])
          
          TPM[1,1:n.sites,week,year,s,a,1] <- 1
          TPM[1,1:n.sites,week,year,s,a,2] <- 0
          TPM[1,1:n.sites,week,year,s,a,3] <- 0 
          
          TPM[2,1:n.sites,week,year,s,a,1] <- eps.l[,week,year,s,a] 
          TPM[2,1:n.sites,week,year,s,a,2] <- (1- eps.l[,week,year,s,a]) 
          TPM[2,1:n.sites,week,year,s,a,3] <- 0 
          
          TPM[3,1:n.sites,week,year,s,a,1] <- eps.h[,week,year,s,a] #high to empty (eradication)
          TPM[3,1:n.sites,week,year,s,a,2] <- (1- eps.h[,week,year,s,a])*(1-phi.h[,week,year,s,a]) #high to low
          TPM[3,1:n.sites,week,year,s,a,3] <- (1- eps.h[,week,year,s,a])*(phi.h[,week,year,s,a]) #high to high
          
          #week: Identify the sites where removal will occur 
          n.pre.visit <- length(which(rem.vec[,week-1,year,s,a] >= 0)) #number of sites that were sampled last week
          #put last weeks sampling sites at the end of the sampling queue 
          sites.rem.M[,week,year,s,a] <- c(sites.rem.M[,(week-1),year,s,a][-1:-n.pre.visit],
                                      sites.rem.M[,(week-1),year,s,a][1:n.pre.visit])
        } #week > 1
        
        
        ##### Observation process #######
        # Observation process: draw observation given current state
        
        for(h in 1:n.sites){ #order of sites where removal occurs
          i <- sites.rem.M[h,week,year,s,a]
          
          #A. while we still have resources to spend:
          if(resource.total[week,year,s,a] < (n.resource- max.spent[i,week,year,s,a])){
            
            #1. first occasion occupancy data (1 = not detected, 2 = detected)
            yM[i,1,week, year,s,a] <- rcat(1, P.datM[State[i,week,year,s,a],i,week,year,s,a,])
            
            #2. second occasion occupancy data
            #2a. if seen in first occasion, do not search again and remove the rush
            if(yM[i,1,week, year, s,a] > 1){ 
              yM[i,2, week,year, s,a] <- NA #no occupancy data because we did not need to search again
              rem.vec[i,week,year,s,a] <- 1 #notes that removal occurred that week at that site
              
              if(i == sites.rem.M[1,week,year,s,a]){
                #Calculating resources used = resources already used + search hours + removal hours
                resource.total[week,year,s,a] <- resource.total[week,year,s,a] + removal.hours[s,a]
              }else{
                resource.total[week,year,s,a] <- resource.total[week,year,s,a] + removal.hours[s,a] + 
                  0.1*abs(sites.rem.M[h,week,year,s,a]  -sites.rem.M[h-1,week,year,s,a]) #hours traveling 
              }
              
            }else{
              #2b. If not seen the first occasion, we need to search again:
              #Second occasion occupancy data
              yM[i,2, week, year, s,a] <- rcat(1, P.datM[State[i,week,year,s,a],i,week,year,s,a,])
              
              #2bi. If seen at the second occasion:
              if(yM[i,2, week, year, s,a] > 1){ #if seen (state observed > 1) the second time
                rem.vec[i,week,year,s,a] <- 1 #notes that removal occurred that week at that site
                if(i == sites.rem.M[1,week,year,s,a]){
                  #Calculating resources used = resources already used + search hours + removal hours
                  resource.total[week,year,s,a] <- resource.total[week,year,s,a] + removal.hours[s,a] 
                }else{
                  resource.total[week,year,s,a] <- resource.total[week,year,s,a] + removal.hours[s,a] + 
                    0.1*abs(sites.rem.M[h,week,year,s,a]  -sites.rem.M[h-1,week,year,s,a]) #hours traveling 
                } 
              }
              
              #2bi. If we do not detect flowering rush during the second occasion:
              if(yM[i,2, week, year, s,a]==1){ #if not seen (state observed = 1)
                rem.vec[i,week,year,s,a] <- 0 #notes removal did not occur
                
                if(i == sites.rem.M[1,week,year,s,a]){
                  #Calculating resources used = resources already used + search hours
                  resource.total[week,year,s,a] <- resource.total[week,year,s,a]
                }else{
                  resource.total[week,year,s,a] <- resource.total[week,year,s,a]+ 
                    0.1*abs(sites.rem.M[h,week,year,s,a]  -sites.rem.M[h-1,week,year,s,a]) #hours traveling 
                } 
                
                
              } 
            }
            
            #B. if we do not have any more resources to spend:
          }
        } #ends site loop
        
        #Calculating distance traveled: 
        #if we visit all sites:
        if(sum(is.na(rem.vec[,week,year,s,a])) == 0){
          v <- sites.rem.M[,week,year,s,a] #vector 
          index.na <- n.sites+1
        }else{
          #first location we do not go to that week:
          first.na <- intersect(sites.rem.M[,week,year,s,a], which(is.na(rem.vec[,week,year,s,a])))[1]
          index.na <- which(first.na == sites.rem.M[,week,year,s,a])
          v <- sites.rem.M[1:(index.na-1),week,year,s,a] #vector 
        }
        
        l.v <- length(v) #length of visited sites vector
        
        #Vector of sites we visited
        visit[1:l.v, week, year,s,a] <- sites.rem.M[1:(index.na-1),week,year,s,a]
        
        #Calculating stepwise distance traveled
        d.traveled[week,year,s,a] <- abs(visit[1, week, year,s,a] - visit[2, week, year,s,a])
        
        if(l.v > 2){
          for(si in 2:(l.v-1)){
            d.traveled[week,year,s,a] <- d.traveled[week,year,s,a] + 
              abs(visit[si, week, year,s,a] - visit[si+1, week, year,s,a])
          }
        }
        
        
      } #ends week loop
      
      ###### Week 5 #####
      #Between weeks: we need to project 48 weeks forward
      for(i in 1:n.sites){ #State process: state given previous state and transition probability
        State[i,5,year,s,a] <- rcat(1,TPM[State[i,4,year,s,a], i, 4, year,s,a,]) 
      }
      
      for(i in 1:n.sites){ #state of neighbors
        N[i,5,year,s,a] <- (sum(State[neighbors[i,], 5,year,s,a])-2)/n.neighbors[i] #state of neighbors
      }
      
      gamma[,5,year,s,a] <-invlogit(B0.gamma[s] + B1.gamma[s]*site.char + B2.gamma[s]*N[,5,year,s,a]) #invasion 
      
      # TPM used for next week
      TPM[1,1:n.sites,5,year,s,a,1] <- 1-gamma[,5,year,s,a] #empty to empty 
      TPM[1,1:n.sites,5,year,s,a,2] <- gamma[,5,year,s,a]*(1-g[s]) #empty to low 
      TPM[1,1:n.sites,5,year,s,a,3] <- gamma[,5,year,s,a]*(g[s]) #empty to high 
      
      TPM[2,1:n.sites,5,year,s,a,1] <- epsB.l[s] #low to empty 
      TPM[2,1:n.sites,5,year,s,a,2] <- (1- epsB.l[s])*(phiB.l[s]) #low to low 
      TPM[2,1:n.sites,5,year,s,a,3] <- (1- epsB.l[s])*(1-phiB.l[s]) #low to high 
      
      TPM[3,1:n.sites,5,year,s,a,1] <- epsB.h[s] #high to empty 
      TPM[3,1:n.sites,5,year,s,a,2] <- (1- epsB.h[s])*(1-phiB.h[s]) #high to low
      TPM[3,1:n.sites,5,year,s,a,3] <- (1- epsB.h[s])*(phiB.h[s]) #high to high
      
      
    } #ends sim loop
}
}

#################################################################################################
#### Path to save data ####
#path <- 'E:\\Chapter3\\results-space2\\linear_gen\\20_datM'

#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

file_name = paste(path, 'time.txt',sep = '/')
#write.table(time.taken,file_name)

#### TRUE STATE ####
S.dat <- as.data.frame.table(State)
colnames(S.dat) <- c("site", "week", "year", "sim", "alt", "state")
S.dat <-  as.data.frame(sapply(S.dat,as.numeric))

file_name = paste(path, 'states_truth.csv',sep = '/')
#write.csv(S.dat,file_name)

#### DISTANCE TRAVELED ####
dist.travel <- as.data.frame.table(d.traveled)
colnames(dist.travel) <- c("week", "year", "sim","alt", "distance")
dist.travel <-  as.data.frame(sapply(dist.travel,as.numeric))

file_name = paste(path, 'dist_travel.csv',sep = '/')
#write.csv(dist.travel,file_name)

#### SITES VISITED ####
site.visit <- as.data.frame.table(rem.vec)
colnames(site.visit) <- c("site", "week", "year", "sim", "alt", "visit")
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

file_name = paste(path, 'sites_visit',sep = '/')
#write.csv(site.visit,file_name)

#### OBSERVATION DATA ####
yM.dat <- as.data.frame.table(yM)
colnames(yM.dat) <- c("site", "occasion", "week", "year", "sim", "alt", "observation")
yM.dat <-  as.data.frame(sapply(yM.dat,as.numeric))

file_name = paste(path, 'y_dat',sep = '/')
#write.csv(yM.dat,file_name)

#### QUICK TEST ####
S.fin <- S.dat %>% filter(week == 5 & year == 10)
mean(S.fin$state[1:4000])
mean(S.fin$state[4001:8000])
