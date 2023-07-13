library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(plyr)
library(tidyverse)
library(strex)

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
# Observations (O):  
# 1 not observed
# 2 observed low state
# 3 observed high state
# -------------------------------------------------

#### PRIORS ####
  
  #detection parameters
  
  rho.l ~ dbeta(pl_a,pl_b) #base detection for low state
  alpha.l ~ dnorm(l_mean,l_tau) #difference in baseline detection probability between observation1 and 2, low state
  rho.h ~ dbeta(ph_a,ph_b) #base detection for high state
  alpha.h ~ dnorm(h_mean, h_tau) #difference in baseline detection probability between observation1 and 2, high state
  delta ~ dbeta(delta_a, delta_b) #probability of observing the high state given species has been detected and true state is high

  l_tau <- 1/(l_sd * l_sd) #precision
  h_tau <- 1/(h_sd * h_sd) #precision

  logit(pmulti.l) <- alpha.l + rho.l 
  logit(pmulti.h) <- alpha.h + rho.h
  
  
  #--------------------------------------------------#
  # OCCUPANCY PROBABILITIES
  for (i in 1:n.sites){  
  
    omega[i] ~ dbeta(omega.a[i], omega.b[i]) #probability of being invaded regardless of state
    phi[i] ~ dbeta(phi.a[i], phi.b[i]) #conditional probability that FR is high abundance given present
    
    ps[1,i] <- 1-omega[i] #probability of not invaded
    ps[2,i] <- omega[i]*(1-phi[i]) #probability of invaded at low abundance
    ps[3,i] <- omega[i]*phi[i] #probability of invaded at high abundance
  
    
  #--------------------------------------------------#
  # OBSERVATION PROBABILITIES (for multistate data) 
    # Observation probabilities of given S(t)
    #index = [current state, location, current observation]
   
    #Empty and not observed    
    po_multi[1,i,1] <- 1
    
    #Empty and observed low 
    po_multi[1,i,2] <- 0
    
    #Empty and observed high  
    po_multi[1,i,3] <- 0
 
    #Low state and not observed   
    po_multi[2,i,1] <- 1-pmulti.l #not detected probability
    
    #Low state and observed low 
    po_multi[2,i,2] <- pmulti.l #detection probability
      
    #Low state and observed high 
    po_multi[2,i,3] <- 0 
      
    #High state and not observed   
    po_multi[3,i,1] <- 1-pmulti.h #not detected probability
      
    #High state and observed low 
    po_multi[3,i,2] <- (1-pmulti.h)*(1-delta) #detection probability
      
    #high abundance observed high abundance
    po_multi[3,i,3] <- pmulti.h*delta


  #### LIKELIHOOD ####
    State[i] ~ dcat(ps[,i])
  
    y.multi[i] ~ dcat(po_multi[State[i], i, ])
  
    #Derived parmeter
    State.fin[i] <- State[i] 
   
} #i
  
} #end model
", fill = TRUE)
sink()

#### Data ####
n.sims <- 2 #simulations
eps.l <- 0.9 #eradication when at low state
eps.h <- 0.7 #eradication when at high state

phi.lh <- 0.05 #transition from low to high
phi.hh <- 0.9 #transition from high to high

p1.l <- 0.2 #detection probability (for multistate data)
p1.h <- 0.6 #detection probability (for multistate data)

p2.l <- 0.4 #detection probability (for multistate data)
p2.h <- 0.8 #detection probability (for multistate data)
delta <- 0.5
n.sites <- 5 #number of sites
n.rem <- 3 #number of removal sites per week
n.obs <- 3
n.years <- 5 #time steps
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
po_multi<- array(NA, c(n.states,n.states))
po_multi[1,1] <- 1
po_multi[1,2] <- 0
po_multi[1,3] <- 0

po_multi[2,1] <- 1-p2.l
po_multi[2,2] <- p2.l
po_multi[2,3] <- 0

