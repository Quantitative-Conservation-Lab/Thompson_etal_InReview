library(tidyverse)
library(here)
library(plyr)
library(data.table)
library(RColorBrewer) 

#### States truth ####
##### hstatebins #####
#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40 <- fread(file_name)
state_truth_S25_R5_40 <- data.frame(state_truth_S25_R5_40)[-1]

state_truth_S25_R5_40$location <- 'hstatebins'
state_truth_S25_R5_40$detection <- 0.25
state_truth_S25_R5_40$eradication <- 0.5
state_truth_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40b <- fread(file_name)
state_truth_S25_R5_40b <- data.frame(state_truth_S25_R5_40b)[-1]

state_truth_S25_R5_40b$location <- 'hstatebins'
state_truth_S25_R5_40b$detection <- 0.25
state_truth_S25_R5_40b$eradication <- 0.5
state_truth_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40 <- fread(file_name)
state_truth_S25_R75_40 <- data.frame(state_truth_S25_R75_40)[-1]

state_truth_S25_R75_40$location <- 'hstatebins'
state_truth_S25_R75_40$detection <- 0.25
state_truth_S25_R75_40$eradication <- 0.75
state_truth_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40b <- fread(file_name)
state_truth_S25_R75_40b <- data.frame(state_truth_S25_R75_40b)[-1]

state_truth_S25_R75_40b$location <- 'hstatebins'
state_truth_S25_R75_40b$detection <- 0.25
state_truth_S25_R75_40b$eradication <- 0.75
state_truth_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40 <- fread(file_name)
state_truth_S5_R5_40 <- data.frame(state_truth_S5_R5_40)[-1]

state_truth_S5_R5_40$location <- 'hstatebins'
state_truth_S5_R5_40$detection <- 0.5
state_truth_S5_R5_40$eradication <- 0.5
state_truth_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40b <- fread(file_name)
state_truth_S5_R5_40b <- data.frame(state_truth_S5_R5_40b)[-1]

state_truth_S5_R5_40b$location <- 'hstatebins'
state_truth_S5_R5_40b$detection <- 0.5
state_truth_S5_R5_40b$eradication <- 0.5
state_truth_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'hstatebins'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'hstatebins'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40 <- fread(file_name)
state_truth_S75_R5_40 <- data.frame(state_truth_S75_R5_40)[-1]

state_truth_S75_R5_40$location <- 'hstatebins'
state_truth_S75_R5_40$detection <- 0.75
state_truth_S75_R5_40$eradication <- 0.5
state_truth_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40b <- fread(file_name)
state_truth_S75_R5_40b <- data.frame(state_truth_S75_R5_40b)[-1]

state_truth_S75_R5_40b$location <- 'hstatebins'
state_truth_S75_R5_40b$detection <- 0.75
state_truth_S75_R5_40b$eradication <- 0.5
state_truth_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40 <- fread(file_name)
state_truth_S75_R75_40 <- data.frame(state_truth_S75_R75_40)[-1]

state_truth_S75_R75_40$location <- 'hstatebins'
state_truth_S75_R75_40$detection <- 0.75
state_truth_S75_R75_40$eradication <- 0.75
state_truth_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40b <- fread(file_name)
state_truth_S75_R75_40b <- data.frame(state_truth_S75_R75_40b)[-1]

state_truth_S75_R75_40b$location <- 'hstatebins'
state_truth_S75_R75_40b$detection <- 0.75
state_truth_S75_R75_40b$eradication <- 0.75
state_truth_S75_R75_40b$budget <- 40

#--- Combine state_truths ---#
state_truth_40 <- rbind(state_truth_S25_R5_40,state_truth_S25_R5_40b,
                        state_truth_S25_R75_40,state_truth_S25_R75_40b,
                        state_truth_S5_R5_40,state_truth_S5_R5_40b,
                  state_truth_S5_R75_40,state_truth_S5_R75_40b,
                  state_truth_S75_R5_40,state_truth_S75_R5_40b,
                  state_truth_S75_R75_40,state_truth_S5_R75_40b)

state_truth_hstatebins <- rbind(state_truth_40)

##### linear #####
#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40 <- fread(file_name)
state_truth_S25_R5_40 <- data.frame(state_truth_S25_R5_40)[-1]

state_truth_S25_R5_40$location <- 'linear'
state_truth_S25_R5_40$detection <- 0.25
state_truth_S25_R5_40$eradication <- 0.5
state_truth_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40b <- fread(file_name)
state_truth_S25_R5_40b <- data.frame(state_truth_S25_R5_40b)[-1]

state_truth_S25_R5_40b$location <- 'linear'
state_truth_S25_R5_40b$detection <- 0.25
state_truth_S25_R5_40b$eradication <- 0.5
state_truth_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40 <- fread(file_name)
state_truth_S25_R75_40 <- data.frame(state_truth_S25_R75_40)[-1]

state_truth_S25_R75_40$location <- 'linear'
state_truth_S25_R75_40$detection <- 0.25
state_truth_S25_R75_40$eradication <- 0.75
state_truth_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40b <- fread(file_name)
state_truth_S25_R75_40b <- data.frame(state_truth_S25_R75_40b)[-1]

state_truth_S25_R75_40b$location <- 'linear'
state_truth_S25_R75_40b$detection <- 0.25
state_truth_S25_R75_40b$eradication <- 0.75
state_truth_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40 <- fread(file_name)
state_truth_S5_R5_40 <- data.frame(state_truth_S5_R5_40)[-1]

state_truth_S5_R5_40$location <- 'linear'
state_truth_S5_R5_40$detection <- 0.5
state_truth_S5_R5_40$eradication <- 0.5
state_truth_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40b <- fread(file_name)
state_truth_S5_R5_40b <- data.frame(state_truth_S5_R5_40b)[-1]

state_truth_S5_R5_40b$location <- 'linear'
state_truth_S5_R5_40b$detection <- 0.5
state_truth_S5_R5_40b$eradication <- 0.5
state_truth_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'linear'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'linear'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40 <- fread(file_name)
state_truth_S75_R5_40 <- data.frame(state_truth_S75_R5_40)[-1]

state_truth_S75_R5_40$location <- 'linear'
state_truth_S75_R5_40$detection <- 0.75
state_truth_S75_R5_40$eradication <- 0.5
state_truth_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40b <- fread(file_name)
state_truth_S75_R5_40b <- data.frame(state_truth_S75_R5_40b)[-1]

state_truth_S75_R5_40b$location <- 'linear'
state_truth_S75_R5_40b$detection <- 0.75
state_truth_S75_R5_40b$eradication <- 0.5
state_truth_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40 <- fread(file_name)
state_truth_S75_R75_40 <- data.frame(state_truth_S75_R75_40)[-1]

state_truth_S75_R75_40$location <- 'linear'
state_truth_S75_R75_40$detection <- 0.75
state_truth_S75_R75_40$eradication <- 0.75
state_truth_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40b <- fread(file_name)
state_truth_S75_R75_40b <- data.frame(state_truth_S75_R75_40b)[-1]

state_truth_S75_R75_40b$location <- 'linear'
state_truth_S75_R75_40b$detection <- 0.75
state_truth_S75_R75_40b$eradication <- 0.75
state_truth_S75_R75_40b$budget <- 40

#--- Combine state_truths ---#
state_truth_40 <- rbind(state_truth_S25_R5_40,state_truth_S25_R5_40b,
                        state_truth_S25_R75_40,state_truth_S25_R75_40b,
                        state_truth_S5_R5_40,state_truth_S5_R5_40b,
                        state_truth_S5_R75_40,state_truth_S5_R75_40b,
                        state_truth_S75_R5_40,state_truth_S75_R5_40b,
                        state_truth_S75_R75_40,state_truth_S5_R75_40b)

state_truth_linear <- rbind(state_truth_40)

