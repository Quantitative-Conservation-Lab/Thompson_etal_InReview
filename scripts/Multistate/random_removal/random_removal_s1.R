library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)

#### Path Name ####
path <- here::here("results", "Multistate", "searcheffort1","random40_datM")
res <- c('results/Multistate/searcheffort1/random40_datM') 

start.time <- Sys.time()

#### Data and parameters ####
load("parameters.RData")

n.sims <- 20
n.params <- 4
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 4 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

##### STATE VALUES ####

gamma.0  <- c(gamma.0s[1], gamma.0s[1], gamma.0s[3], gamma.0s[3]) #base invasion
gamma.1  <- c(gamma.1s[1], gamma.1s[1], gamma.1s[3], gamma.1s[3]) #effect of site characteristics
gamma.2  <- c(gamma.2s[1], gamma.2s[1], gamma.2s[3], gamma.2s[3]) #effect of neighboring invasion state

eps.l0 <- c(eps.l0s[1], eps.l0s[1], eps.l0s[3], eps.l0s[3]) #base eradication at low state
eps.l1 <- c(eps.l1s[1], eps.l1s[1], eps.l1s[3], eps.l1s[3]) #effect of eradication at low state
eps.h0 <- c(eps.h0s[1], eps.h0s[1], eps.h0s[3], eps.h0s[3]) #base eradication at high state
eps.h1 <- c(eps.h1s[1], eps.h1s[1], eps.h1s[3], eps.h1s[3]) #effect of eradication at high state

phi0.lh <- c(phi0.lhs[1], phi0.lhs[1], phi0.lhs[3], phi0.lhs[3]) #transition from low to high
phi1.lh <- c(phi1.lhs[1], phi1.lhs[1], phi1.lhs[3], phi1.lhs[3]) #transition from low to high
phi0.hh <- c(phi0.hhs[1], phi0.hhs[1], phi0.hhs[3], phi0.hhs[3]) #transition from high to high
phi1.hh <- c(phi1.hhs[1], phi1.hhs[1], phi1.hhs[3], phi1.hhs[3]) #transition from high to high

TPM.48 <- array(NA, dim = c(n.states, n.params, n.states))
TPM.48[,1,] <- TPM.48s[,,1] #TPM matrix for 48 week period
TPM.48[,2,] <- TPM.48s[,,1]
TPM.48[,3,] <- TPM.48s[,,3]
TPM.48[,4,] <- TPM.48s[,,3]

##### OBSERVATION VALUES ####

p.l0 <- c(p.l0s[1], p.l0s[3], p.l0s[1], p.l0s[3]) #base detection for low state
p.l1 <- c(p.l1s[1], p.l1s[3], p.l1s[1], p.l1s[3]) #effect of effort
alpha.l <- c(alpha.ls[1], alpha.ls[3], alpha.ls[1], alpha.ls[3])  #difference in baseline detection between dat D and M

p.h0 <- c(p.h0s[1], p.h0s[3], p.h0s[1], p.h0s[3]) #base detection for high state
p.h1 <- c(p.h1s[1], p.h1s[3], p.h1s[1], p.h1s[3]) #effect of effort
alpha.h <- c(alpha.hs[1], alpha.hs[3], alpha.hs[1], alpha.hs[3]) #difference in baseline detection between dat D and M

search.hours <- search.hourss[2] #search effort
removal.hours <- c(0, 2, 3) #it removal takes 2 hours if in low state and 3 hours if in high state
n.resource <- 40 #total hours per week

#---- arrays ----#
gamma <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims))
eps.l <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims))
eps.h <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims))
phi.lh <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims))
phi.hh <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims))

#---Habitat data---#
# effect of habitat quality on occupancy
#set.seed(03222021)
#site.char <- runif(n.sites) 
#Loading habitat data:
path2 <- here::here("data")
file_name = paste(path2, 'Site_char_multi.csv',sep = '/')
site.chardat <- read.csv(file_name)
site.char <- site.chardat[,2]

