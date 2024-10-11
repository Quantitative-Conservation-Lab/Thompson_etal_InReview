library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)

#### Data and parameters ####
load("parameters.RData")

n.sims <-  20
n.params <- 3
n.sites <- 40 #number of sites
n.years <- 10 #number of years
n.weeks <- 4 #number of weeks
n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

#---- arrays ----#
gamma <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims))
eps.l <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims))
eps.h <- array(NA, c(n.sites, n.weeks, n.years, n.params, n.sims))

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

#--------------------------------------------------------------------------------#
#### 1. Simulate the truth ####

for(p in 1:n.params){
  for(year in 1:n.years){
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
      
      gamma[,1,1,p,] <-invlogit(gamma.0s[p] + gamma.1s[p]*site.char + gamma.2s[p]*D[,1,1,p,]) #invasion (week 1 year 1)
      eps.l[,1,1,p,] <- invlogit(eps.l0s[p]) #eradication low (week 1 year 1)
      eps.h[,1,1,p,] <- invlogit(eps.h0s[p]) #eradication high (week 1 year 1)
      
      # TPM used for week 2
      TPM[1,1:n.sites,1,1,p,,1] <- 1-gamma[,1,1,p,] #empty to empty (week 1 year 1)
      TPM[1,1:n.sites,1,1,p,,2] <- gamma[,1,1,p,] #empty to low (week 1 year 1)
      TPM[1,1:n.sites,1,1,p,,3] <- 0 #empty to high (week 1 year 1)
      
      TPM[2,1:n.sites,1,1,p,,1] <- eps.l[,1,1,p,] #low to empty (week 1 year 1)
      TPM[2,1:n.sites,1,1,p,,2] <- (1- eps.l[,1,1,p,])*(1-phi.lhs[p]) #low to low (week 1 year 1)
      TPM[2,1:n.sites,1,1,p,,3] <- (1- eps.l[,1,1,p,])*(phi.lhs[p]) #low to high (week 1 year 1)
      
      TPM[3,1:n.sites,1,1,p,,1] <- eps.h[,1,1,p,] #high to empty (week 1 year 1)
      TPM[3,1:n.sites,1,1,p,,2] <- (1- eps.h[,1,1,p,])*(1-phi.hhs[p]) #high to low (week 1 year 1)
      TPM[3,1:n.sites,1,1,p,,3] <- (1- eps.h[,1,1,p,])*(phi.hhs[p]) #high to high (week 1 year 1)
      
    } #ends year = 1 loop
    
    ###### Week 1 year >1 #####
    #for all years > 1 we need to project 48 weeks forward
    
    if(year > 1){
      for(s in 1:n.sims){
        
        for(i in 1:n.sites){ #State process: state given previous state and transition probability
          State[i,week,year,p,s] <- rcat(1,TPM.48s[State[i,4,(year-1),p,s],,p]) 
        }
        
        for(i in 1:n.sites){
          D[i,week,year,p,s] <- sum(State[neighbors[i,], week,year,p,s])/n.neighbors[i] #state of neighbors
        }
        
        #invasion probability =  base invasion + effect of site habitat + effect of neighbor being invaded
        gamma[,week,year,p,s] <-invlogit(gamma.0s[p] + gamma.1s[p]*site.char + gamma.2s[p]*D[,week,year,p,s])
        
        # eradication probability = base + effect of previous removal (removal*removal hours)
        eps.l[,1,year,p,s] <- invlogit(eps.l0s[p]) #eradication low (week 1 year 1)
        eps.h[,1,year,p,s] <- invlogit(eps.h0s[p]) #eradication high (week 1 year 1)
        
        TPM[1,1:n.sites,week,year,p,s,1] <- 1-gamma[,week,year,p,s] #empty to empty
        TPM[1,1:n.sites,week,year,p,s,2] <- gamma[,week,year,p,s] #empty to low
        TPM[1,1:n.sites,week,year,p,s,3] <- 0 #empty to high
        
        TPM[2,1:n.sites,week,year,p,s,1] <- eps.l[,week,year,p,s] #low to empty (eradication)
        TPM[2,1:n.sites,week,year,p,s,2] <- (1- eps.l[,week,year,p,s])*(1-phi.lhs[p]) #low to low (eradication failure)
        TPM[2,1:n.sites,week,year,p,s,3] <- (1- eps.l[,week,year,p,s])*(phi.lhs[p]) #low to high 
        
        TPM[3,1:n.sites,week,year,p,s,1] <- eps.h[,week,year,p,s] #high to empty (eradication)
        TPM[3,1:n.sites,week,year,p,s,2] <- (1- eps.h[,week,year,p,s])*(1-phi.hhs[p]) #high to low 
        TPM[3,1:n.sites,week,year,p,s,3] <- (1- eps.h[,week,year,p,s])*(phi.hhs[p]) #high to high
        
      } #ends s loop
    } #ends year > 1 loop
    
    ##### Week 1+ State model #####
    for(s in 1:n.sims){
      for(week in 2:n.weeks){
        for(i in 1:n.sites){ #State process: state given previous state and transition probability
          State[i,week,year,p,s] <- rcat(1,TPM[State[i,week-1,year,p,s], i, week-1, year,p,s,]) 
        }
          
        for(i in 1:n.sites){ #state of neighbors
          D[i,week,year,p,s] <- sum(State[neighbors[i,], week,year,p,s])/n.neighbors[i] #state of neighbors
        }
          
        #--- Data for the TPM for the next week: week 2+ ---#
        #invasion probability =  base invasion + effect of site habitat + effect of neighbor being invaded
        gamma[,week,year,p,s] <-invlogit(gamma.0s[p] + gamma.1s[p]*site.char + gamma.2s[p]*D[,week,year,p,s]) 
          
        # eradication probability = base + effect of previous removal (removal*removal hours)
        eps.l[,week,year,p,s] <- invlogit(eps.l0s[p]) #low eradication
        eps.h[,week,year,p,s] <- invlogit(eps.h0s[p]) #high eradication
        
        TPM[1,1:n.sites,week,year,p,s,1] <- 1-gamma[,week,year,p,s] #empty to empty
        TPM[1,1:n.sites,week,year,p,s,2] <- gamma[,week,year,p,s] #empty to low
        TPM[1,1:n.sites,week,year,p,s,3] <- 0 #empty to high
          
        TPM[2,1:n.sites,week,year,p,s,1] <- eps.l[,week,year,p,s] #low to empty (eradication)
        TPM[2,1:n.sites,week,year,p,s,2] <- (1- eps.l[,week,year,p,s])*(1-phi.lhs[p]) #low to low (eradication failure)
        TPM[2,1:n.sites,week,year,p,s,3] <- (1- eps.l[,week,year,p,s])*(phi.lhs[p]) #low to high
          
        TPM[3,1:n.sites,week,year,p,s,1] <- eps.h[,week,year,p,s] #high to empty (eradication)
        TPM[3,1:n.sites,week,year,p,s,2] <- (1- eps.h[,week,year,p,s])*(1-phi.hhs[p]) #high to low
        TPM[3,1:n.sites,week,year,p,s,3] <- (1- eps.h[,week,year,p,s])*(phi.hhs[p]) #high to high
          
      }
        
  } #ends sims loop  
  } #year loop
} #params loop

##### Final States ####
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