##### epicenter #####
#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40 <- fread(file_name)
state_truth_S25_R5_40 <- data.frame(state_truth_S25_R5_40)[-1]

state_truth_S25_R5_40$location <- 'epicenter'
state_truth_S25_R5_40$detection <- 0.25
state_truth_S25_R5_40$eradication <- 0.5
state_truth_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40b <- fread(file_name)
state_truth_S25_R5_40b <- data.frame(state_truth_S25_R5_40b)[-1]

state_truth_S25_R5_40b$location <- 'epicenter'
state_truth_S25_R5_40b$detection <- 0.25
state_truth_S25_R5_40b$eradication <- 0.5
state_truth_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40 <- fread(file_name)
state_truth_S25_R75_40 <- data.frame(state_truth_S25_R75_40)[-1]

state_truth_S25_R75_40$location <- 'epicenter'
state_truth_S25_R75_40$detection <- 0.25
state_truth_S25_R75_40$eradication <- 0.75
state_truth_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40b <- fread(file_name)
state_truth_S25_R75_40b <- data.frame(state_truth_S25_R75_40b)[-1]

state_truth_S25_R75_40b$location <- 'epicenter'
state_truth_S25_R75_40b$detection <- 0.25
state_truth_S25_R75_40b$eradication <- 0.75
state_truth_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40 <- fread(file_name)
state_truth_S5_R5_40 <- data.frame(state_truth_S5_R5_40)[-1]

state_truth_S5_R5_40$location <- 'epicenter'
state_truth_S5_R5_40$detection <- 0.5
state_truth_S5_R5_40$eradication <- 0.5
state_truth_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40b <- fread(file_name)
state_truth_S5_R5_40b <- data.frame(state_truth_S5_R5_40b)[-1]

state_truth_S5_R5_40b$location <- 'epicenter'
state_truth_S5_R5_40b$detection <- 0.5
state_truth_S5_R5_40b$eradication <- 0.5
state_truth_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'epicenter'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'epicenter'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40 <- fread(file_name)
state_truth_S75_R5_40 <- data.frame(state_truth_S75_R5_40)[-1]

state_truth_S75_R5_40$location <- 'epicenter'
state_truth_S75_R5_40$detection <- 0.75
state_truth_S75_R5_40$eradication <- 0.5
state_truth_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40b <- fread(file_name)
state_truth_S75_R5_40b <- data.frame(state_truth_S75_R5_40b)[-1]

state_truth_S75_R5_40b$location <- 'epicenter'
state_truth_S75_R5_40b$detection <- 0.75
state_truth_S75_R5_40b$eradication <- 0.5
state_truth_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40 <- fread(file_name)
state_truth_S75_R75_40 <- data.frame(state_truth_S75_R75_40)[-1]

state_truth_S75_R75_40$location <- 'epicenter'
state_truth_S75_R75_40$detection <- 0.75
state_truth_S75_R75_40$eradication <- 0.75
state_truth_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40b <- fread(file_name)
state_truth_S75_R75_40b <- data.frame(state_truth_S75_R75_40b)[-1]

state_truth_S75_R75_40b$location <- 'epicenter'
state_truth_S75_R75_40b$detection <- 0.75
state_truth_S75_R75_40b$eradication <- 0.75
state_truth_S75_R75_40b$budget <- 40

#--- Combine state_truths ---#
state_truth_40 <- rbind(state_truth_S25_R5_40,state_truth_S25_R5_40b,
                        state_truth_S25_R75_40,state_truth_S25_R75_40b,
                        state_truth_S5_R5_40,state_truth_S5_R5_40b,
                        state_truth_S5_R75_40,state_truth_S5_R75_40b,
                        state_truth_S75_R5_40,state_truth_S75_R5_40b,
                        state_truth_S75_R75_40,state_truth_S5_R75_40b)

state_truth_epicenter <- rbind(state_truth_40)

#### Combine ####
state_truth <- rbind(state_truth_hstatebins, state_truth_linear, state_truth_epicenter)
finstate_truth <- state_truth %>% filter(week == 5 & year == 7)

##### Suppression ####
finstate_truth$rates <- paste0('(p = )', finstate_truth$detection, ',  \u03F5 = ', finstate_truth$eradication)
finstate_truth$rates2 <- paste0('(', finstate_truth$detection, ', ', finstate_truth$eradication, ")")
finstate_truth$state <- finstate_truth$state - 1
finstate_truth <- aggregate(state ~ sim + location + detection + eradication + budget + rates + rates2, 
                            data = as.data.frame(finstate_truth), 
                            FUN = mean)

colnames(finstate_truth)[5] <- 'Budget'
finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication)

detach(package:plyr)

budget40_suppress <- finstate_truth %>% 
  filter(Budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(state),
            max_c = max(state))

budget40_suppress

##### Containment ####
fininv_truth <-  state_truth %>% filter(week == 5 & year == 7)

fininv_truth$rates <- paste0('p = ', fininv_truth$detection, ', e = ', fininv_truth$eradication)
fininv_truth$rates2 <- paste0('(', fininv_truth$detection, ', ', fininv_truth$eradication, ")")

fininv_truth$inv <- fininv_truth$state
fininv_truth$inv[fininv_truth$inv <= 2 ] <- 0
fininv_truth$inv[fininv_truth$inv > 2 ] <- 1

fininv_truth <- aggregate(inv ~ sim + location + detection + eradication + budget + rates + rates2, 
                          data = as.data.frame(fininv_truth), 
                          FUN = mean)

fininv_truth$loc2 <- paste0(fininv_truth$location, fininv_truth$detection, fininv_truth$eradication)

colnames(fininv_truth)[c(2,5)] <- c('Location', 'Budget')

budget40_contain <- fininv_truth %>% 
  filter(Budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv))

budget40_contain 
cor(fininv_truth$inv, finstate_truth$state)

#### Bias state ####
##### hstatebins ######
#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_40 <- fread(file_name)
hsb_biasstate_S25_R5_40 <- data.frame(hsb_biasstate_S25_R5_40)[-1]

hsb_biasstate_S25_R5_40$location <- 'hstatebins'
hsb_biasstate_S25_R5_40$detection <- 0.25
hsb_biasstate_S25_R5_40$eradication <- 0.5
hsb_biasstate_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_40b <- fread(file_name)
hsb_biasstate_S25_R5_40b <- data.frame(hsb_biasstate_S25_R5_40b)[-1]

hsb_biasstate_S25_R5_40b$location <- 'hstatebins'
hsb_biasstate_S25_R5_40b$detection <- 0.25
hsb_biasstate_S25_R5_40b$eradication <- 0.5
hsb_biasstate_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_40 <- fread(file_name)
hsb_biasstate_S25_R75_40 <- data.frame(hsb_biasstate_S25_R75_40)[-1]

hsb_biasstate_S25_R75_40$location <- 'hstatebins'
hsb_biasstate_S25_R75_40$detection <- 0.25
hsb_biasstate_S25_R75_40$eradication <- 0.75
hsb_biasstate_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_40b <- fread(file_name)
hsb_biasstate_S25_R75_40b <- data.frame(hsb_biasstate_S25_R75_40b)[-1]

hsb_biasstate_S25_R75_40b$location <- 'hstatebins'
hsb_biasstate_S25_R75_40b$detection <- 0.25
hsb_biasstate_S25_R75_40b$eradication <- 0.75
hsb_biasstate_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_40 <- fread(file_name)
hsb_biasstate_S5_R5_40 <- data.frame(hsb_biasstate_S5_R5_40)[-1]

hsb_biasstate_S5_R5_40$location <- 'hstatebins'
hsb_biasstate_S5_R5_40$detection <- 0.5
hsb_biasstate_S5_R5_40$eradication <- 0.5
hsb_biasstate_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_40b <- fread(file_name)
hsb_biasstate_S5_R5_40b <- data.frame(hsb_biasstate_S5_R5_40b)[-1]

