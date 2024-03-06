library(tidyverse)
library(ggplot2)
library(LaplacesDemon)
library(plyr)
library(tidyr)
library(RColorBrewer)
library(fabricatr)
library(plotly)
library(LaplacesDemon)

####  DATA ###
set.seed(03222021)#

#---Habitat data---#
# effect of habitat quality on occupancy
n.sites <- 40
n.states <- 3

site.char <- runif(n.sites)

#---Initial state data---#
#Code that generated initial true state
State.init <- rep(NA, n.sites)
rate.init <- rep(NA, n.sites)
occ.init <- rep(NA, n.sites)
init.matrix <- array(NA, c(n.sites, n.states))
for(i in 1:n.sites){
  rate.init[i] <- mean(rbinom(100000,1,invlogit(1 + 1*site.char[i]))) #invasion rate
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

#-----------------------------------------------------------------------------#
rem.hours <- seq(0,10)
search.hours <- seq(0,10)
log.search <- log(search.hours)
log.search <- log.search[-1]
neighbors <- seq(0,4)
n.rem <- length(rem.hours)
n.search <- length(search.hours)
n.neighbors <- length(neighbors)

#### Invasion ####
site.cov <- site.char
B0.gamma <- rnorm(100, 1, 0.05)
B1.gamma <- rnorm(100, 1, 0.05)
B2.gamma <- rnorm(100, 2, 0.05)

invasion.parms <- expand.grid(B0 = B0.gamma, B1 = B1.gamma, B2 = B2.gamma,
                              site.cov = site.cov, neighbors = neighbors)

invasion <- invlogit(invasion.parms$B0 + 
                       invasion.parms$B1*invasion.parms$site.cov +
                       invasion.parms$B2*invasion.parms$neighbors)

summary(invasion)

#### Staying in high state ####
B0.phih <- rnorm(100, 2, 0.05)
B1.phih <- rnorm(100, 0, 1)

B1.phih[B1.phih < 0] <- 0

phih.parms <- expand.grid(B0 = B0.phih, B1 = B1.phih, rem = rem.hours)

phih <- invlogit(phih.parms$B0 - phih.parms$B1*phih.parms$rem)

summary(phih)
boxplot(phih)

#### Eradication low state ####
B0.epsl <- rnorm(100, 1, 0.05)
B1.epsl <- rnorm(100, 0, 1)
B1.epsl[B1.epsl < 0] <- 0

epsl.parms <- expand.grid(B0 = B0.epsl, B1 = B1.epsl, rem = rem.hours)

epsl <- invlogit(epsl.parms$B0 + epsl.parms$B1*epsl.parms$rem)

summary(epsl)
boxplot(epsl)

#### Eradication high state ####
B0.epsh <- rnorm(100, -2, 0.05)
B1.epsh <- rnorm(100, 0, 1)
B1.epsh[B1.epsh < 0] <- 0

epsh.parms <- expand.grid(B0 = B0.epsh, B1 = B1.epsh, rem = rem.hours)

epsh <- invlogit(epsh.parms$B0 + epsh.parms$B1*epsh.parms$rem)

summary(epsh)
boxplot(epsh)

#### Between week parameters ####
#Beta distribution
alpha_in_beta_moment <- function(means, sd){
  alpha <- (means^2 - means^3 -(means*sd^2))/sd^2
  return(alpha)
}

beta_in_beta_moment <- function(alpha, means){ #beta = (alpha)*(1-mean)/(mean)
  beta <- (alpha*(1-means))/means
  return(beta)
}


g.a <- alpha_in_beta_moment(0.2,0.1)
g.b <- beta_in_beta_moment(g.a, 0.2)
g <- rbeta(100,g.a,g.b)
summary(g)

phiB.la <- alpha_in_beta_moment(0.2,0.1)
phiB.lb <- beta_in_beta_moment(phiB.la, 0.2)
phiB.l <- rbeta(100,phiB.la,phiB.lb)
summary(phiB.l)

phiB.ha <- alpha_in_beta_moment(0.7,0.1)
phiB.hb <- beta_in_beta_moment(phiB.ha, 0.7)
phiB.h <- rbeta(100,phiB.ha,phiB.hb)
summary(phiB.h) 

epsB.la <- alpha_in_beta_moment(0.5,0.1)
epsB.lb <- beta_in_beta_moment(epsB.la, 0.5)
epsB.l <- rbeta(100,epsB.la,epsB.lb)
summary(epsB.l) 

epsB.ha <- alpha_in_beta_moment(0.1,0.05)
epsB.hb <- beta_in_beta_moment(epsB.ha, 0.1)
epsB.h <- rbeta(100,epsB.ha,epsB.hb)
summary(epsB.h) 

#### Detection low state ####
B0.pl <- rnorm(100,0,1)
B1.pl <- rnorm(100,0,1)

pl.parms <- expand.grid(B0 = B0.pl, B1 = B1.pl, log.search = log.search)

pl <- invlogit(pl.parms$B0 + pl.parms$B1*pl.parms$log.search)

summary(pl)
boxplot(pl)

#### Detection high state ####
B0.ph <- rnorm(100,0,1)
B1.ph <- rnorm(100,0,1)

ph.parms <- expand.grid(B0 = B0.ph, B1 = B1.ph, log.search = log.search)

ph <- invlogit(ph.parms$B0 + ph.parms$B1*ph.parms$log.search)

summary(ph)
boxplot(ph)

save.image(file = "parameters_data.RData")
