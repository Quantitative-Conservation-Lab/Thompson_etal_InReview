#Comparing the decision scenarios: 
library(tidyverse)
library(here)
library(plyr)
library(boot)

path <- here::here("results", "ESA")
n.sites <- 50
n.sims <- 25
n.years <- 10

#### Final states ####
##### No control scenario ####
# path2 <- "nocontrol"
# file_name = paste(path, path2,'States_nocontrol.csv',sep = '/')
# nocontrol.states <- read.csv(file_name)[-1]
# 
# nc.final <- nocontrol.states %>% filter(year == 10)
# nc.final$dr <- "no control"

#### minimize number of invaded sites ####
##### update effort, high occ ####
path2 <- "e5_hocc_AR"

file_name = paste(path, path2,'Mean.States_e5_hocc.csv',sep = '/')
eup_hocc_state <- read.csv(file_name)[-1]

eup_hocc_state <- eup_hocc_state %>% filter(year == 11)

#count number of invaded sites for each sim
sum(round(eup_hocc_state$state))


##### update effort, random ####
path2 <- "e5_random"

file_name = paste(path, path2,'Mean.States_e5_random.csv',sep = '/')
eup_rand_state <- read.csv(file_name)[-1]

eup_rand_state <- eup_rand_state %>% filter(year == 11)

#count number of invaded sites for each sim
sum(round(eup_rand_state$state))

##### update effort, linear ####
path2 <- "e5_linear"

file_name = paste(path, path2,'Mean.States_e5_linear.csv',sep = '/')
eup_linear_state <- read.csv(file_name)[-1]

eup_linear_state <- eup_linear_state %>% filter(year == 11)

#count number of invaded sites for each sim
sum(round(eup_linear_state$state))


##### no update effort, high occ ####
path2 <- "eno_hocc"

file_name = paste(path, path2,'Mean.States_eno_hocc.csv',sep = '/')
eno_hocc_state <- read.csv(file_name)[-1]

eno_hocc_state <- eno_hocc_state %>% filter(year == 11)

#count number of invaded sites for each sim
sum(round(eno_hocc_state$state))


##### no update effort, random ####
path2 <- "eno_random"

file_name = paste(path, path2,'Mean.States_eno_random.csv',sep = '/')
eno_rand_state <- read.csv(file_name)[-1]

eno_rand_state <- eno_rand_state %>% filter(year == 11)

#count number of invaded sites for each sim
sum(round(eno_rand_state$state))

##### no update effort, linear ####
path2 <- "eno_linear"

file_name = paste(path, path2,'Mean.States_eno_linear.csv',sep = '/')
eno_linear_state <- read.csv(file_name)[-1]

eno_linear_state <- eno_linear_state %>% filter(year == 11)

#count number of invaded sites for each sim
sum(round(eno_linear_state$state))

#### minimize average invaded state ####
##### update effort, high occ ####
mean(eup_hocc_state$state)

##### update effort, random ####
mean(eup_rand_state$state)

##### update effort, linear ####
mean(eup_linear_state$state)

##### no update effort, high occ ####
mean(eno_hocc_state$state)

##### no effort, random ####
mean(eno_rand_state$state)

##### no effort, linear ####
mean(eno_linear_state$state)

#### Effort ####
##### update effort, high occ ####
path2 <- "e5_hocc_AR"

file_name = paste(path, path2,'logeffort_e5_hocc.csv',sep = '/')
eup_hocc_effort <- read.csv(file_name)[-1]

summary(exp(eup_hocc_effort$effort))

##### update effort, random ####
path2 <- "e5_random"

file_name = paste(path, path2,'logeffort_e5_random.csv',sep = '/')
eup_rand_effort <- read.csv(file_name)[-1]

summary(exp(eup_rand_effort$effort))

##### update effort, linear ####
path2 <- "e5_linear"

file_name = paste(path, path2,'logeffort_e5_linear.csv',sep = '/')
eup_linear_effort <- read.csv(file_name)[-1]

summary(exp(eup_linear_effort$effort))


#### States Map ####
##### update effort, high occ ####
eup_hocc_state <- eup_hocc_state %>% filter(year == 11)

#count number of invaded sites for each sim
eup_hocc_map <- data.frame(site = seq(1,n.sites), state = eup_hocc_state$state, dr = 1)
eup_rand_map <- data.frame(site = seq(1,n.sites), state = eup_rand_state$state, dr = 2)
eup_linear_map <- data.frame(site = seq(1,n.sites), state = eup_linear_state$state, dr = 3)

eno_hocc_map <- data.frame(site = seq(1,n.sites), state = eno_hocc_state$state, dr = 4)
eno_rand_map <- data.frame(site = seq(1,n.sites), state = eno_rand_state$state, dr = 5)
eno_linear_map <- data.frame(site = seq(1,n.sites), state = eno_linear_state$state, dr = 6)

heatmap.dat <- rbind(eup_hocc_map, eup_rand_map, eup_linear_map, 
                     eno_hocc_map, eno_rand_map, eno_linear_map)

ggplot(heatmap.dat, aes(x = site, y = dr, fill = state)) +
  geom_tile()