hsb_biasstate_S5_R5_40b$location <- 'hstatebins'
hsb_biasstate_S5_R5_40b$detection <- 0.5
hsb_biasstate_S5_R5_40b$eradication <- 0.5
hsb_biasstate_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_40 <- fread(file_name)
hsb_biasstate_S5_R75_40 <- data.frame(hsb_biasstate_S5_R75_40)[-1]

hsb_biasstate_S5_R75_40$location <- 'hstatebins'
hsb_biasstate_S5_R75_40$detection <- 0.5
hsb_biasstate_S5_R75_40$eradication <- 0.75
hsb_biasstate_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_40b <- fread(file_name)
hsb_biasstate_S5_R75_40b <- data.frame(hsb_biasstate_S5_R75_40b)[-1]

hsb_biasstate_S5_R75_40b$location <- 'hstatebins'
hsb_biasstate_S5_R75_40b$detection <- 0.5
hsb_biasstate_S5_R75_40b$eradication <- 0.75
hsb_biasstate_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_40 <- fread(file_name)
hsb_biasstate_S75_R5_40 <- data.frame(hsb_biasstate_S75_R5_40)[-1]

hsb_biasstate_S75_R5_40$location <- 'hstatebins'
hsb_biasstate_S75_R5_40$detection <- 0.75
hsb_biasstate_S75_R5_40$eradication <- 0.5
hsb_biasstate_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_40b <- fread(file_name)
hsb_biasstate_S75_R5_40b <- data.frame(hsb_biasstate_S75_R5_40b)[-1]

hsb_biasstate_S75_R5_40b$location <- 'hstatebins'
hsb_biasstate_S75_R5_40b$detection <- 0.75
hsb_biasstate_S75_R5_40b$eradication <- 0.5
hsb_biasstate_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_40 <- fread(file_name)
hsb_biasstate_S75_R75_40 <- data.frame(hsb_biasstate_S75_R75_40)[-1]

hsb_biasstate_S75_R75_40$location <- 'hstatebins'
hsb_biasstate_S75_R75_40$detection <- 0.75
hsb_biasstate_S75_R75_40$eradication <- 0.75
hsb_biasstate_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_40b <- fread(file_name)
hsb_biasstate_S75_R75_40b <- data.frame(hsb_biasstate_S75_R75_40b)[-1]

hsb_biasstate_S75_R75_40b$location <- 'hstatebins'
hsb_biasstate_S75_R75_40b$detection <- 0.75
hsb_biasstate_S75_R75_40b$eradication <- 0.75
hsb_biasstate_S75_R75_40b$budget <- 40

##### linear #####
#----- linear -----#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_40 <- fread(file_name)
linear_biasstate_S25_R5_40 <- data.frame(linear_biasstate_S25_R5_40)[-1]

linear_biasstate_S25_R5_40$location <- 'linear'
linear_biasstate_S25_R5_40$detection <- 0.25
linear_biasstate_S25_R5_40$eradication <- 0.5
linear_biasstate_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_40b <- fread(file_name)
linear_biasstate_S25_R5_40b <- data.frame(linear_biasstate_S25_R5_40b)[-1]

linear_biasstate_S25_R5_40b$location <- 'linear'
linear_biasstate_S25_R5_40b$detection <- 0.25
linear_biasstate_S25_R5_40b$eradication <- 0.5
linear_biasstate_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_40 <- fread(file_name)
linear_biasstate_S25_R75_40 <- data.frame(linear_biasstate_S25_R75_40)[-1]

linear_biasstate_S25_R75_40$location <- 'linear'
linear_biasstate_S25_R75_40$detection <- 0.25
linear_biasstate_S25_R75_40$eradication <- 0.75
linear_biasstate_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_40b <- fread(file_name)
linear_biasstate_S25_R75_40b <- data.frame(linear_biasstate_S25_R75_40b)[-1]

linear_biasstate_S25_R75_40b$location <- 'linear'
linear_biasstate_S25_R75_40b$detection <- 0.25
linear_biasstate_S25_R75_40b$eradication <- 0.75
linear_biasstate_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_40 <- fread(file_name)
linear_biasstate_S5_R5_40 <- data.frame(linear_biasstate_S5_R5_40)[-1]

linear_biasstate_S5_R5_40$location <- 'linear'
linear_biasstate_S5_R5_40$detection <- 0.5
linear_biasstate_S5_R5_40$eradication <- 0.5
linear_biasstate_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_40b <- fread(file_name)
linear_biasstate_S5_R5_40b <- data.frame(linear_biasstate_S5_R5_40b)[-1]

linear_biasstate_S5_R5_40b$location <- 'linear'
linear_biasstate_S5_R5_40b$detection <- 0.5
linear_biasstate_S5_R5_40b$eradication <- 0.5
linear_biasstate_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_40 <- fread(file_name)
linear_biasstate_S5_R75_40 <- data.frame(linear_biasstate_S5_R75_40)[-1]

linear_biasstate_S5_R75_40$location <- 'linear'
linear_biasstate_S5_R75_40$detection <- 0.5
linear_biasstate_S5_R75_40$eradication <- 0.75
linear_biasstate_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_40b <- fread(file_name)
linear_biasstate_S5_R75_40b <- data.frame(linear_biasstate_S5_R75_40b)[-1]

linear_biasstate_S5_R75_40b$location <- 'linear'
linear_biasstate_S5_R75_40b$detection <- 0.5
linear_biasstate_S5_R75_40b$eradication <- 0.75
linear_biasstate_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_40 <- fread(file_name)
linear_biasstate_S75_R5_40 <- data.frame(linear_biasstate_S75_R5_40)[-1]

linear_biasstate_S75_R5_40$location <- 'linear'
linear_biasstate_S75_R5_40$detection <- 0.75
linear_biasstate_S75_R5_40$eradication <- 0.5
linear_biasstate_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_40b <- fread(file_name)
linear_biasstate_S75_R5_40b <- data.frame(linear_biasstate_S75_R5_40b)[-1]

linear_biasstate_S75_R5_40b$location <- 'linear'
linear_biasstate_S75_R5_40b$detection <- 0.75
linear_biasstate_S75_R5_40b$eradication <- 0.5
linear_biasstate_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_40 <- fread(file_name)
linear_biasstate_S75_R75_40 <- data.frame(linear_biasstate_S75_R75_40)[-1]

linear_biasstate_S75_R75_40$location <- 'linear'
linear_biasstate_S75_R75_40$detection <- 0.75
linear_biasstate_S75_R75_40$eradication <- 0.75
linear_biasstate_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_40b <- fread(file_name)
linear_biasstate_S75_R75_40b <- data.frame(linear_biasstate_S75_R75_40b)[-1]

linear_biasstate_S75_R75_40b$location <- 'linear'
linear_biasstate_S75_R75_40b$detection <- 0.75
linear_biasstate_S75_R75_40b$eradication <- 0.75
linear_biasstate_S75_R75_40b$budget <- 40

##### epicenter #####
#----- epicenter -----#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R5_40 <- fread(file_name)
epicenter_biasstate_S25_R5_40 <- data.frame(epicenter_biasstate_S25_R5_40)[-1]

epicenter_biasstate_S25_R5_40$location <- 'epicenter'
epicenter_biasstate_S25_R5_40$detection <- 0.25
epicenter_biasstate_S25_R5_40$eradication <- 0.5
epicenter_biasstate_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R5_40b <- fread(file_name)
epicenter_biasstate_S25_R5_40b <- data.frame(epicenter_biasstate_S25_R5_40b)[-1]

epicenter_biasstate_S25_R5_40b$location <- 'epicenter'
epicenter_biasstate_S25_R5_40b$detection <- 0.25
epicenter_biasstate_S25_R5_40b$eradication <- 0.5
epicenter_biasstate_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R75_40 <- fread(file_name)
epicenter_biasstate_S25_R75_40 <- data.frame(epicenter_biasstate_S25_R75_40)[-1]

