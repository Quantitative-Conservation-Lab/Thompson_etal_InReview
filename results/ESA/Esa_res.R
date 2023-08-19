#Comparing the decision scenarios: 
library(tidyverse)
library(here)
library(plyr)
library(boot)
library(ggsci)
library(gridExtra)
library(RColorBrewer)

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
#### e125 ####
##### e125, high occ ####
path2 <- "e125_hocc"

file_name = paste(path, path2,'States_e125_hocc.csv',sep = '/')
e125_hocc_state <- read.csv(file_name)[-1]

e125_hocc_state <- e125_hocc_state %>% filter(year == 11)

e125hocc.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e125_hocc_state %>% filter(sim == s)
  e125hocc.invstate[s] <- sum(dat$state)
}

mean(e125hocc.invstate)

##### e125, random ####
path2 <- "e125_random"

file_name = paste(path, path2,'States_e125_random.csv',sep = '/')
e125_rand_state <- read.csv(file_name)[-1]

e125_rand_state <- e125_rand_state %>% filter(year == 11)

e125rand.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e125_rand_state %>% filter(sim == s)
  e125rand.invstate[s] <- sum(dat$state)
}

mean(e125rand.invstate)

##### e125, linear ####
path2 <- "e125_linear"

file_name = paste(path, path2,'States_e125_linear.csv',sep = '/')
e125_linear_state <- read.csv(file_name)[-1]

e125_linear_state <- e125_linear_state %>% filter(year == 11)

e125linear.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e125_linear_state %>% filter(sim == s)
  e125linear.invstate[s] <- sum(dat$state)
}

mean(e125linear.invstate)

#### e25 ####
##### e25, high occ ####
path2 <- "e25_hocc"

file_name = paste(path, path2,'States_e25_hocc.csv',sep = '/')
e25_hocc_state <- read.csv(file_name)[-1]

e25_hocc_state <- e25_hocc_state %>% filter(year == 11)

e25hocc.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e25_hocc_state %>% filter(sim == s)
  e25hocc.invstate[s] <- sum(dat$state)
}

mean(e25hocc.invstate)

##### e25, random ####
path2 <- "e25_random"

file_name = paste(path, path2,'States_e25_random.csv',sep = '/')
e25_rand_state <- read.csv(file_name)[-1]

e25_rand_state <- e25_rand_state %>% filter(year == 11)

e25rand.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e25_rand_state %>% filter(sim == s)
  e25rand.invstate[s] <- sum(dat$state)
}

mean(e25rand.invstate)

##### e25, linear ####
path2 <- "e25_linear"

file_name = paste(path, path2,'States_e25_linear.csv',sep = '/')
e25_linear_state <- read.csv(file_name)[-1]

e25_linear_state <- e25_linear_state %>% filter(year == 11)

e25linear.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e25_linear_state %>% filter(sim == s)
  e25linear.invstate[s] <- sum(dat$state)
}

mean(e25linear.invstate)

#### e375 ####
##### e375, high occ ####
path2 <- "e375_hocc"

file_name = paste(path, path2,'States_e375_hocc.csv',sep = '/')
e375_hocc_state <- read.csv(file_name)[-1]

e375_hocc_state <- e375_hocc_state %>% filter(year == 11)

e375hocc.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e375_hocc_state %>% filter(sim == s)
  e375hocc.invstate[s] <- sum(dat$state)
}

mean(e375hocc.invstate)

##### e375, random ####
path2 <- "e375_random"

file_name = paste(path, path2,'States_e375_random.csv',sep = '/')
e375_rand_state <- read.csv(file_name)[-1]

e375_rand_state <- e375_rand_state %>% filter(year == 11)

e375rand.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e375_rand_state %>% filter(sim == s)
  e375rand.invstate[s] <- sum(dat$state)
}

mean(e375rand.invstate)

##### e375, linear ####
path2 <- "e375_linear"

file_name = paste(path, path2,'States_e375_linear.csv',sep = '/')
e375_linear_state <- read.csv(file_name)[-1]

e375_linear_state <- e375_linear_state %>% filter(year == 11)

e375linear.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e375_linear_state %>% filter(sim == s)
  e375linear.invstate[s] <- sum(dat$state)
}

mean(e375linear.invstate)

#### e5 ####
##### e5, high occ ####
path2 <- "e5_hocc"

file_name = paste(path, path2,'States_e5_hocc.csv',sep = '/')
e5_hocc_state <- read.csv(file_name)[-1]

e5_hocc_state <- e5_hocc_state %>% filter(year == 11)

e5hocc.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e5_hocc_state %>% filter(sim == s)
  e5hocc.invstate[s] <- sum(dat$state)
}

mean(e5hocc.invstate)

##### e5, random ####
path2 <- "e5_random"

file_name = paste(path, path2,'States_e5_random.csv',sep = '/')
e5_rand_state <- read.csv(file_name)[-1]

e5_rand_state <- e5_rand_state %>% filter(year == 11)

e5rand.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e5_rand_state %>% filter(sim == s)
  e5rand.invstate[s] <- sum(dat$state)
}

mean(e5rand.invstate)

##### e5, linear ####
path2 <- "e5_linear"

file_name = paste(path, path2,'States_e5_linear.csv',sep = '/')
e5_linear_state <- read.csv(file_name)[-1]