path2 <- here::here("data") 
file_name = paste(path2, 'States_init_multi.csv',sep = '/')
State.init <- read.csv(file_name) #loading initial state data
State.init <- State.init[,2]
State <- array(NA,c(n.sites, n.weeks, n.years+1, n.params, n.sims)) #state array

#---Neighbor data---#
D <- array(NA, c(n.sites, n.weeks, n.years+1, n.params,n.sims)) #neighbors array
num.neighbors <- 2 #one upstream, one downstream
neighbors <- matrix(NA, nrow = n.sites, ncol = num.neighbors) #neighbors matrix, each row (site) identifies the neighbors for that site 
neighbors[1,1] <- 2 #site 1 only has site 2 as its neighbor 
neighbors[2:n.sites, 1] <- seq(1,n.sites-1) #filling in upstream neighbors
neighbors[n.sites,2] <- n.sites-1 #end site only has end site -1 as its neighbor
neighbors[1:(n.sites-1), 2] <- seq(2,n.sites) #filling in downstream neighbors
n.neighbors <- rep(2,n.sites)
n.neighbors[1] <- n.neighbors[n.sites] <- 1

TPM<- array(NA, c(n.states,n.sites,n.weeks, n.years + 1,n.params, n.sims, n.states)) #state probability

#### Random removal ####
removal.hours <- c(0, 2, 3) #it removal takes 2 hours if in low state and 3 hours if in high state
n.resource <- 40
sites.rem.M <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims)) 

for(y in 1:n.years){
  for(p in 1:n.params){
    for(s in 1: n.sims){
      sites.rem.M[,1,y,p,s] <- sample(n.sites, n.sites, replace = F)
}}}


yM <- array(NA, c(n.sites, n.occs, n.weeks, n.years, n.params, n.sims)) 
resource.total <- array(0, c(n.weeks, n.years, n.params, n.sims)) 

logsearch.effort <- log(search.hours) #log search effort

pM.l <- rep(NA, n.params)
pM.h <- rep(NA, n.params)
P.datM <- array(NA, dim = c(n.states, n.params, n.states))

for(p in 1:n.params){
  pM.l[p] <- invlogit(p.l0[p] + p.l1[p]*logsearch.effort + alpha.l[p]) #low state detection probability (base detection + effect of effort)
  pM.h[p] <- invlogit(p.h0[p] + p.h1[p]*logsearch.effort + alpha.h[p]) #high state detection probability (base detection + effect of effort)

  P.datM[1,p,] <- c(1,0,0)
  P.datM[2,p,] <- c(1-pM.l[p], pM.l[p], 0)
  P.datM[3,p,] <- c(1-pM.h[p], 0, pM.h[p])
  
}

rem.vec <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims)) #removal sites array

#--------------------------------------------------------------------------------#
#### 1. Simulate the truth ####
year <- 1

