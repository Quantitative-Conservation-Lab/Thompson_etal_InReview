library(tidyverse)
library(ggplot2)
library(LaplacesDemon)

n.occs <- 2 #number of occasions for occupancy data collection
n.states <- 3 #number of states

gamma.0s <- c(0.2, 0.5, 0.8) #intrinsic invasion probability
gamma.1s <- c(0.2, 0.5, 0.8) #effect of site characteristics
gamma.2s <- c(0.2, 0.5, 0.8) #effect of neighboring invasion state

# eps.l0s <- c(0.8, 0.6, 0.4) #base eradication at low state
# eps.l1s <- c(0.8, 0.6, 0.4)  #effect of eradication at low state
# eps.h0s <- c(0.6, 0.4, 0.2)  #base eradication at high state
# eps.h1s <- c(0.6, 0.4, 0.2) #effect of eradication at high state

eps.l0s <- c(0.9, 0.6, 0.3) #base eradication at low state
eps.l1s <- c(0.9, 0.6, 0.3)  #effect of eradication at low state
eps.h0s <- c(0.6, 0.4, 0.2)  #base eradication at high state
eps.h1s <- c(0.6, 0.4, 0.2) #effect of eradication at high state

phi0.lhs <- c(0.2, 0.6, 0.8) #transition from low to high
phi0.hhs <- c(0.2, 0.6, 0.8) #transition from high to high

phi1.lhs <- c(0.6, 0.4, 0.2) #transition from low to high
phi1.hhs <- c(0.6, 0.4, 0.2) #transition from high to high

TPM.48s <- array(NA, dim = c(n.states, n.states, 3))
TPM.48s[1,,1] <- c(1,0,0)
TPM.48s[2,,1] <- c(0.2,0.8,0)
TPM.48s[3,,1] <- c(0.1,0.2,0.7)

TPM.48s[1,,2] <- c(1,0,0)
TPM.48s[2,,2] <- c(0,1,0)
TPM.48s[3,,2] <- c(0,0,1)

TPM.48s[1,,3] <- c(0.8,0.2,0)
TPM.48s[2,,3] <- c(0,0.8,0.2)
TPM.48s[3,,3] <- c(0,0,1)

p.l0s <- c(0.2, 0.4, 0.6) #base detection for low state
p.l1s <- c(0.2, 0.4, 0.6) #effect of effort
p.h0s <- c(0.4, 0.6, 0.8) #base detection for high state
p.h1s <- c(0.4, 0.6, 0.8) #effect of effort
alpha.ls <- c(0.1, 0.2, 0.3) #difference in baseline detection between dat D and M
alpha.hs <- c(0.1, 0.2, 0.3)  #difference in baseline detection between dat D and M
deltas <- c(0.2, 0.6, 0.8)  # Probability of observing the high state given the species

# has been detected and the true state is high
search.hourss <- c(0.5, 1.1, 2) #effort is fixed
n.resource <- 40 #total resources we can use each week (hours)

#### Save workspace ####
save.image(file = "parameters.RData")

#load("parameters.RData")
#### DETECTION CURVES ####

search.hoursvals <- c(search.hourss,5) 
#search.hoursvals <- c(0.25, 0.5, 1, 2, 4, 8, 16) 
n <- length(search.hoursvals)
logsearch.efforts <- log(search.hoursvals) #log search effort

pM.l.lowd <- invlogit(p.l0s[1] + p.l1s[1]*logsearch.efforts + alpha.ls[1])
pM.l.highd <- invlogit(p.l0s[3] + p.l1s[3]*logsearch.efforts + alpha.ls[3])

pM.h.lowd <- invlogit(p.h0s[1] + p.h1s[1]*logsearch.efforts + alpha.hs[1])
pM.h.highd <- invlogit(p.h0s[3] + p.h1s[3]*logsearch.efforts + alpha.hs[3])

det.df <- data.frame(detection = c(pM.l.lowd, pM.l.highd, pM.h.lowd, pM.h.highd),
           val = c(rep(1,n), rep(2,n), rep(1,n), rep(2,n)),
           state = c(rep(1,n), rep(1,n), rep(2,n), rep(2,n)),
           effort = rep(search.hoursvals,4),
           color = c(rep('low state, low detection',n),rep('low state, high detection',n),
                         rep('high state, low detection',n), rep('high state, high detection',n)),
           colorvals = c(rep('grey',n),rep('black',n),
                     rep('red1',n), rep('red4',n))
           )

colorvals <- c(rep('lightblue',n), rep('darkblue',n),
              rep('lightgreen',n),rep('darkgreen',n)
              )

ggplot(det.df)+
  geom_point(aes(x = effort, y = detection, group = val, color = color), color = colorvals)+
  geom_line(aes(x = effort, y = detection, group = interaction(val, state), color = color), color = colorvals)+
  xlab("Search effort (hours)") +
  ylab("Detection probability")+
  theme_bw() + theme(#panel.border = element_blank(),
                     panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(),
                     axis.title.x = element_text(size = 16),
                     axis.text.x = element_text(size = 14),
                     axis.title.y = element_text(size = 16),
                     axis.line = element_line(colour = "black"))