e5_linear_state <- e5_linear_state %>% filter(year == 11)

e5linear.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e5_linear_state %>% filter(sim == s)
  e5linear.invstate[s] <- sum(dat$state)
}

mean(e5linear.invstate)

#### e625 ####
##### e625, high occ ####
path2 <- "e625_hocc"

file_name = paste(path, path2,'States_e625_hocc.csv',sep = '/')
e625_hocc_state <- read.csv(file_name)[-1]

e625_hocc_state <- e625_hocc_state %>% filter(year == 11)

e625hocc.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e625_hocc_state %>% filter(sim == s)
  e625hocc.invstate[s] <- sum(dat$state)
}

mean(e625hocc.invstate)

##### e625, random ####
path2 <- "e625_random"

file_name = paste(path, path2,'States_e625_random.csv',sep = '/')
e625_rand_state <- read.csv(file_name)[-1]

e625_rand_state <- e625_rand_state %>% filter(year == 11)

e625rand.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e625_rand_state %>% filter(sim == s)
  e625rand.invstate[s] <- sum(dat$state)
}

mean(e625rand.invstate)

##### e625, linear ####
path2 <- "e625_linear"

file_name = paste(path, path2,'States_e625_linear.csv',sep = '/')
e625_linear_state <- read.csv(file_name)[-1]

e625_linear_state <- e625_linear_state %>% filter(year == 11)

e625linear.invstate <- rep(NA, n.sims)

#count number of invaded sites for each sim
for(s in 1:n.sims){
  dat <- e625_linear_state %>% filter(sim == s)
  e625linear.invstate[s] <- sum(dat$state)
}

mean(e625linear.invstate)


#### Combined ####
invaded.sites <- c(mean(e125hocc.invstate), mean(e125rand.invstate), mean(e125linear.invstate), 
                   mean(e25hocc.invstate), mean(e25rand.invstate), mean(e25linear.invstate), 
                   mean(e375hocc.invstate), mean(e375rand.invstate), mean(e375linear.invstate), 
                   mean(e5hocc.invstate), mean(e5rand.invstate), mean(e5linear.invstate), 
                   mean(e625hocc.invstate), mean(e625rand.invstate), mean(e625linear.invstate))

goal.p <- c(rep(0.125,3), rep(0.25,3), rep(0.375,3), rep(0.5,3), rep(0.625,3))

Location <- rep(c("occupancy", "random", "linear"), 5)

obj1 <- data.frame(goal.p = goal.p, invaded.sites = invaded.sites, Location = Location)

ggplot(obj1,mapping = aes(x = goal.p, y = invaded.sites, col = Location))+
  geom_point(size = 3) + #, position=position_jitter(width=0, height=0.1))+
  scale_color_jama()+
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks=c(0.125, 0.25, 0.375, 0.5, 0.625))+
  xlab("Detection probability (p)")+
  ylab("Average number of invaded sites")
  

#### Effort ####
##### e125, high occ ####
path2 <- "e125_hocc"

file_name = paste(path, path2,'logeffort_e125_hocc.csv',sep = '/')
e125_hocc_effort <- read.csv(file_name)[-1]
e125_hocc_effort$effort2 <- exp(e125_hocc_effort$effort)

# summary(exp(e125_hocc_effort$effort))
# 
# ggplot(e125_hocc_effort, mapping = aes(x = year, y = effort2, col = sim))+
#   geom_point()

#filter final year 
e125_hocc_effort <- e125_hocc_effort %>% filter(year == 10)

e125.hocc.effort <- mean(e125_hocc_effort$effort2)

##### e125, random ####
path2 <- "e125_random"

file_name = paste(path, path2,'logeffort_e125_random.csv',sep = '/')
e125_rand_effort <- read.csv(file_name)[-1]
e125_rand_effort$effort2 <- exp(e125_rand_effort$effort)

e125_rand_effort <- e125_rand_effort %>% filter(year == 10)
e125.rand.effort <- mean(e125_rand_effort$effort2)

##### e125, linear ####
path2 <- "e125_linear"

file_name = paste(path, path2,'logeffort_e125_linear.csv',sep = '/')
e125_linear_effort <- read.csv(file_name)[-1]
e125_linear_effort$effort2 <- exp(e125_linear_effort$effort)

e125_linear_effort <- e125_linear_effort %>% filter(year == 10)
e125.linear.effort <- mean(e125_linear_effort$effort2)

##### e25, high occ ####
path2 <- "e25_hocc"

file_name = paste(path, path2,'logeffort_e25_hocc.csv',sep = '/')
e25_hocc_effort <- read.csv(file_name)[-1]
e25_hocc_effort$effort2 <- exp(e25_hocc_effort$effort)

# summary(exp(e25_hocc_effort$effort))
# 
# ggplot(e25_hocc_effort, mapping = aes(x = year, y = effort2, col = sim))+
#   geom_point()

#filter final year 
e25_hocc_effort <- e25_hocc_effort %>% filter(year == 10)

e25.hocc.effort <- mean(e25_hocc_effort$effort2)

##### e25, random ####
path2 <- "e25_random"

file_name = paste(path, path2,'logeffort_e25_random.csv',sep = '/')
e25_rand_effort <- read.csv(file_name)[-1]
e25_rand_effort$effort2 <- exp(e25_rand_effort$effort)