#count number of invaded sites for each sim
eup_hocc_map <- data.frame(site = seq(1,n.sites), state = round(eup_hocc_state$state), dr = 6)
eup_rand_map <- data.frame(site = seq(1,n.sites), state = round(eup_rand_state$state), dr = 5)
eup_linear_map <- data.frame(site = seq(1,n.sites), state = round(eup_linear_state$state), dr = 4)

eno_hocc_map <- data.frame(site = seq(1,n.sites), state = round(eno_hocc_state$state), dr = 3)
eno_rand_map <- data.frame(site = seq(1,n.sites), state = round(eno_rand_state$state), dr = 2)
eno_linear_map <- data.frame(site = seq(1,n.sites), state = round(eno_linear_state$state), dr = 1)

heatmap.dat <- rbind(eup_hocc_map, eup_rand_map, eup_linear_map, 
                     eno_hocc_map, eno_rand_map, eno_linear_map)

ggplot(heatmap.dat, aes(x = site, y = dr, fill = state)) +
  geom_tile()


#### Sites visited and removed avg ####
path2 <- "e5_hocc_AR"
file_name = paste(path, path2,'sites.visit_e5_hocc.csv',sep = '/')
eup_hocc_sites <- read.csv(file_name)[-1]

eup_hocc_sites <- gather(eup_hocc_sites, visit, num.visit, num.visit.norem:num.visit.rem, factor_key=TRUE)

eup_hocc_sites$dr <- "e5_hocc"

path2 <- "e5_random"
file_name = paste(path, path2,'sites.visit_e5_random.csv',sep = '/')
eup_rand_sites <- read.csv(file_name)[-1]
eup_rand_sites <- gather(eup_rand_sites, visit, num.visit, num.visit.norem:num.visit.rem, factor_key=TRUE)
eup_rand_sites$dr <- "e5_rand"

path2 <- "e5_linear"
file_name = paste(path, path2,'sites.visit_e5_linear.csv',sep = '/')
eup_linear_sites <- read.csv(file_name)[-1]
eup_linear_sites <- gather(eup_linear_sites, visit, num.visit, num.visit.norem:num.visit.rem, factor_key=TRUE)
eup_linear_sites$dr <- "e5_linear"

path2 <- "eno_hocc"
file_name = paste(path, path2,'sites.visit_eno_hocc.csv',sep = '/')
eno_hocc_sites <- read.csv(file_name)[-1]
eno_hocc_sites <- gather(eno_hocc_sites, visit, num.visit, num.visit.norem:num.visit.rem, factor_key=TRUE)
eno_hocc_sites$dr <- "eno_hocc"

path2 <- "eno_random"
file_name = paste(path, path2,'sites.visit_eno_random.csv',sep = '/')
eno_rand_sites <- read.csv(file_name)[-1]
eno_rand_sites <- gather(eno_rand_sites, visit, num.visit, num.visit.norem:num.visit.rem, factor_key=TRUE)
eno_rand_sites$dr <- "eno_rand"

path2 <- "eno_linear"
file_name = paste(path, path2,'sites.visit_eno_linear.csv',sep = '/')
eno_linear_sites <- read.csv(file_name)[-1]
eno_linear_sites <- gather(eno_linear_sites, visit, num.visit, num.visit.norem:num.visit.rem, factor_key=TRUE)
eno_linear_sites$dr <- "eno_linear"


sites.df <- rbind(eup_hocc_sites, eup_rand_sites, eup_linear_sites, 
                  eno_hocc_sites, eno_rand_sites, eno_linear_sites)


ggplot(sites.df, aes(year, num.visit, fill=visit, label = num.visit))+
  geom_bar(stat = "identity", position = 'stack')+
  geom_text(size = 3, position = position_stack(vjust = 0.5))+
  facet_wrap(~dr)

sites.df.avg <- aggregate(num.visit ~ visit + dr,
                                 data = as.data.frame(sites.df), FUN = mean)

sites.df.avg$dr2 <- c(1,1,3,3,2,2,4,4,6,6,5,5)

ggplot(sites.df.avg, aes(dr2, num.visit, fill=visit, label = round(num.visit)))+
  geom_bar(stat = "identity", position = 'stack')+
  geom_text(size = 3, position = position_stack(vjust = 0.5))

#### Learning ####
##### psi 0 ####
######eup_hocc #####
psi0 <- 0.5 #base occupancy

path2 <- "e5_hocc_AR"
file_name = paste(path, path2,'psi0s.est.est_e5_hocc.csv',sep = '/')
eup_hocc_psi0<- read.csv(file_name)[-1]

eup_hocc_psi0 <- eup_hocc_psi0 %>% select(mean, X2.5., X97.5., sim, year)


eup_hocc_psi0_low <- eup_hocc_psi0 %>% select(X2.5., year, sim)
eup_hocc_psi0_low <- aggregate(X2.5. ~ year, data = eup_hocc_psi0_low, FUN = mean)

eup_hocc_psi0_mean <- eup_hocc_psi0 %>% select(mean, year, sim)
eup_hocc_psi0_mean <- aggregate(mean ~ year, data = eup_hocc_psi0_mean, FUN = mean)

eup_hocc_psi0_high <- eup_hocc_psi0 %>% select(X97.5., year, sim)
eup_hocc_psi0_high <- aggregate(X97.5. ~ year, data = eup_hocc_psi0_high, FUN = mean)

