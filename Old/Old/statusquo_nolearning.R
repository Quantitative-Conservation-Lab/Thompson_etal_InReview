library(LaplacesDemon)
library(rjags)
library(R2jags)
library(MCMCvis)
library(plyr)
library(tidyverse)
library(strex)

#### Data ####
n.sims <- 50 #simulations
eps.l <- 0.9 #eradication when at low state
eps.h <- 0.7 #eradication when at high state

phi.lh <- 0.05 #transition from low to high
phi.hh <- 0.9 #transition from high to high

p1.l <- 0.2 #detection probability (for multistate data)
p1.h <- 0.6 #detection probability (for multistate data)

p2.l <- 0.4 #detection probability (for multistate data)
p2.h <- 0.8 #detection probability (for multistate data)
delta <- 0.5
n.sites <- 20 #number of sites
n.rem <- n.sites
n.obs <- n.sites
n.weeks <- 4
n.years <- 10 #time steps
n.states <- 3


ps<- array(NA, c(n.states,n.sites,n.weeks, n.states)) #state transition array

gamma <- array(NA, c(n.sites,n.weeks,n.years,n.sims)) #invasion
gamma0 <- -2 #intrinsic invasion
gamma1 <- 0.5 #effect of neighboring locations on invasion probability

#transition probabilities
State <- array(NA, c(n.sites, n.weeks, n.years, n.sims))

# Observation probabilities 
Obs.multi <- array(NA, c(n.sites, n.weeks, n.years, n.sims))

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

sites.rem <- array(NA, dim = c(5, n.weeks, n.years, n.sims))

segs.selected <- array(1:n.sites, dim = c(5, n.weeks))


##### Week 1 year 1 #####
#Initial True State 
#first 5 sites are highly invaded, then next 5 sites are low abundance, then none
State[1:5,1,1,] <- 3 #n.states
State[6:10,1,1,] <- 2
State[11:20,1,1,] <- 1
year <- 1
for(s in 1:n.sims){
  for(i in segs.selected[,1]){
    Obs.multi[i,1,year,s] <- rcat(1,po_multi[State[i,1,year,s], ])
  }
}


for(s in 1:n.sims){
  sites.rem[1:length(which(Obs.multi[1:5,1,year,s] > 1)), 1, year, s] <- which(Obs.multi[1:5,1,year,s] > 1)
}


D <- array(NA, c(n.sites,n.weeks, n.years,n.sims)) #neighbor states

#checking
# discard(sites.rem[,4,year,2], is.na)
# Obs.multi[, 4, 1, 2]
# 
# State[,4,1,2]

