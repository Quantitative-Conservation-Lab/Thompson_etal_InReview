#Simulate occupancy and observation data 
#occupancy is a function of habitat characteristics: 

set.seed(4)

#number of sites 
sites <- 50 
#number of occasions 
occasions <- 2 

#effect of habitat quality on occupancy 
site.char <- runif(sites) #might be multivariate
b0 <- -2 
b1 <- 1 

#effect of effort on detection 
effort <- matrix(runif(sites*occasions),nrow=sites,ncol=occasions)
#can update this. 
a0 <- -1 
a1 <- 1 

#set up for simulation
occ.pr <- occ <- rep(NA,sites) 
detect.pr <- detect <- matrix(NA,nrow=sites,ncol = occasions)

#simulate occupancy
test <- rep(NA, sites)

for(i in 1:sites){
  occ.pr[i] <- 1/(1+exp(-(b0 + b1*site.char[i]))) #inv.logit
  occ[i] <- rbinom(1,1,occ.pr[i]) #true state
}

#simulate detection 
for(i in 1:sites){
  for(j in 1:2){
    detect.pr[i,j] <- 1/(1+exp(-(a1 + a1*log(effort[i,j]))))
  }
  detect[i,1] <- rbinom(1,1,detect.pr[i,1])*occ[i]
  if(detect[i,1]==1){
    detect[i,2] <- NA #wont search again after detected 
  }else{
    detect[i,2] <- rbinom(1,1,detect.pr[i,2])*occ[i] #occupancy data
  }
}

plot(effort[,1], detect.pr[,1])

#using detect (occupancy data), run occupancy model and set effort = 0 if we have detect = NA

#Estimates from occupancy model: occupancy probabilities
#Eventually make occupancy model autoregressive (effect of neighboring sites) --> dynamic occupancy model


#We can use occupancy probabilities to predict occupancy at each site

#Decisions: 
#1. Locations to search: select sites where occupancy probabilities are the highest (passive AM)
                         #select where occupancy probabilities are low (active AM)
#2. Amount of time spent searching: 
    #Example: search 50% of the assymptote of detection vs effort curve. 
    #Example: if logistic curve, search at the inflection point




#now, develop candidate search strategies (where and how long) based on what you know about occupancy and detection
#implement your rule, then fit an occupancy model to the data you collect
#update, etc. 

#So i need to model the state of the system and incorporate removals
#what would happen if we detect and remove right away -can that be included in occupancy data

#so, would effort be updated for different scenarios? 

# Examples of rules
#Go to random 10 locations where detected
#Go to 10 downstream locations where detected
#Others?