eup_hocc_psi0s <- cbind(eup_hocc_psi0_low, mean = eup_hocc_psi0_mean$mean, X97.5. = eup_hocc_psi0_high$X97.5.)

# eup_hocc_psi0s <- gather(eup_hocc_psi0s, stat, value, 
#                            X2.5.:X97.5., factor_key=TRUE)

ggplot(eup_hocc_psi0s, aes(x=year, y=mean)) +
  geom_point(size = 4)+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05), size = 1)+
  geom_hline(yintercept = psi0, color = 'red', size = 0.75) +
  scale_x_continuous(breaks=seq(1,10,3))+
  ylab('value')+
  theme(text = element_text(size = 20))   


######eup_rand #####
psi0 <- 0.5 #base occupancy

path2 <- "e5_random"
file_name = paste(path, path2,'psi0s.est.est_e5_random.csv',sep = '/')
eup_rand_psi0<- read.csv(file_name)[-1]

eup_rand_psi0 <- eup_rand_psi0 %>% select(mean, X2.5., X97.5., sim, year)

eup_rand_psi0_low <- eup_rand_psi0 %>% select(X2.5., year, sim)
eup_rand_psi0_low <- aggregate(X2.5. ~ year, data = eup_rand_psi0_low, FUN = mean)

eup_rand_psi0_mean <- eup_rand_psi0 %>% select(mean, year, sim)
eup_rand_psi0_mean <- aggregate(mean ~ year, data = eup_rand_psi0_mean, FUN = mean)

eup_rand_psi0_high <- eup_rand_psi0 %>% select(X97.5., year, sim)
eup_rand_psi0_high <- aggregate(X97.5. ~ year, data = eup_rand_psi0_high, FUN = mean)

eup_rand_psi0s <- cbind(eup_rand_psi0_low, mean = eup_rand_psi0_mean$mean, X97.5. = eup_rand_psi0_high$X97.5.)

ggplot(eup_rand_psi0s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = psi0, color = 'red')

######eup_linear #####
psi0 <- 0.5 #base occupancy

path2 <- "e5_linear"
file_name = paste(path, path2,'psi0s.est.est_e5_linear.csv',sep = '/')
eup_linear_psi0<- read.csv(file_name)[-1]

eup_linear_psi0 <- eup_linear_psi0 %>% select(mean, X2.5., X97.5., sim, year)

eup_linear_psi0_low <- eup_linear_psi0 %>% select(X2.5., year, sim)
eup_linear_psi0_low <- aggregate(X2.5. ~ year, data = eup_linear_psi0_low, FUN = mean)

eup_linear_psi0_mean <- eup_linear_psi0 %>% select(mean, year, sim)
eup_linear_psi0_mean <- aggregate(mean ~ year, data = eup_linear_psi0_mean, FUN = mean)

eup_linear_psi0_high <- eup_linear_psi0 %>% select(X97.5., year, sim)
eup_linear_psi0_high <- aggregate(X97.5. ~ year, data = eup_linear_psi0_high, FUN = mean)

eup_linear_psi0s <- cbind(eup_linear_psi0_low, mean = eup_linear_psi0_mean$mean, X97.5. = eup_linear_psi0_high$X97.5.)

ggplot(eup_linear_psi0s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = psi0, color = 'red')

######eno_hocc #####
psi0 <- 0.5 #base occupancy

path2 <- "eno_hocc"
file_name = paste(path, path2,'psi0s.est.est_eno_hocc.csv',sep = '/')
eno_hocc_psi0<- read.csv(file_name)[-1]

eno_hocc_psi0 <- eno_hocc_psi0 %>% select(mean, X2.5., X97.5., sim, year)

eno_hocc_psi0_low <- eno_hocc_psi0 %>% select(X2.5., year, sim)
eno_hocc_psi0_low <- aggregate(X2.5. ~ year, data = eno_hocc_psi0_low, FUN = mean)

eno_hocc_psi0_mean <- eno_hocc_psi0 %>% select(mean, year, sim)
eno_hocc_psi0_mean <- aggregate(mean ~ year, data = eno_hocc_psi0_mean, FUN = mean)

eno_hocc_psi0_high <- eno_hocc_psi0 %>% select(X97.5., year, sim)
eno_hocc_psi0_high <- aggregate(X97.5. ~ year, data = eno_hocc_psi0_high, FUN = mean)

eno_hocc_psi0s <- cbind(eno_hocc_psi0_low, mean = eno_hocc_psi0_mean$mean, X97.5. = eno_hocc_psi0_high$X97.5.)

ggplot(eno_hocc_psi0s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = psi0, color = 'red')


##### psi 1 ####
psi1 <- -30 #effect of previous removal
######eup_hocc #####
path2 <- "e5_hocc_AR"
file_name = paste(path, path2,'psi1s.est.est_e5_hocc.csv',sep = '/')
eup_hocc_psi1<- read.csv(file_name)[-1]

eup_hocc_psi1 <- eup_hocc_psi1 %>% select(mean, X2.5., X97.5., sim, year)

eup_hocc_psi1_low <- eup_hocc_psi1 %>% select(X2.5., year, sim)
eup_hocc_psi1_low <- aggregate(X2.5. ~ year, data = eup_hocc_psi1_low, FUN = mean)