e25_rand_effort <- e25_rand_effort %>% filter(year == 10)
e25.rand.effort <- mean(e25_rand_effort$effort2)

##### e25, linear ####
path2 <- "e25_linear"

file_name = paste(path, path2,'logeffort_e25_linear.csv',sep = '/')
e25_linear_effort <- read.csv(file_name)[-1]
e25_linear_effort$effort2 <- exp(e25_linear_effort$effort)

e25_linear_effort <- e25_linear_effort %>% filter(year == 10)
e25.linear.effort <- mean(e25_linear_effort$effort2)

##### e375, high occ ####
path2 <- "e375_hocc"

file_name = paste(path, path2,'logeffort_e375_hocc.csv',sep = '/')
e375_hocc_effort <- read.csv(file_name)[-1]
e375_hocc_effort$effort2 <- exp(e375_hocc_effort$effort)

# summary(exp(e375_hocc_effort$effort))
# 
# ggplot(e375_hocc_effort, mapping = aes(x = year, y = effort2, col = sim))+
#   geom_point()

#filter final year 
e375_hocc_effort <- e375_hocc_effort %>% filter(year == 10)

e375.hocc.effort <- mean(e375_hocc_effort$effort2)

##### e375, random ####
path2 <- "e375_random"

file_name = paste(path, path2,'logeffort_e375_random.csv',sep = '/')
e375_rand_effort <- read.csv(file_name)[-1]
e375_rand_effort$effort2 <- exp(e375_rand_effort$effort)

e375_rand_effort <- e375_rand_effort %>% filter(year == 10)
e375.rand.effort <- mean(e375_rand_effort$effort2)

##### e375, linear ####
path2 <- "e375_linear"

file_name = paste(path, path2,'logeffort_e375_linear.csv',sep = '/')
e375_linear_effort <- read.csv(file_name)[-1]
e375_linear_effort$effort2 <- exp(e375_linear_effort$effort)

e375_linear_effort <- e375_linear_effort %>% filter(year == 10)
e375.linear.effort <- mean(e375_linear_effort$effort2)

##### e5, high occ ####
path2 <- "e5_hocc"

file_name = paste(path, path2,'logeffort_e5_hocc.csv',sep = '/')
e5_hocc_effort <- read.csv(file_name)[-1]
e5_hocc_effort$effort2 <- exp(e5_hocc_effort$effort)

# summary(exp(e5_hocc_effort$effort))
# 
# ggplot(e5_hocc_effort, mapping = aes(x = year, y = effort2, col = sim))+
#   geom_point()

#filter final year 
e5_hocc_effort <- e5_hocc_effort %>% filter(year == 10)

e5.hocc.effort <- mean(e5_hocc_effort$effort2)

##### e5, random ####
path2 <- "e5_random"

file_name = paste(path, path2,'logeffort_e5_random.csv',sep = '/')
e5_rand_effort <- read.csv(file_name)[-1]
e5_rand_effort$effort2 <- exp(e5_rand_effort$effort)

e5_rand_effort <- e5_rand_effort %>% filter(year == 10)
e5.rand.effort <- mean(e5_rand_effort$effort2)

##### e5, linear ####
path2 <- "e5_linear"

file_name = paste(path, path2,'logeffort_e5_linear.csv',sep = '/')
e5_linear_effort <- read.csv(file_name)[-1]
e5_linear_effort$effort2 <- exp(e5_linear_effort$effort)

e5_linear_effort <- e5_linear_effort %>% filter(year == 10)
e5.linear.effort <- mean(e5_linear_effort$effort2)

##### e625, high occ ####
path2 <- "e625_hocc"

file_name = paste(path, path2,'logeffort_e625_hocc.csv',sep = '/')
e625_hocc_effort <- read.csv(file_name)[-1]
e625_hocc_effort$effort2 <- exp(e625_hocc_effort$effort)

e625_hocc_effort <- e625_hocc_effort %>% filter(effort2 < 10)
e625_hocc_effort <- e625_hocc_effort %>% filter(year == 10)
e625.hocc.effort <- min(e625_hocc_effort$effort2)


##### e625, random ####
path2 <- "e625_random"

file_name = paste(path, path2,'logeffort_e625_random.csv',sep = '/')
e625_rand_effort <- read.csv(file_name)[-1]
e625_rand_effort$effort2 <- exp(e625_rand_effort$effort)

e625_rand_effort <- e625_rand_effort %>% filter(effort2 < 10)
e625_rand_effort <- e625_rand_effort %>% filter(year == 10)
e625.rand.effort <- min(e625_rand_effort$effort2)

##### e625, linear ####
path2 <- "e625_linear"

file_name = paste(path, path2,'logeffort_e625_linear.csv',sep = '/')
e625_linear_effort <- read.csv(file_name)[-1]
e625_linear_effort$effort2 <- exp(e625_linear_effort$effort)

e625_linear_effort <- e625_linear_effort %>% filter(effort2 < 10)
e625_linear_effort <- e625_linear_effort %>% filter(year == 10)
e625.linear.effort <- min(e625_linear_effort$effort2)

