library(tidyverse)
library(ggplot2)
library(LaplacesDemon)
library(plyr)
library(tidyr)
library(RColorBrewer)
library(fabricatr)

rem.hours <- seq(0,6)
search.hours <- seq(0,3)
neighbors <- seq(0,4)
n.rem <- length(rem.hours)
n.search <- length(search.hours)
n.neighbors
#### eps.l ####
B0.eps.ls <- seq(-1,2, by = 0.25) #potential B0s
B1.eps.ls <- seq(0,2, by = 0.25) #potential B1s (min = 0 because want to show removal has a greater effect than no removal)

epsl.combine <- expand.grid(B0 = B0.eps.ls,B1 = B1.eps.ls ) #combinations of B0s and B1s
n.epsl <- length(epsl.combine$B0)

epsl.array <- array(NA, c(n.epsl, n.rem))

for(p in 1:n.epsl){
  for(r in 1:n.rem)
    epsl.array[p,r] <- invlogit(epsl.combine$B0[p] + rem.hours[r]*epsl.combine$B1[p])
}

epsl.df <- adply(epsl.array, c(1,2))
colnames(epsl.df) <- c("p", "removal_hours", "eps.l")
epsl.df$removal_hours <- as.numeric(epsl.df$removal_hours) - 1
epsl.df$B0 <- rep(epsl.combine$B0, n.rem)
epsl.df$B1 <- rep(epsl.combine$B1, n.rem)

ggplot(epsl.df, aes(B0,B1, fill= eps.l)) + 
  geom_tile() +
  scale_fill_distiller(palette = "Spectral") +
  facet_wrap(~ removal_hours, labeller = label_both)+ labs(title = "eps.l = invlogit(B0 + B1*removal_hours)")

#### Unsure how to find the parameter sets ####
#find 3 groups -low medium and high
epsl.r2 <-  filter(epsl.df, removal_hours == 2)
#getJenksBreaks(eps.r2$eps.l, 4)
quantile(epsl.r2$eps.l, prob=c(0, .25,.5,.75, 1), type=1)

#### eps.h ####
B0.eps.hs <- seq(-2,1, by = 0.25) #potential B0s
B1.eps.hs <- seq(0,2, by = 0.25) #potential B1s (min = 0 because want to show removal has a greater effect than no removal)

epsh.combine <- expand.grid(B0 = B0.eps.hs,B1 = B1.eps.hs ) #combinations of B0s and B1s
n.epsh <- length(epsh.combine$B0)
epsh.array <- array(NA, c(n.epsh, n.rem))

for(p in 1:n.epsh){
  for(r in 1:n.rem)
    epsh.array[p,r] <- invlogit(epsh.combine$B0[p] + rem.hours[r]*epsh.combine$B1[p])
}

epsh.df <- adply(epsh.array, c(1,2))
colnames(epsh.df) <- c("p", "removal_hours", "eps.h")
epsh.df$removal_hours <- as.numeric(epsh.df$removal_hours) - 1
epsh.df$B0 <- rep(epsh.combine$B0, n.rem)
epsh.df$B1 <- rep(epsh.combine$B1, n.rem)

ggplot(epsh.df, aes(B0,B1, fill= eps.h)) + 
  geom_tile() +
  scale_fill_distiller(palette = "Spectral") +
  facet_wrap(~ removal_hours, labeller = label_both)+ labs(title = "eps.h = invlogit(B0 + B1*removal_hours)")

#### phi.h ####
#probability of staying in the high state
B0.phi.hs <- seq(-2,2, by = 0.25) #potential B0s
B1.phi.hs <- seq(0,2, by = 0.25) #potential B1s (min = 0 because want to show removal has a greater effect than no removal)

phih.combine <- expand.grid(B0 = B0.phi.hs,B1 = B1.phi.hs ) #combinations of B0s and B1s
n.phih <- length(phih.combine$B0)
phih.array <- array(NA, c(n.phih, n.rem))

for(p in 1:n.phih){
  for(r in 1:n.rem)
    phih.array[p,r] <- invlogit(phih.combine$B0[p] - rem.hours[r]*phih.combine$B1[p])
}

phih.df <- adply(phih.array, c(1,2))
colnames(phih.df) <- c("p", "removal_hours", "phi.h")
phih.df$removal_hours <- as.numeric(phih.df$removal_hours) - 1
phih.df$B0 <- rep(phih.combine$B0, n.rem)
phih.df$B1 <- rep(phih.combine$B1, n.rem)

ggplot(phih.df, aes(B0,B1, fill= phi.h)) + 
  geom_tile() +
  scale_fill_distiller(palette = "Spectral") +
  facet_wrap(~ removal_hours, labeller = label_both)+ labs(title = "phi.h = invlogit(B0 - B1*removal_hours)")

#### p.h ####
#probability of detecting
B0.p.hs <- seq(-1,2, by = 0.25) #potential B0s
B1.p.hs <- seq(0,2, by = 0.25) #potential B1s

ph.combine <- expand.grid(B0 = B0.p.hs,B1 = B1.p.hs ) #combinations of B0s and B1s
n.ph <- length(ph.combine$B0)
ph.array <- array(NA, c(n.ph, n.rem))

for(p in 1:n.ph){
  for(r in 1:n.search)
    #But if search = 0, dont log...
    ph.array[p,r] <- invlogit(ph.combine$B0[p] + log(search.hours[r])*ph.combine$B1[p])
}

ph.df <- adply(ph.array, c(1,2))
colnames(ph.df) <- c("p", "log_search_hours", "p.h")
ph.df$log_search_hours <- as.numeric(ph.df$removal_hours) - 1
ph.df$B0 <- rep(ph.combine$B0, n.rem)
ph.df$B1 <- rep(ph.combine$B1, n.rem)

ggplot(ph.df, aes(B0,B1, fill= p.h)) + 
  geom_tile() +
  scale_fill_distiller(palette = "Spectral") +
  facet_wrap(~ removal_hours, labeller = label_both)+ labs(title = "p.h = invlogit(B0 + B1*log_search_hours)")

#### p.l ####
#probability of detecting low
B0.p.ls <- seq(-2,1, by = 0.25) #potential B0s
B1.p.ls <- seq(0,2, by = 0.25) #potential B1s

#### gamma ####
#invasion probability