eup_hocc_psi1_mean <- eup_hocc_psi1 %>% select(mean, year, sim)
eup_hocc_psi1_mean <- aggregate(mean ~ year, data = eup_hocc_psi1_mean, FUN = mean)

eup_hocc_psi1_high <- eup_hocc_psi1 %>% select(X97.5., year, sim)
eup_hocc_psi1_high <- aggregate(X97.5. ~ year, data = eup_hocc_psi1_high, FUN = mean)

eup_hocc_psi1s <- cbind(eup_hocc_psi1_low, mean = eup_hocc_psi1_mean$mean, X97.5. = eup_hocc_psi1_high$X97.5.)

# eup_hocc_psi1s <- gather(eup_hocc_psi1s, stat, value, 
#                            X2.5.:X97.5., factor_key=TRUE)

ggplot(eup_hocc_psi1s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = -psi1, color = 'red')


######eup_rand #####

path2 <- "e5_random"
file_name = paste(path, path2,'psi1s.est.est_e5_random.csv',sep = '/')
eup_rand_psi1<- read.csv(file_name)[-1]

eup_rand_psi1 <- eup_rand_psi1 %>% select(mean, X2.5., X97.5., sim, year)

eup_rand_psi1_low <- eup_rand_psi1 %>% select(X2.5., year, sim)
eup_rand_psi1_low <- aggregate(X2.5. ~ year, data = eup_rand_psi1_low, FUN = mean)

eup_rand_psi1_mean <- eup_rand_psi1 %>% select(mean, year, sim)
eup_rand_psi1_mean <- aggregate(mean ~ year, data = eup_rand_psi1_mean, FUN = mean)

eup_rand_psi1_high <- eup_rand_psi1 %>% select(X97.5., year, sim)
eup_rand_psi1_high <- aggregate(X97.5. ~ year, data = eup_rand_psi1_high, FUN = mean)

eup_rand_psi1s <- cbind(eup_rand_psi1_low, mean = eup_rand_psi1_mean$mean, X97.5. = eup_rand_psi1_high$X97.5.)

ggplot(eup_rand_psi1s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = -psi1, color = 'red')

######eup_linear #####

path2 <- "e5_linear"
file_name = paste(path, path2,'psi1s.est.est_e5_linear.csv',sep = '/')
eup_linear_psi1<- read.csv(file_name)[-1]

eup_linear_psi1 <- eup_linear_psi1 %>% select(mean, X2.5., X97.5., sim, year)

eup_linear_psi1_low <- eup_linear_psi1 %>% select(X2.5., year, sim)
eup_linear_psi1_low <- aggregate(X2.5. ~ year, data = eup_linear_psi1_low, FUN = mean)

eup_linear_psi1_mean <- eup_linear_psi1 %>% select(mean, year, sim)
eup_linear_psi1_mean <- aggregate(mean ~ year, data = eup_linear_psi1_mean, FUN = mean)

eup_linear_psi1_high <- eup_linear_psi1 %>% select(X97.5., year, sim)
eup_linear_psi1_high <- aggregate(X97.5. ~ year, data = eup_linear_psi1_high, FUN = mean)

eup_linear_psi1s <- cbind(eup_linear_psi1_low, mean = eup_linear_psi1_mean$mean, X97.5. = eup_linear_psi1_high$X97.5.)

ggplot(eup_linear_psi1s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = -psi1, color = 'red')

######eno_hocc #####
path2 <- "eno_hocc"
file_name = paste(path, path2,'psi1s.est.est_eno_hocc.csv',sep = '/')
eno_hocc_psi1<- read.csv(file_name)[-1]

eno_hocc_psi1 <- eno_hocc_psi1 %>% select(mean, X2.5., X97.5., sim, year)

eno_hocc_psi1_low <- eno_hocc_psi1 %>% select(X2.5., year, sim)
eno_hocc_psi1_low <- aggregate(X2.5. ~ year, data = eno_hocc_psi1_low, FUN = mean)

eno_hocc_psi1_mean <- eno_hocc_psi1 %>% select(mean, year, sim)
eno_hocc_psi1_mean <- aggregate(mean ~ year, data = eno_hocc_psi1_mean, FUN = mean)

eno_hocc_psi1_high <- eno_hocc_psi1 %>% select(X97.5., year, sim)
eno_hocc_psi1_high <- aggregate(X97.5. ~ year, data = eno_hocc_psi1_high, FUN = mean)

eno_hocc_psi1s <- cbind(eno_hocc_psi1_low, mean = eno_hocc_psi1_mean$mean, X97.5. = eno_hocc_psi1_high$X97.5.)

ggplot(eno_hocc_psi1s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = -psi1, color = 'red')

##### psi 2 ####
psi2 <- 0.5  #effect of site characteristics 
######eup_hocc #####
path2 <- "e5_hocc_AR"
file_name = paste(path, path2,'psi2s.est.est_e5_hocc.csv',sep = '/')
eup_hocc_psi2<- read.csv(file_name)[-1]

eup_hocc_psi2 <- eup_hocc_psi2 %>% select(mean, X2.5., X97.5., sim, year)