#### Combined ####
effort.dat <- c(e125.hocc.effort, e125.rand.effort, e125.linear.effort,
                e25.hocc.effort, e25.rand.effort, e25.linear.effort, 
                e375.hocc.effort, e375.rand.effort, e375.linear.effort,
                e5.hocc.effort, e5.rand.effort, e5.linear.effort,
                e625.hocc.effort, e625.rand.effort, e625.linear.effort)

goal.p <- c(rep(0.125,3), rep(0.25,3), rep(0.375,3), rep(0.5,3), rep(0.625,3))

Location <- rep(c("occupancy", "random", "linear"), 5)

effort.obj <- data.frame(Effort = effort.dat, goal.p = goal.p, Location = Location)


ggplot(effort.obj)+
  geom_point(mapping = aes(x = Effort,
                           y = goal.p, col = Location),size = 3)+
  geom_smooth(mapping = aes(x = Effort,
                            y = goal.p, col = Location), se = F) +
  scale_color_jama()+
  theme_bw(base_size = 25) +
  scale_y_continuous(breaks=c(0.125, 0.25, 0.375, 0.5, 0.625))+
  xlab("Effort (hours)")+
  ylab("Detection probability (p)")



#effort.obj2 <- effort.obj %>% filter(Location == "occupancy")

# ggplot(effort.obj2)+
#   geom_point(mapping = aes(x = log(Effort),
#                            y = goal.p, col = Location),size = 3)+
#   geom_smooth(method = "glm", 
#               mapping = aes(x = log(Effort),
#                             y = goal.p, col = Location), 
#               method.args = list(family = "binomial"), 
#               se = FALSE) +
#   scale_color_jama()+
#   theme_bw(base_size = 15) +
#   scale_y_continuous(breaks=c(0.125, 0.25, 0.375, 0.5, 0.625))+
#   xlab("log(Effort)")+
#   ylab("Detection probability")


#### States Map ####
path2 <- "e125_hocc"
file_name = paste(path, path2,'Mean.States_e125_hocc.csv',sep = '/')
e125_hocc_state <- read.csv(file_name)[-1]
e125_hocc_state <- e125_hocc_state %>% filter(year == 11)
e125_hocc_state$state <- round(e125_hocc_state$state)

path2 <- "e125_random"
file_name = paste(path, path2,'Mean.States_e125_random.csv',sep = '/')
e125_rand_state <- read.csv(file_name)[-1]
e125_rand_state <- e125_rand_state %>% filter(year == 11)
e125_rand_state$state <- round(e125_rand_state$state)

path2 <- "e125_linear"
file_name = paste(path, path2,'Mean.States_e125_linear.csv',sep = '/')
e125_linear_state <- read.csv(file_name)[-1]
e125_linear_state <- e125_linear_state %>% filter(year == 11)
e125_linear_state$state <- round(e125_linear_state$state)

path2 <- "e375_hocc"
file_name = paste(path, path2,'Mean.States_e375_hocc.csv',sep = '/')
e375_hocc_state <- read.csv(file_name)[-1]
e375_hocc_state <- e375_hocc_state %>% filter(year == 11)
e375_hocc_state$state <- round(e375_hocc_state$state)

path2 <- "e375_random"
file_name = paste(path, path2,'Mean.States_e375_random.csv',sep = '/')
e375_rand_state <- read.csv(file_name)[-1]
e375_rand_state <- e375_rand_state %>% filter(year == 11)
e375_rand_state$state <- round(e375_rand_state$state)

path2 <- "e375_linear"
file_name = paste(path, path2,'Mean.States_e375_linear.csv',sep = '/')
e375_linear_state <- read.csv(file_name)[-1]
e375_linear_state <- e375_linear_state %>% filter(year == 11)
e375_linear_state$state <- round(e375_linear_state$state)


e125_hocc_map <- data.frame(site = seq(1,n.sites), state = e125_hocc_state$state, dr = 2)
e125_rand_map <- data.frame(site = seq(1,n.sites), state = e125_rand_state$state, dr = 1)
e125_linear_map <- data.frame(site = seq(1,n.sites), state = e125_linear_state$state, dr = 3)

heatmap.dat <- rbind(e125_hocc_map, e125_rand_map, e125_linear_map)

ggplot(heatmap.dat, aes(x = site, y = dr, fill = state)) +
  geom_tile()+
  theme_classic()


e375_hocc_map <- data.frame(site = seq(1,n.sites), state = e375_hocc_state$state, dr = 2)
e375_rand_map <- data.frame(site = seq(1,n.sites), state = e375_rand_state$state, dr = 1)
e375_linear_map <- data.frame(site = seq(1,n.sites), state = e375_linear_state$state, dr = 3)

heatmap.dat <- rbind(e375_hocc_map, e375_rand_map, e375_linear_map)
ggplot(heatmap.dat, aes(x = site, y = dr, fill = state)) +
  geom_tile()+
  theme_classic()

#### Sites visited and removed avg ####
path2 <- "e375_hocc"
file_name = paste(path, path2,'rem.site_e375_hocc.csv',sep = '/')
e375_hocc_rems <- read.csv(file_name)[-1]

rem.s <- array(NA, dim = c(n.years, n.sims))

for(s in 1:n.sims){
  for(y in 1:n.years){
    df <- e375_hocc_rems %>% filter(year == y, sim == s)
    rem.s[y,s] <- sum(df$observed.state)
  }
}

