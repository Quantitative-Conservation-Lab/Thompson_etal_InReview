library(tidyverse)
library(ggplot2)
library(LaplacesDemon)
library(plyr)

n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states
n.sites <- 40 

#### 1. Baseline Colonization ####
gamma.0s <- c(0.2, 0.5, 0.8) #intrinsic invasion probability during between weeks
low.colonization <- list(gamma.0 = gamma.0s[1])
med.colonization <- list(gamma.0 = gamma.0s[2])
high.colonization <- list(gamma.0 = gamma.0s[3])

col1 <- list(low.colonization, med.colonization, high.colonization)

#### 2. Effect of site on colonization ####
gamma.1s <- c(0.1, 0.5, 2) #effect of site characteristics during between weeks
low.siteeffect <- list(gamma.1 = gamma.1s[1])
med.siteeffect<- list(gamma.1 = gamma.1s[2])
high.siteeffect <- list(gamma.1 = gamma.1s[3])

ste2 <- list(low.siteeffect, med.siteeffect, high.siteeffect)

#### 3. Effect of neighbor on colonization ####
gamma.2s <- c(0.1,0.5,0.8) #effect of neighboring invasion state during between weeks
low.neighbor <- list(gamma.2 = gamma.2s[1])
med.neighbor <- list(gamma.2 = gamma.2s[2])
high.neighbor <- list(gamma.2 = gamma.2s[3])

nbr3 <- list(low.neighbor, med.neighbor, high.neighbor)

# invlogit(gamma.0s[1] + gamma.1s[1] + 2*gamma.2s[1])
# invlogit(gamma.0s[2] + gamma.1s[2] + 2*gamma.2s[2])
# invlogit(gamma.0s[3] + gamma.1s[3] + 2*gamma.2s[3])

#### 4. Tendency to grow ####
phi0.hhs <- c(0, 1, 3) #transition from high to high during data weeks
eps.l0s <- c(0, -1, -2) #base eradication at low state during data weeks
eps.h0s <- c(-1, -2, -3)  #base eradication at high state during data weeks

phiB.lhs <- c(0.1, 0.5, 0.9) #transition from low to high during between weeks
phiB.hhs <- c(0.1, 0.5, 0.9) #transition from low to high during between weeks
epsB.l <- c(0.9, 0.5, 0.1) #eradication of low state during between weeks
epsB.h <- c(0.7, 0.4, 0.1) #eradication of high state during between weeks

low.grow <- list(phi0.hhs = phi0.hhs[1], eps.l0 = eps.l0s[1],eps.h0 = eps.h0s[1],
                 phiB.lhs = phiB.lhs[1], phiB.hhs = phiB.hhs[1],epsB.l= epsB.l[1], epsB.h = epsB.h[1])

med.grow <- list(phi0.hhs = phi0.hhs[2],eps.l0 = eps.l0s[2],eps.h0 = eps.h0s[2],
                 phiB.lhs = phiB.lhs[2], phiB.hhs = phiB.hhs[2],epsB.l= epsB.l[2], epsB.h = epsB.h[2])

high.grow <- list(phi0.hhs = phi0.hhs[3], eps.l0 = eps.l0s[3],eps.h0 = eps.h0s[3],
                  phiB.lhs = phiB.lhs[3], phiB.hhs = phiB.hhs[3],epsB.l= epsB.l[3], epsB.h = epsB.h[3])

gro4 <- list(low.grow, med.grow, high.grow)




#### 5. Effect of removal #### 
eps.l1s <- c(1.25, 1.5, 2)  #effect of eradication at low state during data weeks
eps.h1s <- c(1.1, 1.25, 1.5) #effect of eradication at high state during data weeks
phi1.hhs <- c(1, 0.6, 0.3) #effect of removal on growth during data weeks

low.removal <- list(eps.l1 = eps.l1s[1],eps.h1 = eps.h1s[1],phi1.hhs = phi1.hhs[1])
med.removal <- list(eps.l1 = eps.l1s[2],eps.h1 = eps.h1s[2],phi1.hhs = phi1.hhs[2])
high.removal <- list(eps.l1 = eps.l1s[3],eps.h1 = eps.h1s[3],phi1.hhs = phi1.hhs[3])

rem5 <- list(low.removal, med.removal, high.removal)

# invlogit(eps.l0s[1] + 2*eps.l1s[3]) #want highest
# invlogit(eps.l0s[2] + 2*eps.l1s[2])
# invlogit(eps.l0s[3] + 2*eps.l1s[1]) #want low
# 
# invlogit(eps.h0s[1] + 2*eps.h1s[3])#want highest
# invlogit(eps.h0s[2] + 2*eps.h1s[2])
# invlogit(eps.h0s[3] + 2*eps.h1s[1])#want low