eup_hocc_psi2_low <- eup_hocc_psi2 %>% select(X2.5., year, sim)
eup_hocc_psi2_low <- aggregate(X2.5. ~ year, data = eup_hocc_psi2_low, FUN = mean)

eup_hocc_psi2_mean <- eup_hocc_psi2 %>% select(mean, year, sim)
eup_hocc_psi2_mean <- aggregate(mean ~ year, data = eup_hocc_psi2_mean, FUN = mean)

eup_hocc_psi2_high <- eup_hocc_psi2 %>% select(X97.5., year, sim)
eup_hocc_psi2_high <- aggregate(X97.5. ~ year, data = eup_hocc_psi2_high, FUN = mean)

eup_hocc_psi2s <- cbind(eup_hocc_psi2_low, mean = eup_hocc_psi2_mean$mean, X97.5. = eup_hocc_psi2_high$X97.5.)

# eup_hocc_psi2s <- gather(eup_hocc_psi2s, stat, value, 
#                            X2.5.:X97.5., factor_key=TRUE)

ggplot(eup_hocc_psi2s, aes(x=year, y=mean)) +
  geom_point(size = 4)+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05), size = 1)+
  geom_hline(yintercept = psi2, color = 'red', size = 0.75) +
  scale_x_continuous(breaks=seq(1,10,3))+
  ylab('value')+
  theme(text = element_text(size = 20))   


######eup_rand #####
path2 <- "e5_random"
file_name = paste(path, path2,'psi2s.est.est_e5_random.csv',sep = '/')
eup_rand_psi2<- read.csv(file_name)[-1]

eup_rand_psi2 <- eup_rand_psi2 %>% select(mean, X2.5., X97.5., sim, year)

eup_rand_psi2_low <- eup_rand_psi2 %>% select(X2.5., year, sim)
eup_rand_psi2_low <- aggregate(X2.5. ~ year, data = eup_rand_psi2_low, FUN = mean)

eup_rand_psi2_mean <- eup_rand_psi2 %>% select(mean, year, sim)
eup_rand_psi2_mean <- aggregate(mean ~ year, data = eup_rand_psi2_mean, FUN = mean)

eup_rand_psi2_high <- eup_rand_psi2 %>% select(X97.5., year, sim)
eup_rand_psi2_high <- aggregate(X97.5. ~ year, data = eup_rand_psi2_high, FUN = mean)

eup_rand_psi2s <- cbind(eup_rand_psi2_low, mean = eup_rand_psi2_mean$mean, X97.5. = eup_rand_psi2_high$X97.5.)

ggplot(eup_rand_psi2s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = psi2, color = 'red')

######eup_linear #####
path2 <- "e5_linear"
file_name = paste(path, path2,'psi2s.est.est_e5_linear.csv',sep = '/')
eup_linear_psi2<- read.csv(file_name)[-1]

eup_linear_psi2 <- eup_linear_psi2 %>% select(mean, X2.5., X97.5., sim, year)

eup_linear_psi2_low <- eup_linear_psi2 %>% select(X2.5., year, sim)
eup_linear_psi2_low <- aggregate(X2.5. ~ year, data = eup_linear_psi2_low, FUN = mean)

eup_linear_psi2_mean <- eup_linear_psi2 %>% select(mean, year, sim)
eup_linear_psi2_mean <- aggregate(mean ~ year, data = eup_linear_psi2_mean, FUN = mean)

eup_linear_psi2_high <- eup_linear_psi2 %>% select(X97.5., year, sim)
eup_linear_psi2_high <- aggregate(X97.5. ~ year, data = eup_linear_psi2_high, FUN = mean)

eup_linear_psi2s <- cbind(eup_linear_psi2_low, mean = eup_linear_psi2_mean$mean, X97.5. = eup_linear_psi2_high$X97.5.)

ggplot(eup_linear_psi2s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = psi2, color = 'red')

######eno_hocc #####
path2 <- "eno_hocc"
file_name = paste(path, path2,'psi2s.est.est_eno_hocc.csv',sep = '/')
eno_hocc_psi2<- read.csv(file_name)[-1]

eno_hocc_psi2 <- eno_hocc_psi2 %>% select(mean, X2.5., X97.5., sim, year)

eno_hocc_psi2_low <- eno_hocc_psi2 %>% select(X2.5., year, sim)
eno_hocc_psi2_low <- aggregate(X2.5. ~ year, data = eno_hocc_psi2_low, FUN = mean)

eno_hocc_psi2_mean <- eno_hocc_psi2 %>% select(mean, year, sim)
eno_hocc_psi2_mean <- aggregate(mean ~ year, data = eno_hocc_psi2_mean, FUN = mean)

eno_hocc_psi2_high <- eno_hocc_psi2 %>% select(X97.5., year, sim)
eno_hocc_psi2_high <- aggregate(X97.5. ~ year, data = eno_hocc_psi2_high, FUN = mean)

eno_hocc_psi2s <- cbind(eno_hocc_psi2_low, mean = eno_hocc_psi2_mean$mean, X97.5. = eno_hocc_psi2_high$X97.5.)

ggplot(eno_hocc_psi2s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = psi2, color = 'red')