colMeans(rem.s)

path2 <- "e375_random"
file_name = paste(path, path2,'rem.site_e375_random.csv',sep = '/')
e375_rand_rems <- read.csv(file_name)[-1]

rem.s2 <- array(NA, dim = c(n.years, n.sims))

for(s in 1:n.sims){
  for(y in 1:n.years){
    df <- e375_rand_rems %>% filter(year == y, sim == s)
    rem.s2[y,s] <- sum(df$observed.state)
  }
}

colMeans(rem.s2)

path2 <- "e375_random"
file_name = paste(path, path2,'rem.site_e375_random.csv',sep = '/')
e375_rand_rems <- read.csv(file_name)[-1]

rem.s2 <- array(NA, dim = c(n.years, n.sims))

for(s in 1:n.sims){
  for(y in 1:n.years){
    df <- e375_rand_rems %>% filter(year == y, sim == s)
    rem.s[y,s] <- sum(df$observed.state)
  }
}

path2 <- "e375_linear"
file_name = paste(path, path2,'rem.site_e375_linear.csv',sep = '/')
e375_linear_rems <- read.csv(file_name)[-1]

rem.s3 <- array(NA, dim = c(n.years, n.sims))

for(s in 1:n.sims){
  for(y in 1:n.years){
    df <- e375_linear_rems %>% filter(year == y, sim == s)
    rem.s3[y,s] <- sum(df$observed.state)
  }
}

colMeans(rem.s3)

###### compare ####
colMeans(rem.s)
colMeans(rem.s2)
colMeans(rem.s3)

colMeans(rem.s3) > colMeans(rem.s)

#### Learning ####
##### psi 0 ####
psi0 <- 0.5 #base occupancy

######e125_linear #####
path2 <- "e125_linear"
file_name = paste(path, path2,'psi0s.est.est_e125_linear.csv',sep = '/')
e125_linear_psi0<- read.csv(file_name)[-1]

e125_linear_psi0 <- e125_linear_psi0 %>% select(mean, X2.5., X97.5., sim, year)

e125_linear_psi0_low <- e125_linear_psi0 %>% select(X2.5., year, sim)
e125_linear_psi0_low <- aggregate(X2.5. ~ year, data = e125_linear_psi0_low, FUN = mean)

e125_linear_psi0_mean <- e125_linear_psi0 %>% select(mean, year, sim)
e125_linear_psi0_mean <- aggregate(mean ~ year, data = e125_linear_psi0_mean, FUN = mean)

e125_linear_psi0_high <- e125_linear_psi0 %>% select(X97.5., year, sim)
e125_linear_psi0_high <- aggregate(X97.5. ~ year, data = e125_linear_psi0_high, FUN = mean)

e125_linear_psi0s <- cbind(e125_linear_psi0_low, mean = e125_linear_psi0_mean$mean, X97.5. = e125_linear_psi0_high$X97.5.)

p1 <- ggplot(e125_linear_psi0s, aes(x=year, y=mean)) +
  geom_point(size = 4)+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05), size = 1)+
  geom_hline(yintercept = psi0, color = 'red', size = 0.75) +
  scale_x_continuous(breaks=seq(1,10,3))+
  ylab('value')+
  theme(text = element_text(size = 15))   


#######e625_linear #####
# path2 <- "e625_linear"
# file_name = paste(path, path2,'psi0s.est.est_e625_linear.csv',sep = '/')
# e625_linear_psi0<- read.csv(file_name)[-1]
# 
# e625_linear_psi0 <- e625_linear_psi0 %>% select(mean, X2.5., X97.5., sim, year)
# 
# e625_linear_psi0_low <- e625_linear_psi0 %>% select(X2.5., year, sim)
# e625_linear_psi0_low <- aggregate(X2.5. ~ year, data = e625_linear_psi0_low, FUN = mean)
# 
# e625_linear_psi0_mean <- e625_linear_psi0 %>% select(mean, year, sim)
# e625_linear_psi0_mean <- aggregate(mean ~ year, data = e625_linear_psi0_mean, FUN = mean)
# 
# e625_linear_psi0_high <- e625_linear_psi0 %>% select(X97.5., year, sim)
# e625_linear_psi0_high <- aggregate(X97.5. ~ year, data = e625_linear_psi0_high, FUN = mean)
# 
# e625_linear_psi0s <- cbind(e625_linear_psi0_low, mean = e625_linear_psi0_mean$mean, X97.5. = e625_linear_psi0_high$X97.5.)
# 
# ggplot(e625_linear_psi0s, aes(x=year, y=mean)) +
#   geom_point(size = 4)+
#   geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
#                 position=position_dodge(0.05), size = 1)+
#   geom_hline(yintercept = psi0, color = 'red', size = 0.75) +
#   scale_x_continuous(breaks=seq(1,10,3))+
#   ylab('value')+
#   theme(text = element_text(size = 20)) 

##### psi 1 ####
psi1 <- -30 #effect of previous removal

######e125_linear #####
path2 <- "e125_linear"
file_name = paste(path, path2,'psi1s.est.est_e125_linear.csv',sep = '/')
e125_linear_psi1<- read.csv(file_name)[-1]

e125_linear_psi1 <- e125_linear_psi1 %>% select(mean, X2.5., X97.5., sim, year)