po_multi[3,1] <- 1-p2.h
po_multi[3,2] <- (1-p2.h)*delta
po_multi[3,3] <- p2.h*delta

sites.rem <- array(NA, dim = c(n.rem, n.years, n.sims))

##### year 1 #####
#Initial True State 
State[1,1,] <- 3 
State[2,1,] <- 3 
State[3,1,] <- 2 
State[4,1,] <- 2 
State[5,1,] <- 1 

segs.selected <- c(1,3,5)

year <- 1
for(s in 1:n.sims){
  for(i in segs.selected){
    Obs.multi[i,year,s] <- rcat(1,po_multi[State[i,year,s], ])
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
pl_a <- array(NA, c(n.years, n.sims))
pl_b <- array(NA, c(n.years, n.sims))
l_mean <- array(NA, c(n.years, n.sims))
l_sd <- array(NA, c(n.years, n.sims))
ph_a <- array(NA, c(n.years, n.sims))
ph_b <- array(NA, c(n.years, n.sims))
h_mean <- array(NA, c(n.years, n.sims))
h_sd <- array(NA, c(n.years, n.sims))

delta_a <- array(NA, c(n.years, n.sims))
delta_b <- array(NA, c(n.years, n.sims))

S.init <-  array(NA, c(n.sites, n.years, n.sims))
D.init <- array(NA, c(n.sites,n.years,n.sims))
rem.vec <- array(NA, dim = c(n.sites, n.years, n.sims))

rhat_vals <- array(NA, c(n.years, n.sims))
my.data <- list()
outs <- rep(NA,n.sims)
outputsfull <- rep(NA, n.sims)
outputs <- rep(NA, n.sims)
mcmcs <- rep(NA, n.sims)
x <- list()
final.states <- rep(NA, n.sims)
segments <- list()

omega.est <- rep(NA, n.sims)
phi.est <- rep(NA, n.sims)

rho.l.est <- rep(NA, n.sims)
alpha.l.est <- rep(NA, n.sims)
rho.h.est <- rep(NA, n.sims)
alpha.h.est <- rep(NA, n.sims)
delta.est <- rep(NA, n.sims)

all.final.states <- rep(NA, n.sims)
all.omega.est <- rep(NA, n.sims)
all.phi.est <- rep(NA, n.sims)


all.rho.l.est <- rep(NA, n.sims)
all.alpha.l.est <- rep(NA, n.sims)
all.rho.h.est <- rep(NA, n.sims)
all.alpha.h.est <- rep(NA, n.sims)
all.delta.est <- rep(NA, n.sims)

final.states.mean <- array(NA, dim = c(n.sites, n.years, n.sims))
site.rem.options <- list()

alpha.omegas <- rep(NA, n.sims)
beta.omegas <- rep(NA, n.sims)
alpha.gammas <- rep(NA, n.sims)
beta.gammas <- rep(NA, n.sims)

alpha.rhols <- rep(NA, n.sims)
beta.rhols <- rep(NA, n.sims)
alpha.rhohs <- rep(NA, n.sims)
beta.rhohs <- rep(NA, n.sims)

alpha.lmeans <- rep(NA, n.sims)
alpha.lsds <- rep(NA, n.sims)
alpha.hmeans <- rep(NA, n.sims)
alpha.hsds <- rep(NA, n.sims)

alpha.delta <- rep(NA, n.sims)
beta.delta <- rep(NA, n.sims)

initial.values <- list() #initial value list
final.states.mean <- array(NA, dim = c(n.sites, n.years, n.sims))

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
      
      State[i,year,s] <- rcat(1,ps[State[i,year,s], i, ])
      
    }
    
    ###### Observation data ######
    for(i in segs.selected[,week]){
      Obs.multi[i,year,s] <- rcat(1,po_multi[State[i,year,s], ])
    }
    
    ###### Sites for removal ######
    #if we have no sites for removal then we record that
    if(sum(Obs.multi[,year,s] >= 2, na.rm = TRUE) == 0){
      sites.rem[1:5, year, s] <- rep(NA, 5)
    }else{
      sites.rem[1:length(which(Obs.multi[,year,s] >= 2)), year, s] <- which(Obs.multi[,year,s] >= 2)
    }
  
} #ends year > 1 things
  
} #ends simulations


