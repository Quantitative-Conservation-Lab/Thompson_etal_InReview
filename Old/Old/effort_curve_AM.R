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
sink("Flower_mod.txt")
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
  logit(psi[i]) <- psi0 - psi1*previous.rem[i] 
    
  State[i] ~ dbern(psi[i])

  for(j in 1:n.occs){
    effort[i,j] ~ dbeta(effort.a, effort.b)

    logit(obs.pr[i,j]) <- a0 + a1*effort[i,j] #probability of detection
      
    y.obs[i,j] ~ dbin(obs.pr[i,j] * State[i], n.occs)
  
    } # occasions loop
      
} #sites loop
 
#--------------------------------------------------#    
#### PRIORS ####
  #psi = occupancy (invasion) probabilitiy (function of base rate and whether rempoval previously occured)
    psi0 ~ dbeta(psi0.a, psi0.b) #base occupancy rate
    psi1 ~ dnorm(psi1.mean,psi1.tau) #effect on removal previously taking place at site i 
    psi1.tau <- 1/(psi1.sd * psi1.sd) #precision
  
  #obs.pr = detection probability
    a0 ~ dbeta(a0.a, a0.b)
    a1 ~ dnorm(a1.mean, a1.tau)
    a1.tau <- 1/(a1.sd * a1.sd)
    
  
} #end model
", fill = TRUE)
sink()



#### Path Name ####
path <- here::here("results", "ESA", "high_occ_p_AM")
res <- c('results/ESA/high_occ_p_AM') 

#### Data ####
n.sims <- 2
n.sites <- 50 #number of sites
n.years <- 10 
n.occs <- 2 #number of occasions for occupancy data collection
n.rems <- 10

##### true state year 1 ####
state.pr <- State <- array(NA,c(n.sites, n.years, n.sims)) 
# effect of habitat quality on occupancy
site.char <- runif(n.sites) #might be multivariate
b0 <- -2 
b1 <- 1 

for(i in 1:n.sites){
  state.pr[i,1,1:n.sims] <- 1/(1+exp(-(b0 + b1*site.char[i]))) #inv.logit
  State[i,1,1:n.sims] <- rbinom(1,1,state.pr[i,1,1:n.sims]) #true state
}

gamma <- 0.1 #invasion probability 
eps <- 0.5 #eradication probability 
ps <- array(NA, c(2,n.sites,2))

##### occupancy data year 1 ####
#Say year 1 we do a massive search and look at each site 
#then in subsequent years we choose 10 sites for removal

#effect of effort on detection 
#Randomly assigns effort at each site 
#Should this be an annual value?)
effort <- array(runif(n.sites*n.occs), c(n.sites,n.occs,n.years, n.sims))
a0 <- -1
a1 <- 1 

obs.pr <- y.obs <- array(NA,c(n.sites, n.occs, n.years, n.sims))
rem.vec <- array(NA, c(n.sites, n.years, n.sims)) #removal sites array

#simulate occupancy data for year 1 across sims
year <- 1

for(s in 1:n.sims){
  for(i in 1:n.sites){
    for(j in 1:2){ #occasions loop
      obs.pr[i,j, year, s] <- 1/(1+exp(-(a1 + a1*log(effort[i,j,year,s]))))
    }
    
    #first occasion occupancy data
    y.obs[i,1, year, s] <- rbinom(1,1,obs.pr[i,1, year, s])*State[i, year, s]
    
    #second occasion occupancy data
    if(y.obs[i,1, year, s]==1){ #if already seen, do not search again
      y.obs[i,2, year, s] <- NA 
    }else{
      y.obs[i,2, year, s] <- rbinom(1,1,obs.pr[i,2, year, s])*State[i, year, s] #occupancy data
    }
    
    #Create vector noting where removals occurred
    if(i %in% which(rowSums(y.obs[,,year,s], na.rm = T) != 0)){ #if we detected flowering rush
      rem.vec[i,year,s] <- 1 #then note we removed there
    }else{
      rem.vec[i,year,s] <- 0
    }
  } #ends sites loop
} #ends sims loop


