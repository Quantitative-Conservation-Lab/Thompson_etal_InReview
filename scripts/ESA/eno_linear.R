library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)


#Remove at downstream 5 locations but collect monitoring data
#at next 5 downstream locations

#### Path Name ####
path <- here::here("results", "ESA", "eno_linear")
res <- c('results/ESA/eno_linear') 

#### Data ####

n.sims <-  100 #30
n.sites <- 50 #number of sites
n.years <- 10 
n.occs <- 2 #number of occasions for occupancy data collection


##### true state year 1 ####
psi <- State <- array(NA,c(n.sites, n.years+1, n.sims)) 
# effect of habitat quality on occupancy
set.seed(03222021)
site.char <- runif(n.sites) #might be multivariate, this is data
psi0 <- 0.5 #base occupancy
psi1 <- -30 #effect of previous removal
psi2 <- 0.5  #effect of site characteristics 
psi3 <-2 #effect of previous year state
a0 <- 0.9
a1 <- 1
n.resource <- 70 

# set.seed(03222021)
# 
# for(i in 1:n.sites){
#   #psi[i,1,1:n.sims] <- 1/(1+exp(-(psi0 + psi2*site.char[i]))) #inv.logit
#   psi[i,1,1:n.sims] <- invlogit(psi0 + psi2*site.char[i])
#   State[i,1,1:n.sims] <- rbinom(1,1,psi[i,1,1:n.sims]) #true state
# }

path2 <- here::here("data")
file_name = paste(path2, 'States_init.csv',sep = '/')

State.init <- read.csv(file_name)

State[,1,1:n.sims] <- State.init[,2]

##### occupancy data year 1 ####
#Randomly order all sites (next year order of sites will be based on some factor)
sites.rem <- array(NA, dim = c(n.sites, n.years, n.sims))

sites.rem[,1:n.years,] <- seq(1,n.sites)

logsearch.effort <- array(NA, c(n.occs,n.years, n.sims))

#effort is fixed year 1
logsearch.effort[,1:n.years,] <- log(0.5)
removal.effort <- 2
resource.total <- array(0, c(n.years,n.sims))

obs.pr <- y.obs <- array(NA,c(n.sites, n.occs, n.years, n.sims))
rem.vec <- array(NA, c(n.sites, n.years, n.sims)) #removal sites array

#simulate occupancy data for year 1 across sims
year <- 1

for(s in 1:n.sims){
  for(i in sites.rem[,year,s]){
    
    #while we still have resources to spend:
    if(resource.total[year,s] < n.resource){
      for(j in 1:2){ #detection probability
        obs.pr[i,j, year, s] <- 1/(1+exp(-(a0 + a1*logsearch.effort[j,year,s])))
      }
      
      #first occasion occupancy data
      y.obs[i,1, year, s] <- rbinom(1,1,obs.pr[i,1, year, s])*State[i, year, s]
        
      #second occasion occupancy data
      if(y.obs[i,1, year, s]==1){ #if already seen, do not search again and remove
        y.obs[i,2, year, s] <- NA 
        rem.vec[i,year,s] <- 1
        resource.total[year,s] <- resource.total[year,s] + 2*0.5 + 2
          
      }else{
        y.obs[i,2, year, s] <- rbinom(1,1,obs.pr[i,2, year, s])*State[i, year, s] #occupancy data
          
        if(y.obs[i,2, year, s]==1){
           rem.vec[i,year,s] <- 1
           resource.total[year,s] <- resource.total[year,s] + 2*0.5 + 2
        } 
          
         #if we don't detect anything, then 
         if(y.obs[i,2, year, s]==0){
           rem.vec[i,year,s] <- 0
           resource.total[year,s] <- resource.total[year,s] + 0.5
         } 
      }
    #if we do not have any more resources to spend:
    }else{
      #if we do not have enough data
      y.obs[i,1:2, year, s] <- NA
      rem.vec[i,year,s] <- NA
    }
    
  } #ends site loop
 
} #ends sims loop

#check
# y.obs[,,year,2]
# which(rowSums(y.obs[,,year,s], na.rm = T) != 0)
# rem.vec[,year,s]

####################################################################################
#### Run Adaptive Management ####

