#### Model 1 ####

sink("Flower_datB_est1_explorecert.txt")
cat("
model{
# -------------------------------------------------
# States (S):
# 1 empty
# 2 low abundance
# 3 high abundance 
# 
# Observations Dat D:  
# 1 detected
# 2 not detected
#
# Observations Dat M:  
# 1 not detected
# 2 low abundance
# 3 high abundance
# -------------------------------------------------
#--------------- State parameters for data weeks: ---------------#
#Erradication:
B0.eps.l ~ dnorm(B0.eps.l.mean, B0.eps.l.tau) #eradication when at low state
B0.eps.l.tau <- 1/(B0.eps.l.sd * B0.eps.l.sd) #precision parameter
B1.eps.l ~ dnorm(B1.eps.l.mean, B1.eps.l.tau)T(0,) #effect of eradication 
B1.eps.l.tau <- 1/(B1.eps.l.sd * B1.eps.l.sd) #precision parameter
  
B0.eps.h ~ dnorm(B0.eps.h.mean, B0.eps.h.tau) #eradication when at high state
B0.eps.h.tau <- 1/(B0.eps.h.sd * B0.eps.h.sd) #precision parameter
B1.eps.h ~ dnorm(B1.eps.h.mean, B1.eps.h.tau)T(0,) #effect of eradication 
B1.eps.h.tau <- 1/(B1.eps.h.sd * B1.eps.h.sd) #precision parameter
  
#State transition:
B0.phi.h ~ dnorm(B0.phi.h.mean, B0.phi.h.tau) #transition from high to high
B0.phi.h.tau <- 1/(B0.phi.h.sd * B0.phi.h.sd) #precision parameter
B1.phi.h ~ dnorm(B1.phi.h.mean, B1.phi.h.tau)T(,0) #effect of removal on transition
B1.phi.h.tau <- 1/(B1.phi.h.sd*B1.phi.h.sd) #precision parameter
  
#--------------- State parametes for between weeks: ---------------#
#Invasion:
B0.gamma ~dnorm(B0.gamma.mean,B0.gamma.tau) #intrinsic invasion probability
B0.gamma.tau <- 1/(B0.gamma.sd*B0.gamma.sd) #precision parameter
B1.gamma ~dnorm(B1.gamma.mean, B1.gamma.tau) #effect of site characteristics on invasion probability
B1.gamma.tau <- 1/(B1.gamma.sd*B1.gamma.sd) #precision parameter
B2.gamma ~dnorm(B2.gamma.mean, B2.gamma.tau) #effect of Neighboring invasion state
B2.gamma.tau <- 1/(B2.gamma.sd*B2.gamma.sd) #precision parameter

g~dbeta(g.a, g.b)T(0.0001,0.9999) #Given colonization, probability of becoming high state
  
#Erradication:
epsB.l ~ dbeta(epsB.l.a,epsB.l.b)T(0.0001,0.9999) #eradication when at low state
epsB.h ~ dbeta(epsB.h.a,epsB.h.b)T(0.0001,0.9999) #eradication when at low state
  
#State transition:
phiB.l ~ dbeta(phiB.l.a, phiB.l.b)T(0.0001,0.9999) #staying low state
phiB.h ~ dbeta(phiB.h.a, phiB.h.b)T(0.0001,0.9999) #staying high state
  
#--------------- Detection parameters: ---------------#
#Detection low state:
B0.p.l ~ dnorm(B0.p.l.mean, B0.p.l.tau) #base detection for low state
B0.p.l.tau <- 1/(B0.p.l.sd * B0.p.l.sd) #precision parameter
B1.p.l ~ dnorm(B1.p.l.mean, B1.p.l.tau)T(0,) #effect of effort 
B1.p.l.tau <- 1/(B1.p.l.sd * B1.p.l.sd) #precision parameter

#Detection high state:
B0.p.h ~ dnorm(B0.p.h.mean, B0.p.h.tau) #base detection for high state
B0.p.h.tau <- 1/(B0.p.h.sd * B0.p.h.sd) #precision parameter
B1.p.h ~ dnorm(B1.p.h.mean, B1.p.h.tau)T(0,) #effect of effort 
B1.p.h.tau <- 1/(B1.p.h.sd * B1.p.h.sd) #precision parameter

#difference between detection/nondetection data and multistate data
alpha.l ~ dnorm(alpha.l.mean, alpha.l.sd)T(,0)
alpha.h ~ dnorm(alpha.h.mean, alpha.h.sd)T(,0)

#Detection/nondetection data
#logit(pD.l) <- B0.p.l + B1.p.l*logeffort.D + alpha.l #detection low state 
#logit(pD.h) <- B0.p.h + B1.p.h*logeffort.D + alpha.h #detection high state

pD.l <- 1
pD.h <- 1

P.datD[1,1] <- 1 #empty and not detected
P.datD[1,2] <- 0 #empty and detected
P.datD[2,1] <- 1-pD.l #low state and not detected
P.datD[2,2] <- pD.l #low state and detected
P.datD[3,1] <- 1-pD.h #high state and not detected
P.datD[3,2] <- pD.h #high state and detected

delta ~dbeta(delta.a, delta.b)T(0.0001,0.9999)  #ability to correctly observe high state

#-----------------------------------------------------------------------------#
# STATE TRANSITION

#initial occupancy probability
psi[1:3] ~ ddirch(alpha.init1) #alpha = rep(1,3)

for (i in 1:n.sites){  
  # State transition probabilities (TPM): probability of S(t+1) given S(t)
  for(y in 1:2){ #year
    for (t in 1:4){ #week
    
      logit(eps.l[i,t,y]) <- B0.eps.l + B1.eps.l*rem.vec[i,t,y]*hours[2,i,t,y] #erradication low state, rem.vec = indicator of removal
      logit(eps.h[i,t,y]) <- B0.eps.h + B1.eps.h*rem.vec[i,t,y]*hours[2,i,t,y] #erradication high state
    
      logit(phi.h[i,t,y]) <- B0.phi.h + B1.phi.h*rem.vec[i,t,y]*hours[2,i,t,y]
    
      #State transition matrix: TPM[current state, location, time, future state]
      TPM[1,i,t,y,1] <- 1 #empty to empty
      TPM[1,i,t,y,2] <- 0 #empty to low
      TPM[1,i,t,y,3] <- 0 #empty to high

      TPM[2,i,t,y,1] <- eps.l[i,t,y] #low to empty
      TPM[2,i,t,y,2] <- (1- eps.l[i,t,y]) #low to low
      TPM[2,i,t,y,3] <- 0 #low to high
    
      TPM[3,i,t,y,1] <- eps.h[i,t,y] #high to empty
      TPM[3,i,t,y,2] <- (1- eps.h[i,t,y])*(1-phi.h[i,t,y]) #high to low
      TPM[3,i,t,y,3] <- (1- eps.h[i,t,y])*(phi.h[i,t,y]) #high to high
      
      #Detection matrix:
      logit(pM.l[i,t,y]) <- B0.p.l + B1.p.l*log(hours[1,i,t,y]) #detection low state
      logit(pM.h[i,t,y]) <- B0.p.h + B1.p.h*log(hours[1,i,t,y])  #detection high state
      
      P.datM[1,i,t,y,1] <- 1 #Empty and not observed  
      P.datM[1,i,t,y,2] <- 0 #Empty and observed low 
      P.datM[1,i,t,y,3] <- 0 #Empty and observed high

      P.datM[2,i,t,y,1] <- 1-pM.l[i,t,y] #Low state and not observed
      P.datM[2,i,t,y,2] <- pM.l[i,t,y] #Low state and observed low
      P.datM[2,i,t,y,3] <- 0 #Low state and observed high
      
      P.datM[3,i,t,y,1] <- 1-pM.h[i,t,y] #High state and not observed
      P.datM[3,i,t,y,2] <- pM.h[i,t,y]*(1-delta) #High state and observed low
      P.datM[3,i,t,y,3] <- pM.h[i,t,y]*(delta) #High state and observed high 
      
    
    } #t
  } #y
  
     logit(gamma[i]) <-B0.gamma + B1.gamma*site.char[i] + B2.gamma*N[i,5,1] #invasion probability 
      
      #Between week calculation
      TPM[1,i,5,1,1] <-  1- gamma[i] #empty to empty
      TPM[1,i,5,1,2] <-  gamma[i]*(1-g) #empty to low
      TPM[1,i,5,1,3] <-  gamma[i]*(g)  #empty to high

      TPM[2,i,5,1,1] <- epsB.l #low to empty
      TPM[2,i,5,1,2] <- (1-epsB.l)*(phiB.l) #low to low
      TPM[2,i,5,1,3] <-  (1-epsB.l)*(1-phiB.l) #low to high
    
      TPM[3,i,5,1,1] <-  epsB.h #high to empty
      TPM[3,i,5,1,2] <-  (1-epsB.h)*(1-phiB.h) #high to low
      TPM[3,i,5,1,3] <-  (1-epsB.h)*(phiB.h) #high to high
  
} #i

#-----------------------------------------------------------------------------#

  #### Likelihood ####
  for (i in 1:n.sites){
      
    #-- Initial State[i,week = 1,year]: --# 
    State[i,1,1] ~ dcat(psi) #psi is written above in the priors
    State[i,1,2] ~ dcat(TPM[State[i,5,1], i, 5, 1, ]) #psi is written above in the priors
    
    #-- State Model: --#
    for(y in 1:2){
      for (t in 2:n.weeks){ 
        # State process: state given previous state and transition probability
        State[i,t,y] ~ dcat(TPM[State[i,t-1,y], i, t-1,y, ]) 
      } #t 

    #----- Observation Model -----#
      for(j in 1:n.occs){
        for(t in 1:4){
          # Observation process: draw observation given current state
          yM[i,j,t,y] ~ dcat(P.datM[State[i,t,y],i,t,y,]) 
          
          yD[i,j,t,y] ~ dcat(P.datD[State[i,t,y],]) 
        
        } #t
      } #j
    } #y 
    
    #Derived parameter: final estimated state
    State.fin[i] <- State[i,n.weeks,2] #state after 5 weeks
    
    #State of neighbors for between weeks TPM
    N[i,5,1] <- (sum(State[neighbors[i,], 5,1]) - 2)/n.neighbors[i] #state of neighbors 
    
  } #i
} #end model
", fill = TRUE)
sink()

#### Model 2 ####
sink("Flower_datB_est2_explorecert.txt")
cat("
model{
# -------------------------------------------------
# States (S):
# 1 empty
# 2 low abundance
# 3 high abundance 
# 
# Observations Dat D:  
# 1 detected
# 2 not detected
#
# Observations Dat M:  
# 1 not detected
# 2 low abundance
# 3 high abundance
# -------------------------------------------------
#--------------- State parameters for data weeks: ---------------#
B0.eps.l ~ dnorm(B0.eps.l.mean, B0.eps.l.tau) #eradication when at low state
B0.eps.l.tau <- 1/(B0.eps.l.sd * B0.eps.l.sd) #precision parameter
B1.eps.l ~ dnorm(B1.eps.l.mean, B1.eps.l.tau)T(0,) #effect of eradication 
B1.eps.l.tau <- 1/(B1.eps.l.sd * B1.eps.l.sd) #precision parameter
  
B0.eps.h ~ dnorm(B0.eps.h.mean, B0.eps.h.tau) #eradication when at high state
B0.eps.h.tau <- 1/(B0.eps.h.sd * B0.eps.h.sd) #precision parameter
B1.eps.h ~ dnorm(B1.eps.h.mean, B1.eps.h.tau)T(0,) #effect of eradication 
B1.eps.h.tau <- 1/(B1.eps.h.sd * B1.eps.h.sd) #precision parameter
  
#State transition:
B0.phi.h ~ dnorm(B0.phi.h.mean, B0.phi.h.tau) #transition from high to high
B0.phi.h.tau <- 1/(B0.phi.h.sd * B0.phi.h.sd) #precision parameter
B1.phi.h ~ dnorm(B1.phi.h.mean, B1.phi.h.tau)T(,0) #effect of removal on transition
B1.phi.h.tau <- 1/(B1.phi.h.sd*B1.phi.h.sd) #precision parameter
  
#--------------- State parametes for between weeks: ---------------#
#Invasion:
B0.gamma ~dnorm(B0.gamma.mean,B0.gamma.tau) #intrinsic invasion probability
B0.gamma.tau <- 1/(B0.gamma.sd*B0.gamma.sd) #precision parameter
B1.gamma ~dnorm(B1.gamma.mean, B1.gamma.tau) #effect of site characteristics on invasion probability
B1.gamma.tau <- 1/(B1.gamma.sd*B1.gamma.sd) #precision parameter
B2.gamma ~dnorm(B2.gamma.mean, B2.gamma.tau) #effect of Neighboring invasion state
B2.gamma.tau <- 1/(B2.gamma.sd*B2.gamma.sd) #precision parameter
  
g~dbeta(g.a, g.b)T(0.0001,0.9999) #Given colonization, probability of becoming high state  
  
#Erradication:
epsB.l ~ dbeta(epsB.l.a,epsB.l.b)T(0.0001,0.9999) #eradication when at low state
epsB.h ~ dbeta(epsB.h.a,epsB.h.b)T(0.0001,0.9999) #eradication when at low state
  
#State transition:
phiB.l ~ dbeta(phiB.l.a, phiB.l.b)T(0.0001,0.9999) #staying low state
phiB.h ~ dbeta(phiB.h.a, phiB.h.b)T(0.0001,0.9999) #staying high state

#--------------- Detection parameters: ---------------#
#Detection low state:
B0.p.l ~ dnorm(B0.p.l.mean, B0.p.l.tau) #base detection for low state
B0.p.l.tau <- 1/(B0.p.l.sd * B0.p.l.sd) #precision parameter
B1.p.l ~ dnorm(B1.p.l.mean, B1.p.l.tau)T(0,) #effect of effort 
B1.p.l.tau <- 1/(B1.p.l.sd * B1.p.l.sd) #precision parameter
  
#Detection high state:
B0.p.h ~ dnorm(B0.p.h.mean, B0.p.h.tau) #base detection for high state
B0.p.h.tau <- 1/(B0.p.h.sd * B0.p.h.sd) #precision parameter
B1.p.h ~ dnorm(B1.p.h.mean, B1.p.h.tau)T(0,) #effect of effort 
B1.p.h.tau <- 1/(B1.p.h.sd * B1.p.h.sd) #precision parameter

delta ~dbeta(delta.a, delta.b)T(0.0001,0.9999)  #ability to correctly observe high state

#difference between detection/nondetection data and multistate data
alpha.l ~ dnorm(alpha.l.mean, alpha.l.sd)T(,0)
alpha.h ~ dnorm(alpha.h.mean, alpha.h.sd)T(,0)

#Detection/nondetection data
#logit(pD.l) <- B0.p.l + B1.p.l*logeffort.D + alpha.l #detection low state 
#logit(pD.h) <- B0.p.h + B1.p.h*logeffort.D + alpha.h #detection high state

pD.l <- 1
pD.h <- 1

P.datD[1,1] <- 1 #empty and not detected
P.datD[1,2] <- 0 #empty and detected
P.datD[2,1] <- 1-pD.l #low state and not detected
P.datD[2,2] <- pD.l #low state and detected
P.datD[3,1] <- 1-pD.h #high state and not detected
P.datD[3,2] <- pD.h #high state and detected

  
#-----------------------------------------------------------------------------#
# STATE TRANSITION

for (i in 1:n.sites){  

  #psi[i, 1:3] ~ ddirch(alpha.init[i,1:3]) #Initial state estimation
  #StateB[i] ~ dcat(psi[i,1:3]) 
  
  StateB[i] ~ dcat(alpha.init[i,1:3]) 
  
  NB[i] <- (sum(StateB[neighbors[i,]])-2)/n.neighbors[i] #state of neighbors (subtract 2 so if neigbor sites are both 1, neighbor effect = 0)

  logit(gamma[i]) <-B0.gamma + B1.gamma*site.char[i] + B2.gamma*NB[i] #invasion probability 
      
  #Between week calculation (for initial state estimation)
  TPMB[1,i,1] <-  1- gamma[i] #empty to empty
  TPMB[1,i,2] <-  gamma[i]*(1-g) #empty to low
  TPMB[1,i,3] <-  gamma[i]*(g) #empty to high

  TPMB[2,i,1] <- epsB.l #low to empty
  TPMB[2,i,2] <- (1-epsB.l)*(phiB.l) #low to low
  TPMB[2,i,3] <-  (1-epsB.l)*(1-phiB.l) #low to high
    
  TPMB[3,i,1] <-  epsB.h #high to empty
  TPMB[3,i,2] <-  (1-epsB.h)*(1-phiB.h) #high to low
  TPMB[3,i,3] <-  (1-epsB.h)*(phiB.h) #high to high

  # State transition probabilities (TPM): probability of S(t+1) given S(t)
  for (t in 1:4){
    
    logit(eps.l[i,t]) <- B0.eps.l + B1.eps.l*rem.vec[i,t]*hours[2,i,t] #erradication low state, rem.vec = indicator of removal
    logit(eps.h[i,t]) <- B0.eps.h + B1.eps.h*rem.vec[i,t]*hours[2,i,t] #erradication high state
    
    logit(phi.h[i,t]) <- B0.phi.h + B1.phi.h*rem.vec[i,t]*hours[2,i,t]
    
    #State transition matrix: TPM[current state, location, time, future state]
    TPM[1,i,t,1] <- 1 #empty to empty
    TPM[1,i,t,2] <- 0 #empty to low
    TPM[1,i,t,3] <- 0 #empty to high

    TPM[2,i,t,1] <- eps.l[i,t] #low to empty
    TPM[2,i,t,2] <- (1- eps.l[i,t]) #low to low
    TPM[2,i,t,3] <- 0 #low to high
    
    TPM[3,i,t,1] <- eps.h[i,t] #high to empty
    TPM[3,i,t,2] <- (1- eps.h[i,t])*(1-phi.h[i,t]) #high to low
    TPM[3,i,t,3] <- (1- eps.h[i,t])*(phi.h[i,t]) #high to high
    
    #Detection matrix:
    logit(pM.l[i,t]) <- B0.p.l + B1.p.l*log(hours[1,i,t]) #detection low state
    logit(pM.h[i,t]) <- B0.p.h + B1.p.h*log(hours[1,i,t])  #detection high state
      
    P.datM[1,i,t,1] <- 1 #Empty and not observed  
    P.datM[1,i,t,2] <- 0 #Empty and observed low 
    P.datM[1,i,t,3] <- 0 #Empty and observed high

    P.datM[2,i,t,1] <- 1-pM.l[i,t] #Low state and not observed
    P.datM[2,i,t,2] <- pM.l[i,t] #Low state and observed low
    P.datM[2,i,t,3] <- 0 #Low state and observed high
      
    P.datM[3,i,t,1] <- 1-pM.h[i,t] #High state and not observed
    P.datM[3,i,t,2] <- pM.h[i,t]*(1-delta) #High state and observed low
    P.datM[3,i,t,3] <- pM.h[i,t]*(delta) #High state and observed high 
    
    
  } #t
} #i

#-----------------------------------------------------------------------------#

#### Likelihood ####
for (i in 1:n.sites){

  #-- Initial State[i,week]: --# 
  State[i,1] ~ dcat(TPMB[StateB[i], i, ]) #psi is written above in the priors
    
  #-- State Model: --#
  for (t in 2:n.weeks){ 
    # State process: state given previous state and transition probability
    State[i,t] ~ dcat(TPM[State[i,t-1], i, t-1,]) 
  } #t 

  #----- Observation Model -----#
  for(j in 1:n.occs){
    for(t in 1:4){
      # Observation process: draw observation given current state
      yM[i,j,t] ~ dcat(P.datM[State[i,t],i,t,]) 
      
      yD[i,j,t] ~ dcat(P.datD[State[i,t],]) 
      
    } #t
  } #j
    
  #Derived parameter: final estimated state
  State.fin[i] <- State[i,n.weeks] #state after 5 weeks
  
} #i


} #end model
", fill = TRUE)
sink()


#### Model 2 no explore ####
sink("Flower_datB_est2_cert.txt")
cat("
model{
# -------------------------------------------------
# States (S):
# 1 empty
# 2 low abundance
# 3 high abundance 
# 
# Observations Dat D:  
# 1 detected
# 2 not detected
#
# Observations Dat M:  
# 1 not detected
# 2 low abundance
# 3 high abundance
# -------------------------------------------------
#--------------- State parameters for data weeks: ---------------#
B0.eps.l ~ dnorm(B0.eps.l.mean, B0.eps.l.tau) #eradication when at low state
B0.eps.l.tau <- 1/(B0.eps.l.sd * B0.eps.l.sd) #precision parameter
B1.eps.l ~ dnorm(B1.eps.l.mean, B1.eps.l.tau)T(0,) #effect of eradication 
B1.eps.l.tau <- 1/(B1.eps.l.sd * B1.eps.l.sd) #precision parameter
  
B0.eps.h ~ dnorm(B0.eps.h.mean, B0.eps.h.tau) #eradication when at high state
B0.eps.h.tau <- 1/(B0.eps.h.sd * B0.eps.h.sd) #precision parameter
B1.eps.h ~ dnorm(B1.eps.h.mean, B1.eps.h.tau)T(0,) #effect of eradication 
B1.eps.h.tau <- 1/(B1.eps.h.sd * B1.eps.h.sd) #precision parameter
  
#State transition:
B0.phi.h ~ dnorm(B0.phi.h.mean, B0.phi.h.tau) #transition from high to high
B0.phi.h.tau <- 1/(B0.phi.h.sd * B0.phi.h.sd) #precision parameter
B1.phi.h ~ dnorm(B1.phi.h.mean, B1.phi.h.tau)T(,0) #effect of removal on transition
B1.phi.h.tau <- 1/(B1.phi.h.sd*B1.phi.h.sd) #precision parameter
  
#--------------- State parametes for between weeks: ---------------#
#Invasion:
B0.gamma ~dnorm(B0.gamma.mean,B0.gamma.tau) #intrinsic invasion probability
B0.gamma.tau <- 1/(B0.gamma.sd*B0.gamma.sd) #precision parameter
B1.gamma ~dnorm(B1.gamma.mean, B1.gamma.tau) #effect of site characteristics on invasion probability
B1.gamma.tau <- 1/(B1.gamma.sd*B1.gamma.sd) #precision parameter
B2.gamma ~dnorm(B2.gamma.mean, B2.gamma.tau) #effect of Neighboring invasion state
B2.gamma.tau <- 1/(B2.gamma.sd*B2.gamma.sd) #precision parameter
  
g~dbeta(g.a, g.b)T(0.0001,0.9999) #Given colonization, probability of becoming high state  
  
#Erradication:
epsB.l ~ dbeta(epsB.l.a,epsB.l.b)T(0.0001,0.9999) #eradication when at low state
epsB.h ~ dbeta(epsB.h.a,epsB.h.b)T(0.0001,0.9999) #eradication when at low state
  
#State transition:
phiB.l ~ dbeta(phiB.l.a, phiB.l.b)T(0.0001,0.9999) #staying low state
phiB.h ~ dbeta(phiB.h.a, phiB.h.b)T(0.0001,0.9999) #staying high state

#--------------- Detection parameters: ---------------#
#Detection low state:
B0.p.l ~ dnorm(B0.p.l.mean, B0.p.l.tau) #base detection for low state
B0.p.l.tau <- 1/(B0.p.l.sd * B0.p.l.sd) #precision parameter
B1.p.l ~ dnorm(B1.p.l.mean, B1.p.l.tau)T(0,) #effect of effort 
B1.p.l.tau <- 1/(B1.p.l.sd * B1.p.l.sd) #precision parameter
  
#Detection high state:
B0.p.h ~ dnorm(B0.p.h.mean, B0.p.h.tau) #base detection for high state
B0.p.h.tau <- 1/(B0.p.h.sd * B0.p.h.sd) #precision parameter
B1.p.h ~ dnorm(B1.p.h.mean, B1.p.h.tau)T(0,) #effect of effort 
B1.p.h.tau <- 1/(B1.p.h.sd * B1.p.h.sd) #precision parameter

logit(pM.l) <- B0.p.l + B1.p.l*logeffort #detection low state
logit(pM.h) <- B0.p.h + B1.p.h*logeffort #detection high state
  
delta ~dbeta(delta.a, delta.b)  #ability to correctly observe high state

#difference between detection/nondetection data and multistate data
alpha.l ~ dnorm(alpha.l.mean, alpha.l.sd)T(,0)
alpha.h ~ dnorm(alpha.h.mean, alpha.h.sd)T(,0)

#Detection/nondetection data
#logit(pD.l) <- B0.p.l + B1.p.l*logeffort.D + alpha.l #detection low state 
#logit(pD.h) <- B0.p.h + B1.p.h*logeffort.D + alpha.h #detection high state

pD.l <- 1
pD.h <- 1

P.datD[1,1] <- 1 #empty and not detected
P.datD[1,2] <- 0 #empty and detected
P.datD[2,1] <- 1-pD.l #low state and not detected
P.datD[2,2] <- pD.l #low state and detected
P.datD[3,1] <- 1-pD.h #high state and not detected
P.datD[3,2] <- pD.h #high state and detected

#Detection matrix- M:
P.datM[1,1] <- 1 #Empty and not observed  
P.datM[1,2] <- 0 #Empty and observed low 
P.datM[1,3] <- 0 #Empty and observed high

P.datM[2,1] <- 1-pM.l #Low state and not observed
P.datM[2,2] <- pM.l #Low state and observed low
P.datM[2,3] <- 0 #Low state and observed high

P.datM[3,1] <- 1-pM.h #High state and not observed
P.datM[3,2] <- pM.h*(1-delta) #High state and observed low
P.datM[3,3] <- pM.h*(delta) #High state and observed high  
  
#-----------------------------------------------------------------------------#
# STATE TRANSITION

for (i in 1:n.sites){  

  #psi[i, 1:3] ~ ddirch(alpha.init[i,1:3]) #Initial state estimation
  #StateB[i] ~ dcat(psi[i,1:3]) 
  
  StateB[i] ~ dcat(alpha.init[i,1:3]) 
  
  NB[i] <- (sum(StateB[neighbors[i,]])-2)/n.neighbors[i] #state of neighbors (subtract 2 so if neigbor sites are both 1, neighbor effect = 0)

  logit(gamma[i]) <-B0.gamma + B1.gamma*site.char[i] + B2.gamma*NB[i] #invasion probability 
      
  #Between week calculation (for initial state estimation)
  TPMB[1,i,1] <-  1- gamma[i] #empty to empty
  TPMB[1,i,2] <-  gamma[i]*(1-g) #empty to low
  TPMB[1,i,3] <-  gamma[i]*(g) #empty to high

  TPMB[2,i,1] <- epsB.l #low to empty
  TPMB[2,i,2] <- (1-epsB.l)*(phiB.l) #low to low
  TPMB[2,i,3] <-  (1-epsB.l)*(1-phiB.l) #low to high
    
  TPMB[3,i,1] <-  epsB.h #high to empty
  TPMB[3,i,2] <-  (1-epsB.h)*(1-phiB.h) #high to low
  TPMB[3,i,3] <-  (1-epsB.h)*(phiB.h) #high to high

  # State transition probabilities (TPM): probability of S(t+1) given S(t)
  for (t in 1:4){
    
    logit(eps.l[i,t]) <- B0.eps.l + B1.eps.l*rem.vec[i,t]*removal.hours #erradication low state, rem.vec = indicator of removal
    logit(eps.h[i,t]) <- B0.eps.h + B1.eps.h*rem.vec[i,t]*removal.hours #erradication high state
    
    logit(phi.h[i,t]) <- B0.phi.h + B1.phi.h*rem.vec[i,t]*removal.hours
    
    #State transition matrix: TPM[current state, location, time, future state]
    TPM[1,i,t,1] <- 1 #empty to empty
    TPM[1,i,t,2] <- 0 #empty to low
    TPM[1,i,t,3] <- 0 #empty to high

    TPM[2,i,t,1] <- eps.l[i,t] #low to empty
    TPM[2,i,t,2] <- (1- eps.l[i,t]) #low to low
    TPM[2,i,t,3] <- 0 #low to high
    
    TPM[3,i,t,1] <- eps.h[i,t] #high to empty
    TPM[3,i,t,2] <- (1- eps.h[i,t])*(1-phi.h[i,t]) #high to low
    TPM[3,i,t,3] <- (1- eps.h[i,t])*(phi.h[i,t]) #high to high
    
  } #t
} #i

#-----------------------------------------------------------------------------#

#### Likelihood ####
for (i in 1:n.sites){

  #-- Initial State[i,week]: --# 
  State[i,1] ~ dcat(TPMB[StateB[i], i, ]) #psi is written above in the priors
    
  #-- State Model: --#
  for (t in 2:n.weeks){ 
    # State process: state given previous state and transition probability
    State[i,t] ~ dcat(TPM[State[i,t-1], i, t-1,]) 
  } #t 

  #----- Observation Model -----#
  for(j in 1:n.occs){
    for(t in 1:n.weeks){
      # Observation process: draw observation given current state
      yM[i,j,t] ~ dcat(P.datM[State[i,t],]) 
      
      yD[i,j,t] ~ dcat(P.datD[State[i,t],]) 
      
    } #t
  } #j
    
  #Derived parameter: final estimated state
  State.fin[i] <- State[i,n.weeks] #state after 5 weeks
  
} #i


} #end model
", fill = TRUE)
sink()



