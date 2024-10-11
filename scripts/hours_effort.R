
#### Search effort ####
#logit(pl) = B0.pl + B1.pl*(log(search.hours)) 
#--> log(search.hours) = (logit(pl) - B0.pl)/B1.pl
#--> search.hours = exp( (logit(pl) - B0.pl)/B1.pl )
B0.pl <- rnorm(100, 0, 0.5)
B1.pl <- rnorm(100, 2, 0.5)

B0.ph <- rnorm(100, 0, 0.5)
B1.ph <- rnorm(100, 3, 0.5)

for(i in 1:length(B1.pl)){
  while(B1.pl[i] < 0 ){
    B1.pl[i] <- rnorm(1, 2, 0.5)
  }
}


for(i in 1:length(B1.ph)){
  while(B1.ph[i] < 0 ){
    B1.ph[i] <- rnorm(1, 3, 0.5)
  }
}

logsearch.L <- (logit(0.8) - B0.pl)/(B1.pl)
summary(exp(logsearch.L))

logsearch.H <- (logit(0.8) - B0.ph)/(B1.ph)
summary(exp(logsearch.H))

#### removal effort ####
#logit(epsl) = B0.epsl +  B0.epsl*(removal.hours) 
#--> log(removal.hours) = (logit(epsl) - B0.epsl)/B1.epsl
#--> removal.hours = exp( (logit(epsl) - B0.epsl)/B1.epsl )
B0.epsl <- rnorm(100, -2, 0.5)
B1.epsl <- rnorm(100, 3, 0.5)

B0.epsh <- rnorm(100, -3, 0.5)
B1.epsh <- rnorm(100, 2, 0.5)

for(i in 1:length(B1.epsl)){
  while(B1.epsl[i] < 0 ){
    B1.epsl[i] <- rnorm(1, 3, 0.5)
  }
}


for(i in 1:length(B1.epsh)){
  while(B1.epsh[i] < 0 ){
    B1.epsh[i] <- rnorm(1, 2, 0.5)
  }
}

removal.L <- (logit(0.8) - B0.epsl)/(B1.epsl)
removal.H <- (logit(0.8) - B0.epsh)/(B1.epsh)

summary(removal.L)
summary(removal.H)
