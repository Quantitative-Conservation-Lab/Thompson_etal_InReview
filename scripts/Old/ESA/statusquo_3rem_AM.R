library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(plyr)
library(tidyverse)
library(strex)
library(here)

start.time <- Sys.time()

#### JAGS MODEL ####

start.time <- Sys.time()

sink("Flower_mod_basic.txt")
cat("
model{

# -------------------------------------------------
# States (S):
# 1 empty
# 2 low state
# 3 high state
# 
# Observations (y.multi):  
# 1 not detected
# 2 detected low state
# 3 detected high state
# -------------------------------------------------

#--------------------------------------------------#  
#### PRIORS ####

  #detection parameters
  
  rho.l ~ dbeta(pl.a,pl.b) #base detection for low state
  rho.h ~ dbeta(ph.a,ph.b) #base detection for high state

  delta ~ dbeta(delta.a, delta.b) #probability of observing the high state given species has been detected and true state is high

  pmulti.l <-  rho.l
  pmulti.h <-  rho.h
  
  #state parameters
  
  for (i in 1:n.sites){  
    omega[i] ~ dbeta(omega.a[i], omega.b[i]) #probability of being invaded regardless of state
    phi[i] ~ dbeta(phi.a[i], phi.b[i]) #conditional probability that FR is high abundance given present
    
    ps[1,i] <- 1-omega[i] #probability of not invaded
    ps[2,i] <- omega[i]*(1-phi[i]) #probability of invaded at low abundance
    ps[3,i] <- omega[i]*phi[i] #probability of invaded at high abundance
  
    
  #--------------------------------------------------#
  # OBSERVATION PROBABILITIES 
    # Observation probabilities of given S(t)
    #index = [current state, location, current observation]
   
    #Empty and not detected    
    po.multi[1,i,1] <- 1
    
    #Empty and detected low 
    po.multi[1,i,2] <- 0
    
    #Empty and detected high  
    po.multi[1,i,3] <- 0
 
    #Low state and not detected   
    po.multi[2,i,1] <- 1-pmulti.l #not detected probability
    
    #Low state and detected low 
    po.multi[2,i,2] <- pmulti.l #detection probability
      
    #Low state and detected high 
    po.multi[2,i,3] <- 0 
      
    #High state and not detected   
    po.multi[3,i,1] <- 1-pmulti.h #not detected probability
      
    #High state and detected low 
    po.multi[3,i,2] <- (1-pmulti.h)*(1-delta) #detection probability
      
    #high abundance detected high abundance
    po.multi[3,i,3] <- pmulti.h*delta

  #--------------------------------------------------#
  #### LIKELIHOOD ####
    State[i] ~ dcat(ps[,i])
  
    y.multi[i] ~ dcat(po.multi[State[i], i, ])
  
    #Derived parmeter
    State.fin[i] <- State[i] 
   
} #i
  
} #end model
", fill = TRUE)
sink()

path <- here::here("results", "ESA", "statusquo")
res <- c('results/ESA/statusquo') #subset of path for plot save


#### Data ####
n.sims <- 100 #simulations
eps.l <- 0.9 #eradication when at low state
eps.h <- 0.7 #eradication when at high state

phi.lh <- 0.1 #transition from low to high
phi.hh <- 0.9 #transition from high to high

pmulti.l <- 0.6 #detection probability (for multistate data)
pmulti.h <- 0.9 #detection probability (for multistate data)
delta <- 0.5
n.sites <- 5 #number of sites
n.rem <- 3 #number of removal sites per week
n.obs <- 3
n.years <- 10 #time steps
n.states <- 3

ps<- array(NA, c(n.states,n.sites, n.states)) #state transition array

gamma <- array(NA, c(n.sites,n.years,n.sims)) #invasion
gamma0 <- -2 #intrinsic invasion
gamma1 <- 0.5 #effect of neighboring locations on invasion probability

#transition probabilities
State <- array(NA, c(n.sites, n.years, n.sims))

# Observation probabilities 
Obs.multi <- array(NA, c(n.sites, n.years, n.sims))

#observation probabilities for multistate observation data
po.multi<- array(NA, c(n.states,n.states))
po.multi[1,1] <- 1
po.multi[1,2] <- 0
po.multi[1,3] <- 0

po.multi[2,1] <- 1-pmulti.l
po.multi[2,2] <- pmulti.l
po.multi[2,3] <- 0

po.multi[3,1] <- 1-pmulti.h
po.multi[3,2] <- (1-pmulti.h)*delta
po.multi[3,3] <- pmulti.h*delta

sites.rem <- array(NA, dim = c(n.rem, n.years, n.sims))

##### year 1 #####
#Initial True State 
State[1,1,] <- 3 
State[2,1,] <- 3 
State[3,1,] <- 2 
State[4,1,] <- 2 
State[5,1,] <- 1 

site.selected <- c(1,3,5)

year <- 1
for(s in 1:n.sims){
  for(i in site.selected){
    Obs.multi[i,year,s] <- rcat(1,po.multi[State[i,year,s], ])
  }
}

for(s in 1:n.sims){
  if(length(which(Obs.multi[,year,s] > 1)) == 0){
    sites.rem[,year,s] <- rep(NA,n.rem)
  }else{
    sites.rem[1:length(which(Obs.multi[,year,s] > 1)), year, s] <- which(Obs.multi[,year,s] > 1)
  }
}


D <- array(NA, c(n.sites,n.years,n.sims)) #neighbor states

#### JAGS data ####
#State parameters:
omega.a <- array(NA, c(n.sites,n.years,n.sims))
omega.b <- array(NA, c(n.sites,n.years,n.sims))

phi.a <- array(NA, c(n.sites,n.years,n.sims))
phi.b <- array(NA, c(n.sites,n.years,n.sims))

#Detection parameters:
pl.a <- array(NA, c(n.years, n.sims))
pl.b <- array(NA, c(n.years, n.sims))
ph.a <- array(NA, c(n.years, n.sims))
ph.b <- array(NA, c(n.years, n.sims))

delta.a <- array(NA, c(n.years, n.sims))
delta.b <- array(NA, c(n.years, n.sims))

S.init <-  array(NA, c(n.sites, n.years, n.sims))
D.init <- array(NA, c(n.sites,n.years,n.sims))
rem.vec <- array(NA, dim = c(n.sites, n.years, n.sims))

rhat.vals <- array(NA, c(n.years, n.sims))
my.data <- list()
outs <- rep(NA,n.sims)
outputsfull <- rep(NA, n.sims)
outputs <- rep(NA, n.sims)
mcmcs <- rep(NA, n.sims)
x <- list()
final.states <- rep(NA, n.sims)
sites <- list()

omega.est <- rep(NA, n.sims)
phi.est <- rep(NA, n.sims)

rho.l.est <- rep(NA, n.sims)
rho.h.est <- rep(NA, n.sims)

delta.est <- rep(NA, n.sims)

all.final.states <- rep(NA, n.sims)
all.omega.est <- rep(NA, n.sims)
all.phi.est <- rep(NA, n.sims)

all.rho.l.est <- rep(NA, n.sims)
all.rho.h.est <- rep(NA, n.sims)

all.delta.est <- rep(NA, n.sims)

final.states.mean <- array(NA, dim = c(n.sites, n.years, n.sims))
site.rem.options <- list()

alpha.omegas <- rep(NA, n.sims)
beta.omegas <- rep(NA, n.sims)
alpha.phis <- rep(NA, n.sims)
beta.phis <- rep(NA, n.sims)

alpha.rhols <- rep(NA, n.sims)
beta.rhols <- rep(NA, n.sims)
alpha.rhohs <- rep(NA, n.sims)
beta.rhohs <- rep(NA, n.sims)

alpha.delta <- rep(NA, n.sims)
beta.delta <- rep(NA, n.sims)

initial.values <- list() #initial value list
final.states.mean <- array(NA, dim = c(n.sites, n.years, n.sims))
final.mean <- array(NA, dim = c(n.sites, n.years, n.sims))

####################################################################################
#### Run ####
year <- 1

for(year in 1:n.years){

#### 1. Simulate truth #####
for(s in 1:n.sims){

#----- year > 1 simulations -----#
if(year > 1){
    for(i in 1:(n.sites)){
      ###### State Transitions ######
      ##---- edge transitions ----##
      if(i %in% 2:(n.sites-1)){
        D[i,year-1,s] <- State[i+1,year-1,s] + State[i-1,year-1,s] 
        gamma[i,year-1,s] <- invlogit(gamma0 + gamma1*D[i,year-1,s]) #invasion probability
        
        ps[1,i,1] <- 1-gamma[i,year-1,s] #empty stay empty
        ps[1,i,2] <- gamma[i,year-1,s] #empty to low abundance
        ps[1,i,3] <- 0
        
      }else{
        D[1,year-1,s] <- State[2,year-1,s]
        D[n.sites,year-1,s] <- State[(n.sites-1),year-1,s]
        
        gamma[1,year-1,s] <- invlogit(gamma0 + gamma1*D[1,year-1,s])
        ps[1,1,1] <- 1-gamma[i,year-1,s] #empty stay empty
        ps[1,1,2] <- gamma[i,year-1,s]
        ps[1,1,3] <- 0
        
        gamma[n.sites,year-1,s] <- invlogit(gamma0 + gamma1*D[n.sites,year-1,s])
        ps[1,n.sites,1] <- 1-gamma[i,year-1,s] #empty stay empty
        ps[1,n.sites,2] <- gamma[i,year-1,s]
        ps[1,n.sites,3] <- gamma[i,year-1,s]
      }
      
      ###### removal site transitions #####
      #Transitions if in removal site locations
      if(i %in% discard(sites.rem[,year-1,s], is.na) ){
        ps[2,i,1] <- eps.l #low abundance to empty
        ps[2,i,2] <- (1- eps.l*(1-phi.lh)) #low abundance to low abundance
        ps[2,i,3] <- (1- eps.l*(phi.lh)) #low abundance to high abundance
        
        ps[3,i,1] <- (eps.h) #high abundance to empty
        ps[3,i,2] <- (1- eps.h)*(1-phi.hh) #high abundance to low abundance
        ps[3,i,3] <- (1- eps.h)*(phi.hh) #high abundance to high abundance
      }else{
        ps[2,i,1] <- 0 #low abundance to empty
        ps[2,i,2] <- (1-phi.lh) #low abundance to low abundance
        ps[2,i,3] <- (phi.lh) #low abundance to high abundance
        
        ps[3,i,1] <- 0
        ps[3,i,2] <- (1-phi.hh) #high abundance to low abundance
        ps[3,i,3] <- (phi.hh) #high abundance to high abundance
      }
      
      State[i,year,s] <- rcat(1,ps[State[i,year-1,s], i, ])
      
    }
    
    ###### Observation data ######
    for(i in site.selected){
      Obs.multi[i,year,s] <- rcat(1,po.multi[State[i,year,s], ])
    }
    
    ###### Sites for removal ######
    if(length(which(Obs.multi[,year,s] > 1)) == 0){
      sites.rem[,year,s] <- rep(NA,n.rem)
    }else{
      sites.rem[1:length(which(Obs.multi[,year,s] > 1)), year, s] <- which(Obs.multi[,year,s] > 1)
    }
  
  
} #ends year > 1 things
  
} #ends simulations


#check:
# discard(sites.rem[,year,1], is.na)
# Obs.multi[, year, 1]
# State[,year,1]
# 
# discard(sites.rem[,year,2], is.na)
# Obs.multi[, year, 2]
# State[,year,2]

##### Initial priors #####
#------------------------Year 1 Priors------------------------#
if(year == 1){
  
  #State process
  omega.a[,1,] <- 1
  omega.b[,1,] <- 1
  
  phi.a[,1,] <- 1
  phi.b[,1,] <- 1
  
  #Observation process
  
  pl.a[1,] <- 1
  pl.b[1,] <- 1
  
  ph.a[1,] <- 1
  ph.b[1,] <- 1
  
  delta.a[1,] <- 1
  delta.b[1,] <- 1
    
  }else{
  for(s in 1:n.sims){
    ##### Year 1+ prior #####
    #State process
    #-------phi priors -------#
    alpha.phis[s]<- paste("alpha.phi", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.phis[s],
           (1 - get(phi.est[s])$mean*(1 + get(phi.est[s])$cv^2))/(get(phi.est[s])$cv^2))
    
    beta.phis[s]<- paste("beta.phi", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.phis[s],
           get(alpha.phis[s])*(1 - get(phi.est[s])$mean)/get(phi.est[s])$mean)
    
    #assigning these values for the next jags run:
    phi.a[,year,s] <- get(alpha.phis[s])
    phi.b[,year,s] <- get(beta.phis[s])
    
    #-------omega priors -------#
    alpha.omegas[s]<- paste("alpha.omega", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.omegas[s],
           (1 - get(omega.est[s])$mean*(1 + get(omega.est[s])$cv^2))/(get(omega.est[s])$cv^2))
    
    beta.omegas[s]<- paste("beta.phi", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.omegas[s],
           get(alpha.omegas[s])*(1 - get(omega.est[s])$mean)/get(omega.est[s])$mean)
    
    #assigning these values for the next jags run:
    omega.a[,year,s] <- get(alpha.omegas[s])
    omega.b[,year,s] <- get(beta.omegas[s])
    
   
    

    #Observation process
    #-------rho priors: base detection -------#
    ## Low ##
    alpha.rhols[s]<- paste("alpha.pl", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.rhols[s],
           (1 - get(rho.l.est[s])$mean*(1 + get(rho.l.est[s])$cv^2))/(get(rho.l.est[s])$cv^2))
    
    beta.rhols[s]<- paste("beta.pl", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.rhols[s],
           get(alpha.rhols[s])*(1 - get(rho.l.est[s])$mean)/get(rho.l.est[s])$mean)
    
    #assigning these values for the next jags run:
    pl.a[year,s] <- get(alpha.rhols[s])
    pl.b[year,s] <- get(beta.rhols[s])

    ## High ##
    alpha.rhohs[s]<- paste("alpha.ph", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.rhohs[s],
           (1 - get(rho.h.est[s])$mean*(1 + get(rho.h.est[s])$cv^2))/(get(rho.h.est[s])$cv^2))
    
    beta.rhohs[s]<- paste("beta.ph", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.rhohs[s],
           get(alpha.rhohs[s])*(1 - get(rho.h.est[s])$mean)/get(rho.h.est[s])$mean)
    
    #assigning these values for the next jags run:
    ph.a[year,s] <- get(alpha.rhohs[s])
    ph.b[year,s] <- get(beta.rhohs[s])
    
    #-------delta priors -------#
    #delta = probability of observing the high state given species has been detected and true state is high
    alpha.delta[s]<- paste("alpha.delta", s, sep = "_")
    #assigning alpha values for beta: alpha = (1-mean)*(1+cv^2)/cv^2
    assign(alpha.delta[s],
           (1 - get(delta.est[s])$mean*(1 + get(delta.est[s])$cv^2))/(get(delta.est[s])$cv^2))
    
    beta.delta[s]<- paste("beta.delta", s, sep = "_")
    #assigning beta values for beta: beta = (alpha)*(1-mean)/(mean)
    assign(beta.delta[s],
           get(alpha.delta[s])*(1 - get(delta.est[s])$mean)/get(delta.est[s])$mean)
    
    #assigning these values for the next jags run:
    delta.a[year,s] <- get(alpha.delta[s])
    delta.b[year,s] <- get(beta.delta[s])
    
  }
  
  
} #ends priors loops

###### 2b. JAGS data ######

#Parameters monitored
parameters.to.save <- c("State.fin", "omega", "phi",
                        "rho.l", "rho.h",
                        "delta")


#settings: this works fine
n.burnin <- 1000
n.iter <- 10000 + n.burnin
n.chains <- 3
n.thin <- 1

for(s in 1:n.sims){
  my.data[[s]] <- list(n.sites = n.sites,
                       y.multi = Obs.multi[,year,s],
                       
                       #priors
                       phi.a = phi.a[,year,s],
                       phi.b = phi.b[,year,s],
                       omega.a = omega.a[,year,s],
                       omega.b = omega.b[,year,s],
                       
                       pl.a = pl.a[year,s], 
                       pl.b = pl.b[year,s],

                       ph.a = ph.a[year,s], 
                       ph.b = ph.b[year,s],
                      
                       delta.a = delta.a[year,s],
                       delta.b = delta.b[year,s]                  
                       
 
  )
}

###### 2c. Run JAGS #####
##### Run year 1 #####
if(year == 1){
  
  State.start <- array(NA, c(n.sites,n.sims))
  
  State.start <- Obs.multi[,year,]
  
    
  for(s in 1:n.sims){
    initial.values[[s]] <- function()list(State = State.start[,s])
    }
  
  for(s in 1:n.sims){
    
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]], inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_mod_basic.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
  }
    
}else{
    
  ##### Run year > 1 #####
  State.start <- array(NA, c(n.sites,n.sims))
  
  State.start <- Obs.multi[,year,]
  
  
  for(s in 1:n.sims){
    initial.values[[s]] <- function()list(State = State.start[,s])
  }
  
  for(s in 1:n.sims){
    
    outs[s]<- paste("out", s, sep = "_")
    assign(outs[s],
           jagsUI::jags(data = my.data[[s]], inits = initial.values[[s]],
                        parameters.to.save = parameters.to.save, model.file = "Flower_mod_basic.txt",
                        n.chains = n.chains, n.thin = n.thin, n.iter = n.iter , n.burnin = n.burnin))
  }
  
}

