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