epicenter_biasstate_S25_R75_40$location <- 'epicenter'
epicenter_biasstate_S25_R75_40$detection <- 0.25
epicenter_biasstate_S25_R75_40$eradication <- 0.75
epicenter_biasstate_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R75_40b <- fread(file_name)
epicenter_biasstate_S25_R75_40b <- data.frame(epicenter_biasstate_S25_R75_40b)[-1]

epicenter_biasstate_S25_R75_40b$location <- 'epicenter'
epicenter_biasstate_S25_R75_40b$detection <- 0.25
epicenter_biasstate_S25_R75_40b$eradication <- 0.75
epicenter_biasstate_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R5_40 <- fread(file_name)
epicenter_biasstate_S5_R5_40 <- data.frame(epicenter_biasstate_S5_R5_40)[-1]

epicenter_biasstate_S5_R5_40$location <- 'epicenter'
epicenter_biasstate_S5_R5_40$detection <- 0.5
epicenter_biasstate_S5_R5_40$eradication <- 0.5
epicenter_biasstate_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R5_40b <- fread(file_name)
epicenter_biasstate_S5_R5_40b <- data.frame(epicenter_biasstate_S5_R5_40b)[-1]

epicenter_biasstate_S5_R5_40b$location <- 'epicenter'
epicenter_biasstate_S5_R5_40b$detection <- 0.5
epicenter_biasstate_S5_R5_40b$eradication <- 0.5
epicenter_biasstate_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R75_40 <- fread(file_name)
epicenter_biasstate_S5_R75_40 <- data.frame(epicenter_biasstate_S5_R75_40)[-1]

epicenter_biasstate_S5_R75_40$location <- 'epicenter'
epicenter_biasstate_S5_R75_40$detection <- 0.5
epicenter_biasstate_S5_R75_40$eradication <- 0.75
epicenter_biasstate_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R75_40b <- fread(file_name)
epicenter_biasstate_S5_R75_40b <- data.frame(epicenter_biasstate_S5_R75_40b)[-1]

epicenter_biasstate_S5_R75_40b$location <- 'epicenter'
epicenter_biasstate_S5_R75_40b$detection <- 0.5
epicenter_biasstate_S5_R75_40b$eradication <- 0.75
epicenter_biasstate_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R5_40 <- fread(file_name)
epicenter_biasstate_S75_R5_40 <- data.frame(epicenter_biasstate_S75_R5_40)[-1]

epicenter_biasstate_S75_R5_40$location <- 'epicenter'
epicenter_biasstate_S75_R5_40$detection <- 0.75
epicenter_biasstate_S75_R5_40$eradication <- 0.5
epicenter_biasstate_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R5_40b <- fread(file_name)
epicenter_biasstate_S75_R5_40b <- data.frame(epicenter_biasstate_S75_R5_40b)[-1]

epicenter_biasstate_S75_R5_40b$location <- 'epicenter'
epicenter_biasstate_S75_R5_40b$detection <- 0.75
epicenter_biasstate_S75_R5_40b$eradication <- 0.5
epicenter_biasstate_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R75_40 <- fread(file_name)
epicenter_biasstate_S75_R75_40 <- data.frame(epicenter_biasstate_S75_R75_40)[-1]

epicenter_biasstate_S75_R75_40$location <- 'epicenter'
epicenter_biasstate_S75_R75_40$detection <- 0.75
epicenter_biasstate_S75_R75_40$eradication <- 0.75
epicenter_biasstate_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R75_40b <- fread(file_name)
epicenter_biasstate_S75_R75_40b <- data.frame(epicenter_biasstate_S75_R75_40b)[-1]

epicenter_biasstate_S75_R75_40b$location <- 'epicenter'
epicenter_biasstate_S75_R75_40b$detection <- 0.75
epicenter_biasstate_S75_R75_40b$eradication <- 0.75
epicenter_biasstate_S75_R75_40b$budget <- 40

#--- Combine bias_states ---#
bias_state_40 <- rbind(hsb_biasstate_S25_R5_40,hsb_biasstate_S25_R5_40b,
                       hsb_biasstate_S25_R75_40,hsb_biasstate_S25_R75_40b,
                       hsb_biasstate_S5_R5_40,hsb_biasstate_S5_R5_40b,
                       hsb_biasstate_S5_R75_40,hsb_biasstate_S5_R75_40b,
                       hsb_biasstate_S75_R5_40,hsb_biasstate_S75_R5_40b,
                       hsb_biasstate_S75_R75_40,hsb_biasstate_S75_R75_40b,
                       linear_biasstate_S25_R5_40,linear_biasstate_S25_R5_40b,
                       linear_biasstate_S25_R75_40,linear_biasstate_S25_R75_40b,
                       linear_biasstate_S5_R5_40,linear_biasstate_S5_R5_40b,
                       linear_biasstate_S5_R75_40,linear_biasstate_S5_R75_40b,
                       linear_biasstate_S75_R5_40,linear_biasstate_S75_R5_40b,
                       linear_biasstate_S75_R75_40,linear_biasstate_S75_R75_40b,
                       epicenter_biasstate_S25_R5_40,epicenter_biasstate_S25_R5_40b,
                       epicenter_biasstate_S25_R75_40,epicenter_biasstate_S25_R75_40b,
                       epicenter_biasstate_S5_R5_40,epicenter_biasstate_S5_R5_40b,
                       epicenter_biasstate_S5_R75_40,epicenter_biasstate_S5_R75_40b,
                       epicenter_biasstate_S75_R5_40,epicenter_biasstate_S75_R5_40b,
                       epicenter_biasstate_S75_R75_40,epicenter_biasstate_S75_R75_40b)


#-- Combine Bias --#
bias_state <- rbind(bias_state_40)

##### results ####
bias_state$rates <- paste0('(p = )', bias_state$detection, ',  \u03F5 = ', bias_state$eradication)
bias_state$rates2 <- paste0('(', bias_state$detection, ', ', bias_state$eradication, ")")
bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication)

budget40_biasstate <- bias_state %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))


budget40_biasstate

#### Bias params ####
##### hstatebins #####
#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_40 <- fread(file_name)
hsb_biasparam_S25_R5_40 <- data.frame(hsb_biasparam_S25_R5_40)[-1]

hsb_biasparam_S25_R5_40$location <- 'hstatebins'
hsb_biasparam_S25_R5_40$detection <- 0.25
hsb_biasparam_S25_R5_40$eradication <- 0.5
hsb_biasparam_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_40b <- fread(file_name)
hsb_biasparam_S25_R5_40b <- data.frame(hsb_biasparam_S25_R5_40b)[-1]

hsb_biasparam_S25_R5_40b$location <- 'hstatebins'
hsb_biasparam_S25_R5_40b$detection <- 0.25
hsb_biasparam_S25_R5_40b$eradication <- 0.5
hsb_biasparam_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_40 <- fread(file_name)
hsb_biasparam_S25_R75_40 <- data.frame(hsb_biasparam_S25_R75_40)[-1]

hsb_biasparam_S25_R75_40$location <- 'hstatebins'
hsb_biasparam_S25_R75_40$detection <- 0.25
hsb_biasparam_S25_R75_40$eradication <- 0.75
hsb_biasparam_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_40b <- fread(file_name)
hsb_biasparam_S25_R75_40b <- data.frame(hsb_biasparam_S25_R75_40b)[-1]

hsb_biasparam_S25_R75_40b$location <- 'hstatebins'
hsb_biasparam_S25_R75_40b$detection <- 0.25
hsb_biasparam_S25_R75_40b$eradication <- 0.75
hsb_biasparam_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_40 <- fread(file_name)
hsb_biasparam_S5_R5_40 <- data.frame(hsb_biasparam_S5_R5_40)[-1]

