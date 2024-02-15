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
n.neighbors <- length(neighbors)
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

#### p.l ####
#probability of detecting low
B0.p.ls <- seq(-2,1, by = 0.25) #potential B0s
B1.p.ls <- seq(0,2, by = 0.25) #potential B1s

pl.combine <- expand.grid(B0 = B0.p.ls,B1 = B1.p.ls ) #combinations of B0s and B1s
n.pl <- length(pl.combine$B0)
pl.array <- array(NA, c(n.pl, n.search))

for(p in 1:n.pl){
  for(r in 1:n.search)
    if(search.hours[r] == 0){
      pl.array[p,r] <- invlogit(pl.combine$B0[p])
    }else{
      pl.array[p,r] <- invlogit(pl.combine$B0[p] + log(search.hours[r])*pl.combine$B1[p])
    }
  
}

pl.df <- adply(pl.array, c(1,2))
colnames(pl.df) <- c("p", "search_hours", "p.h")
pl.df$search_hours <- as.numeric(pl.df$search_hours) - 1
pl.df$B0 <- rep(pl.combine$B0, n.search)
pl.df$B1 <- rep(pl.combine$B1, n.search)

ggplot(pl.df, aes(B0,B1, fill= p.h)) + 
  geom_tile() +
  scale_fill_distiller(palette = "Spectral") +
  facet_wrap(~ search_hours, labeller = label_both)+ labs(title = "p.l = invlogit(B0 + B1*log(search_hours)")

#### p.h ####
#probability of detecting
B0.p.hs <- seq(-1,2, by = 0.25) #potential B0s
B1.p.hs <- seq(0,2, by = 0.25) #potential B1s

ph.combine <- expand.grid(B0 = B0.p.hs,B1 = B1.p.hs ) #combinations of B0s and B1s
n.ph <- length(ph.combine$B0)
ph.array <- array(NA, c(n.ph, n.search))

for(p in 1:n.ph){
  for(r in 1:n.search)
    if(search.hours[r] == 0){
      ph.array[p,r] <- invlogit(ph.combine$B0[p])
    }else{
      ph.array[p,r] <- invlogit(ph.combine$B0[p] + log(search.hours[r])*ph.combine$B1[p])
    }
}

ph.df <- adply(ph.array, c(1,2))
colnames(ph.df) <- c("p", "search_hours", "p.h")
ph.df$search_hours <- as.numeric(ph.df$search_hours) - 1
ph.df$B0 <- rep(ph.combine$B0, n.search)
ph.df$B1 <- rep(ph.combine$B1, n.search)

ggplot(ph.df, aes(B0,B1, fill= p.h)) + 
  geom_tile() +
  scale_fill_distiller(palette = "Spectral") +
  facet_wrap(~ search_hours, labeller = label_both)+ labs(title = "p.h = invlogit(B0 + B1*log(search_hours)")

#### gamma -min site.char ####
#invasion probability
load("parameters.RData")
site.min <- min(site.char)

B0.gammas <- seq(-2,2, by = 0.25) 
B1.gammas <- seq(-2,2, by = 0.25) 
B2.gammas <- seq(-2,2, by = 0.25)

gamma.combine <- expand.grid(B0 = B0.gammas,B1 = B1.gammas,B2 = B2.gammas) #combinations of B0s and B1s
n.gamma <- length(gamma.combine$B0)
gamma.array <- array(NA, c(n.gamma, n.neighbors))

for(p in 1:n.ph){
  for(n in 1:n.search){
    gamma.array[p,n] <- invlogit(gamma.combine$B0[p] + gamma.combine$B1[p]*site.min + gamma.combine$B2[p]*neighbors[n])
  }
}

gamma.df <- adply(ph.array, c(1,2))
colnames(gamma.df) <- c("p", "neighbor", "gamma")
gamma.df$neighbor <- as.numeric(gamma.df$neighbor) - 1

#### gamma -mean site.char ####
#invasion probability
load("parameters.RData")
site.mean <- mean(site.char)

B0.gammas <- seq(-2,2, by = 0.25) 
B1.gammas <- seq(-2,2, by = 0.25) 
B2.gammas <- seq(-2,2, by = 0.25)

gamma.combine <- expand.grid(B0 = B0.gammas,B1 = B1.gammas,B2 = B2.gammas) #combinations of B0s and B1s
n.gamma <- length(gamma.combine$B0)
gamma.array <- array(NA, c(n.gamma, n.neighbors))

for(p in 1:n.ph){
  for(n in 1:n.search){
    gamma.array[p,n] <- invlogit(gamma.combine$B0[p] + gamma.combine$B1[p]*site.mean + gamma.combine$B2[p]*neighbors[n])
  }
}

gamma.df <- adply(ph.array, c(1,2))
colnames(gamma.df) <- c("p", "neighbor", "gamma")
gamma.df$neighbor <- as.numeric(gamma.df$neighbor) - 1

#### gamma -mean site.char ####
#invasion probability
load("parameters.RData")
site.max <- max(site.char)

B0.gammas <- seq(-2,2, by = 0.25) 
B1.gammas <- seq(-2,2, by = 0.25) 
B2.gammas <- seq(-2,2, by = 0.25)

