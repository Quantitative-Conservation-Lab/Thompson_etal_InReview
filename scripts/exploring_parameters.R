library(tidyverse)
library(ggplot2)
library(LaplacesDemon)
library(plyr)
library(tidyr)
library(RColorBrewer)


rem.hours <- seq(1,6)
n.rem <- length(rem.hours)
#### Eradication low state ####
B0.eps.ls <- seq(-2,2, by = 0.25) 
B1.eps.ls <- seq(-2,2, by = 0.25)  

eps.combine <- expand.grid(B0 = B0.eps.ls,B1 = B1.eps.ls )
n.eps <- length(eps.combine$B0)

eps.array <- array(NA, c(n.eps, n.rem))

for(p in 1:n.eps){
  for(r in 1:n.rem)
    eps.array[p,r] <- invlogit(eps.combine$B0[p] + rem.hours[r]*eps.combine$B1[p])
}

eps.df <- adply(eps.array, c(1,2))
colnames(eps.df) <- c("p", "removal_hours", "eps.l")
eps.df$B0 <- rep(eps.combine$B0, n.rem)
eps.df$B1 <- rep(eps.combine$B1, n.rem)

ggplot(eps.df, aes(B0,B1, fill= eps.l)) + 
  geom_tile() +
  scale_fill_distiller(palette = "Spectral") +
  facet_wrap(~ removal_hours)

summary(eps.df$eps.l)
#find 3 groups -low medium and high and find what those parameters were