hsb_biasparam_S5_R5_40$location <- 'hstatebins'
hsb_biasparam_S5_R5_40$detection <- 0.5
hsb_biasparam_S5_R5_40$eradication <- 0.5
hsb_biasparam_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_40b <- fread(file_name)
hsb_biasparam_S5_R5_40b <- data.frame(hsb_biasparam_S5_R5_40b)[-1]

hsb_biasparam_S5_R5_40b$location <- 'hstatebins'
hsb_biasparam_S5_R5_40b$detection <- 0.5
hsb_biasparam_S5_R5_40b$eradication <- 0.5
hsb_biasparam_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_40 <- fread(file_name)
hsb_biasparam_S5_R75_40 <- data.frame(hsb_biasparam_S5_R75_40)[-1]

hsb_biasparam_S5_R75_40$location <- 'hstatebins'
hsb_biasparam_S5_R75_40$detection <- 0.5
hsb_biasparam_S5_R75_40$eradication <- 0.75
hsb_biasparam_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_40b <- fread(file_name)
hsb_biasparam_S5_R75_40b <- data.frame(hsb_biasparam_S5_R75_40b)[-1]

hsb_biasparam_S5_R75_40b$location <- 'hstatebins'
hsb_biasparam_S5_R75_40b$detection <- 0.5
hsb_biasparam_S5_R75_40b$eradication <- 0.75
hsb_biasparam_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_40 <- fread(file_name)
hsb_biasparam_S75_R5_40 <- data.frame(hsb_biasparam_S75_R5_40)[-1]

hsb_biasparam_S75_R5_40$location <- 'hstatebins'
hsb_biasparam_S75_R5_40$detection <- 0.75
hsb_biasparam_S75_R5_40$eradication <- 0.5
hsb_biasparam_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_40b <- fread(file_name)
hsb_biasparam_S75_R5_40b <- data.frame(hsb_biasparam_S75_R5_40b)[-1]

hsb_biasparam_S75_R5_40b$location <- 'hstatebins'
hsb_biasparam_S75_R5_40b$detection <- 0.75
hsb_biasparam_S75_R5_40b$eradication <- 0.5
hsb_biasparam_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_40 <- fread(file_name)
hsb_biasparam_S75_R75_40 <- data.frame(hsb_biasparam_S75_R75_40)[-1]

hsb_biasparam_S75_R75_40$location <- 'hstatebins'
hsb_biasparam_S75_R75_40$detection <- 0.75
hsb_biasparam_S75_R75_40$eradication <- 0.75
hsb_biasparam_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_40b <- fread(file_name)
hsb_biasparam_S75_R75_40b <- data.frame(hsb_biasparam_S75_R75_40b)[-1]

hsb_biasparam_S75_R75_40b$location <- 'hstatebins'
hsb_biasparam_S75_R75_40b$detection <- 0.75
hsb_biasparam_S75_R75_40b$eradication <- 0.75
hsb_biasparam_S75_R75_40b$budget <- 40

##### linear #####
#----- linear -----#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_40 <- fread(file_name)
linear_biasparam_S25_R5_40 <- data.frame(linear_biasparam_S25_R5_40)[-1]

linear_biasparam_S25_R5_40$location <- 'linear'
linear_biasparam_S25_R5_40$detection <- 0.25
linear_biasparam_S25_R5_40$eradication <- 0.5
linear_biasparam_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_40b <- fread(file_name)
linear_biasparam_S25_R5_40b <- data.frame(linear_biasparam_S25_R5_40b)[-1]

linear_biasparam_S25_R5_40b$location <- 'linear'
linear_biasparam_S25_R5_40b$detection <- 0.25
linear_biasparam_S25_R5_40b$eradication <- 0.5
linear_biasparam_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_40 <- fread(file_name)
linear_biasparam_S25_R75_40 <- data.frame(linear_biasparam_S25_R75_40)[-1]

linear_biasparam_S25_R75_40$location <- 'linear'
linear_biasparam_S25_R75_40$detection <- 0.25
linear_biasparam_S25_R75_40$eradication <- 0.75
linear_biasparam_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_40b <- fread(file_name)
linear_biasparam_S25_R75_40b <- data.frame(linear_biasparam_S25_R75_40b)[-1]

linear_biasparam_S25_R75_40b$location <- 'linear'
linear_biasparam_S25_R75_40b$detection <- 0.25
linear_biasparam_S25_R75_40b$eradication <- 0.75
linear_biasparam_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_40 <- fread(file_name)
linear_biasparam_S5_R5_40 <- data.frame(linear_biasparam_S5_R5_40)[-1]

linear_biasparam_S5_R5_40$location <- 'linear'
linear_biasparam_S5_R5_40$detection <- 0.5
linear_biasparam_S5_R5_40$eradication <- 0.5
linear_biasparam_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_40b <- fread(file_name)
linear_biasparam_S5_R5_40b <- data.frame(linear_biasparam_S5_R5_40b)[-1]

linear_biasparam_S5_R5_40b$location <- 'linear'
linear_biasparam_S5_R5_40b$detection <- 0.5
linear_biasparam_S5_R5_40b$eradication <- 0.5
linear_biasparam_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_40 <- fread(file_name)
linear_biasparam_S5_R75_40 <- data.frame(linear_biasparam_S5_R75_40)[-1]

linear_biasparam_S5_R75_40$location <- 'linear'
linear_biasparam_S5_R75_40$detection <- 0.5
linear_biasparam_S5_R75_40$eradication <- 0.75
linear_biasparam_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_40b <- fread(file_name)
linear_biasparam_S5_R75_40b <- data.frame(linear_biasparam_S5_R75_40b)[-1]

linear_biasparam_S5_R75_40b$location <- 'linear'
linear_biasparam_S5_R75_40b$detection <- 0.5
linear_biasparam_S5_R75_40b$eradication <- 0.75
linear_biasparam_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_40 <- fread(file_name)
linear_biasparam_S75_R5_40 <- data.frame(linear_biasparam_S75_R5_40)[-1]

linear_biasparam_S75_R5_40$location <- 'linear'
linear_biasparam_S75_R5_40$detection <- 0.75
linear_biasparam_S75_R5_40$eradication <- 0.5
linear_biasparam_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_40b <- fread(file_name)
linear_biasparam_S75_R5_40b <- data.frame(linear_biasparam_S75_R5_40b)[-1]

linear_biasparam_S75_R5_40b$location <- 'linear'
linear_biasparam_S75_R5_40b$detection <- 0.75
linear_biasparam_S75_R5_40b$eradication <- 0.5
linear_biasparam_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_40 <- fread(file_name)
linear_biasparam_S75_R75_40 <- data.frame(linear_biasparam_S75_R75_40)[-1]

linear_biasparam_S75_R75_40$location <- 'linear'
linear_biasparam_S75_R75_40$detection <- 0.75
linear_biasparam_S75_R75_40$eradication <- 0.75
linear_biasparam_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_40b <- fread(file_name)
linear_biasparam_S75_R75_40b <- data.frame(linear_biasparam_S75_R75_40b)[-1]

linear_biasparam_S75_R75_40b$location <- 'linear'
linear_biasparam_S75_R75_40b$detection <- 0.75
linear_biasparam_S75_R75_40b$eradication <- 0.75
linear_biasparam_S75_R75_40b$budget <- 40

##### epicenter #####
#----- epicenter -----#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R5_40 <- fread(file_name)
epicenter_biasparam_S25_R5_40 <- data.frame(epicenter_biasparam_S25_R5_40)[-1]

epicenter_biasparam_S25_R5_40$location <- 'epicenter'
epicenter_biasparam_S25_R5_40$detection <- 0.25
epicenter_biasparam_S25_R5_40$eradication <- 0.5
epicenter_biasparam_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R5_40b <- fread(file_name)
epicenter_biasparam_S25_R5_40b <- data.frame(epicenter_biasparam_S25_R5_40b)[-1]