year <- 1
#n.years <- 2

for(year in 1:n.years){
  #### 1. Simulate truth #####
  if(year > 1){ #we simulated year 1 data above
    
    for(s in 1:n.sims){
      #locations where removal occured at year -1
      rem.vec.sim <- rem.vec[,year-1,]
      rem.vec.sim[,s][is.na(rem.vec.sim[,s])] <- 0 #replaces nas with 0
      previous.rem[,year,s] <- rem.vec.sim[,s]
      
    }
    
    ###### State Transitions ######
    for(s in 1:n.sims){
      for(i in 1:n.sites){
        psi[i,year,s]  <- invlogit(psi0 + psi1*previous.rem[i,year,s]+ psi2*site.char[i] + psi3*State[i,year-1,s])
        State[i,year,s] <- rbinom(1,1,psi[i,year,s]) #true state
      }
    }
    
    ###### Occupancy Data ######
    for(s in 1:n.sims){
      for(i in sites.rem[,year,s]){
        
        #while we still have resources to spend:
        if(resource.total[year,s] < n.resource){
          for(j in 1:2){ #detection probability
            obs.pr[i,j, year, s] <- 1/(1+exp(-(a0 + a1*logsearch.effort[j,year,s])))
          }
          
          #first occasion occupancy data
          y.obs[i,1, year, s] <- rbinom(1,1,obs.pr[i,1, year, s])*State[i, year, s]
          
          #second occasion occupancy data
          if(y.obs[i,1, year, s]==1){ #if already seen, do not search again and remove
            y.obs[i,2, year, s] <- NA 
            rem.vec[i,year,s] <- 1
            resource.total[year,s] <- resource.total[year,s] + exp(logsearch.effort[1,year,s]) + 2
            
          }else{
            y.obs[i,2, year, s] <- rbinom(1,1,obs.pr[i,2, year, s])*State[i, year, s] #occupancy data
            
            if(y.obs[i,2, year, s]==1){
              rem.vec[i,year,s] <- 1
              resource.total[year,s] <- resource.total[year,s] + 2*exp(logsearch.effort[1,year,s]) + 2
            } 
            
            #if we don't detect anything, then 
            if(y.obs[i,2, year, s]==0){
              rem.vec[i,year,s] <- 0
              resource.total[year,s] <- resource.total[year,s] + 2*exp(logsearch.effort[1,year,s])
            } 
          }
          #if we do not have any more resources to spend:
        }else{
          #if we do not have enough data
          y.obs[i,1:2, year, s] <- NA
          rem.vec[i,year,s] <- NA
        }
        
      } #ends site loop
      
    } #ends sims loop
    
  } #ends years > 1 simulations
  
} #end adaptive management 

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

#################################################################################################
#################################################################################################
#### Save True Data ####
#results for each sim
States.df <- adply(State, c(1,2,3))

colnames(States.df) <- c("site", "year", "sim", "state")              

file_name = paste(path, 'States_eno_linear.csv',sep = '/')
write.csv(States.df,file_name)


#mean across simulations
Mean.States.df <- aggregate(state ~ site+year,
                            data = as.data.frame(States.df), FUN = mean)


file_name = paste(path, 'Mean.States_eno_linear.csv',sep = '/')
write.csv(Mean.States.df ,file_name)

#observation data -multi
y.obs.df <- adply(y.obs, c(1,2,3,4))

colnames(y.obs.df) <- c("site", "occasion", "year", "sim", "observed.state")              

file_name = paste(path, 'y.obs_eno_linear.csv',sep = '/')
write.csv(y.obs.df,file_name)


rem.site.df <- y.obs.df %>% filter(observed.state == 1)
file_name = paste(path, 'rem.site_eno_linear.csv',sep = '/')
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

file_name = paste(path, 'sites.visit_eno_linear.csv',sep = '/')
write.csv(sites.df,file_name)

#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

file_name = paste(path, 'eno_linear_time.txt',sep = '/')
write.table(time.taken,file_name)

round((Mean.States.df %>% filter(year == n.years))[,3])
round((Mean.States.df %>% filter(year == n.years+1))[,3])

sum(round((Mean.States.df %>% filter(year == n.years+1))[,3]))