#check:
#discard(sites.rem[,1,year,2], is.na)
#Obs.multi[, 1, year, 2]

##### Initial priors #####
#------------------------Year 1 Priors------------------------#
if(year == 1){
  
  #State process
  omega.a[,1,] <- 1
  omega.b[,1,] <- 1
  
  phi.a[,1,] <- 1
  phi.b[,1,] <- 1
  
  #Observation process
  
  pl_a[1,] <- 1
  pl_b[1,] <- 1
  l_mean[1,] <- 0
  l_sd[1,] <- 10
  
  ph_a[1,] <- 1
  ph_b[1,] <- 1
  h_mean[1,] <- 0
  h_sd[1,] <- 10
  
  delta_a[1,] <- 1
  delta_b[1,] <- 1
    
  }else{
  for(s in 1:n.sims){
    #### Fix HERE ####
    ##### Year 1+ prior #####
    #State process
    
    

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
    pl_a[year,s] <- get(alpha.rhols[s])
    pl_b[year,s] <- get(beta.rhols[s])

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
    ph_a[year,s] <- get(alpha.rhohs[s])
    ph_b[year,s] <- get(beta.rhohs[s])
    
    
    #-------alpha priors: difference in baseline detection -------#
    ## Low ##
    l_mean[year,] <- get(alpha.l.est[s])$mean
    l_sd[year,] <- get(alpha.l.est[s])$sd
    
    ## High ##
    h_mean[year,] <- get(alpha.h.est[s])$mean
    h_sd[year,] <- get(alpha.h.est[s])$sd
    
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
    delta_a[year,s] <- get(alpha.delta[s])
    delta_b[year,s] <- get(beta.delta[s])
    
  }
  
  #-------Initial estimated state -------#
  S.init[6:n.sites,year,] <- final.states.mean[6:n.sites,year-1,]
  
  S.init[1:5,year,] <- Obs.multi[1:5,1,year,]
  
  #S.init[,year,] <- State[,1,year,]
  
  for(s in 1:n.sims){
    for(i in 2:(n.sites-1)){
      D.init[i,year,s] <- S.init[i+1,year,s] + S.init[i-1,year,s]
    }
    
    D.init[1,year,s] <- S.init[2,year,s]
    D.init[n.sites,year,s] <- S.init[(n.sites-1),year,s]
    
  }
  
} #ends priors loops

###### 2b. JAGS data ######

#Parameters monitored
parameters.to.save <- c("State.fin", "omega", "phi",
                        "rho.l", "alpha.l", "rho.h", "alpha.h",
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
                       
                       pl_a = pl_a[year,s], 
                       pl_b = pl_b[year,s],
                       l_mean= l_mean[year,s],
                       l_sd= l_sd[year,s],
                       ph_a = ph_a[year,s], 
                       ph_b = ph_b[year,s],
                       h_mean= h_mean[year,s],
                       h_sd= h_sd[year,s],
                       delta_a = delta_a[year,s],
                       delta_b = delta_b[year,s]                  
                       
 
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
}

mcmc_1 <- out_1$samples
mcmc_2 <- out_2$samples

