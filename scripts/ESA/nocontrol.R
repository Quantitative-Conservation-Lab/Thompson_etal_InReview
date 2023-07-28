library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)

start.time <- Sys.time()

#### Path Name ####
path <- here::here("results", "ESA", "nocontrol")
res <- c('results/ESA/nocontrol') 

#### Data ####
n.sims <- 100
n.sites <- 50 #number of sites
n.years <- 10 
n.occs <- 2 #number of occasions for occupancy data collection
n.resource <- 20 #number of resource units available

##### true state year 1 ####
psi <- State <- array(NA,c(n.sites, n.years+1, n.sims)) 
# effect of habitat quality on occupancy
set.seed(03222021)
#site.char <- runif(n.sites) #might be multivariate, this is data

#State.init.allsims <- State[,1,1]

path2 <- here::here("data")
file_name = paste(path2, 'Site_char.csv',sep = '/')
# write.csv(site.char,file_name)

site.chardat <- read.csv(file_name)

site.char <- site.chardat[,2]

psi0 <- -1 #base occupancy
psi2 <- 0.5  #effect of site characteristics 
psi3 <- 2

set.seed(03222021)

# for(i in 1:n.sites){
#   #psi[i,1,1:n.sims] <- 1/(1+exp(-(psi0 + psi2*site.char[i]))) #inv.logit
#   psi[i,1,1:n.sims] <- invlogit(psi0 + psi2*site.char[i])
#   State[i,1,1:n.sims] <- rbinom(1,1,psi[i,1,1:n.sims]) #true state
# }

#State.init.allsims <- State[,1,1]

path2 <- here::here("data")
file_name = paste(path2, 'States_init.csv',sep = '/')
# write.csv(State.init.allsims,file_name)

State.init <- read.csv(file_name)

State[,1,1:n.sims] <- State.init[,2]

##### occupancy data year 1 ####
#Randomly order all sites (next year order of sites will be based on some factor)
sites.rem <- array(NA, dim = c(n.sites, n.years, n.sims))

sites.rem[,1,] <- sample(seq(1,n.sites), n.sites, replace = F)

search.effort <- array(NA, c(n.occs,n.years, n.sims))

#effort is fixed year 1
search.effort[,1,] <- 0.5
removal.effort <- 2
resource.total <- array(0, c(n.years,n.sims))

obs.pr <- y.obs <- array(NA,c(n.sites, n.occs, n.years, n.sims))
rem.vec <- array(NA, c(n.sites, n.years, n.sims)) #removal sites array

#n.resource <- 20 
a0 <- -1
a1 <- 1 

#check
# y.obs[,,year,2]
# which(rowSums(y.obs[,,year,s], na.rm = T) != 0)
# rem.vec[,year,s]

####################################################################################
#### Run Sims ####

year <- 1
#n.years <- 2



for(year in 2:n.years){
  #### 1. Simulate truth #####
    ###### State Transitions ######
    for(s in 1:n.sims){
      for(i in 1:n.sites){
        psi[i,year,s]  <- invlogit(psi0 + psi2*site.char[i] + psi3*State[i,year-1,s])
        State[i,year,s] <- rbinom(1,1,psi[i,year,s]) #true state
      }
    }
  
} #end adaptive management 

#################################################################################################
#### Save True Data ####
#results for each sim
States.df <- adply(State, c(1,2,3))

colnames(States.df) <- c("site", "year", "sim", "state")              

file_name = paste(path, 'States_nc.csv',sep = '/')
write.csv(States.df,file_name)


#mean across simulations
Mean.States.df <- aggregate(state ~ site+year,
                            data = as.data.frame(States.df), FUN = mean)


file_name = paste(path, 'Mean.States_nc.csv',sep = '/')
write.csv(Mean.States.df ,file_name)


round((Mean.States.df %>% filter(year == n.years))[,3])
sum( round((Mean.States.df %>% filter(year == n.years))[,3]))


dat <- Mean.States.df %>% filter(year == n.years)
mean(dat[,3])