##### psi 3 ####
psi3 <-2 #effect of previous year state
######eup_hocc #####
path2 <- "e5_hocc_AR"
file_name = paste(path, path2,'psi3s.est.est_e5_hocc.csv',sep = '/')
eup_hocc_psi3<- read.csv(file_name)[-1]

eup_hocc_psi3 <- eup_hocc_psi3 %>% select(mean, X2.5., X97.5., sim, year)


eup_hocc_psi3_low <- eup_hocc_psi3 %>% select(X2.5., year, sim)
eup_hocc_psi3_low <- aggregate(X2.5. ~ year, data = eup_hocc_psi3_low, FUN = mean)

eup_hocc_psi3_mean <- eup_hocc_psi3 %>% select(mean, year, sim)
eup_hocc_psi3_mean <- aggregate(mean ~ year, data = eup_hocc_psi3_mean, FUN = mean)

eup_hocc_psi3_high <- eup_hocc_psi3 %>% select(X97.5., year, sim)
eup_hocc_psi3_high <- aggregate(X97.5. ~ year, data = eup_hocc_psi3_high, FUN = mean)

eup_hocc_psi3s <- cbind(eup_hocc_psi3_low, mean = eup_hocc_psi3_mean$mean, X97.5. = eup_hocc_psi3_high$X97.5.)

# eup_hocc_psi3s <- gather(eup_hocc_psi3s, stat, value, 
#                            X2.5.:X97.5., factor_key=TRUE)

ggplot(eup_hocc_psi3s, aes(x=year, y=mean)) +
  geom_point(size = 4)+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05), size = 1)+
  geom_hline(yintercept = psi3, color = 'red', size = 0.75) +
  scale_x_continuous(breaks=seq(1,10,3))+
  ylab('value')+
  theme(text = element_text(size = 20))   

######eup_rand #####
path2 <- "e5_random"
file_name = paste(path, path2,'psi3s.est.est_e5_random.csv',sep = '/')
eup_rand_psi3<- read.csv(file_name)[-1]

eup_rand_psi3 <- eup_rand_psi3 %>% select(mean, X2.5., X97.5., sim, year)

eup_rand_psi3_low <- eup_rand_psi3 %>% select(X2.5., year, sim)
eup_rand_psi3_low <- aggregate(X2.5. ~ year, data = eup_rand_psi3_low, FUN = mean)

eup_rand_psi3_mean <- eup_rand_psi3 %>% select(mean, year, sim)
eup_rand_psi3_mean <- aggregate(mean ~ year, data = eup_rand_psi3_mean, FUN = mean)

eup_rand_psi3_high <- eup_rand_psi3 %>% select(X97.5., year, sim)
eup_rand_psi3_high <- aggregate(X97.5. ~ year, data = eup_rand_psi3_high, FUN = mean)

eup_rand_psi3s <- cbind(eup_rand_psi3_low, mean = eup_rand_psi3_mean$mean, X97.5. = eup_rand_psi3_high$X97.5.)


######eup_linear #####
path2 <- "e5_linear"
file_name = paste(path, path2,'psi3s.est.est_e5_linear.csv',sep = '/')
eup_linear_psi3<- read.csv(file_name)[-1]

eup_linear_psi3 <- eup_linear_psi3 %>% select(mean, X2.5., X97.5., sim, year)

eup_linear_psi3_low <- eup_linear_psi3 %>% select(X2.5., year, sim)
eup_linear_psi3_low <- aggregate(X2.5. ~ year, data = eup_linear_psi3_low, FUN = mean)

eup_linear_psi3_mean <- eup_linear_psi3 %>% select(mean, year, sim)
eup_linear_psi3_mean <- aggregate(mean ~ year, data = eup_linear_psi3_mean, FUN = mean)

eup_linear_psi3_high <- eup_linear_psi3 %>% select(X97.5., year, sim)
eup_linear_psi3_high <- aggregate(X97.5. ~ year, data = eup_linear_psi3_high, FUN = mean)

eup_linear_psi3s <- cbind(eup_linear_psi3_low, mean = eup_linear_psi3_mean$mean, X97.5. = eup_linear_psi3_high$X97.5.)

ggplot(eup_linear_psi3s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = psi3, color = 'red')

######eno_hocc #####
path2 <- "eno_hocc"
file_name = paste(path, path2,'psi3s.est.est_eno_hocc.csv',sep = '/')
eno_hocc_psi3<- read.csv(file_name)[-1]

eno_hocc_psi3 <- eno_hocc_psi3 %>% select(mean, X2.5., X97.5., sim, year)

eno_hocc_psi3_low <- eno_hocc_psi3 %>% select(X2.5., year, sim)
eno_hocc_psi3_low <- aggregate(X2.5. ~ year, data = eno_hocc_psi3_low, FUN = mean)

eno_hocc_psi3_mean <- eno_hocc_psi3 %>% select(mean, year, sim)
eno_hocc_psi3_mean <- aggregate(mean ~ year, data = eno_hocc_psi3_mean, FUN = mean)

eno_hocc_psi3_high <- eno_hocc_psi3 %>% select(X97.5., year, sim)
eno_hocc_psi3_high <- aggregate(X97.5. ~ year, data = eno_hocc_psi3_high, FUN = mean)