#### 3. Extract estimation results ####
###### 3a. Extract parameters #####
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



for(s in 1:n.sims){
  mcmcs[s]<- paste("mcmc", s, sep = "_")
  assign(mcmcs[s], get(outs[s])$samples)
}

#select random 5 sims for sampling
rand5 <- sample(seq(1:n.sims), 5, replace = F)

for(s in rand5){

  MCMCtrace(get(mcmcs[s]), 
            params = 'rho.l', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/rho.l_sim_', s, '_year', year))

  MCMCtrace(get(mcmcs[s]), 
            params = 'rho.h', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/rho.h_sim_', s, '_year', year))
  
  
  MCMCtrace(get(mcmcs[s]), 
            params = 'delta', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/delta_sim_', s, '_year', year))
  
  
}

#save rhat outputs
for(s in 1:n.sims){
  x[[s]] <- as.numeric(unlist(get(outputsfull[s])$Rhat))
  rhat.vals[year,s] <-  sum(x[[s]] > 1.1, na.rm = TRUE)/ length(x[[s]])
}


#-------Final States -------#
for(s in 1:n.sims){
  final.states[s]<- paste("final.states", s, sep = "_")
  assign(final.states[s], filter(get(outputs[s]), grepl("^S", param)))
  
  sites[[s]] <- as.numeric(str_nth_number((get(final.states[s]))$param, n = 1))
  
}


for(s in 1:n.sims){
  assign(final.states[s], 
         cbind(get(final.states[s]), site = sites[[s]])) #adding site column  
}

#-------phi -------#
for(s in 1:n.sims){
  phi.est[s]<- paste("phi.est", s, sep = "_")
  assign(phi.est[s], filter(get(outputs[s]), grepl("^phi", param)))
  
  assign(phi.est[s], 
         cbind(get(phi.est[s]), cv = get(phi.est[s])$sd/get(phi.est[s])$mean
         ))  

  sites[[s]] <- as.numeric(str_nth_number((get(phi.est[s]))$param, n = 1))
  
}

for(s in 1:n.sims){
  assign(phi.est[s], 
         cbind(get(phi.est[s]), site = sites[[s]])) #adding site column  
}

#-------omega -------#
for(s in 1:n.sims){
  omega.est[s]<- paste("omega.est", s, sep = "_")
  assign(omega.est[s], filter(get(outputs[s]), grepl("^omega", param)))
  
  assign(omega.est[s], 
         cbind(get(omega.est[s]), cv = get(omega.est[s])$sd/get(omega.est[s])$mean
         ))  
  
  sites[[s]] <- as.numeric(str_nth_number((get(omega.est[s]))$param, n = 1))
  
}

for(s in 1:n.sims){
  assign(omega.est[s], 
         cbind(get(omega.est[s]), site = sites[[s]])) #adding site column  
}

#-------rho.l.est -------#
for(s in 1:n.sims){
  rho.l.est[s]<- paste("rho.l.est", s, sep = "_")
  assign(rho.l.est[s], filter(get(outputs[s]), grepl("^rho.l", param)))
  
  assign(rho.l.est[s], 
         cbind(get(rho.l.est[s]), cv = get(rho.l.est[s])$sd/get(rho.l.est[s])$mean
         ))  
  
}

#-------rho.h.est -------#
for(s in 1:n.sims){
  rho.h.est[s]<- paste("rho.h.est", s, sep = "_")
  assign(rho.h.est[s], filter(get(outputs[s]), grepl("^rho.h", param)))
  
  assign(rho.h.est[s], 
         cbind(get(rho.h.est[s]), cv = get(rho.h.est[s])$sd/get(rho.h.est[s])$mean
         ))  
  
}


#-------delta -------#
for(s in 1:n.sims){
  delta.est[s]<- paste("delta.est", s, sep = "_")
  assign(delta.est[s], filter(get(outputs[s]), grepl("^delta", param)))
  
  assign(delta.est[s], 
         cbind(get(delta.est[s]), cv = get(delta.est[s])$sd/get(delta.est[s])$mean
         ))  
  
}


#save annual data
for(s in 1:n.sims){
  assign(final.states[s], 
         cbind(get(final.states[s]), year = year))
  
  assign(phi.est[s], 
         cbind(get(phi.est[s]), year = year))
  
  
  assign(omega.est[s], 
         cbind(get(omega.est[s]), year = year))
  
  assign(rho.l.est[s], 
         cbind(get(rho.l.est[s]), year = year))
  
  assign(rho.h.est[s], 
         cbind(get(rho.h.est[s]), year = year))
  
  
  assign(delta.est[s], 
         cbind(get(delta.est[s]), year = year))
  
}

for(s in 1:n.sims){
  
  all.final.states[s]<- paste("final.states.allsummary", s, sep = "_")
  all.phi.est[s]<- paste("phi.allsummary", s, sep = "_")
  all.omega.est[s]<- paste("omega.allsummary", s, sep = "_")
  
  all.rho.l.est[s]<- paste("rho.l.allsummary", s, sep = "_")
  all.rho.h.est[s]<- paste("rho.h.allsummary", s, sep = "_")
 
  all.delta.est[s]<- paste("delta.allsummary", s, sep = "_")
  
  #If year 1 we set summary data frame to itself
  if(year == 1){
    assign(all.final.states[s], 
           get(final.states[s]))
    
    assign(all.phi.est[s], 
           get(phi.est[s]))
    
    assign(all.omega.est[s], 
           get(omega.est[s]))
    
    assign(all.rho.l.est[s], 
           get(rho.l.est[s]))
    
    assign(all.rho.h.est[s], 
           get(rho.h.est[s]))
    
    assign(all.delta.est[s], 
           get(delta.est[s]))
    
  }else{ #if beyond first year, we append previous summary to new summary
    assign(all.final.states[s], 
           rbind(get(all.final.states[s]), get(final.states[s])))
    
    assign(all.phi.est[s], 
           rbind(get(all.phi.est[s]), get(phi.est[s])))
    
    assign(all.omega.est[s], 
           rbind(get(all.omega.est[s]), get(omega.est[s])))
    
    assign(all.rho.l.est[s], 
           rbind(get(all.rho.l.est[s]), get(rho.l.est[s])))
    
    assign(all.rho.h.est[s], 
           rbind(get(all.rho.h.est[s]), get(rho.h.est[s])))
    
    assign(all.delta.est[s], 
           rbind(get(all.delta.est[s]), get(delta.est[s])))
    
  }
}

for(s in 1:n.sims){
  final.states.mean[,year,s] <- round((get(final.states[s]))$mean)
  final.mean[,year,s] <- get(final.states[s])$mean #not rounded
}

final.mean.wide <- data.frame(t(final.mean[,year,]))
colnames(final.mean.wide) <- seq(1:n.sites)
final.mean.wide$sim <- seq(1:n.sims)  

final.mean.long <- gather(final.mean.wide, site, state, 1:5, factor_key=TRUE)
final.mean.long$site <- as.numeric(final.mean.long$site)

final.mean.long$year <- year

if(year == 1){
  final.mean.years <- final.mean.long
}else{
  final.mean.years <- rbind(final.mean.years, final.mean.long)
}
  
}


#################################################################################################

#### Save True Data ####
#results for each sim
States.df <- adply(State, c(1,2,3))

colnames(States.df) <- c("site", "year", "sim", "state")              

file_name = paste(path, 'States_statusquo.csv',sep = '/')
write.csv(States.df,file_name)


#mean across simulations
Mean.States.df <- aggregate(state ~ site+year,
                            data = as.data.frame(States.df), FUN = mean)


file_name = paste(path, 'Mean.States_statusquo.csv',sep = '/')
write.csv(Mean.States.df ,file_name)

#observation data
Obs.multi.df <- adply(Obs.multi, c(1,2,3))

colnames(Obs.multi.df) <- c("site", "year", "sim", "observed.state")              

file_name = paste(path, 'Obs.multi_statusquo.csv',sep = '/')
write.csv(Obs.multi.df,file_name)

#### Estimated Data ####
##### Estimated States ####
States.est.df <- final.mean.years %>% select(site,year,sim,state)

file_name = paste(path, 'States.est_statusquo.csv',sep = '/')
write.csv(States.est.df,file_name)


#mean across simulations
Mean.States.est.df <- aggregate(state ~ site+year,
                            data = as.data.frame(States.est.df), FUN = mean)

file_name = paste(path, 'Mean.States.est_statusquo.csv',sep = '/')
write.csv(Mean.States.est.df ,file_name)

##### Estimated parameters ####
###### omega ######

omegas <- list()

for(s in 1:n.sims){
  assign(all.omega.est[s], 
         cbind(get(all.omega.est[s]), sim = s))
  
  omegas[[s]] <- get(all.omega.est[s])
}

omegas.df <- do.call("rbind", omegas)

file_name = paste(path, 'omegas.est_statusquo.csv',sep = '/')
write.csv(omegas.df,file_name)


###### phi ######

phis <- list()

for(s in 1:n.sims){
  assign(all.phi.est[s], 
         cbind(get(all.phi.est[s]), sim = s))
  
  phis[[s]] <- get(all.phi.est[s])
}

phis.df <- do.call("rbind", phis)

file_name = paste(path, 'phis.est_statusquo.csv',sep = '/')
write.csv(phis.df,file_name)

###### rho.l ######
rho.ls <- list()

for(s in 1:n.sims){
  assign(all.rho.l.est[s], 
         cbind(get(all.rho.l.est[s]), sim = s))
  
  rho.ls[[s]] <- get(all.rho.l.est[s])
}

rho.ls.df <- do.call("rbind", rho.ls)

file_name = paste(path, 'rho.ls.est_statusquo.csv',sep = '/')
write.csv(rho.ls.df,file_name)

###### rho.h ######
rho.hs <- list()

for(s in 1:n.sims){
  assign(all.rho.h.est[s], 
         cbind(get(all.rho.h.est[s]), sim = s))
  
  rho.hs[[s]] <- get(all.rho.h.est[s])
}

rho.hs.df <- do.call("rbind", rho.ls)

file_name = paste(path, 'rho.hs.est_statusquo.csv',sep = '/')
write.csv(rho.hs.df,file_name)

###### delta ######
deltas <- list()

for(s in 1:n.sims){
  assign(all.delta.est[s], 
         cbind(get(all.delta.est[s]), sim = s))
  
  deltas[[s]] <- get(all.delta.est[s])
}

deltas.df <- do.call("rbind", deltas)

file_name = paste(path, 'deltas.est_statusquo.csv',sep = '/')
write.csv(deltas.df,file_name)

###### rhat vals ######
file_name = paste(path, 'rhat.vals_statusquo.csv',sep = '/')
write.csv(rhat.vals,file_name)

#### TIMING ####
end.time <- Sys.time()
time.taken <- end.time - start.time

file_name = paste(path, 'statusquo_time.txt',sep = '/')
write.table(time.taken,file_name)

