library(tidyverse)
library(ggplot2)
library(LaplacesDemon)
library(plyr)

n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states
n.sites <- 40 

#### 1. Baseline Colonization ####
B0.gammas <- c(0.2, 0.5, 0.8) #intrinsic invasion probability during between weeks
low.colonization <- list(B0.gamma = B0.gammas[1])
med.colonization <- list(B0.gamma = B0.gammas[2])
high.colonization <- list(B0.gamma = B0.gammas[3])

col1 <- list(low.colonization, med.colonization, high.colonization)

#### 2. Effect of site on colonization ####
B1.gammas <- c(0.1, 0.5, 2) #effect of site characteristics during between weeks
low.siteeffect <- list(B1.gamma = B1.gammas[1])
med.siteeffect<- list(B1.gamma = B1.gammas[2])
high.siteeffect <- list(B1.gamma = B1.gammas[3])

ste2 <- list(low.siteeffect, med.siteeffect, high.siteeffect)

#### 3. Effect of neighbor on colonization ####
B2.gammas <- c(0.1,0.5,0.8) #effect of neighboring invasion state during between weeks
low.neighbor <- list(B2.gamma = B2.gammas[1])
med.neighbor <- list(B2.gamma = B2.gammas[2])
high.neighbor <- list(B2.gamma = B2.gammas[3])

nbr3 <- list(low.neighbor, med.neighbor, high.neighbor)

invlogit(B0.gammas[1] + B1.gammas[1] + 2*B2.gammas[1])
# invlogit(B0.gammas[2] + B1.gammas[2] + 2*B2.gammas[2])
invlogit(B0.gammas[3] + B1.gammas[3] + 2*B2.gammas[3])

#### 4. Tendency to grow ####
B0.phi.hs <- c(0, 0.5, 1) #transition from high to high during data weeks
B0.eps.ls <- c(0, -0.5, -1) #base eradication at low state during data weeks
B0.eps.hs <- c(-0.5, -1, -1.5)  #base eradication at high state during data weeks

gs <- c(0.2, 0.4, 0.8) #given colonization, probability of becoming high state
phiB.ls <- c(0.9, 0.5, 0.1) #Remaining in low state (not transitioning to high)
phiB.hs <- c(0.1, 0.5, 0.9) #Remaining in high state (not transitioning to low)
epsB.ls <- c(0.9, 0.5, 0.2) #eradication of low state during between weeks
epsB.hs <- c(0.8, 0.4, 0.1) #eradication of high state during between weeks


low.grow <- list(B0.phi.h = B0.phi.hs[1], B0.eps.l = B0.eps.ls[1], B0.eps.h = B0.eps.hs[1],
                 phiB.l = phiB.ls[1], phiB.h = phiB.hs[1], epsB.l= epsB.ls[1], epsB.h = epsB.hs[1], g = gs[1])

med.grow <- list(B0.phi.h = B0.phi.hs[2], B0.eps.l = B0.eps.ls[2], B0.eps.h = B0.eps.hs[2],
                 phiB.l = phiB.ls[2], phiB.h = phiB.hs[2], epsB.l= epsB.ls[2], epsB.h = epsB.hs[2], g = gs[2])

high.grow <- list(B0.phi.h = B0.phi.hs[3], B0.eps.l = B0.eps.ls[3], B0.eps.h = B0.eps.hs[3],
                  phiB.l = phiB.ls[3], phiB.h = phiB.hs[3], epsB.l= epsB.ls[3], epsB.h = epsB.hs[3], g = gs[3])

gro4 <- list(low.grow, med.grow, high.grow)

#### 5. Effect of removal #### 
B1.eps.ls <- c(1, 1.5, 2)  #effect of eradication at low state during data weeks
B1.eps.hs <- c(0.5, 1, 1.5) #effect of eradication at high state during data weeks
B1.phi.hs <- c(0.1, 0.5, 1) #effect of removal on growth during data weeks

low.removal <- list(B1.eps.l = B1.eps.ls[1],B1.eps.h = B1.eps.hs[1],B1.phi.hs = B1.phi.hs[1])
med.removal <- list(B1.eps.l = B1.eps.ls[2],B1.eps.h = B1.eps.hs[2],B1.phi.hs = B1.phi.hs[2])
high.removal <- list(B1.eps.l = B1.eps.ls[3],B1.eps.h = B1.eps.hs[3],B1.phi.hs = B1.phi.hs[3])

