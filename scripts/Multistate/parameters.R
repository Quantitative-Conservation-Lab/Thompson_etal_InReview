
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

phi.lhs <- c(0.2, 0.6, 0.8) #transition from low to high
phi.hhs <- c(0.2, 0.6, 0.8) #transition from high to high

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