gamma.combine <- expand.grid(B0 = B0.gammas,B1 = B1.gammas,B2 = B2.gammas) #combinations of B0s and B1s
n.gamma <- length(gamma.combine$B0)
gamma.array <- array(NA, c(n.gamma, n.neighbors))

for(p in 1:n.ph){
  for(n in 1:n.search){
    gamma.array[p,n] <- invlogit(gamma.combine$B0[p] + gamma.combine$B1[p]*site.max + gamma.combine$B2[p]*neighbors[n])
  }
}

gamma.df <- adply(ph.array, c(1,2))
colnames(gamma.df) <- c("p", "neighbor", "gamma")
gamma.df$neighbor <- as.numeric(gamma.df$neighbor) - 1


# ##### 3d heat map ####
# # generate data, random + linear trend in x + linear trend in y
# data = matrix(data = runif(n = 100, min = 0, max = 1), nrow=10, ncol = 10, dimnames=list(paste0('x',1:10),paste0('y',1:10)))
# data = sweep(x = data, MARGIN = 1, 10:1, FUN = '+')
# data = sweep(x = data, MARGIN = 2, 1:10, FUN = '+')
# 
# # generate 'empty' persp plot
# pmat = persp(x=c(0,10), y=c(0,10), z=matrix(c(0,.1,0,.1), nrow=2), 
#              xlim=c(0,10), ylim=c(0,10), zlim=c(0,20), 
#              xlab='x', ylab='y', zlab='z', 
#              theta=60, phi=20, d=2, box=F) 
# 
# # define color ramp
# my_cols = heat.colors(10)
# 
# # generate color matrix (values between 1 and 10, corresponding to 10 values my_cols
# colmat = matrix(data = 1, ncol = 10, nrow = 10)
# colmat[1,1:10] <- 5
# colmat[5,2:4] <- 8
# colmat[6,8] <- 3
# 
# # draw each bar: from left to right ...
# for (i in 1:nrow(data)){
#   
#   # ... and back to front 
#   for (j in ncol(data):1){
#     
#     xy = which(data == data[i,j], arr.ind=TRUE)
#     
#     # side facing y
#     x = rep(xy[1],4)
#     y = c(xy[2]-1,xy[2],xy[2],xy[2]-1)
#     z = c(0,0,data[i,j],data[i,j])
#     polygon(trans3d(x, y, z, pmat), col=my_cols[colmat[i,j]], border=1)
#     
#     #  side facing x
#     x = c(xy[1]-1,xy[1],xy[1],xy[1]-1)
#     y = rep(xy[2]-1,4)
#     z = c(0,0,data[i,j],data[i,j])
#     polygon(trans3d(x, y, z, pmat), col=my_cols[colmat[i,j]], border=1)
#     
#     # top side
#     x = c(xy[1]-1,xy[1],xy[1],xy[1]-1)
#     y = c(xy[2]-1,xy[2]-1,xy[2],xy[2])
#     z = rep(data[i,j],4)
#     polygon(trans3d(x, y, z, pmat), col=my_cols[colmat[i,j]], border=1)
#     
#   }
# }
# 
# # define axis ranges etc
# x.axis <- 1:ncol(data) - 0.5
# min.x <- 0
# max.x <- 10
# y.axis <- 1:nrow(data) - 0.5 
# min.y <- 0
# max.y <- 10
# z.axis <- seq(0, 10, by=10)
# min.z <- 0
# max.z <- 10
# 
# # add some distance between tick labels and the axis
# xoffset = 1
# yoffset = 0.5
# zoffset = 0.5
# ticklength = 0.2
# 
# # x axis ticks
# tick.start <- trans3d(x.axis, min.y, min.z, pmat)
# tick.end <- trans3d(x.axis, (min.y - ticklength), min.z, pmat)
# segments(tick.start$x, tick.start$y, tick.end$x, tick.end$y)
# 
# # y axis ticks
# tick.start <- trans3d(max.x, y.axis, min.z, pmat)
# tick.end <- trans3d(max.x + ticklength, y.axis, min.z, pmat)
# segments(tick.start$x, tick.start$y, tick.end$x, tick.end$y)
# 
# # z axis ticks
# tick.start <- trans3d(min.x, min.y, z.axis, pmat)
# tick.end <- trans3d(min.x, (min.y - ticklength), z.axis, pmat)
# segments(tick.start$x, tick.start$y, tick.end$x, tick.end$y)
# 
# # x labels
# labels <- rownames(data)
# label.pos <- trans3d(x.axis, (min.y - xoffset), min.z, pmat)
# text(label.pos$x, label.pos$y, labels=labels, adj=c(0, NA), srt=0, cex=0.6)
# 
# # y labels
# labels <- colnames(data)
# label.pos <- trans3d((max.x + yoffset), y.axis, min.z, pmat)
# text(label.pos$x, label.pos$y, labels=labels, adj=c(0, NA), srt=0, cex=0.6)
# 
# # z labels
# labels <- as.character(z.axis)
# label.pos <- trans3d(min.x, (min.y - zoffset), z.axis, pmat)
# text(label.pos$x, label.pos$y, labels=labels, adj=c(1, NA), srt=0, cex=0.6) 
# 
# 