for(year in 1:n.years){
  for(p in 1:n.params){
    ##### Week 1 State model only #####
    week <- 1
    ###### Week 1 year 1 #####
    if(year == 1){
      
      State[,1,year,,] <- State.init #first week state is from data
      
      for(s in 1:n.sims){
        for(i in 1:n.sites){
          D[i,1,1,p,s] <- sum(State[neighbors[i,], 1,1,p,s])/n.neighbors[i] #state of neighbors
        }
      }
      
      gamma[,1,1,p,] <-invlogit(gamma.0[p] + gamma.1[p]*site.char + gamma.2[p]*D[,1,1,p,]) #invasion (week 1 year 1)
      eps.l[,1,1,p,] <- invlogit(eps.l0[p]) #eradication low (week 1 year 1)
      eps.h[,1,1,p,] <- invlogit(eps.h0[p]) #eradication high (week 1 year 1)
      phi.lh[,1,1,p,] <- invlogit(phi0.lh[p]) #transition low to high
      phi.hh[,1,1,p,] <- invlogit(phi0.hh[p]) #transition high to high
      
      # TPM used for week 2
      TPM[1,1:n.sites,1,1,p,,1] <- 1-gamma[,1,1,p,] #empty to empty (week 1 year 1)
      TPM[1,1:n.sites,1,1,p,,2] <- gamma[,1,1,p,] #empty to low (week 1 year 1)
      TPM[1,1:n.sites,1,1,p,,3] <- 0 #empty to high (week 1 year 1)
      
      TPM[2,1:n.sites,1,1,p,,1] <- eps.l[,1,1,p,] #low to empty (week 1 year 1)
      TPM[2,1:n.sites,1,1,p,,2] <- (1- eps.l[,1,1,p,])*(1-phi.lh[p]) #low to low (week 1 year 1)
      TPM[2,1:n.sites,1,1,p,,3] <- (1- eps.l[,1,1,p,])*(phi.lh[p]) #low to high (week 1 year 1)
      
      TPM[3,1:n.sites,1,1,p,,1] <- eps.h[,1,1,p,] #high to empty (week 1 year 1)
      TPM[3,1:n.sites,1,1,p,,2] <- (1- eps.h[,1,1,p,])*(1-phi.hh[p]) #high to low (week 1 year 1)
      TPM[3,1:n.sites,1,1,p,,3] <- (1- eps.h[,1,1,p,])*(phi.hh[p]) #high to high (week 1 year 1)
      
    } #ends year = 1 loop
    
    ###### Week 1 year >1 #####
    #for all years > 1 we need to project 48 weeks forward
    
    if(year > 1){
      for(s in 1:n.sims){
        
        for(i in 1:n.sites){ #State process: state given previous state and transition probability
          State[i,week,year,p,s] <- rcat(1,TPM.48[State[i,4,(year-1),p,s],p,]) 
        }
        
        for(i in 1:n.sites){
          D[i,week,year,p,s] <- sum(State[neighbors[i,], week,year,p,s])/n.neighbors[i] #state of neighbors
        }
        
        prev.rem.vec <- replace(rem.vec[,4,(year-1),p,s], is.na(rem.vec[,4,(year-1),p,s]), 0) 
        
        #invasion probability =  base invasion + effect of site habitat + effect of neighbor being invaded
        gamma[,week,year,p,s] <-invlogit(gamma.0[p] + gamma.1[p]*site.char + gamma.2[p]*D[,week,year,p,s])
    
        # eradication probability = base + effect of previous removal (removal*removal hours)
        eps.l[,week,year,p,s] <- invlogit(eps.l0[p] + eps.l1[p]*prev.rem.vec*removal.hours[2]) #low eradication 
        eps.h[,week,year,p,s] <- invlogit(eps.h0[p] + eps.h1[p]*prev.rem.vec*removal.hours[3]) #high eradication
        phi.lh[,week,year,p,s] <- invlogit(phi0.lh[p] -phi1.lh[p]*prev.rem.vec*removal.hours[2]) #transition low to high
        phi.hh[,week,year,p,s] <- invlogit(phi0.hh[p] -phi1.hh[p]*prev.rem.vec*removal.hours[3]) #transition high to high
        
        TPM[1,1:n.sites,week,year,p,s,1] <- 1-gamma[,week,year,p,s] #empty to empty
        TPM[1,1:n.sites,week,year,p,s,2] <- gamma[,week,year,p,s] #empty to low
        TPM[1,1:n.sites,week,year,p,s,3] <- 0 #empty to high
        
        TPM[2,1:n.sites,week,year,p,s,1] <- eps.l[,week,year,p,s] #low to empty (eradication)
        TPM[2,1:n.sites,week,year,p,s,2] <- (1- eps.l[,week,year,p,s])*(1-phi.lh[,week,year,p,s]) #low to low (eradication failure)
        TPM[2,1:n.sites,week,year,p,s,3] <- (1- eps.l[,week,year,p,s])*(phi.lh[,week,year,p,s]) #low to high 
        
        TPM[3,1:n.sites,week,year,p,s,1] <- eps.h[,week,year,p,s] #high to empty (eradication)
        TPM[3,1:n.sites,week,year,p,s,2] <- (1- eps.h[,week,year,p,s])*(1-phi.hh[,week,year,p,s]) #high to low 
        TPM[3,1:n.sites,week,year,p,s,3] <- (1- eps.h[,week,year,p,s])*(phi.hh[,week,year,p,s]) #high to high
        
      } #ends s loop
    } #ends year > 1 loop
    
    ##### Week 1+ #####
    
    #####State model #####
    
    for(s in 1:n.sims){
      for(week in 1:n.weeks){
        if(week > 1){
          for(i in 1:n.sites){ #State process: state given previous state and transition probability
            State[i,week,year,p,s] <- rcat(1,TPM[State[i,week-1,year,p,s], i, week-1, year,p,s,]) 
          }
            
          for(i in 1:n.sites){ #state of neighbors
            D[i,week,year,p,s] <- sum(State[neighbors[i,], week,year,p,s])/n.neighbors[i] #state of neighbors
          }
            
          #--- Data for the TPM for the next week: week 2+ ---#
          prev.rem.vec <- replace(rem.vec[,week-1,year,p,s], is.na(rem.vec[,week-1,year,p,s]), 0)
          
          #invasion probability =  base invasion + effect of site habitat + effect of neighbor being invaded
          gamma[,week,year,p,s] <-invlogit(gamma.0[p] + gamma.1[p]*site.char + gamma.2[p]*D[,week,year,p,s]) 
            
          # eradication probability = base + effect of previous removal (removal*removal hours)
          eps.l[,week,year,p,s] <- invlogit(eps.l0[p]+ eps.l1[p]*prev.rem.vec*removal.hours[2]) #low eradication
          eps.h[,week,year,p,s] <- invlogit(eps.h0[p]+ eps.h1[p]*prev.rem.vec*removal.hours[3]) #high eradication
          phi.lh[,week,year,p,s] <- invlogit(phi0.lh[p] -phi1.lh[p]*prev.rem.vec*removal.hours[2]) #transition low to high
          phi.hh[,week,year,p,s] <- invlogit(phi0.hh[p] -phi1.hh[p]*prev.rem.vec*removal.hours[3]) #transition high to high
          
          
          TPM[1,1:n.sites,week,year,p,s,1] <- 1-gamma[,week,year,p,s] #empty to empty
          TPM[1,1:n.sites,week,year,p,s,2] <- gamma[,week,year,p,s] #empty to low
          TPM[1,1:n.sites,week,year,p,s,3] <- 0 #empty to high
            
          TPM[2,1:n.sites,week,year,p,s,1] <- eps.l[,week,year,p,s] #low to empty (eradication)
          TPM[2,1:n.sites,week,year,p,s,2] <- (1- eps.l[,week,year,p,s])*(1-phi.lh[,week,year,p,s]) #low to low (eradication failure)
          TPM[2,1:n.sites,week,year,p,s,3] <- (1- eps.l[,week,year,p,s])*(phi.lh[,week,year,p,s]) #low to high
            
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
          if(resource.total[week,year,p,s] < n.resource){
            
            #1. Collect occupancy data, 2 visitors (1 = not detected, 2 = detected low state, 3 = detected high state)
            #Assuming observers have same detection rate:
            yM[i,,week, year,p, s] <- rcat(2, P.datM[State[i,week,year,p,s], p,])
            
            #2. Determine whether we remove the species
            #2a. if seen by at least one observer then we remove species
            if(yM[i,1,week, year,p, s] > 1 | yM[i,2,week,year,p,s] > 1){ 
              rem.vec[i,week,year,p,s] <- 1 #notes that removal occurred that week at that site
              
              #Calculating resources used = resources already used + search hours + removal hours
              resource.total[week,year,p,s] <- resource.total[week,year,p,s] + search.hours + removal.hours[State[i,week,year,p,s]]
              
            }else{#2b. if not seen by any observer then we remove species
              
              rem.vec[i,week,year,p,s] <- 0 #notes that removal occurred that week at that site
              
              #Calculating resources used = resources already used + search hours 
              resource.total[week,year,p,s] <- resource.total[week,year,p,s] + search.hours 
            }
            
            
            #B. if we do not have any more resources to spend:
          }else{
            yM[i,1:2, week, year,p, s] <- NA #no occupancy data
            rem.vec[i,week,year,p,s] <- NA #removal did not occur
          }
          
        } #ends site loop
      } #week loop
    } #ends sims loop  
  } #year loop
} #params loop