#### Simulations ####
for(s in 1:n.sims){
  year <- 1
  for(week in 2:n.weeks){
    for(i in 1:(n.sites)){
      #### Year == 1 ####
      ###### edge transitions #####
      if(i %in% 2:(n.sites-1)){
        D[i,week-1,year,s] <- State[i+1,week-1,year,s] + State[i-1,week-1,year,s] 
        gamma[i,week-1,year,s] <- invlogit(gamma0 + gamma1*D[i,week-1,year,s]) #invasion probability
        
        ps[1,i,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
        ps[1,i,week-1,2] <- gamma[i,week-1,year,s] #empty to low abundance
        ps[1,i,week-1,3] <- 0
      }else{
        D[1,week-1,year,s] <- State[2,week-1,year,s]
        D[n.sites,week-1,year,s] <- State[(n.sites-1),week-1,year,s]
        
        gamma[1,week-1,year,s] <- invlogit(gamma0 + gamma1*D[1,week-1,year,s])
        ps[1,1,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
        ps[1,1,week-1,2] <- gamma[i,week-1,year,s]
        ps[1,1,week-1,3] <- 0
        
        gamma[n.sites,week-1,year,s] <- invlogit(gamma0 + gamma1*D[n.sites,week-1,year,s])
        ps[1,n.sites,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
        ps[1,n.sites,week-1,2] <- gamma[i,week-1,year,s]
        ps[1,n.sites,week-1,3] <- gamma[i,week-1,year,s]
      }
      ###### removal site transitions #####
      #Transitions if in removal site locations
      if(i %in% discard(sites.rem[,week-1,year,s], is.na) ){
        ps[2,i,week-1,1] <- eps.l #low abundance to empty
        ps[2,i,week-1,2] <- (1- eps.l*(1-phi.lh)) #low abundance to low abundance
        ps[2,i,week-1,3] <- (1- eps.l*(phi.lh)) #low abundance to high abundance
        
        ps[3,i,week-1,1] <- (eps.h) #high abundance to empty
        ps[3,i,week-1,2] <- (1- eps.h)*(1-phi.hh) #high abundance to low abundance
        ps[3,i,week-1,3] <- (1- eps.h)*(phi.hh) #high abundance to high abundance
      }else{
        ps[2,i,week-1,1] <- 0 #low abundance to empty
        ps[2,i,week-1,2] <- (1-phi.lh) #low abundance to low abundance
        ps[2,i,week-1,3] <- (phi.lh) #low abundance to high abundance
        
        ps[3,i,week-1,1] <- 0
        ps[3,i,week-1,2] <- (1-phi.hh) #high abundance to low abundance
        ps[3,i,week-1,3] <- (phi.hh) #high abundance to high abundance
      }
      
      State[i,week,year,s] <- rcat(1,ps[State[i,week-1,year,s], i, (week-1), ])
      
    }
    
    ###### Observation data ######
    for(i in segs.selected[,week]){
      Obs.multi[i,week,year,s] <- rcat(1,po_multi[State[i,week,year,s], ])
    }
    
    ###### Sites for removal ######
    #if we have no sites for removal then we record that
    if(sum(Obs.multi[,week,year,s] >= 2, na.rm = TRUE) == 0){
      sites.rem[1:5, week, year, s] <- rep(NA, 5)
    }else{
      sites.rem[1:length(which(Obs.multi[,week,year,s] >= 2)), week, year, s] <- which(Obs.multi[,week,year,s] >= 2)
    }
    
  } #ends week loop
  
  #### years > 1 ####
  for(year in 2:n.years){
    for(week in 1:n.weeks)
    ##### week 1 ####
    week <- 1
    
    for(i in 1:(n.sites)){
      ## State Transitions 
      ## edge transitions
      if(i %in% 2:(n.sites-1)){
        D[i,4,year-1,s] <- State[i+1,4,year-1,s] + State[i-1,4,year-1,s] 
        gamma[i,4,year-1,s] <- invlogit(gamma0 + gamma1*D[i,4,year-1,s]) #invasion probability
        
        ps[1,i,4,1] <- 1-gamma[i,4,year-1,s] #empty stay empty
        ps[1,i,4,2] <- gamma[i,4,year-1,s] #empty to low abundance
        ps[1,i,4,3] <- 0
      }else{
        D[1,4,year-1,s] <- State[2,4,year-1,s]
        D[n.sites,4,year-1,s] <- State[(n.sites-1),4,year-1,s]
          
        gamma[1,4,year-1,s] <- invlogit(gamma0 + gamma1*D[1,4,year-1,s])
        ps[1,1,4,1] <- 1-gamma[i,4,year-1,s] #empty stay empty
        ps[1,1,4,2] <- gamma[i,4,year-1,s]
        ps[1,1,4,3] <- 0
          
        gamma[n.sites,4,year-1,s] <- invlogit(gamma0 + gamma1*D[n.sites,4,year-1,s])
        ps[1,n.sites,4,1] <- 1-gamma[i,4,year-1,s] #empty stay empty
        ps[1,n.sites,4,2] <- gamma[i,4,year-1,s]
        ps[1,n.sites,4,3] <- gamma[i,4,year-1,s]
      }
        
      ##removal site transitions 
      #Transitions if in removal site locations
      if(i %in% discard(sites.rem[,4,year-1,s], is.na) ){
        ps[2,i,4,1] <- eps.l #low abundance to empty
        ps[2,i,4,2] <- (1- eps.l*(1-phi.lh)) #low abundance to low abundance
        ps[2,i,4,3] <- (1- eps.l*(phi.lh)) #low abundance to high abundance
          
        ps[3,i,4,1] <- (eps.h) #high abundance to empty
        ps[3,i,4,2] <- (1- eps.h)*(1-phi.hh) #high abundance to low abundance
        ps[3,i,4,3] <- (1- eps.h)*(phi.hh) #high abundance to high abundance
      }else{
        ps[2,i,4,1] <- 0 #low abundance to empty
        ps[2,i,4,2] <- (1-phi.lh) #low abundance to low abundance
        ps[2,i,4,3] <- (phi.lh) #low abundance to high abundance
        
        ps[3,i,4,1] <- 0
        ps[3,i,4,2] <- (1-phi.hh) #high abundance to low abundance
        ps[3,i,4,3] <- (phi.hh) #high abundance to high abundance
      }
        
      State[i,week,year,s] <- rcat(1,ps[State[i,4,year-1,s], i, 4, ])
        
    }
    
    ## Observation data 
    for(i in segs.selected[,week]){
      Obs.multi[i,week,year,s] <- rcat(1,po_multi[State[i,week,year,s], ])
    }
      
    ## Sites for removal
    #if we have no sites for removal then we record that
    if(sum(Obs.multi[,week,year,s] >= 2, na.rm = TRUE) == 0){
      sites.rem[1:5, week, year, s] <- rep(NA, 5)
    }else{
      sites.rem[1:length(which(Obs.multi[,week,year,s] >= 2)), week, year, s] <- which(Obs.multi[,week,year,s] >= 2)
    }
    
    ##### week 2+ ####
    for(week in 2:n.weeks){
      for(i in 1:(n.sites)){
        ###### State Transitions ######
        ###### edge transitions #####
        if(i %in% 2:(n.sites-1)){
          D[i,week-1,year,s] <- State[i+1,week-1,year,s] + State[i-1,week-1,year,s] 
          gamma[i,week-1,year,s] <- invlogit(gamma0 + gamma1*D[i,week-1,year,s]) #invasion probability
          
          ps[1,i,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
          ps[1,i,week-1,2] <- gamma[i,week-1,year,s] #empty to low abundance
          ps[1,i,week-1,3] <- 0
        }else{
          D[1,week-1,year,s] <- State[2,week-1,year,s]
          D[n.sites,week-1,year,s] <- State[(n.sites-1),week-1,year,s]
          
          gamma[1,week-1,year,s] <- invlogit(gamma0 + gamma1*D[1,week-1,year,s])
          ps[1,1,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
          ps[1,1,week-1,2] <- gamma[i,week-1,year,s]
          ps[1,1,week-1,3] <- 0
          
          gamma[n.sites,week-1,year,s] <- invlogit(gamma0 + gamma1*D[n.sites,week-1,year,s])
          ps[1,n.sites,week-1,1] <- 1-gamma[i,week-1,year,s] #empty stay empty
          ps[1,n.sites,week-1,2] <- gamma[i,week-1,year,s]
          ps[1,n.sites,week-1,3] <- gamma[i,week-1,year,s]
        }
        ###### removal site transitions #####
        #Transitions if in removal site locations
        if(i %in% discard(sites.rem[,week-1,year,s], is.na) ){
          ps[2,i,week-1,1] <- eps.l #low abundance to empty
          ps[2,i,week-1,2] <- (1- eps.l*(1-phi.lh)) #low abundance to low abundance
          ps[2,i,week-1,3] <- (1- eps.l*(phi.lh)) #low abundance to high abundance
          
          ps[3,i,week-1,1] <- (eps.h) #high abundance to empty
          ps[3,i,week-1,2] <- (1- eps.h)*(1-phi.hh) #high abundance to low abundance
          ps[3,i,week-1,3] <- (1- eps.h)*(phi.hh) #high abundance to high abundance
        }else{
          ps[2,i,week-1,1] <- 0 #low abundance to empty
          ps[2,i,week-1,2] <- (1-phi.lh) #low abundance to low abundance
          ps[2,i,week-1,3] <- (phi.lh) #low abundance to high abundance
          
          ps[3,i,week-1,1] <- 0
          ps[3,i,week-1,2] <- (1-phi.hh) #high abundance to low abundance
          ps[3,i,week-1,3] <- (phi.hh) #high abundance to high abundance
        }
        
        State[i,week,year,s] <- rcat(1,ps[State[i,week-1,year,s], i, (week-1), ])
        
      }
      
      ###### Observation data ######
      for(i in segs.selected[,week]){
        Obs.multi[i,week,year,s] <- rcat(1,po_multi[State[i,week,year,s], ])
      }
      
      ###### Sites for removal ######
      #if we have no sites for removal then we record that
      if(sum(Obs.multi[,week,year,s] >= 2, na.rm = TRUE) == 0){
        sites.rem[1:5, week, year, s] <- rep(NA, 5)
      }else{
        sites.rem[1:length(which(Obs.multi[,week,year,s] >= 2)), week, year, s] <- which(Obs.multi[,week,year,s] >= 2)
      }
      
    } #ends week loop
    
  } #ends year loop
  
} #ends sims loop


State[,4,n.years,1]
State[,4,n.years,2]

rowMeans(State[,4,n.years,1:n.sims])

#### Results Mean ####
y1 <-cbind(rowMeans(State[,1,1,1:n.sims]), seq(1:n.sites))
y1 <- data.frame(y1)              
colnames(y1) <- c("value", "site")              
y1$year <- 1


y2 <-cbind(rowMeans(State[,4,2,1:n.sims]), seq(1:n.sites))
y2 <- data.frame(y2)              
colnames(y2) <- c("value", "site")              
y2$year <- 2

y3 <-cbind(rowMeans(State[,4,3,1:n.sims]), seq(1:n.sites))
y3 <- data.frame(y3)              
colnames(y3) <- c("value", "site")              
y3$year <- 3

y4 <-cbind(rowMeans(State[,4,4,1:n.sims]), seq(1:n.sites))
y4 <- data.frame(y4)              
colnames(y4) <- c("value", "site")              
y4$year <- 4

y5 <-cbind(rowMeans(State[,4,5,1:n.sims]), seq(1:n.sites))
y5 <- data.frame(y5)              
colnames(y5) <- c("value", "site")              
y5$year <- 5

y6 <-cbind(rowMeans(State[,4,6,1:n.sims]), seq(1:n.sites))
y6 <- data.frame(y6)              
colnames(y6) <- c("value", "site")              
y6$year <- 6

y7 <-cbind(rowMeans(State[,4,7,1:n.sims]), seq(1:n.sites))
y7 <- data.frame(y7)              
colnames(y7) <- c("value", "site")              
y7$year <- 7

y8 <-cbind(rowMeans(State[,4,8,1:n.sims]), seq(1:n.sites))
y8 <- data.frame(y8)              
colnames(y8) <- c("value", "site")              
y8$year <- 8

y9 <-cbind(rowMeans(State[,4,9,1:n.sims]), seq(1:n.sites))
y9 <- data.frame(y9)              
colnames(y9) <- c("value", "site")              
y9$year <- 9

y10 <-cbind(rowMeans(State[,4,10,1:n.sims]), seq(1:n.sites))
y10 <- data.frame(y10)              
colnames(y10) <- c("value", "site")              
y10$year <- 10

final.res <- rbind(y1, y2, y3, y4, y5, y6, y7, y8, y9, y10)


ggplot(final.res)+
  geom_line(mapping = aes(x = year, y = value, group = site, color = site))+
  facet_wrap(~site)

final.res.year10 <- final.res %>% filter(year == 10)

ggplot(final.res.year10)+
  geom_bar(aes(x = site, y = value), stat = "identity")

final.res.year1 <- final.res %>% filter(year == 1)

ggplot(final.res.year1)+
  geom_bar(aes(x = site, y = value), stat = "identity")

final.res.year2 <- final.res %>% filter(year == 2)

ggplot(final.res.year2)+
  geom_bar(aes(x = site, y = value), stat = "identity")


final.res.year5 <- final.res %>% filter(year == 5)

ggplot(final.res.year5)+
  geom_bar(aes(x = site, y = value), stat = "identity")

#### Final across sims ####
final.allsims <-State[,4,10,1:n.sims]

final.allsims.df <- adply(final.allsims, c(1,2))
colnames(final.allsims.df) <- c("site", "simulation", "value")


#test
# final.allsims1.df <- final.allsims.df %>% filter(site == 1)
# 
# ggplot(final.allsims1.df)+
#   geom_boxplot(mapping = aes(x = site, y = value))
# 
# summary(final.allsims1.df)


ggplot(final.allsims.df)+
  geom_boxplot(mapping = aes(x = site, y = value))