e125_linear_psi1_low <- e125_linear_psi1 %>% select(X2.5., year, sim)
e125_linear_psi1_low <- aggregate(X2.5. ~ year, data = e125_linear_psi1_low, FUN = mean)

e125_linear_psi1_mean <- e125_linear_psi1 %>% select(mean, year, sim)
e125_linear_psi1_mean <- aggregate(mean ~ year, data = e125_linear_psi1_mean, FUN = mean)

e125_linear_psi1_high <- e125_linear_psi1 %>% select(X97.5., year, sim)
e125_linear_psi1_high <- aggregate(X97.5. ~ year, data = e125_linear_psi1_high, FUN = mean)

e125_linear_psi1s <- cbind(e125_linear_psi1_low, mean = e125_linear_psi1_mean$mean, X97.5. = e125_linear_psi1_high$X97.5.)

p2 <- ggplot(e125_linear_psi1s, aes(x=year, y=mean)) +
  geom_point(size = 4)+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05), size = 1)+
  geom_hline(yintercept = -psi1, color = 'red', size = 0.75) +
  scale_x_continuous(breaks=seq(1,10,3))+
  ylab('value')+
  theme(text = element_text(size = 15))   

######e625_linear #####
# path2 <- "e625_linear"
# file_name = paste(path, path2,'psi1s.est.est_e625_linear.csv',sep = '/')
# e625_linear_psi1<- read.csv(file_name)[-1]
# 
# e625_linear_psi1 <- e625_linear_psi1 %>% select(mean, X2.5., X97.5., sim, year)
# 
# e625_linear_psi1_low <- e625_linear_psi1 %>% select(X2.5., year, sim)
# e625_linear_psi1_low <- aggregate(X2.5. ~ year, data = e625_linear_psi1_low, FUN = mean)
# 
# e625_linear_psi1_mean <- e625_linear_psi1 %>% select(mean, year, sim)
# e625_linear_psi1_mean <- aggregate(mean ~ year, data = e625_linear_psi1_mean, FUN = mean)
# 
# e625_linear_psi1_high <- e625_linear_psi1 %>% select(X97.5., year, sim)
# e625_linear_psi1_high <- aggregate(X97.5. ~ year, data = e625_linear_psi1_high, FUN = mean)
# 
# e625_linear_psi1s <- cbind(e625_linear_psi1_low, mean = e625_linear_psi1_mean$mean, X97.5. = e625_linear_psi1_high$X97.5.)
# 
# ggplot(e625_linear_psi1s, aes(x=year, y=mean)) +
#   geom_point(size = 4)+
#   geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
#                 position=position_dodge(0.05), size = 1)+
#   geom_hline(yintercept = -psi1, color = 'red', size = 0.75) +
#   scale_x_continuous(breaks=seq(1,10,3))+
#   ylab('value')+
#   theme(text = element_text(size = 20))   


##### psi 2 ####
psi2 <- 0.5  #effect of site characteristics 

######e125_linear #####
path2 <- "e125_linear"
file_name = paste(path, path2,'psi2s.est.est_e125_linear.csv',sep = '/')
e125_linear_psi2<- read.csv(file_name)[-1]

e125_linear_psi2 <- e125_linear_psi2 %>% select(mean, X2.5., X97.5., sim, year)

e125_linear_psi2_low <- e125_linear_psi2 %>% select(X2.5., year, sim)
e125_linear_psi2_low <- aggregate(X2.5. ~ year, data = e125_linear_psi2_low, FUN = mean)

e125_linear_psi2_mean <- e125_linear_psi2 %>% select(mean, year, sim)
e125_linear_psi2_mean <- aggregate(mean ~ year, data = e125_linear_psi2_mean, FUN = mean)

e125_linear_psi2_high <- e125_linear_psi2 %>% select(X97.5., year, sim)
e125_linear_psi2_high <- aggregate(X97.5. ~ year, data = e125_linear_psi2_high, FUN = mean)

e125_linear_psi2s <- cbind(e125_linear_psi2_low, mean = e125_linear_psi2_mean$mean, X97.5. = e125_linear_psi2_high$X97.5.)


p3 <- ggplot(e125_linear_psi2s, aes(x=year, y=mean)) +
  geom_point(size = 4)+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05), size = 1)+
  geom_hline(yintercept = psi2, color = 'red', size = 0.75) +
  scale_x_continuous(breaks=seq(1,10,3))+
  ylab('value')+
  theme(text = element_text(size = 15))

######e625_linear #####
# path2 <- "e625_linear"
# file_name = paste(path, path2,'psi2s.est.est_e625_linear.csv',sep = '/')
# e625_linear_psi2<- read.csv(file_name)[-1]
# 
# e625_linear_psi2 <- e625_linear_psi2 %>% select(mean, X2.5., X97.5., sim, year)
# 
# e625_linear_psi2_low <- e625_linear_psi2 %>% select(X2.5., year, sim)
# e625_linear_psi2_low <- aggregate(X2.5. ~ year, data = e625_linear_psi2_low, FUN = mean)
# 
# e625_linear_psi2_mean <- e625_linear_psi2 %>% select(mean, year, sim)
# e625_linear_psi2_mean <- aggregate(mean ~ year, data = e625_linear_psi2_mean, FUN = mean)
# 
# e625_linear_psi2_high <- e625_linear_psi2 %>% select(X97.5., year, sim)
# e625_linear_psi2_high <- aggregate(X97.5. ~ year, data = e625_linear_psi2_high, FUN = mean)
# 
# e625_linear_psi2s <- cbind(e625_linear_psi2_low, mean = e625_linear_psi2_mean$mean, X97.5. = e625_linear_psi2_high$X97.5.)
# 
# 
# ggplot(e625_linear_psi2s, aes(x=year, y=mean)) +
#   geom_point(size = 4)+
#   geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
#                 position=position_dodge(0.05), size = 1)+
#   geom_hline(yintercept = psi2, color = 'red', size = 0.75) +
#   scale_x_continuous(breaks=seq(1,10,3))+
#   ylab('value')+
#   theme(text = element_text(size = 20))