#### Save True Data ####
#results for each sim
States.df <- adply(State, c(1,2,3,4,5))

colnames(States.df) <- c("site", "week", "year", "param", "sim", "state")              

file_name = paste(path, 'States_random.csv',sep = '/')
write.csv(States.df,file_name)

#mean across simulations
Mean.States.df <- aggregate(state ~ site+week+year,
                            data = as.data.frame(States.df), FUN = mean)

file_name = paste(path, 'Mean.States_random.csv',sep = '/')
write.csv(Mean.States.df ,file_name)

#observation data -multi
yM.df <- adply(yM, c(1,2,3,4,5,6))

colnames(yM.df) <- c("site", "occasion", "week", "year", "param", "sim", "observed.state")              

file_name = paste(path, 'y.obs_random.csv',sep = '/')
write.csv(yM.df,file_name)


rem.site.M.df <- yM.df %>% filter(observed.state > 1)
file_name = paste(path, 'rem.site.M_random.csv',sep = '/')
write.csv(rem.site.M.df,file_name)

###### sites visited ####
sites.visit <- adply(rem.vec, c(1,2,3,4,5))

colnames(sites.visit) <- c("site", "week", "year", "param", "sim", "rem.val")   

file_name = paste(path, 'site.M_random.csv',sep = '/')
write.csv(sites.visit,file_name)