rem5 <- list(low.removal, med.removal, high.removal)

#### 6. Detection Rates ####
B0.p.ls <- c(0.2, 0.3, 0.4) #base detection for low state
B1.p.ls <- c(0.5, 1, 1.5) #effect of effort
B0.p.hs <- c(0.4, 0.6, 0.8) #base detection for high state
B1.p.hs <- c(1, 1.5, 2) #effect of effort
alpha.ls <- c(0.1, 0.2, 0.3) #difference in baseline detection between dat D and M
alpha.hs <- c(0.1, 0.2, 0.3)  #difference in baseline detection between dat D and M
deltas <- c(0.2, 0.6, 0.8)  # Probability of observing the high state given the species

#Save as a list
low.detection <- list(
  B0.p.l = B0.p.ls[1], #base detection for low state
  B1.p.l = B1.p.ls[1], #effect of effort
  B0.p.h = B0.p.hs[1], #base detection for high state
  B1.p.h = B1.p.hs[1], #effect of effort
  alpha.l = alpha.ls[1], #difference in baseline detection between dat D and M
  alpha.h = alpha.hs[1],  #difference in baseline detection between dat D and M
  delta = deltas[1]  # Probability of observing the high state given the species 
)

med.detection <- list(
  B0.p.l = B0.p.ls[2], #base detection for low state
  B1.p.l = B1.p.ls[2], #effect of effort
  B0.p.h = B0.p.hs[2], #base detection for high state
  B1.p.h = B1.p.hs[2], #effect of effort
  alpha.l = alpha.ls[2], #difference in baseline detection between dat D and M
  alpha.h = alpha.hs[2],  #difference in baseline detection between dat D and M
  delta = deltas[2]  # Probability of observing the high state given the species 
)

high.detection <- list(
  B0.p.l = B0.p.ls[3], #base detection for low state
  B1.p.l = B1.p.ls[3], #effect of effort
  B0.p.h = B0.p.hs[3], #base detection for high state
  B1.p.h = B1.p.hs[3], #effect of effort
  alpha.l = alpha.ls[3], #difference in baseline detection between dat D and M
  alpha.h = alpha.hs[3],  #difference in baseline detection between dat D and M
  delta = deltas[3]  # Probability of observing the high state given the species 
)

det6 <- list(low.detection, med.detection, high.detection)

invlogit(B0.phi.hs[3] - 1*B1.phi.hs[3])
invlogit(B0.eps.ls[3] + 2*B1.eps.ls[3])
invlogit(B0.eps.hs[3] + 2*B1.eps.hs[3])

invlogit(B0.gammas[3] + B1.gammas[3] + 2*B2.gammas[3])
phiB.hs[3]
phiB.ls[3]
epsB.ls[3]
epsB.hs[3]

invlogit(B0.p.ls[3] + 0*B1.p.ls[3]+ alpha.ls[3])
invlogit(B0.p.hs[3] + 1*B1.p.hs[3]+ alpha.hs[3])

#### Initial State and Habitat Data ####
#---Habitat data---#
# effect of habitat quality on occupancy
n.sites <- 40
n.states <- 3

set.seed(03222021)
site.char <- runif(n.sites)

#---Initial state data---#
#Code that generated initial true state
State.init <- rep(NA, n.sites)
rate.init <- rep(NA, n.sites)
occ.init <- rep(NA, n.sites)
init.matrix <- array(NA, c(n.sites, n.states))
for(i in 1:n.sites){
  rate.init[i] <- mean(rbinom(100000,1,invlogit(B0.gammas[2] + B1.gammas[2]*site.char[i]))) #invasion rate
  p.high <- 0.5 #say the probability of being in high state is 0.5
  
  occ.init[i] <- round(mean(rbern(100000,rate.init[i]))) #being invaded or not
  
  init.matrix[i,1] <- (1-rate.init[i])*occ.init[i] + (1-occ.init[i]) #empty
  init.matrix[i,2] <- (rate.init[i])*occ.init[i]*(1-p.high) #low state
  init.matrix[i,3] <- (rate.init[i])*occ.init[i]*(p.high) #high state
  
  State.init[i] <- rcat(1,init.matrix[i,1:3])
}

sum(State.init == 1)
sum(State.init == 2)
sum(State.init == 3)

#### Save workspace ####
save.image(file = "parameters.RData")

####Plot####