#### 6. Detection Rates ####
p.l0s <- c(0.2, 0.3, 0.4) #base detection for low state
p.l1s <- c(1, 2, 3) #effect of effort
p.h0s <- c(0.4, 0.6, 0.8) #base detection for high state
p.h1s <- c(2, 4, 6) #effect of effort
alpha.ls <- c(0.1, 0.2, 0.3) #difference in baseline detection between dat D and M
alpha.hs <- c(0.1, 0.2, 0.3)  #difference in baseline detection between dat D and M
deltas <- c(0.2, 0.6, 0.8)  # Probability of observing the high state given the species

#Save as a list
low.detection <- list(
  p.l0 = p.l0s[1], #base detection for low state
  p.l1 = p.l1s[1], #effect of effort
  p.h0 = p.h0s[1], #base detection for high state
  p.h1 = p.h1s[1], #effect of effort
  alpha.l = alpha.ls[1], #difference in baseline detection between dat D and M
  alpha.h = alpha.hs[1],  #difference in baseline detection between dat D and M
  delta = deltas[1]  # Probability of observing the high state given the species 
)

med.detection <- list(
  p.l0 = p.l0s[2], #base detection for low state
  p.l1 = p.l1s[2], #effect of effort
  p.h0 = p.h0s[2], #base detection for high state
  p.h1 = p.h1s[2], #effect of effort
  alpha.l = alpha.ls[2], #difference in baseline detection between dat D and M
  alpha.h = alpha.hs[2],  #difference in baseline detection between dat D and M
  delta = deltas[2]  # Probability of observing the high state given the species 
)

high.detection <- list(
  p.l0 = p.l0s[3], #base detection for low state
  p.l1 = p.l1s[3], #effect of effort
  p.h0 = p.h0s[3], #base detection for high state
  p.h1 = p.h1s[3], #effect of effort
  alpha.l = alpha.ls[3], #difference in baseline detection between dat D and M
  alpha.h = alpha.hs[3],  #difference in baseline detection between dat D and M
  delta = deltas[3]  # Probability of observing the high state given the species 
)

det6 <- list(low.detection, med.detection, high.detection)

#### Removal values ####
# has been detected and the true state is high
search.hourss <- c(1, 2, 4) #effort is fixed
removal.hourss <- c(2, 4, 8) #effort is fixed

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
  rate.init[i] <- mean(rbinom(100000,1,invlogit(gamma.0s[2] + gamma.1s[2]*site.char[i]))) #invasion rate
  p.high <- 0.5 #say the probability of being in high state is 0.5
  
  occ.init[i] <- round(mean(rbern(100000,rate.init[i]))) #being invaded or not
  
  init.matrix[i,1] <- (1-rate.init[i])*occ.init[i] + (1-occ.init[i]) #empty
  init.matrix[i,2] <- (rate.init[i])*occ.init[i]*(1-p.high) #low state
  init.matrix[i,3] <- (rate.init[i])*occ.init[i]*(p.high) #high state
  
  State.init[i] <- rcat(1,init.matrix[i,1:3])
}

#### Save workspace ####
save.image(file = "parameters.RData")

####Plot####
#Low values:
p.val.l <- array(NA, c(3,3))
p.val.h <- array(NA, c(3,3))

for(p in 1:3){
  for(s in 1:3){
    p.val.l[p,s] <- invlogit(p.l0s[p] + p.l1s[p]*log(search.hourss[s]) + alpha.ls[p])
    p.val.h[p,s] <- invlogit(p.h0s[p] + p.h1s[p]*log(search.hourss[s]) + alpha.hs[p])
  }
}

pl.df <- adply(p.val.l, c(1,2))
pl.df$state <- 'Low State'
ph.df <- adply(p.val.h, c(1,2))
ph.df$state <- 'High State'

p.df <- rbind(pl.df, ph.df)
colnames(p.df) <- c("Detection", "Search", "Value", "State")
p.df$Search <- as.numeric(p.df$Search)

for(i in 1:length(p.df$Search)){
  if(p.df$Search[i] == 1){
    p.df$Search[i] <- search.hourss[1]
  }
  if(p.df$Search[i] == 2){
    p.df$Search[i] <- search.hourss[2]
  }
  if(p.df$Search[i] == 3){
    p.df$Search[i] <- search.hourss[3]
  }
}

ggplot(p.df)+
  geom_point(aes(x = Search, y = Value, col = Detection, shape = State))+
  geom_line(aes(x = Search, y = Value, col = Detection, group = interaction(State, Detection)))+
  scale_color_manual(labels = c("Low", "Medium", "High"), values = c("green", "black", "purple")) +
  facet_wrap(~State) + 
  ylab("Detection Probability") +xlab("Search hours")