sites.visit <- sites.visit %>% filter(!is.na(rem.val))
sites.visit$rem.val <- 1

sites.visit.param <- aggregate(rem.val ~ param + sim,
                               data = as.data.frame(sites.visit), FUN = sum)

ggplot(sites.visit.param) + geom_bar(aes(x = param, y = rem.val), stat = "identity")

#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

file_name = paste(path, 'random_time.txt',sep = '/')
write.table(time.taken,file_name)

#### Final States average state ####
State.fins <- State[,4,n.years,,]
State.fins.df <- adply(State.fins, c(1,2,3))
colnames(State.fins.df) <- c("site", "param", "sim", "state")

ggplot(State.fins.df)+
  geom_boxplot(mapping = aes(x = param, y = state, middle = mean(state)))

means <- aggregate(state ~  param, State.fins.df, mean)

ggplot(State.fins.df)+
  geom_violin(mapping = aes(x = param, y = state))+
  stat_summary(aes(x = param, y = state),
               fun=mean, colour="darkred", geom="point",
               shape=18, size=3, show.legend=FALSE) + 
  geom_text(data = means, aes(x = param, label = state, y = state + 0.08))


#### site invasion ####
State.fins.avg <- aggregate(state ~  param + site, State.fins.df, mean)

head(State.fins.avg)

# ggplot(State.fins.avg, aes(x = site, y = param, fill = state)) +
#   geom_tile()+
#   theme_classic()

#### number of invaded sites ####
invasion <- matrix(NA, nrow = n.params, ncol = n.sims)

for(p in 1:n.params){
  for(s in 1:n.sims){
    df <- filter(State.fins.df, param == p, sim == s)
    invasion[p,s] <- sum(df$state == 1)
  }
}

invasion.mean <- rep(NA, n.params)

for(p in 1:n.params){
  invasion.mean[p] <- mean(invasion[p,])
}


#percent of river uninvaded after 10 years
1- invasion.mean/40