epicenter_biasparam_S25_R5_40b$location <- 'epicenter'
epicenter_biasparam_S25_R5_40b$detection <- 0.25
epicenter_biasparam_S25_R5_40b$eradication <- 0.5
epicenter_biasparam_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R75_40 <- fread(file_name)
epicenter_biasparam_S25_R75_40 <- data.frame(epicenter_biasparam_S25_R75_40)[-1]

epicenter_biasparam_S25_R75_40$location <- 'epicenter'
epicenter_biasparam_S25_R75_40$detection <- 0.25
epicenter_biasparam_S25_R75_40$eradication <- 0.75
epicenter_biasparam_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R75_40b <- fread(file_name)
epicenter_biasparam_S25_R75_40b <- data.frame(epicenter_biasparam_S25_R75_40b)[-1]

epicenter_biasparam_S25_R75_40b$location <- 'epicenter'
epicenter_biasparam_S25_R75_40b$detection <- 0.25
epicenter_biasparam_S25_R75_40b$eradication <- 0.75
epicenter_biasparam_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R5_40 <- fread(file_name)
epicenter_biasparam_S5_R5_40 <- data.frame(epicenter_biasparam_S5_R5_40)[-1]

epicenter_biasparam_S5_R5_40$location <- 'epicenter'
epicenter_biasparam_S5_R5_40$detection <- 0.5
epicenter_biasparam_S5_R5_40$eradication <- 0.5
epicenter_biasparam_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R5_40b <- fread(file_name)
epicenter_biasparam_S5_R5_40b <- data.frame(epicenter_biasparam_S5_R5_40b)[-1]

epicenter_biasparam_S5_R5_40b$location <- 'epicenter'
epicenter_biasparam_S5_R5_40b$detection <- 0.5
epicenter_biasparam_S5_R5_40b$eradication <- 0.5
epicenter_biasparam_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R75_40 <- fread(file_name)
epicenter_biasparam_S5_R75_40 <- data.frame(epicenter_biasparam_S5_R75_40)[-1]

epicenter_biasparam_S5_R75_40$location <- 'epicenter'
epicenter_biasparam_S5_R75_40$detection <- 0.5
epicenter_biasparam_S5_R75_40$eradication <- 0.75
epicenter_biasparam_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R75_40b <- fread(file_name)
epicenter_biasparam_S5_R75_40b <- data.frame(epicenter_biasparam_S5_R75_40b)[-1]

epicenter_biasparam_S5_R75_40b$location <- 'epicenter'
epicenter_biasparam_S5_R75_40b$detection <- 0.5
epicenter_biasparam_S5_R75_40b$eradication <- 0.75
epicenter_biasparam_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R5_40 <- fread(file_name)
epicenter_biasparam_S75_R5_40 <- data.frame(epicenter_biasparam_S75_R5_40)[-1]

epicenter_biasparam_S75_R5_40$location <- 'epicenter'
epicenter_biasparam_S75_R5_40$detection <- 0.75
epicenter_biasparam_S75_R5_40$eradication <- 0.5
epicenter_biasparam_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R5_40b <- fread(file_name)
epicenter_biasparam_S75_R5_40b <- data.frame(epicenter_biasparam_S75_R5_40b)[-1]

epicenter_biasparam_S75_R5_40b$location <- 'epicenter'
epicenter_biasparam_S75_R5_40b$detection <- 0.75
epicenter_biasparam_S75_R5_40b$eradication <- 0.5
epicenter_biasparam_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R75_40 <- fread(file_name)
epicenter_biasparam_S75_R75_40 <- data.frame(epicenter_biasparam_S75_R75_40)[-1]

epicenter_biasparam_S75_R75_40$location <- 'epicenter'
epicenter_biasparam_S75_R75_40$detection <- 0.75
epicenter_biasparam_S75_R75_40$eradication <- 0.75
epicenter_biasparam_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R75_40b <- fread(file_name)
epicenter_biasparam_S75_R75_40b <- data.frame(epicenter_biasparam_S75_R75_40b)[-1]

epicenter_biasparam_S75_R75_40b$location <- 'epicenter'
epicenter_biasparam_S75_R75_40b$detection <- 0.75
epicenter_biasparam_S75_R75_40b$eradication <- 0.75
epicenter_biasparam_S75_R75_40b$budget <- 40

#--- Combine bias_params ---#
bias_param_40 <- rbind(hsb_biasparam_S25_R5_40,hsb_biasparam_S25_R5_40b,
                       hsb_biasparam_S25_R75_40,hsb_biasparam_S25_R75_40b,
                       hsb_biasparam_S5_R5_40,hsb_biasparam_S5_R5_40b,
                       hsb_biasparam_S5_R75_40,hsb_biasparam_S5_R75_40b,
                       hsb_biasparam_S75_R5_40,hsb_biasparam_S75_R5_40b,
                       hsb_biasparam_S75_R75_40,hsb_biasparam_S75_R75_40b,
                       linear_biasparam_S25_R5_40,linear_biasparam_S25_R5_40b,
                       linear_biasparam_S25_R75_40,linear_biasparam_S25_R75_40b,
                       linear_biasparam_S5_R5_40,linear_biasparam_S5_R5_40b,
                       linear_biasparam_S5_R75_40,linear_biasparam_S5_R75_40b,
                       linear_biasparam_S75_R5_40,linear_biasparam_S75_R5_40b,
                       linear_biasparam_S75_R75_40,linear_biasparam_S75_R75_40b,
                       epicenter_biasparam_S25_R5_40,epicenter_biasparam_S25_R5_40b,
                       epicenter_biasparam_S25_R75_40,epicenter_biasparam_S25_R75_40b,
                       epicenter_biasparam_S5_R5_40,epicenter_biasparam_S5_R5_40b,
                       epicenter_biasparam_S5_R75_40,epicenter_biasparam_S5_R75_40b,
                       epicenter_biasparam_S75_R5_40,epicenter_biasparam_S75_R5_40b,
                       epicenter_biasparam_S75_R75_40,epicenter_biasparam_S75_R75_40b)


#-- Combine bias --#
bias_params <- rbind(bias_param_40)

##### results -p ####
bias_params$rates <- paste0('(p = )', bias_params$detection, ',  \u03F5 = ', bias_params$eradication)
bias_params$rates2 <- paste0('(', bias_params$detection, ', ', bias_params$eradication, ")")
bias_params$loc2 <- paste0(bias_params$location, bias_params$detection, bias_params$eradication)

bias_param_detect  <- bias_params %>% filter(param %in% c("B0.p.h", "B0.p.h", "B1.p.l", "B1.p.h"))

budget40_bias_param_detect <- bias_param_detect %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget40_bias_param_detect


##### results -eps ####
bias_param_eps  <- bias_params %>% filter(param %in% c("B0.eps.h", "B0.eps.h", "B1.eps.l", "B1.eps.h"))

budget40_bias_param_eps <- bias_param_eps %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget40_bias_param_eps




#### Sites visit ####
#-- Budget = 40 --#
##### hstatebins #####
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40 <- fread(file_name)
sites_S25_R5_40 <- data.frame(sites_S25_R5_40)[-1]

sites_S25_R5_40$location <- 'hstatebins'
sites_S25_R5_40$detection <- 0.25
sites_S25_R5_40$eradication <- 0.5
sites_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40b <- fread(file_name)
sites_S25_R5_40b <- data.frame(sites_S25_R5_40b)[-1]

sites_S25_R5_40b$location <- 'hstatebins'
sites_S25_R5_40b$detection <- 0.25
sites_S25_R5_40b$eradication <- 0.5
sites_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40 <- fread(file_name)
sites_S25_R75_40 <- data.frame(sites_S25_R75_40)[-1]

sites_S25_R75_40$location <- 'hstatebins'
sites_S25_R75_40$detection <- 0.25
sites_S25_R75_40$eradication <- 0.75
sites_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40b <- fread(file_name)
sites_S25_R75_40b <- data.frame(sites_S25_R75_40b)[-1]

