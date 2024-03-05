library(tidyverse)
library(ggplot2)
library(LaplacesDemon)
library(plyr)
library(tidyr)
library(RColorBrewer)
library(fabricatr)
library(plotly)
library(LaplacesDemon)

rem.hours <- seq(0,10)
search.hours <- seq(0,10)
log.search <- log(search.hours)
log.search <- log.search[-1]
neighbors <- seq(0,4)
n.rem <- length(rem.hours)
n.search <- length(search.hours)
n.neighbors <- length(neighbors)

#### Invasion ####
site.cov <- c(0,0.5,1)
B0.gamma <- B1.gamma <- B2.gamma <- seq(-2,2,by = 0.1)

invasion.parms <- expand.grid(B0 = B0.gamma, B1 = B1.gamma, B2 = B2.gamma,
                              site.cov = site.cov, neighbors = neighbors)

invasion <- invlogit(invasion.parms$B0 + invasion.parms$B1*invasion.parms$site.cov + invasion.parms$B2*invasion.parms$neighbors)

summary(invasion)
boxplot(invasion)

#### Staying in high state ####
B0.phih <- B1.phih <- seq(-1,1,by = 0.1)

phih.parms <- expand.grid(B0 = B0.phih, B1 = B1.phih, rem = rem.hours)

phih <- invlogit(phih.parms$B0 - phih.parms$B1*phih.parms$rem)

summary(phih)
boxplot(phih)

#### eradication low state ####
B0.epsl <- B1.epsl <- seq(-1,1,by = 0.1)

epsl.parms <- expand.grid(B0 = B0.epsl, B1 = B1.epsl, rem = rem.hours)

epsl <- invlogit(epsl.parms$B0 + epsl.parms$B1*epsl.parms$rem)

summary(epsl)
boxplot(epsl)

#### eradication high state ####
B0.epsh <- B1.epsh <- seq(-1,1,by = 0.1)

epsh.parms <- expand.grid(B0 = B0.epsh, B1 = B1.epsh, rem = rem.hours)

epsh <- invlogit(epsh.parms$B0 + epsh.parms$B1*epsh.parms$rem)

summary(epsh)
boxplot(epsh)

#### Detection low state ####
B0.pl <- B1.pl <- seq(-2,2,by = 0.1)

pl.parms <- expand.grid(B0 = B0.pl, B1 = B1.pl, log.search = log.search)

pl <- invlogit(pl.parms$B0 + pl.parms$B1*pl.parms$log.search)

summary(pl)
boxplot(pl)

#### Detection high state ####
B0.ph <- B1.ph <- seq(-2,2,by = 0.1)

ph.parms <- expand.grid(B0 = B0.ph, B1 = B1.ph, log.search = log.search)

ph <- invlogit(ph.parms$B0 + ph.parms$B1*ph.parms$log.search)

summary(ph)
boxplot(ph)