##### psi 3 ####
psi3 <-2 #effect of previous year state

######e125_linear #####
path2 <- "e125_linear"
file_name = paste(path, path2,'psi3s.est.est_e125_linear.csv',sep = '/')
e125_linear_psi3<- read.csv(file_name)[-1]

e125_linear_psi3 <- e125_linear_psi3 %>% select(mean, X2.5., X97.5., sim, year)

e125_linear_psi3_low <- e125_linear_psi3 %>% select(X2.5., year, sim)
e125_linear_psi3_low <- aggregate(X2.5. ~ year, data = e125_linear_psi3_low, FUN = mean)

e125_linear_psi3_mean <- e125_linear_psi3 %>% select(mean, year, sim)
e125_linear_psi3_mean <- aggregate(mean ~ year, data = e125_linear_psi3_mean, FUN = mean)

e125_linear_psi3_high <- e125_linear_psi3 %>% select(X97.5., year, sim)
e125_linear_psi3_high <- aggregate(X97.5. ~ year, data = e125_linear_psi3_high, FUN = mean)

e125_linear_psi3s <- cbind(e125_linear_psi3_low, mean = e125_linear_psi3_mean$mean, X97.5. = e125_linear_psi3_high$X97.5.)


p4 <- ggplot(e125_linear_psi3s, aes(x=year, y=mean)) +
  geom_point(size = 4)+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05), size = 1)+
  geom_hline(yintercept = psi3, color = 'red', size = 0.75) +
  scale_x_continuous(breaks=seq(1,10,3))+
  ylab('value')+
  theme(text = element_text(size = 15))   

grid.arrange(p1, p2, p3, p4, nrow = 1)

######e625_linear #####
# path2 <- "e625_linear"
# file_name = paste(path, path2,'psi3s.est.est_e625_linear.csv',sep = '/')
# e625_linear_psi3<- read.csv(file_name)[-1]
# 
# e625_linear_psi3 <- e625_linear_psi3 %>% select(mean, X2.5., X97.5., sim, year)
# 
# e625_linear_psi3_low <- e625_linear_psi3 %>% select(X2.5., year, sim)
# e625_linear_psi3_low <- aggregate(X2.5. ~ year, data = e625_linear_psi3_low, FUN = mean)
# 
# e625_linear_psi3_mean <- e625_linear_psi3 %>% select(mean, year, sim)
# e625_linear_psi3_mean <- aggregate(mean ~ year, data = e625_linear_psi3_mean, FUN = mean)
# 
# e625_linear_psi3_high <- e625_linear_psi3 %>% select(X97.5., year, sim)
# e625_linear_psi3_high <- aggregate(X97.5. ~ year, data = e625_linear_psi3_high, FUN = mean)
# 
# e625_linear_psi3s <- cbind(e625_linear_psi3_low, mean = e625_linear_psi3_mean$mean, X97.5. = e625_linear_psi3_high$X97.5.)
# 
# 
# ggplot(e625_linear_psi3s, aes(x=year, y=mean)) +
#   geom_point(size = 4)+
#   geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
#                 position=position_dodge(0.05), size = 1)+
#   geom_hline(yintercept = psi3, color = 'red', size = 0.75) +
#   scale_x_continuous(breaks=seq(1,10,3))+
#   ylab('value')+
#   theme(text = element_text(size = 20))   

##### a0 ####
a0 <- 0.9 #base detection

######e125_linear #####
path2 <- "e125_linear"
file_name = paste(path, path2,'a0s.est.est_e125_linear.csv',sep = '/')
e125_linear_a0<- read.csv(file_name)[-1]

e125_linear_a0 <- e125_linear_a0 %>% select(mean, X2.5., X97.5., sim, year)

e125_linear_a0_low <- e125_linear_a0 %>% select(X2.5., year, sim)
e125_linear_a0_low <- aggregate(X2.5. ~ year, data = e125_linear_a0_low, FUN = mean)

e125_linear_a0_mean <- e125_linear_a0 %>% select(mean, year, sim)
e125_linear_a0_mean <- aggregate(mean ~ year, data = e125_linear_a0_mean, FUN = mean)

e125_linear_a0_high <- e125_linear_a0 %>% select(X97.5., year, sim)
e125_linear_a0_high <- aggregate(X97.5. ~ year, data = e125_linear_a0_high, FUN = mean)

e125_linear_a0s <- cbind(e125_linear_a0_low, mean = e125_linear_a0_mean$mean, X97.5. = e125_linear_a0_high$X97.5.)