#check
#y.obs[,,year,s]
#which(rowSums(y.obs[,,year,s], na.rm = T) != 0)

#### JAGS arrays ####

#priors:
psi0.a <- array(NA, c(n.years, n.sims))
psi0.b <- array(NA, c(n.years, n.sims))

psi1.mean <- array(NA, c(n.years, n.sims))
psi1.sd <- array(NA, c(n.years, n.sims))

effort.a <- array(NA, c(n.years, n.sims))
effort.b <- array(NA, c(n.years, n.sims))

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

site.rems<- array(NA, c(n.rems, n.years, n.sims))

effort.mcmc <- list()

####################################################################################
#### Run Adaptive Management ####

year <- 1
#year <- 2

for(year in 1:n.years){
  #### 1. Simulate truth #####
  if(year > 1){ #we simulated year 1 data above
    
    ###### State Transitions ######
    for(s in 1:n.sims){
      for(i in 1:(n.sites)){
        ps[1,i,1] <- 1-gamma #empty stay empty
        ps[1,i,2] <- gamma #invasion probability
  
          
        ps[2,i,1] <- eps*rem.vec[i,year-1,s] #invaded to empty
        ps[2,i,2] <- 1- eps*rem.vec[i,year-1,s] #stays invaded
  
        State[i,year,s] <- rcat(1,ps[State[i,year-1,s] + 1, i, ])
        
      } 
    }
    
    
    ###### Occupancy data ######
    for(s in 1:n.sims){
      for(i in 1:n.sites){
        
        if(i %in% site.rems[,year,s]){
          for(j in 1:2){ #occasions loop
            obs.pr[i,j, year, s] <- 1/(1+exp(-(a1 + a1*log(effort[i,j,year,s]))))
          }
          
          #first occasion occupancy data
          y.obs[i,1, year, s] <- rbinom(1,1,as.numeric(obs.pr[i,1, year, s]))*State[i, year, s]
          
          #second occasion occupancy data
          if(y.obs[i,1, year, s]==1){ #if already seen, do not search again
            y.obs[i,2, year, s] <- NA 
          }else{
            y.obs[i,2, year, s] <- rbinom(1,1,as.numeric(obs.pr[i,2, year, s]))*State[i, year, s] #occupancy data
          }
          
          #Create vector noting where removals occurred
          if(i %in% which(rowSums(y.obs[,,year,s], na.rm = T) != 0)){ #if we detected flowering rush
            rem.vec[i,year,s] <- 1 #then note we removed there
          } else{
            rem.vec[i,year,s] <- 0
          }
        }else{rem.vec[i,year,s] <- 0}
      } #ends sites loop
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
    
    #effort (beta distribution)
      effort.a[year,] <- 1
      effort.b[year,] <- 1
    
    
    #obs.pr = detection probability
    #a0 = base detection (beta distribution)
      a0.a[year,] <- 1
      a0.b[year,] <- 1
    
    #a1 = effect of effort on detection
      a1.mean[year,] <- 0
      a1.sd[year,] <- 10
    
    
  } else{
    #------------------------Year 1+ Priors------------------------#
    #### FIX !!! ####
    for(s in 1:n.sims){
      #psi = occupancy probability
      #psi0 = base occupancy rate (beta distribution)
      psi0.a[year,] <- 1
      psi0.b[year,] <- 1
      
      #psi1 = effect on removal previously taking place (normal distribution)
      psi1.mean[year,] <- 0
      psi1.sd[year,] <- 10
      
      #effort (beta distribution)
      effort.a[year,] <- 1
      effort.b[year,] <- 1
      
      
      #obs.pr = detection probability
      #a0 = base detection (beta distribution)
      a0.a[year,] <- 1
      a0.b[year,] <- 1
      
      #a1 = effect of effort on detection
      a1.mean[year,] <- 0
      a1.sd[year,] <- 10
      
    
    
    }
  }
 
  ###### 2b. JAGS data ######
  
  #Parameters monitored
  parameters.to.save <- c("psi0", "psi1","a0","a1","effort", "State", 
                          "obs.pr")
  
  
  #settings
  n.burnin <- 10
  n.iter <- 100 + n.burnin
  n.chains <- 3
  n.thin <- 1
  
  for(s in 1:n.sims){
    my.data[[s]] <- list( #constants
                         n.sites = n.sites,
                         n.occs = n.occs, 

                         #data
                         y.obs = y.obs[,,year,s],
                         previous.rem = rem.vec[,year,s],
                         
                         #priors
                         psi0.a = psi0.a[year,s], 
                         psi0.b = psi0.b[year,s], 
                         
                         psi1.mean = psi1.mean[year,s], 
                         psi1.sd = psi1.sd[year,s], 

                         effort.a = effort.a[year,s],
                         effort.b = effort.b[year,s],

                         a0.a = a0.a[year,s],
                         a0.b = a0.b[year,s],
                         
                         a1.mean = a1.mean[year,s],
                         a1.sd = a1.sd[year,s]

    )
  }
  
  ###### 2c. Run JAGS #####
  State.init <- array(1, c(n.sites))
  
  #State.init[,2:n.months] <- State[,2:n.months,year]
  initial.values <- function(){list(State = State.init)}
  
  for(s in 1:n.sims){
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]],inits = initial.values,
                        parameters.to.save = parameters.to.save, model.file = "Flower_mod.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
  }
  
  #### 3. Decision for year 2 ####
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
  
  
  ###### 3a. Make decision  #####
  #Removal decision: remove at 10 sites based on the efffort/detection curve
  
  for(s in 1:n.sims){
    obs.pr[s]<- paste("obs.pr", s, sep = "_")
    assign(obs.pr[s], filter(get(outputs[s]), grepl("^obs.pr", param)))
  }
  
  obs.pr_1$sites <- rep(seq(1,n.sites), 2)
  obs.pr_1$occs <- rep(1:2, each = n.sites)
  
  obs.pr_2$sites <- rep(seq(1,n.sites), 2)
  obs.pr_2$occs <- rep(1:2, each = n.sites)
  

  #extracting effort
  effort.mcmc_1 <- filter(get(outputs[1]), grepl("^effort", param))
  effort.mcmc_1$sites <- rep(seq(1,n.sites), 2)
  effort.mcmc_1$sites <- rep(seq(1,n.sites), 2)
  
  #plot effort vs probability for simulation 1 
  plot(effort.mcmc_1$mean, obs.pr_1$mean)
  
  
  #choose removal sites ??
  
  
  
  ##### FIX ####
  if(year < 6){
    site.rems[,year+1,1] <- seq(1,10) 
    site.rems[,year+1,2] <- seq(1,10) 
  

  } #ends year < 6 loop
  
  # ###### 3b. Save data from MCMC  #####
  # #### To do ####
  # for(s in 1:n.sims){
  #   mcmcs[s]<- paste("mcmc", s, sep = "_")
  #   assign(mcmcs[s], get(outs[s])$samples)
  # }
  # 
  # 
  # #select random 5 sims for sampling
  # rand5 <- c(1,2)
  # # rand5 <- sample(seq(1:n.sims), 5, replace = F)
  # 
  # for(s in rand5){
  #   
  #   MCMCtrace(get(mcmcs[s]), 
  #             params = 'a0', 
  #             type = 'density', 
  #             ind = TRUE, 
  #             pdf = TRUE, 
  #             open_pdf = FALSE,
  #             filename = paste0(res,'/a0_sim_', s, '_year', year))
  #   
  # }
  # 
  # 
  # #save rhat outputs
  # for(s in 1:n.sims){
  #   x[[s]] <- as.numeric(unlist(get(outputsfull[s])$Rhat))
  #   rhat_vals[year,s] <-  sum(x[[s]] > 1.1, na.rm = TRUE)/ length(x[[s]])
  # }
  

  
} #end adaptive management 

#################################################################################################