sites_S25_R75_40b$location <- 'hstatebins'
sites_S25_R75_40b$detection <- 0.25
sites_S25_R75_40b$eradication <- 0.75
sites_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40 <- fread(file_name)
sites_S5_R5_40 <- data.frame(sites_S5_R5_40)[-1]

sites_S5_R5_40$location <- 'hstatebins'
sites_S5_R5_40$detection <- 0.5
sites_S5_R5_40$eradication <- 0.5
sites_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40b <- fread(file_name)
sites_S5_R5_40b <- data.frame(sites_S5_R5_40b)[-1]

sites_S5_R5_40b$location <- 'hstatebins'
sites_S5_R5_40b$detection <- 0.5
sites_S5_R5_40b$eradication <- 0.5
sites_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40 <- fread(file_name)
sites_S5_R75_40 <- data.frame(sites_S5_R75_40)[-1]

sites_S5_R75_40$location <- 'hstatebins'
sites_S5_R75_40$detection <- 0.5
sites_S5_R75_40$eradication <- 0.75
sites_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40b <- fread(file_name)
sites_S5_R75_40b <- data.frame(sites_S5_R75_40b)[-1]

sites_S5_R75_40b$location <- 'hstatebins'
sites_S5_R75_40b$detection <- 0.5
sites_S5_R75_40b$eradication <- 0.75
sites_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40 <- fread(file_name)
sites_S75_R5_40 <- data.frame(sites_S75_R5_40)[-1]

sites_S75_R5_40$location <- 'hstatebins'
sites_S75_R5_40$detection <- 0.75
sites_S75_R5_40$eradication <- 0.5
sites_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40b <- fread(file_name)
sites_S75_R5_40b <- data.frame(sites_S75_R5_40b)[-1]

sites_S75_R5_40b$location <- 'hstatebins'
sites_S75_R5_40b$detection <- 0.75
sites_S75_R5_40b$eradication <- 0.5
sites_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40 <- fread(file_name)
sites_S75_R75_40 <- data.frame(sites_S75_R75_40)[-1]

sites_S75_R75_40$location <- 'hstatebins'
sites_S75_R75_40$detection <- 0.75
sites_S75_R75_40$eradication <- 0.75
sites_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40b <- fread(file_name)
sites_S75_R75_40b <- data.frame(sites_S75_R75_40b)[-1]

sites_S75_R75_40b$location <- 'hstatebins'
sites_S75_R75_40b$detection <- 0.75
sites_S75_R75_40b$eradication <- 0.75
sites_S75_R75_40b$budget <- 40

#--- Combine dists ---#
sites_40 <- rbind(sites_S25_R5_40,sites_S25_R5_40b,
                  sites_S25_R75_40,sites_S25_R75_40b,
                  sites_S5_R5_40,sites_S5_R5_40b,
                  sites_S5_R75_40,sites_S5_R75_40b,
                  sites_S75_R5_40,sites_S75_R5_40b,
                  sites_S75_R75_40,sites_S5_R75_40b)

sites_hsd <- rbind(sites_40)

##### linear #####
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40 <- fread(file_name)
sites_S25_R5_40 <- data.frame(sites_S25_R5_40)[-1]

sites_S25_R5_40$location <- 'linear'
sites_S25_R5_40$detection <- 0.25
sites_S25_R5_40$eradication <- 0.5
sites_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40b <- fread(file_name)
sites_S25_R5_40b <- data.frame(sites_S25_R5_40b)[-1]

sites_S25_R5_40b$location <- 'linear'
sites_S25_R5_40b$detection <- 0.25
sites_S25_R5_40b$eradication <- 0.5
sites_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40 <- fread(file_name)
sites_S25_R75_40 <- data.frame(sites_S25_R75_40)[-1]

sites_S25_R75_40$location <- 'linear'
sites_S25_R75_40$detection <- 0.25
sites_S25_R75_40$eradication <- 0.75
sites_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40b <- fread(file_name)
sites_S25_R75_40b <- data.frame(sites_S25_R75_40b)[-1]

sites_S25_R75_40b$location <- 'linear'
sites_S25_R75_40b$detection <- 0.25
sites_S25_R75_40b$eradication <- 0.75
sites_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40 <- fread(file_name)
sites_S5_R5_40 <- data.frame(sites_S5_R5_40)[-1]

sites_S5_R5_40$location <- 'linear'
sites_S5_R5_40$detection <- 0.5
sites_S5_R5_40$eradication <- 0.5
sites_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40b <- fread(file_name)
sites_S5_R5_40b <- data.frame(sites_S5_R5_40b)[-1]

sites_S5_R5_40b$location <- 'linear'
sites_S5_R5_40b$detection <- 0.5
sites_S5_R5_40b$eradication <- 0.5
sites_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40 <- fread(file_name)
sites_S5_R75_40 <- data.frame(sites_S5_R75_40)[-1]

sites_S5_R75_40$location <- 'linear'
sites_S5_R75_40$detection <- 0.5
sites_S5_R75_40$eradication <- 0.75
sites_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40b <- fread(file_name)
sites_S5_R75_40b <- data.frame(sites_S5_R75_40b)[-1]

sites_S5_R75_40b$location <- 'linear'
sites_S5_R75_40b$detection <- 0.5
sites_S5_R75_40b$eradication <- 0.75
sites_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40 <- fread(file_name)
sites_S75_R5_40 <- data.frame(sites_S75_R5_40)[-1]

sites_S75_R5_40$location <- 'linear'
sites_S75_R5_40$detection <- 0.75
sites_S75_R5_40$eradication <- 0.5
sites_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40b <- fread(file_name)
sites_S75_R5_40b <- data.frame(sites_S75_R5_40b)[-1]

sites_S75_R5_40b$location <- 'linear'
sites_S75_R5_40b$detection <- 0.75
sites_S75_R5_40b$eradication <- 0.5
sites_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40 <- fread(file_name)
sites_S75_R75_40 <- data.frame(sites_S75_R75_40)[-1]

sites_S75_R75_40$location <- 'linear'
sites_S75_R75_40$detection <- 0.75
sites_S75_R75_40$eradication <- 0.75
sites_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40b <- fread(file_name)
sites_S75_R75_40b <- data.frame(sites_S75_R75_40b)[-1]

sites_S75_R75_40b$location <- 'linear'
sites_S75_R75_40b$detection <- 0.75
sites_S75_R75_40b$eradication <- 0.75
sites_S75_R75_40b$budget <- 40

#--- Combine dists ---#
sites_40 <- rbind(sites_S25_R5_40,sites_S25_R5_40b,
                  sites_S25_R75_40,sites_S25_R75_40b,
                  sites_S5_R5_40,sites_S5_R5_40b,
                  sites_S5_R75_40,sites_S5_R75_40b,
                  sites_S75_R5_40,sites_S75_R5_40b,
                  sites_S75_R75_40,sites_S5_R75_40b)

sites_linear <- rbind(sites_40)

##### epicenter #####
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40 <- fread(file_name)
sites_S25_R5_40 <- data.frame(sites_S25_R5_40)[-1]

sites_S25_R5_40$location <- 'epicenter'
sites_S25_R5_40$detection <- 0.25
sites_S25_R5_40$eradication <- 0.5
sites_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40b <- fread(file_name)
sites_S25_R5_40b <- data.frame(sites_S25_R5_40b)[-1]

sites_S25_R5_40b$location <- 'epicenter'
sites_S25_R5_40b$detection <- 0.25
sites_S25_R5_40b$eradication <- 0.5
sites_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40 <- fread(file_name)
sites_S25_R75_40 <- data.frame(sites_S25_R75_40)[-1]

sites_S25_R75_40$location <- 'epicenter'
sites_S25_R75_40$detection <- 0.25
sites_S25_R75_40$eradication <- 0.75
sites_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40b <- fread(file_name)
sites_S25_R75_40b <- data.frame(sites_S25_R75_40b)[-1]

