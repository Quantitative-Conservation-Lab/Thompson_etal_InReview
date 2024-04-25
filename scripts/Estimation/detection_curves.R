library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(tidyverse)
library(strex)
library(plyr)
library(RColorBrewer)
library(readr)

#### parameters ####
load("parameters_data.RData")

p.goals <- seq(0.05,0.95, 0.1)  
eps.goals <- seq(0.05,0.95, 0.1) 

##### Path to save data ####
path <- 'E:\\Chapter3\\results\\p_eps_hrs\\space1'

#------------------------------------------------------------------------------#
n.sims <- 100

#### 20 hours ####
n.resource <- 20 #total hours per week

#year 3 data path
y3 <- 'E:\\Chapter3\\results\\first3yrs_20'


file_name = paste(y3, 'params.csv',sep = '/')
est_params <- read.csv(file_name)[-1]

est_params <- est_params %>% filter(year == 3)
B0.pl3 <- c(t(est_params %>% filter(param == 'B0.p.l') %>% select(mean)))
B1.pl3 <- c(t(est_params %>% filter(param == 'B1.p.l') %>% select(mean)))
B0.ph3 <- c(t(est_params %>% filter(param == 'B0.p.h') %>% select(mean)))
B1.ph3 <- c(t(est_params %>% filter(param == 'B1.p.h') %>% select(mean)))

logsearch.effort.L <- array(NA, c(length(p.goals),n.sims))
logsearch.effort.H <- array(NA, c(length(p.goals),n.sims))

for(p in 1:length(p.goals)){
  logsearch.effort.L[p,] <- (logit(p.goals[p]) - B0.pl3)/(B1.pl3)
  logsearch.effort.H[p,] <- (logit(p.goals[p]) - B0.ph3)/(B1.ph3)
}

B0.epsl3 <- c(t(est_params %>% filter(param == 'B0.eps.l') %>% select(mean)))
B1.epsl3 <- c(t(est_params %>% filter(param == 'B1.eps.l') %>% select(mean)))
B0.epsh3 <- c(t(est_params %>% filter(param == 'B0.eps.h') %>% select(mean)))
B1.epsh3 <- c(t(est_params %>% filter(param == 'B1.eps.h') %>% select(mean)))

removal.L <- array(NA, c(length(eps.goals),n.sims))
removal.H <- array(NA, c(length(eps.goals),n.sims))

for(p in 1:length(eps.goals)){
  removal.L[p,] <- (logit(eps.goals[p]) - B0.epsl3)/(B1.epsl3)
  removal.H[p,] <- (logit(eps.goals[p]) - B0.epsh3)/(B1.epsh3)  
}

logsearch.effort <- array(NA, c(length(p.goals),n.sims))
search.effort <- array(NA, c(length(p.goals),n.sims))
removal.effort <- array(NA, c(length(eps.goals),n.sims))


for(s in 1:n.sims){
  for(p in 1:length(p.goals)){
    logsearch.effort[p,s] <- mean(logsearch.effort.L[p,s], logsearch.effort.H[p,s])
    search.effort[p,s] <- exp(logsearch.effort[p,s])
  }
  for(p in 1:length(eps.goals)){
    removal.effort[p,s] <- mean(removal.L[p,s], removal.H[p,s]) 
  }

}

search.effort.dat <- as.data.frame.table(search.effort)
colnames(search.effort.dat) <- c('rate', 'sim', 'hours')
search.effort.dat$rate <- as.numeric(search.effort.dat$rate)

for(p in 1:length(p.goals)){
  search.effort.dat$rate[search.effort.dat$rate == p] <- p.goals[p]
}

search.effort.dat$sim <- as.numeric(search.effort.dat$sim)
search.effort.dat$data <- 'p'

removal.effort.dat <- as.data.frame.table(removal.effort)
colnames(removal.effort.dat) <- c('rate', 'sim', 'hours')
removal.effort.dat$rate <- as.numeric(removal.effort.dat$rate)
for(p in 1:length(eps.goals)){
  removal.effort.dat$rate[removal.effort.dat$rate == p] <- eps.goals[p]
}

