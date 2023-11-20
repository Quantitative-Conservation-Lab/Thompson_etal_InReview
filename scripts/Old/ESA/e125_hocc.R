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
sink("Flower_mod2.txt")
cat("
model{

# -------------------------------------------------#
# States (states):
# 1 empty
# 2 invaded
# 
# Observations (y.obs):  
# 1 not detected
# 2 detected 
#--------------------------------------------------#
#### LIKELIHOOD ####  
for(i in 1:n.sites){
  logit(psi.est[i]) <- psi0 - psi1*previous.rem[i] + psi2*site.char[i] + psi3*prev.state[i]
    
  State[i] ~ dbern(psi.est[i])

  for(j in 1:n.occs){

    #logit(obs.pr[i,j]) <- a0 + a1*logeffort[i,j] #probability of detection
     obs.pr[i,j] <- 1/(1+exp(-(a0 + a1*logeffort[i,j] )))
      
    y.obs[i,j] ~ dbin(obs.pr[i,j] * State[i], n.occs)
  
    } # occasions loop
      
} #sites loop
 
#--------------------------------------------------#    
#### PRIORS ####
  #psi = occupancy (invasion) probabilitiy (function of base rate and whether rempoval previously occured)
    psi0 ~ dbeta(psi0.a, psi0.b) #base occupancy rate
    psi1 ~ dnorm(psi1.mean,psi1.tau) #effect on removal previously taking place at site i 
    psi1.tau <- 1/(psi1.sd * psi1.sd) #precision
    psi2 ~ dnorm(psi2.mean, psi2.tau) #effect of habitat
    psi2.tau <- 1/(psi2.sd * psi2.sd) #precision
    psi3 ~ dnorm(psi3.mean, psi3.tau) #effect of previous invasion
    psi3.tau <- 1/(psi3.sd * psi3.sd) #effect of previous invasion
  
    #FIX update b1
    b1 ~ dnorm(0,1)
  
  #obs.pr = detection probability
    a0 ~ dbeta(a0.a, a0.b) #baseline detection probability
    a1 ~ dnorm(a1.mean, a1.tau) #effect of effort 
    a1.tau <- 1/(a1.sd * a1.sd)
    
  
} #end model
", fill = TRUE)
sink()


#### Path Name ####
path <- here::here("results", "ESA", "e125_hocc")
res <- c('results/ESA/e125_hocc') 

#### Data ####
n.sims <-  25 #100
n.sites <- 50 #number of sites
n.years <- 10 
n.occs <- 2 #number of occasions for occupancy data collection

psi0 <- 0.5 #base occupancy
psi1 <- -30 #effect of previous removal
psi2 <- 0.5  #effect of site characteristics 
psi3 <-2 #effect of previous year state
a0 <- 0.9 #base detection
a1 <- 1 #effect of effort
n.resource <- 70 #total resources we can use

##### true state year 1 ####
psi <- State <- array(NA,c(n.sites, n.years+1, n.sims)) 
# effect of habitat quality on occupancy
set.seed(03222021)
#site.char <- runif(n.sites) #might be multivariate, this is data

path2 <- here::here("data")
file_name = paste(path2, 'Site_char.csv',sep = '/')
# write.csv(site.char,file_name)

site.chardat <- read.csv(file_name)

site.char <- site.chardat[,2]

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

sites.rem[,1,] <- sample(seq(1,n.sites), n.sites, replace = F)

logsearch.effort <- array(NA, c(n.occs,n.years, n.sims))

#effort is fixed year 1
logsearch.effort[,1,] <- log(0.5)
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
        resource.total[year,s] <- resource.total[year,s] + 0.5 + 2
          
      }else{
        y.obs[i,2, year, s] <- rbinom(1,1,obs.pr[i,2, year, s])*State[i, year, s] #occupancy data
          
        if(y.obs[i,2, year, s]==1){
           rem.vec[i,year,s] <- 1
           resource.total[year,s] <- resource.total[year,s] + 2*0.5 + 2
        } 
          
         #if we don't detect anything, then 
         if(y.obs[i,2, year, s]==0){
           rem.vec[i,year,s] <- 0
           resource.total[year,s] <- resource.total[year,s] + 2*0.5
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



#### JAGS arrays ####
previous.rem <- array(NA, c(n.sites,n.years, n.sims))

#priors:
psi0.a <- array(NA, c(n.years, n.sims))
psi0.b <- array(NA, c(n.years, n.sims))

psi1.mean <- array(NA, c(n.years, n.sims))
psi1.sd <- array(NA, c(n.years, n.sims))

psi2.mean <- array(NA, c(n.years, n.sims))
psi2.sd <- array(NA, c(n.years, n.sims))

psi3.mean <- array(NA, c(n.years, n.sims))
psi3.sd <- array(NA, c(n.years, n.sims))

a0.a <- array(NA, c(n.years, n.sims))
a0.b <- array(NA, c(n.years, n.sims))

a1.mean <- array(NA, c(n.years, n.sims))
a1.sd <- array(NA, c(n.years, n.sims))

x <- list()
rhat_vals <- array(NA, c(n.years, n.sims))
my.data <- list()
outs <- rep(NA,n.sims)
outputsfull <- rep(NA, n.sims)
outputs <- rep(NA, n.sims)
mcmcs <- rep(NA, n.sims)

State.est <- rep(NA, n.sims)
psi.est <- rep(NA, n.sims)
sites <- list()
psi0s <- rep(NA, n.sims)
psi1s <- rep(NA, n.sims)
psi2s <- rep(NA, n.sims)
psi3s <- rep(NA, n.sims)
a0s <- rep(NA, n.sims)
a1s <- rep(NA, n.sims)

States.mean.round <- array(NA, c(n.sites, n.years, n.sims))
States.mean <- array(NA, c(n.sites, n.years, n.sims))

all.state.est <- rep(NA, n.sims)
all.psi.est <- rep(NA, n.sims)
all.psi0 <- rep(NA, n.sims)
all.psi1 <- rep(NA, n.sims)
all.psi2 <- rep(NA, n.sims)
all.psi3 <- rep(NA, n.sims)
all.a0 <- rep(NA, n.sims)
all.a1 <- rep(NA, n.sims)
all.a2 <- rep(NA, n.sims)

a0.sim <- rep(NA, n.sims)
a1.sim <- rep(NA, n.sims)

alpha.psi0s <- rep(NA, n.sims)
beta.psi0s <- rep(NA, n.sims)

alpha.a0s <- rep(NA, n.sims)
beta.a0s <- rep(NA, n.sims)
initial.values <- list()

prev.state <- array(NA, c(n.sites, n.sims))

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
  #### 2. Learning: ####
  
  ##### 2a. Update priors #####
  
  #------------------------Year 1 Priors------------------------#
  if(year == 1){
    
    #psi = occupancy probability
    #psi0 = base occupancy rate (beta distribution)
      psi0.a[year,] <- 1
      psi0.b[year,] <- 1
      
    #psi1 = effect on removal previously taking place (normal distribution)
      psi1.mean[year,] <- 0
      psi1.sd[year,] <- 10
      
    #psi2 = effect on habitat locations (normal distribution)
      psi2.mean[year,] <- 0
      psi2.sd[year,] <- 10
      
    #psi3 = effect of previous year state
      psi3.mean[year,] <- 0
      psi3.sd[year,] <- 10
    
    #obs.pr = detection probability
    #a0 = base detection (beta distribution)
      a0.a[year,] <- 1
      a0.b[year,] <- 1
    
    #a1 = effect of effort on detection (normal distribution)
      a1.mean[year,] <- 0
      a1.sd[year,] <- 10
    
      previous.rem[,year,1:n.sims] <- 0
    
  } else{
    #------------------------Year 1+ Priors------------------------#
    for(s in 1:n.sims){
      #-------- psi0 --------#
      #psi = occupancy probability
      #psi0 = base occupancy rate (beta distribution)
      alpha.psi0s[s]<- paste("alpha.psi0", s, sep = "_")
      #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
      assign(alpha.psi0s[s],
             (1 - get(psi0s[s])$mean*(1 + get(psi0s[s])$cv^2))/(get(psi0s[s])$cv^2))
      
      beta.psi0s[s]<- paste("beta.psi0", s, sep = "_")
      #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
      assign(beta.psi0s[s],
             get(alpha.psi0s[s])*(1 - get(psi0s[s])$mean)/get(psi0s[s])$mean)
      
      #assigning these values for the next jags run:
      psi0.a[year,s] <- get(alpha.psi0s[s])
      psi0.b[year,s] <- get(beta.psi0s[s])
      
      #-------- psi1 ---------------------------------------------------------#
      #psi1 = effect on removal previously taking place (normal distribution)
 
      psi1.mean[year,s] <- get(psi1s[s])$mean
      psi1.sd[year,s] <- get(psi1s[s])$sd
      
      #-------- psi2 ---------------------------------------------------------#
      #psi2 = effect on habitat locations (normal distribution)
      psi2.mean[year,s] <- get(psi2s[s])$mean
      psi2.sd[year,s] <- get(psi2s[s])$sd
      
      #-------- psi3 ---------------------------------------------------------#
      #psi3 = effect of previous year state
      psi3.mean[year,s] <- get(psi3s[s])$mean
      psi3.sd[year,s] <- get(psi3s[s])$sd
      
      #-------- a0 -----------------------------------------------------------#
      #obs.pr = detection probability
      #a0 = base detection (beta distribution)
      alpha.a0s[s]<- paste("alpha.a0", s, sep = "_")
      #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
      assign(alpha.a0s[s],
             (1 - get(a0s[s])$mean*(1 + get(a0s[s])$cv^2))/(get(a0s[s])$cv^2))
      
      beta.a0s[s]<- paste("beta.a0", s, sep = "_")
      #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
      assign(beta.a0s[s],
             get(alpha.a0s[s])*(1 - get(a0s[s])$mean)/get(a0s[s])$mean)
      
      #assigning these values for the next jags run:
      a0.a[year,s] <- get(alpha.a0s[s])
      a0.b[year,s] <- get(beta.a0s[s])
      
      #-------- a1 ----------------------------------------------------------#
      #a1 = effect of effort on detection (normal distribution)
      a1.mean[year,s] <- get(a1s[s])$mean
      a1.sd[year,s] <- get(a1s[s])$sd
      
     
  
    }
  }
 
  ###### 2b. JAGS data ######
  effort.dat <- array(0, c(n.sites, n.occs, n.sims))
  
  #creating effort data matrix for jags 
  #assigning search effort to the locations where removal occured
  for(s in 1:n.sims){
    effort.dat[rem.vec[,year,s] >= 0,1:2,s] <- logsearch.effort[1,year,s] 
    if(year > 1){
      prev.state[,s] <- round(get(State.est[s])$mean)
    }else{
      prev.state[,s] <- 0
    }
  }
  
  
  #Parameters monitored
  parameters.to.save <- c("psi.est", "psi0", "psi1", "psi2","psi3" , "a0","a1", "State")
  
  #settings
  n.burnin <- 1000
  n.iter <- 10000 + n.burnin
  n.chains <- 3
  n.thin <- 1
  
  for(s in 1:n.sims){
    my.data[[s]] <- list( #constants
                         n.sites = n.sites,
                         n.occs = n.occs, 

                         #data
                         y.obs = y.obs[,,year,s],
                         previous.rem = previous.rem[,year,s],
                         site.char = site.char,
                         logeffort = effort.dat[,,s],
                         prev.state = prev.state[,s],
                         
                         #priors
                         psi0.a = psi0.a[year,s], 
                         psi0.b = psi0.b[year,s], 
                         
                         psi1.mean = psi1.mean[year,s], 
                         psi1.sd = psi1.sd[year,s], 
                         
                         psi2.mean = psi2.mean[year,s], 
                         psi2.sd = psi2.sd[year,s], 
                         
                         psi3.mean = psi3.mean[year,s], 
                         psi3.sd = psi3.sd[year,s], 

                         a0.a = a0.a[year,s],
                         a0.b = a0.b[year,s],
                         
                         a1.mean = a1.mean[year,s],
                         a1.sd = a1.sd[year,s]
                         

    )
  }
  
  ###### 2c. Run JAGS #####
  State.init <- array(NA, c(n.sites, n.sims))
  
  y.obs.info <- y.obs[,,year,]
  y.obs.info[is.na(y.obs.info)] <- 1
  
  
  for(s in 1:n.sims){
    for(i in 1:n.sites){
      State.init[i,s] <- max(y.obs.info[i,,s])
    }
  
    initial.values[[s]] <- function(){list(State = State.init[,s])}
    
  }
  
  for(s in 1:n.sims){
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]],inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_mod2.txt",
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
  #Effort level: remove at effort where detection probability is estimated to be 0.125
  #Removal locations: rank sites by occupancy probability, remove until resource is expelled
  
  #1. find effort where detection probability = 0.125
  
  det.p <- log(0.125/(1-0.125))
  
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

file_name = paste(path, 'States_e125_hocc.csv',sep = '/')
write.csv(States.df,file_name)


#mean across simulations
Mean.States.df <- aggregate(state ~ site+year,
                            data = as.data.frame(States.df), FUN = mean)


file_name = paste(path, 'Mean.States_e125_hocc.csv',sep = '/')
write.csv(Mean.States.df ,file_name)

#observation data -multi
y.obs.df <- adply(y.obs, c(1,2,3,4))

colnames(y.obs.df) <- c("site", "occasion", "year", "sim", "observed.state")              

file_name = paste(path, 'y.obs_e125_hocc.csv',sep = '/')
write.csv(y.obs.df,file_name)


rem.site.df <- y.obs.df %>% filter(observed.state == 1)
file_name = paste(path, 'rem.site_e125_hocc.csv',sep = '/')
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

file_name = paste(path, 'sites.visit_e125_hocc.csv',sep = '/')
write.csv(sites.df,file_name)

#### Estimated Data ####
##### Estimated States ####
States.est.df <- States.mean.years %>% select(site,year,sim,state)

file_name = paste(path, 'States.est_e125_hocc.csv',sep = '/')
write.csv(States.est.df,file_name)


#mean across simulations
Mean.States.est.df <- aggregate(state ~ site+year,
                                data = as.data.frame(States.est.df), FUN = mean)

file_name = paste(path, 'Mean.States.est_e125_hocc.csv',sep = '/')
write.csv(Mean.States.est.df ,file_name)

##### Estimated effort ####
logsearch.effort.df <- adply(logsearch.effort[1,,], c(1,2))

colnames(logsearch.effort.df) <- c("year", "sim", "effort")              

file_name = paste(path, 'logeffort_e125_hocc.csv',sep = '/')
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

file_name = paste(path, 'psis.est_e125_hocc.csv',sep = '/')
write.csv(psis.df,file_name)

###### psi0 ######
psi0s.est <- list()

for(s in 1:n.sims){
  assign(all.psi0[s], 
         cbind(get(all.psi0[s]), sim = s))
  
  psi0s.est[[s]] <- get(all.psi0[s])
}

psi0s.est.df <- do.call("rbind", psi0s.est)

file_name = paste(path, 'psi0s.est.est_e125_hocc.csv',sep = '/')
write.csv(psi0s.est.df,file_name)

###### psi1 ######
psi1s.est <- list()

for(s in 1:n.sims){
  assign(all.psi1[s], 
         cbind(get(all.psi1[s]), sim = s))
  
  psi1s.est[[s]] <- get(all.psi1[s])
}

psi1s.est.df <- do.call("rbind", psi1s.est)

file_name = paste(path, 'psi1s.est.est_e125_hocc.csv',sep = '/')
write.csv(psi1s.est.df,file_name)

###### psi2 ######
psi2s.est <- list()

for(s in 1:n.sims){
  assign(all.psi2[s], 
         cbind(get(all.psi2[s]), sim = s))
  
  psi2s.est[[s]] <- get(all.psi2[s])
}

psi2s.est.df <- do.call("rbind", psi2s.est)

file_name = paste(path, 'psi2s.est.est_e125_hocc.csv',sep = '/')
write.csv(psi2s.est.df,file_name)

###### psi3 ######
psi3s.est <- list()

for(s in 1:n.sims){
  assign(all.psi3[s], 
         cbind(get(all.psi3[s]), sim = s))
  
  psi3s.est[[s]] <- get(all.psi3[s])
}

psi3s.est.df <- do.call("rbind", psi3s.est)

file_name = paste(path, 'psi3s.est.est_e125_hocc.csv',sep = '/')
write.csv(psi3s.est.df,file_name)

###### a0 ######
a0s.est <- list()

for(s in 1:n.sims){
  assign(all.a0[s], 
         cbind(get(all.a0[s]), sim = s))
  
  a0s.est[[s]] <- get(all.a0[s])
}

a0s.est.df <- do.call("rbind", a0s.est)

file_name = paste(path, 'a0s.est.est_e125_hocc.csv',sep = '/')
write.csv(a0s.est.df,file_name)

###### a1 ######
a1s.est <- list()

for(s in 1:n.sims){
  assign(all.a1[s], 
         cbind(get(all.a1[s]), sim = s))
  
  a1s.est[[s]] <- get(all.a1[s])
}

a1s.est.df <- do.call("rbind", a1s.est)

file_name = paste(path, 'a1s.est.est_e125_hocc.csv',sep = '/')
write.csv(a1s.est.df,file_name)

###### rhat vals ######
file_name = paste(path, 'rhat.vals_e125_hocc.csv',sep = '/')
write.csv(rhat_vals,file_name)

#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

file_name = paste(path, 'e125_hocc_time.txt',sep = '/')
write.table(time.taken,file_name)

round((Mean.States.df %>% filter(year == n.years))[,3])
round((Mean.States.df %>% filter(year == n.years+1))[,3])


#round((Mean.States.df %>% filter(year == n.years))[,3])
#round((Mean.States.est.df %>% filter(year == n.years))[,3])

sum(round((Mean.States.df %>% filter(year == n.years+1))[,3]))