eno_hocc_psi3s <- cbind(eno_hocc_psi3_low, mean = eno_hocc_psi3_mean$mean, X97.5. = eno_hocc_psi3_high$X97.5.)

ggplot(eno_hocc_psi3s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = psi3, color = 'red')


##### a0 ####
######eup_hocc #####
a0 <- 0.9 #base detection

path2 <- "e5_hocc_AR"
file_name = paste(path, path2,'a0s.est.est_e5_hocc.csv',sep = '/')
eup_hocc_a0<- read.csv(file_name)[-1]

eup_hocc_a0 <- eup_hocc_a0 %>% select(mean, X2.5., X97.5., sim, year)


eup_hocc_a0_low <- eup_hocc_a0 %>% select(X2.5., year, sim)
eup_hocc_a0_low <- aggregate(X2.5. ~ year, data = eup_hocc_a0_low, FUN = mean)

eup_hocc_a0_mean <- eup_hocc_a0 %>% select(mean, year, sim)
eup_hocc_a0_mean <- aggregate(mean ~ year, data = eup_hocc_a0_mean, FUN = mean)

eup_hocc_a0_high <- eup_hocc_a0 %>% select(X97.5., year, sim)
eup_hocc_a0_high <- aggregate(X97.5. ~ year, data = eup_hocc_a0_high, FUN = mean)

eup_hocc_a0s <- cbind(eup_hocc_a0_low, mean = eup_hocc_a0_mean$mean, X97.5. = eup_hocc_a0_high$X97.5.)

# eup_hocc_a0s <- gather(eup_hocc_a0s, stat, value, 
#                            X2.5.:X97.5., factor_key=TRUE)

ggplot(eup_hocc_a0s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = a0, color = 'red')


######eup_rand #####
path2 <- "e5_random"
file_name = paste(path, path2,'a0s.est.est_e5_random.csv',sep = '/')
eup_rand_a0<- read.csv(file_name)[-1]

eup_rand_a0 <- eup_rand_a0 %>% select(mean, X2.5., X97.5., sim, year)

eup_rand_a0_low <- eup_rand_a0 %>% select(X2.5., year, sim)
eup_rand_a0_low <- aggregate(X2.5. ~ year, data = eup_rand_a0_low, FUN = mean)

eup_rand_a0_mean <- eup_rand_a0 %>% select(mean, year, sim)
eup_rand_a0_mean <- aggregate(mean ~ year, data = eup_rand_a0_mean, FUN = mean)

eup_rand_a0_high <- eup_rand_a0 %>% select(X97.5., year, sim)
eup_rand_a0_high <- aggregate(X97.5. ~ year, data = eup_rand_a0_high, FUN = mean)

eup_rand_a0s <- cbind(eup_rand_a0_low, mean = eup_rand_a0_mean$mean, X97.5. = eup_rand_a0_high$X97.5.)

ggplot(eup_rand_a0s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = a0, color = 'red')

######eup_linear #####
path2 <- "e5_linear"
file_name = paste(path, path2,'a0s.est.est_e5_linear.csv',sep = '/')
eup_linear_a0<- read.csv(file_name)[-1]

eup_linear_a0 <- eup_linear_a0 %>% select(mean, X2.5., X97.5., sim, year)

eup_linear_a0_low <- eup_linear_a0 %>% select(X2.5., year, sim)
eup_linear_a0_low <- aggregate(X2.5. ~ year, data = eup_linear_a0_low, FUN = mean)

eup_linear_a0_mean <- eup_linear_a0 %>% select(mean, year, sim)
eup_linear_a0_mean <- aggregate(mean ~ year, data = eup_linear_a0_mean, FUN = mean)

eup_linear_a0_high <- eup_linear_a0 %>% select(X97.5., year, sim)
eup_linear_a0_high <- aggregate(X97.5. ~ year, data = eup_linear_a0_high, FUN = mean)

eup_linear_a0s <- cbind(eup_linear_a0_low, mean = eup_linear_a0_mean$mean, X97.5. = eup_linear_a0_high$X97.5.)

ggplot(eup_linear_a0s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = a0, color = 'red')

######eno_hocc #####
path2 <- "eno_hocc"
file_name = paste(path, path2,'a0s.est.est_eno_hocc.csv',sep = '/')
eno_hocc_a0<- read.csv(file_name)[-1]

eno_hocc_a0 <- eno_hocc_a0 %>% select(mean, X2.5., X97.5., sim, year)

eno_hocc_a0_low <- eno_hocc_a0 %>% select(X2.5., year, sim)
eno_hocc_a0_low <- aggregate(X2.5. ~ year, data = eno_hocc_a0_low, FUN = mean)

eno_hocc_a0_mean <- eno_hocc_a0 %>% select(mean, year, sim)
eno_hocc_a0_mean <- aggregate(mean ~ year, data = eno_hocc_a0_mean, FUN = mean)

eno_hocc_a0_high <- eno_hocc_a0 %>% select(X97.5., year, sim)
eno_hocc_a0_high <- aggregate(X97.5. ~ year, data = eno_hocc_a0_high, FUN = mean)

eno_hocc_a0s <- cbind(eno_hocc_a0_low, mean = eno_hocc_a0_mean$mean, X97.5. = eno_hocc_a0_high$X97.5.)