removal.effort.dat$sim <- as.numeric(removal.effort.dat$sim)
removal.effort.dat$data <- 'eps'


search.effort.dat20 <- rbind(search.effort.dat,removal.effort.dat )
search.effort.dat20$budget <- 20

#### 40 hours ####
n.resource <- 40 #total hours per week

#year 3 data path
y3 <- 'E:\\Chapter3\\results\\first3yrs_40'

file_name = paste(y3, 'params.csv',sep = '/')
est_params <- read.csv(file_name)[-1]

est_params <- est_params %>% filter(year == 3)
B0.pl3 <- c(t(est_params %>% filter(param == 'B0.p.l') %>% select(mean)))
B1.pl3 <- c(t(est_params %>% filter(param == 'B1.p.l') %>% select(mean)))
B0.ph3 <- c(t(est_params %>% filter(param == 'B0.p.h') %>% select(mean)))
B1.ph3 <- c(t(est_params %>% filter(param == 'B1.p.h') %>% select(mean)))

logsearch.effort.L <- array(NA, c(length(p.goals),n.sims))
logsearch.effort.H <- array(NA, c(length(p.goals),n.sims))

for(p in 1:length(p.goals)){
  logsearch.effort.L[p,] <- (logit(p.goals[p]) - B0.pl3)/(B1.pl3)
  logsearch.effort.H[p,] <- (logit(p.goals[p]) - B0.ph3)/(B1.ph3)
}

B0.epsl3 <- c(t(est_params %>% filter(param == 'B0.eps.l') %>% select(mean)))
B1.epsl3 <- c(t(est_params %>% filter(param == 'B1.eps.l') %>% select(mean)))
B0.epsh3 <- c(t(est_params %>% filter(param == 'B0.eps.h') %>% select(mean)))
B1.epsh3 <- c(t(est_params %>% filter(param == 'B1.eps.h') %>% select(mean)))

removal.L <- array(NA, c(length(eps.goals),n.sims))
removal.H <- array(NA, c(length(eps.goals),n.sims))

for(p in 1:length(eps.goals)){
  removal.L[p,] <- (logit(eps.goals[p]) - B0.epsl3)/(B1.epsl3)
  removal.H[p,] <- (logit(eps.goals[p]) - B0.epsh3)/(B1.epsh3)  
}

logsearch.effort <- array(NA, c(length(p.goals),n.sims))
search.effort <- array(NA, c(length(p.goals),n.sims))
removal.effort <- array(NA, c(length(eps.goals),n.sims))


for(s in 1:n.sims){
  for(p in 1:length(p.goals)){
    logsearch.effort[p,s] <- mean(logsearch.effort.L[p,s], logsearch.effort.H[p,s])
    search.effort[p,s] <- exp(logsearch.effort[p,s])
  }
  for(p in 1:length(eps.goals)){
    removal.effort[p,s] <- mean(removal.L[p,s], removal.H[p,s]) 
  }
  
}

search.effort.dat <- as.data.frame.table(search.effort)
colnames(search.effort.dat) <- c('rate', 'sim', 'hours')
search.effort.dat$rate <- as.numeric(search.effort.dat$rate)

for(p in 1:length(p.goals)){
  search.effort.dat$rate[search.effort.dat$rate == p] <- p.goals[p]
}

search.effort.dat$sim <- as.numeric(search.effort.dat$sim)
search.effort.dat$data <- 'p'

removal.effort.dat <- as.data.frame.table(removal.effort)
colnames(removal.effort.dat) <- c('rate', 'sim', 'hours')
removal.effort.dat$rate <- as.numeric(removal.effort.dat$rate)
for(p in 1:length(eps.goals)){
  removal.effort.dat$rate[removal.effort.dat$rate == p] <- eps.goals[p]
}

removal.effort.dat$sim <- as.numeric(removal.effort.dat$sim)
removal.effort.dat$data <- 'eps'

search.effort.dat40 <- rbind(search.effort.dat,removal.effort.dat )
search.effort.dat40$budget <- 40


#### 60 hours ####
n.resource <- 60 #total hours per week