sites_S25_R75_40b$location <- 'epicenter'
sites_S25_R75_40b$detection <- 0.25
sites_S25_R75_40b$eradication <- 0.75
sites_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40 <- fread(file_name)
sites_S5_R5_40 <- data.frame(sites_S5_R5_40)[-1]

sites_S5_R5_40$location <- 'epicenter'
sites_S5_R5_40$detection <- 0.5
sites_S5_R5_40$eradication <- 0.5
sites_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40b <- fread(file_name)
sites_S5_R5_40b <- data.frame(sites_S5_R5_40b)[-1]

sites_S5_R5_40b$location <- 'epicenter'
sites_S5_R5_40b$detection <- 0.5
sites_S5_R5_40b$eradication <- 0.5
sites_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40 <- fread(file_name)
sites_S5_R75_40 <- data.frame(sites_S5_R75_40)[-1]

sites_S5_R75_40$location <- 'epicenter'
sites_S5_R75_40$detection <- 0.5
sites_S5_R75_40$eradication <- 0.75
sites_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40b <- fread(file_name)
sites_S5_R75_40b <- data.frame(sites_S5_R75_40b)[-1]

sites_S5_R75_40b$location <- 'epicenter'
sites_S5_R75_40b$detection <- 0.5
sites_S5_R75_40b$eradication <- 0.75
sites_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40 <- fread(file_name)
sites_S75_R5_40 <- data.frame(sites_S75_R5_40)[-1]

sites_S75_R5_40$location <- 'epicenter'
sites_S75_R5_40$detection <- 0.75
sites_S75_R5_40$eradication <- 0.5
sites_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40b <- fread(file_name)
sites_S75_R5_40b <- data.frame(sites_S75_R5_40b)[-1]

sites_S75_R5_40b$location <- 'epicenter'
sites_S75_R5_40b$detection <- 0.75
sites_S75_R5_40b$eradication <- 0.5
sites_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40 <- fread(file_name)
sites_S75_R75_40 <- data.frame(sites_S75_R75_40)[-1]

sites_S75_R75_40$location <- 'epicenter'
sites_S75_R75_40$detection <- 0.75
sites_S75_R75_40$eradication <- 0.75
sites_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40b <- fread(file_name)
sites_S75_R75_40b <- data.frame(sites_S75_R75_40b)[-1]

sites_S75_R75_40b$location <- 'epicenter'
sites_S75_R75_40b$detection <- 0.75
sites_S75_R75_40b$eradication <- 0.75
sites_S75_R75_40b$budget <- 40

#--- Combine dists ---#
sites_40 <- rbind(sites_S25_R5_40,sites_S25_R5_40b,
                  sites_S25_R75_40,sites_S25_R75_40b,
                  sites_S5_R5_40,sites_S5_R5_40b,
                  sites_S5_R75_40,sites_S5_R75_40b,
                  sites_S75_R5_40,sites_S75_R5_40b,
                  sites_S75_R75_40,sites_S5_R75_40b)

sites_epicenter <- rbind(sites_40)

sites <- rbind(sites_hsd, sites_linear, sites_epicenter)

sites_visit <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                         data = as.data.frame(sites), 
                         FUN = sum)

sites_visit <- sites_visit %>% filter(week < 5)
sites_visit$visit <- sites_visit$visit/40
sites_visit$visit[sites_visit$visit > 1] <- 1

#### PLOTS ####
cols <- brewer.pal(12, "Paired") 
colors <- c(cols[1:4], cols[9:10])

colors2 <- c('deeppink3','orange2' ,'grey50')

##### Suppression #####

finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication)

finstate_truth %>% 
  ggplot(aes(x = loc2, y = state, fill = rates2, color = location,
             group = interaction(location, rates2)))+
  geom_boxplot() +
  geom_hline(yintercept = 0.93425, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates2)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "hstatebins0.750.5",
    "linear0.750.5", 
    'epicenter0.750.5'),
    labels=c(
      
      "hstatebins0.750.5" = "High invasion",
      "linear0.750.5" = "Linear",
      "epicenter0.750.5" = "Epicenter"))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c('High invasion', 'Linear', 'Epicenter') )+
  
  xlab("Site prioritization")+
  ylab("Average final invasion state")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget, nrow = 3, labeller = label_both)


##### Containment #####
fininv_truth %>% 
  ggplot(aes(x = loc2, y = inv, fill = rates2, color =Location,
             group = interaction(Location, rates2)))+
  geom_boxplot() +
  geom_hline(yintercept = 0.301625, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(Location, rates)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "hstatebins0.750.5",
    "linear0.750.5"),
    labels=c(
      
      "hstatebins0.750.5" = "",
      "linear0.750.5" = ""))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Prioritization",
                     values = colors2, 
                     labels = c( 'High invasion', 'Linear') )+
  
  xlab("Site prioritization")+
  ylab("Average final % invaded")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        #strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget, nrow = 3, labeller = label_both)

#####Bias state time ####
bias_state_years <- bias_state %>%
  group_by(location, year, rates, rates2, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_state_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_state_years$Prioritization[bias_state_years$Prioritization == "hstatebins"] <- 'High invasion'
bias_state_years$Prioritization[bias_state_years$Prioritization == "linear"] <- 'Linear'

ggplot(bias_state_years, aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates2))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8,10)) +
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  ylab("State relative bias ")+
  xlab("Year")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget + Prioritization, nrow = 3, labeller = label_both)

##### Bias param time -p #####
bias_param_detect$rates2 <- paste0('(', bias_param_detect$detection, ', ', bias_param_detect$eradication, ")")

bias_param_detect_years <- bias_param_detect %>%
  group_by(location, year, rates, rates2, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_param_detect_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'hstatebins'] <- 'High invasion'
bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'linear'] <- 'Linear'

ggplot(bias_param_detect_years, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates2))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8, 10)) +
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  ylab(paste0('p parameters relative bias'))+
  xlab("Year")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget + Prioritization, nrow = 3, labeller = label_both, scales = "free")

##### Bias param time -eps #####
bias_param_eps$rates2 <- paste0('(', bias_param_eps$detection, ', ', bias_param_eps$eradication, ")")

bias_param_eps_years <- bias_param_eps %>%
  group_by(location, year, rates, rates2, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_param_eps_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_param_eps_years$Prioritization[bias_param_eps_years$Prioritization == 'hstatebins'] <- 'High invasion'
bias_param_eps_years$Prioritization[bias_param_eps_years$Prioritization == 'linear'] <- 'Linear'

ggplot(bias_param_eps_years, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates2))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8, 10)) +
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  ylab(paste0('\u03F5 parameters relative bias'))+
  xlab("Year")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget + Prioritization, nrow = 3, labeller = label_both, scales = "free")


##### Sites visited #####
total_visit <- sites_visit
total_visit$rates <- paste0('(p = ', total_visit$detection, ',  \u03F5 = ', total_visit$eradication)

total_visit$rates2 <- paste0('(', total_visit$detection, ', ', total_visit$eradication, ")")

total_visit <- total_visit %>% filter(detection < 1 & detection > 0)

total_visit$loc2 <- paste0(total_visit$location, total_visit$detection, total_visit$eradication)

total_visit %>% 
  ggplot(aes(x = loc2, y = visit, fill = rates2, color = location,
             group = interaction(location, rates)))+
  geom_boxplot() +
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates2)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "hstatebins0.750.5",
    "linear0.750.5",
    "epicenter0.750.5"),
    labels=c(
      
      "hstatebins0.750.5" = "High invasion",
      "linear0.750.5" = "Linear",
      "epicenter0.750.5" = "Epicenter"))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c('High invasion', 'Linear', 'Epicenter') )+
  xlab("Site prioritization")+
  ylab("% of sites visited each week")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget, nrow = 3)