p5 <- ggplot(e125_linear_a0s, aes(x=year, y=mean)) +
  geom_point(size = 4)+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05), size = 1)+
  geom_hline(yintercept = a0, color = 'red', size = 0.75) +
  scale_x_continuous(breaks=seq(1,10,3))+
  ylab('value')+
  theme(text = element_text(size = 15))   

######e625_linear #####
# path2 <- "e625_linear"
# file_name = paste(path, path2,'a0s.est.est_e625_linear.csv',sep = '/')
# e625_linear_a0<- read.csv(file_name)[-1]
# 
# e625_linear_a0 <- e625_linear_a0 %>% select(mean, X2.5., X97.5., sim, year)
# 
# e625_linear_a0_low <- e625_linear_a0 %>% select(X2.5., year, sim)
# e625_linear_a0_low <- aggregate(X2.5. ~ year, data = e625_linear_a0_low, FUN = mean)
# 
# e625_linear_a0_mean <- e625_linear_a0 %>% select(mean, year, sim)
# e625_linear_a0_mean <- aggregate(mean ~ year, data = e625_linear_a0_mean, FUN = mean)
# 
# e625_linear_a0_high <- e625_linear_a0 %>% select(X97.5., year, sim)
# e625_linear_a0_high <- aggregate(X97.5. ~ year, data = e625_linear_a0_high, FUN = mean)
# 
# e625_linear_a0s <- cbind(e625_linear_a0_low, mean = e625_linear_a0_mean$mean, X97.5. = e625_linear_a0_high$X97.5.)
# 
# ggplot(e625_linear_a0s, aes(x=year, y=mean)) +
#   geom_point(size = 4)+
#   geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
#                 position=position_dodge(0.05), size = 1)+
#   geom_hline(yintercept = a0, color = 'red', size = 0.75) +
#   scale_x_continuous(breaks=seq(1,10,3))+
#   ylab('value')+
#   theme(text = element_text(size = 20))   

##### a1 ####
a1 <- 1 #effect of effort

######e125_linear #####

path2 <- "e125_linear"
file_name = paste(path, path2,'a1s.est.est_e125_linear.csv',sep = '/')
e125_linear_a1<- read.csv(file_name)[-1]

e125_linear_a1 <- e125_linear_a1 %>% select(mean, X2.5., X97.5., sim, year)

e125_linear_a1_low <- e125_linear_a1 %>% select(X2.5., year, sim)
e125_linear_a1_low <- aggregate(X2.5. ~ year, data = e125_linear_a1_low, FUN = mean)

e125_linear_a1_mean <- e125_linear_a1 %>% select(mean, year, sim)
e125_linear_a1_mean <- aggregate(mean ~ year, data = e125_linear_a1_mean, FUN = mean)

e125_linear_a1_high <- e125_linear_a1 %>% select(X97.5., year, sim)
e125_linear_a1_high <- aggregate(X97.5. ~ year, data = e125_linear_a1_high, FUN = mean)

e125_linear_a1s <- cbind(e125_linear_a1_low, mean = e125_linear_a1_mean$mean, X97.5. = e125_linear_a1_high$X97.5.)

p6 <- ggplot(e125_linear_a1s, aes(x=year, y=mean)) +
  geom_point(size = 4)+
  geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
                position=position_dodge(0.05), size = 1)+
  geom_hline(yintercept = a1, color = 'red', size = 0.75) +
  scale_x_continuous(breaks=seq(1,10,3))+
  ylab('value')+
  theme(text = element_text(size = 15))   

grid.arrange(p5, p6, nrow = 2)

######e625_linear #####
# path2 <- "e625_linear"
# file_name = paste(path, path2,'a1s.est.est_e625_linear.csv',sep = '/')
# e625_linear_a1<- read.csv(file_name)[-1]
# 
# e625_linear_a1 <- e625_linear_a1 %>% select(mean, X2.5., X97.5., sim, year)
# 
# e625_linear_a1_low <- e625_linear_a1 %>% select(X2.5., year, sim)
# e625_linear_a1_low <- aggregate(X2.5. ~ year, data = e625_linear_a1_low, FUN = mean)
# 
# e625_linear_a1_mean <- e625_linear_a1 %>% select(mean, year, sim)
# e625_linear_a1_mean <- aggregate(mean ~ year, data = e625_linear_a1_mean, FUN = mean)
# 
# e625_linear_a1_high <- e625_linear_a1 %>% select(X97.5., year, sim)
# e625_linear_a1_high <- aggregate(X97.5. ~ year, data = e625_linear_a1_high, FUN = mean)
# 
# e625_linear_a1s <- cbind(e625_linear_a1_low, mean = e625_linear_a1_mean$mean, X97.5. = e625_linear_a1_high$X97.5.)
# 
# ggplot(e625_linear_a1s, aes(x=year, y=mean)) +
#   geom_point(size = 4)+
#   geom_errorbar(aes(ymin=X2.5., ymax=X97.5.), width=.2,
#                 position=position_dodge(0.05), size = 1)+
#   geom_hline(yintercept = a1, color = 'red', size = 0.75) +
#   scale_x_continuous(breaks=seq(1,10,3))+
#   ylab('value')+
#   theme(text = element_text(size = 20))   