for(s in 1:n.sims){
  MCMCtrace(get(mcmcs[s]), 
            params = 'gamma0', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/gamma0_sim_', s, '_year', year))
  
  MCMCtrace(get(mcmcs[s]), 
            params = 'gamma1', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/gamma1_sim_', s, '_year', year))
  
  MCMCtrace(get(mcmcs[s]), 
            params = 'eps.l', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/eps.l_sim_', s, '_year', year))
  
  MCMCtrace(get(mcmcs[s]), 
            params = 'eps.h', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/eps.h_sim_', s, '_year', year))
  
  
  MCMCtrace(get(mcmcs[s]), 
            params = 'pl', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/pl_sim_', s, '_year', year))
  
  MCMCtrace(get(mcmcs[s]), 
            params = 'ph', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/ph_sim_', s, '_year', year))
  
  MCMCtrace(get(mcmcs[s]), 
            params = 'phi.lh', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/phi.lh_sim_', s, '_year', year))
  
  MCMCtrace(get(mcmcs[s]), 
            params = 'phi.hh', 
            type = 'density', 
            ind = TRUE, 
            pdf = TRUE, 
            open_pdf = FALSE,
            filename = paste0(res,'/phi.hh_sim_', s, '_year', year))
  
  
}


#save outs into a csv file!
# file_name <- rep(NA, S)
# for(s in 1:S){
#   file_name[s] = paste(path, paste0('Output_',s,'year', year, '.csv'),sep = '/')
#   write.csv(get(outputs[s]),file_name[s])
# }
# 


#save rhat outputs
for(s in 1:n.sims){
  x[[s]] <- as.numeric(unlist(get(outputsfull[s])$Rhat))
  rhat_vals[year,s] <-  sum(x[[s]] > 1.1, na.rm = TRUE)/ length(x[[s]])
}


#-------Final States -------#
for(s in 1:n.sims){
  final.states[s]<- paste("final.states", s, sep = "_")
  assign(final.states[s], filter(get(outputs[s]), grepl("^S", param)))
  
  segments[[s]] <- as.numeric(str_nth_number((get(final.states[s]))$param, n = 1))
  
}


for(s in 1:n.sims){
  assign(final.states[s], 
         cbind(get(final.states[s]), segment = segments[[s]])) #adding segment column  
}

#-------gamma -------#
for(s in 1:n.sims){
  gamma0.est[s]<- paste("gamma0.est", s, sep = "_")
  assign(gamma0.est[s], filter(get(outputs[s]), grepl("^gamma0", param)))
  
  gamma1.est[s]<- paste("gamma1.est", s, sep = "_")
  assign(gamma1.est[s], filter(get(outputs[s]), grepl("^gamma1", param)))
  
}

#-------eps.l -------#
for(s in 1:n.sims){
  eps.l.est[s]<- paste("eps.l.est", s, sep = "_")
  assign(eps.l.est[s], filter(get(outputs[s]), grepl("^eps.l", param)))
  
  assign(eps.l.est[s], 
         cbind(get(eps.l.est[s]), cv = get(eps.l.est[s])$sd/get(eps.l.est[s])$mean
         ))  
}

#-------eps.h -------#
for(s in 1:n.sims){
  eps.h.est[s]<- paste("eps.h.est", s, sep = "_")
  assign(eps.h.est[s], filter(get(outputs[s]), grepl("^eps.h", param)))
  
  assign(eps.h.est[s], 
         cbind(get(eps.h.est[s]), cv = get(eps.h.est[s])$sd/get(eps.h.est[s])$mean
         ))  
}


#-------phi.lh -------#
for(s in 1:n.sims){
  phi.lh.est[s]<- paste("phi.lh.est", s, sep = "_")
  assign(phi.lh.est[s], filter(get(outputs[s]), grepl("^phi.lh", param)))
  
  assign(phi.lh.est[s], 
         cbind(get(phi.lh.est[s]), cv = get(phi.lh.est[s])$sd/get(phi.lh.est[s])$mean
         ))  
  
}

#-------phi.hh -------#
for(s in 1:n.sims){
  phi.hh.est[s]<- paste("phi.hh.est", s, sep = "_")
  assign(phi.hh.est[s], filter(get(outputs[s]), grepl("^phi.hh", param)))
  
  assign(phi.hh.est[s], 
         cbind(get(phi.hh.est[s]), cv = get(phi.hh.est[s])$sd/get(phi.hh.est[s])$mean
         ))  
  
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

#-------alpha.l.est -------#

for(s in 1:n.sims){
  alpha.l.est[s]<- paste("alpha.l.est", s, sep = "_")
  assign(alpha.l.est[s], filter(get(outputs[s]), grepl("^alpha.l", param)))
  
}

#-------alpha.h.est -------#

for(s in 1:n.sims){
  alpha.h.est[s]<- paste("alpha.h.est", s, sep = "_")
  assign(alpha.h.est[s], filter(get(outputs[s]), grepl("^alpha.h", param)))
  
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
  
  assign(gamma0.est[s], 
         cbind(get(gamma0.est[s]), year = year))
  
  assign(gamma1.est[s], 
         cbind(get(gamma1.est[s]), year = year))
  
  assign(eps.l.est[s], 
         cbind(get(eps.l.est[s]), year = year))
  
  assign(eps.h.est[s], 
         cbind(get(eps.h.est[s]), year = year))
  
  assign(rho.l.est[s], 
         cbind(get(rho.l.est[s]), year = year))
  
  assign(rho.h.est[s], 
         cbind(get(rho.h.est[s]), year = year))
  
  assign(alpha.l.est[s], 
         cbind(get(alpha.l.est[s]), year = year))
  
  assign(alpha.h.est[s], 
         cbind(get(alpha.h.est[s]), year = year))
  
  assign(phi.lh.est[s], 
         cbind(get(phi.lh.est[s]), year = year))
  
  assign(phi.hh.est[s], 
         cbind(get(phi.hh.est[s]), year = year))
  
  assign(delta.est[s], 
         cbind(get(delta.est[s]), year = year))
  
  all.final.states[s]<- paste("final.states.allsummary", s, sep = "_")
  all.gamma0.est[s]<- paste("gamma0.allsummary", s, sep = "_")
  all.gamma1.est[s]<- paste("gamma1.allsummary", s, sep = "_")
  all.eps.l.est[s]<- paste("eps.l.allsummary", s, sep = "_")
  all.eps.h.est[s]<- paste("eps.h.allsummary", s, sep = "_")
  all.phi.lh.est[s]<- paste("phi.lh.allsummary", s, sep = "_")
  all.phi.hh.est[s]<- paste("phi.hh.allsummary", s, sep = "_")
  all.rho.l.est[s]<- paste("rho.l.allsummary", s, sep = "_")
  all.rho.h.est[s]<- paste("rho.h.allsummary", s, sep = "_")
  all.alpha.l.est[s]<- paste("alpha.l.allsummary", s, sep = "_")
  all.alpha.h.est[s]<- paste("alpha.h.allsummary", s, sep = "_")
  all.delta.est[s]<- paste("delta.allsummary", s, sep = "_")
  
}

#If year 1 we set summary data frame to itself
for(s in 1:n.sims){
  if(year == 1){
    assign(all.final.states[s], 
           get(final.states[s]))
    
    assign(all.gamma0.est[s], 
           get(gamma0.est[s]))
    
    assign(all.gamma1.est[s], 
           get(gamma1.est[s]))
    
    assign(all.eps.l.est[s], 
           get(eps.l.est[s]))
    
    assign(all.eps.h.est[s], 
           get(eps.h.est[s]))
    
    assign(all.phi.lh.est[s], 
           get(phi.lh.est[s]))
    
    assign(all.phi.hh.est[s], 
           get(phi.hh.est[s]))
    
    assign(all.rho.l.est[s], 
           get(rho.l.est[s]))
    
    assign(all.rho.h.est[s], 
           get(rho.h.est[s]))
    
    assign(all.alpha.l.est[s], 
           get(alpha.l.est[s]))
    
    assign(all.alpha.h.est[s], 
           get(alpha.h.est[s]))
    
    assign(all.delta.est[s], 
           get(delta.est[s]))
    
  }
}

for(s in 1:n.sims){
  final.states.mean[,year,s] <- round((get(final.states[s]))$mean)
}

  
}


#################################################################################################

cbind(State[,1,1,1],State[,12,,1])