ggplot(eno_hocc_a0s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = a0, color = 'red')


##### a1 ####
a1 <- 1 #effect of effort
######eup_hocc #####
path2 <- "e5_hocc_AR"
file_name = paste(path, path2,'a1s.est.est_e5_hocc.csv',sep = '/')
eup_hocc_a1<- read.csv(file_name)[-1]

eup_hocc_a1 <- eup_hocc_a1 %>% select(mean, X2.5., X97.5., sim, year)

eup_hocc_a1_low <- eup_hocc_a1 %>% select(X2.5., year, sim)
eup_hocc_a1_low <- aggregate(X2.5. ~ year, data = eup_hocc_a1_low, FUN = mean)

eup_hocc_a1_mean <- eup_hocc_a1 %>% select(mean, year, sim)
eup_hocc_a1_mean <- aggregate(mean ~ year, data = eup_hocc_a1_mean, FUN = mean)

eup_hocc_a1_high <- eup_hocc_a1 %>% select(X97.5., year, sim)
eup_hocc_a1_high <- aggregate(X97.5. ~ year, data = eup_hocc_a1_high, FUN = mean)

eup_hocc_a1s <- cbind(eup_hocc_a1_low, mean = eup_hocc_a1_mean$mean, X97.5. = eup_hocc_a1_high$X97.5.)

# eup_hocc_a1s <- gather(eup_hocc_a1s, stat, value, 
#                            X2.5.:X97.5., factor_key=TRUE)

ggplot(eup_hocc_a1s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = a1, color = 'red')


######eup_rand #####

path2 <- "e5_random"
file_name = paste(path, path2,'a1s.est.est_e5_random.csv',sep = '/')
eup_rand_a1<- read.csv(file_name)[-1]

eup_rand_a1 <- eup_rand_a1 %>% select(mean, X2.5., X97.5., sim, year)

eup_rand_a1_low <- eup_rand_a1 %>% select(X2.5., year, sim)
eup_rand_a1_low <- aggregate(X2.5. ~ year, data = eup_rand_a1_low, FUN = mean)

eup_rand_a1_mean <- eup_rand_a1 %>% select(mean, year, sim)
eup_rand_a1_mean <- aggregate(mean ~ year, data = eup_rand_a1_mean, FUN = mean)

eup_rand_a1_high <- eup_rand_a1 %>% select(X97.5., year, sim)
eup_rand_a1_high <- aggregate(X97.5. ~ year, data = eup_rand_a1_high, FUN = mean)

eup_rand_a1s <- cbind(eup_rand_a1_low, mean = eup_rand_a1_mean$mean, X97.5. = eup_rand_a1_high$X97.5.)

ggplot(eup_rand_a1s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = a1, color = 'red')

######eup_linear #####

path2 <- "e5_linear"
file_name = paste(path, path2,'a1s.est.est_e5_linear.csv',sep = '/')
eup_linear_a1<- read.csv(file_name)[-1]

eup_linear_a1 <- eup_linear_a1 %>% select(mean, X2.5., X97.5., sim, year)

eup_linear_a1_low <- eup_linear_a1 %>% select(X2.5., year, sim)
eup_linear_a1_low <- aggregate(X2.5. ~ year, data = eup_linear_a1_low, FUN = mean)

eup_linear_a1_mean <- eup_linear_a1 %>% select(mean, year, sim)
eup_linear_a1_mean <- aggregate(mean ~ year, data = eup_linear_a1_mean, FUN = mean)

eup_linear_a1_high <- eup_linear_a1 %>% select(X97.5., year, sim)
eup_linear_a1_high <- aggregate(X97.5. ~ year, data = eup_linear_a1_high, FUN = mean)

eup_linear_a1s <- cbind(eup_linear_a1_low, mean = eup_linear_a1_mean$mean, X97.5. = eup_linear_a1_high$X97.5.)

ggplot(eup_linear_a1s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = a1, color = 'red')

######eno_hocc #####
path2 <- "eno_hocc"
file_name = paste(path, path2,'a1s.est.est_eno_hocc.csv',sep = '/')
eno_hocc_a1<- read.csv(file_name)[-1]

eno_hocc_a1 <- eno_hocc_a1 %>% select(mean, X2.5., X97.5., sim, year)

eno_hocc_a1_low <- eno_hocc_a1 %>% select(X2.5., year, sim)
eno_hocc_a1_low <- aggregate(X2.5. ~ year, data = eno_hocc_a1_low, FUN = mean)

eno_hocc_a1_mean <- eno_hocc_a1 %>% select(mean, year, sim)
eno_hocc_a1_mean <- aggregate(mean ~ year, data = eno_hocc_a1_mean, FUN = mean)

eno_hocc_a1_high <- eno_hocc_a1 %>% select(X97.5., year, sim)
eno_hocc_a1_high <- aggregate(X97.5. ~ year, data = eno_hocc_a1_high, FUN = mean)

eno_hocc_a1s <- cbind(eno_hocc_a1_low, mean = eno_hocc_a1_mean$mean, X97.5. = eno_hocc_a1_high$X97.5.)

ggplot(eno_hocc_a1s, aes(x=year, y=mean)) +
  geom_point()+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = a0, color = 'red')
