library(LaplacesDemon)
library(plyr)
library(tidyverse)

#### Data ####
n.sims <- 50 #simulations

phi.lh <- 0.05 #transition from low to high
phi.hh <- 0.9 #transition from high to high

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

##### Week 1 year 1 #####
#Initial True State 
#first 5 sites are highly invaded, then next 5 sites are low abundance, then none
State[1:5,1,1,] <- 3 #n.states
State[6:10,1,1,] <- 2
State[11:20,1,1,] <- 1

#### Week 2+ year 1 #####
D <- array(NA, c(n.sites,n.weeks, n.years,n.sims)) #neighbor states

year <- 1


#filling in transitions for second week, year 1
for(s in 1:n.sims){
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

        ps[2,i,week-1,1] <- 0 #low abundance to empty
        ps[2,i,week-1,2] <- (1-phi.lh) #low abundance to low abundance
        ps[2,i,week-1,3] <- (phi.lh) #low abundance to high abundance
        
        ps[3,i,week-1,1] <- 0
        ps[3,i,week-1,2] <- (1-phi.hh) #high abundance to low abundance
        ps[3,i,week-1,3] <- (phi.hh) #high abundance to high abundance
      
      State[i,week,year,s] <- rcat(1,ps[State[i,week-1,year,s], i, (week-1), ])
      
    }

    
  } #ends week loop
  
  
} #ends sims loop


#### Years 2+ ####
#filling in transitions for second week, year 1
for(s in 1:n.sims){
  for(year in 2:n.years){
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
      
        ps[2,i,4,1] <- 0 #low abundance to empty
        ps[2,i,4,2] <- (1-phi.lh) #low abundance to low abundance
        ps[2,i,4,3] <- (phi.lh) #low abundance to high abundance
        
        ps[3,i,4,1] <- 0
        ps[3,i,4,2] <- (1-phi.hh) #high abundance to low abundance
        ps[3,i,4,3] <- (phi.hh) #high abundance to high abundance
      
      State[i,week,year,s] <- rcat(1,ps[State[i,4,year-1,s], i, 4, ])
      
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
       
          ps[2,i,week-1,1] <- 0 #low abundance to empty
          ps[2,i,week-1,2] <- (1-phi.lh) #low abundance to low abundance
          ps[2,i,week-1,3] <- (phi.lh) #low abundance to high abundance
          
          ps[3,i,week-1,1] <- 0
          ps[3,i,week-1,2] <- (1-phi.hh) #high abundance to low abundance
          ps[3,i,week-1,3] <- (phi.hh) #high abundance to high abundance
        
        
        State[i,week,year,s] <- rcat(1,ps[State[i,week-1,year,s], i, (week-1), ])
        
      }
    
      
    } #ends week loop
    
  } #ends year loop
  
} #ends sims loop


round(rowMeans(State[,4,n.years,1:n.sims]))

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

