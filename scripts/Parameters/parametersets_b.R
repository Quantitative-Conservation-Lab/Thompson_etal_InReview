library(tidyverse)
library(ggplot2)
library(LaplacesDemon)
library(plyr)
library(tidyr)
library(RColorBrewer)
library(fabricatr)
library(plotly)
library(LaplacesDemon)

####  DATA ####
set.seed(03222)#

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
B0.gamma <- rnorm(100, 0, 0.5)
B1.gamma <- rnorm(100, 1, 0.5)
B2.gamma <- rnorm(100, 2, 0.5)

invasion.parms <- expand.grid(B0 = B0.gamma, B1 = B1.gamma, B2 = B2.gamma,
                              site.cov = site.cov, neighbors = neighbors)

invasion <- invlogit(invasion.parms$B0 + 
                       invasion.parms$B1*invasion.parms$site.cov +
                       invasion.parms$B2*invasion.parms$neighbors)

summary(invasion)

#### Staying in high state ####
B0.phih <- rnorm(100, 2, 0.5)
B1.phih <- rnorm(100, 1, 0.5)

#B1.phi is negative!

for(i in 1:length(B1.phih)){
  while(B1.phih[i] > 0 ){
    B1.phih[i] <- rnorm(1, 1, 0.5)
  }
}

phih.parms <- expand.grid(B0 = B0.phih, B1 = B1.phih, rem = rem.hours)

phih <- invlogit(phih.parms$B0 - phih.parms$B1*phih.parms$rem)

summary(phih)
boxplot(phih)

#### Eradication low state ####
B0.epsl <- rnorm(100, -2, 0.5)
B1.epsl <- rnorm(100, 3, 0.5)


for(i in 1:length(B1.epsl)){
  while(B1.epsl[i] < 0 ){
    B1.epsl[i] <- rnorm(1, 3, 0.5)
  }
}


epsl.parms <- expand.grid(B0 = B0.epsl, B1 = B1.epsl, rem = rem.hours)

epsl <- invlogit(epsl.parms$B0 + epsl.parms$B1*epsl.parms$rem)

summary(epsl)
boxplot(epsl)

#### Eradication high state ####
B0.epsh <- rnorm(100, -3, 0.5)
B1.epsh <- rnorm(100, 2, 0.5)

for(i in 1:length(B1.epsh)){
  while(B1.epsh[i] < 0 ){
    B1.epsh[i] <- rnorm(1, 2, 0.5)
  }
}

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

g.a <- alpha_in_beta_moment(0.5,0.1)
g.b <- beta_in_beta_moment(g.a, 0.5)
g <- rbeta(100,g.a,g.b)
summary(g)

phiB.la <- 2
phiB.lb <- 15
phiB.l <- rbeta(100,phiB.la,phiB.lb)
summary(phiB.l)

phiB.ha <- alpha_in_beta_moment(0.7,0.1)
phiB.hb <- beta_in_beta_moment(phiB.ha, 0.7)
phiB.h <- rbeta(100,phiB.ha,phiB.hb)
summary(phiB.h) 

epsB.la <- 2
epsB.lb <- 15
epsB.l <- rbeta(100,epsB.la,epsB.lb)
summary(epsB.l) 

epsB.ha <- 1
epsB.hb <- 20
epsB.h <- rbeta(100,epsB.ha,epsB.hb)
summary(epsB.h) 

#### Detection low state ####
B0.pl <- rnorm(100, 0, 0.5)
B1.pl <- rnorm(100, 2, 0.5)

for(i in 1:length(B1.pl)){
  while(B1.pl[i] < 0 ){
    B1.pl[i] <- rnorm(1, 2, 0.5)
  }
}

pl.parms <- expand.grid(B0 = B0.pl, B1 = B1.pl, log.search = log.search)

pl <- invlogit(pl.parms$B0 + pl.parms$B1*pl.parms$log.search)

summary(pl)
boxplot(pl)

#### Detection high state ####
B0.ph <- rnorm(100, 0, 0.5)
B1.ph <- rnorm(100, 3, 0.5)

for(i in 1:length(B1.ph)){
  while(B1.ph[i] < 0 ){
    B1.ph[i] <- rnorm(1, 3, 0.5)
  }
}

ph.parms <- expand.grid(B0 = B0.ph, B1 = B1.ph, log.search = log.search)

ph <- invlogit(ph.parms$B0 + ph.parms$B1*ph.parms$log.search)

summary(ph)
boxplot(ph)

#### Correctly observing high state if invaded ####
delta <- rbeta(100,1,1)
summary(delta) 

#### Difference between datm and datd ####
alpha.l <- rnorm(100, 0, 0.5)
alpha.h <- rnorm(100, 0, 0.5)

#alpha.l and alpha.h are negative
for(i in 1:100){
  while(alpha.l[i] > 0){
    alpha.l[i] <- rnorm(1, 0, 0.5)
  }
  
  while(alpha.h[i] > 0){
    alpha.h[i] <- rnorm(1, 0, 0.5)
  }
  
}


save.image(file = "parameters_data_b.RData")