#year 3 data path
y3 <- 'E:\\Chapter3\\results\\first3yrs_60'

file_name = paste(y3, 'params.csv',sep = '/')
est_params <- read.csv(file_name)[-1]

est_params <- est_params %>% filter(year == 3)
B0.pl3 <- c(t(est_params %>% filter(param == 'B0.p.l') %>% select(mean)))
B1.pl3 <- c(t(est_params %>% filter(param == 'B1.p.l') %>% select(mean)))
B0.ph3 <- c(t(est_params %>% filter(param == 'B0.p.h') %>% select(mean)))
B1.ph3 <- c(t(est_params %>% filter(param == 'B1.p.h') %>% select(mean)))

logsearch.effort.L <- array(NA, c(length(p.goals),n.sims))
logsearch.effort.H <- array(NA, c(length(p.goals),n.sims))

for(p in 1:length(p.goals)){
  logsearch.effort.L[p,] <- (logit(p.goals[p]) - B0.pl3)/(B1.pl3)
  logsearch.effort.H[p,] <- (logit(p.goals[p]) - B0.ph3)/(B1.ph3)
}

B0.epsl3 <- c(t(est_params %>% filter(param == 'B0.eps.l') %>% select(mean)))
B1.epsl3 <- c(t(est_params %>% filter(param == 'B1.eps.l') %>% select(mean)))
B0.epsh3 <- c(t(est_params %>% filter(param == 'B0.eps.h') %>% select(mean)))
B1.epsh3 <- c(t(est_params %>% filter(param == 'B1.eps.h') %>% select(mean)))

removal.L <- array(NA, c(length(eps.goals),n.sims))
removal.H <- array(NA, c(length(eps.goals),n.sims))

for(p in 1:length(eps.goals)){
  removal.L[p,] <- (logit(eps.goals[p]) - B0.epsl3)/(B1.epsl3)
  removal.H[p,] <- (logit(eps.goals[p]) - B0.epsh3)/(B1.epsh3)  
}

logsearch.effort <- array(NA, c(length(p.goals),n.sims))
search.effort <- array(NA, c(length(p.goals),n.sims))
removal.effort <- array(NA, c(length(eps.goals),n.sims))


for(s in 1:n.sims){
  for(p in 1:length(p.goals)){
    logsearch.effort[p,s] <- mean(logsearch.effort.L[p,s], logsearch.effort.H[p,s])
    search.effort[p,s] <- exp(logsearch.effort[p,s])
  }
  for(p in 1:length(eps.goals)){
    removal.effort[p,s] <- mean(removal.L[p,s], removal.H[p,s]) 
  }
  
}

search.effort.dat <- as.data.frame.table(search.effort)
colnames(search.effort.dat) <- c('rate', 'sim', 'hours')
search.effort.dat$rate <- as.numeric(search.effort.dat$rate)

for(p in 1:length(p.goals)){
  search.effort.dat$rate[search.effort.dat$rate == p] <- p.goals[p]
}

search.effort.dat$sim <- as.numeric(search.effort.dat$sim)
search.effort.dat$data <- 'p'

removal.effort.dat <- as.data.frame.table(removal.effort)
colnames(removal.effort.dat) <- c('rate', 'sim', 'hours')
removal.effort.dat$rate <- as.numeric(removal.effort.dat$rate)
for(p in 1:length(eps.goals)){
  removal.effort.dat$rate[removal.effort.dat$rate == p] <- eps.goals[p]
}

removal.effort.dat$sim <- as.numeric(removal.effort.dat$sim)
removal.effort.dat$data <- 'eps'

#year 3 data path
y3 <- 'E:\\Chapter3\\results-space2\\first3yrs_60'

search.effort.dat60 <- rbind(search.effort.dat,removal.effort.dat )
search.effort.dat60$budget <- 60


#### Save data ####
search.effort.dat <- rbind(search.effort.dat20, search.effort.dat40, search.effort.dat60)
search.effort.dat$space <- 1

file_name = paste(path, 'hrsdat_1.csv',sep = '/')
write.csv(search.effort.dat,file_name)