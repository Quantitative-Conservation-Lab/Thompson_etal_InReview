library(tidyverse)
library(here)
library(plyr)
library(data.table)
library(RColorBrewer) 

#### States truth ####
##### hstatebins #####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20 <- fread(file_name)
state_truth_S25_R5_20 <- data.frame(state_truth_S25_R5_20)[-1]

state_truth_S25_R5_20$location <- 'hstatebins'
state_truth_S25_R5_20$detection <- 0.25
state_truth_S25_R5_20$eradication <- 0.5
state_truth_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20b <- fread(file_name)
state_truth_S25_R5_20b <- data.frame(state_truth_S25_R5_20b)[-1]

state_truth_S25_R5_20b$location <- 'hstatebins'
state_truth_S25_R5_20b$detection <- 0.25
state_truth_S25_R5_20b$eradication <- 0.5
state_truth_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20 <- fread(file_name)
state_truth_S25_R75_20 <- data.frame(state_truth_S25_R75_20)[-1]

state_truth_S25_R75_20$location <- 'hstatebins'
state_truth_S25_R75_20$detection <- 0.25
state_truth_S25_R75_20$eradication <- 0.75
state_truth_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20b <- fread(file_name)
state_truth_S25_R75_20b <- data.frame(state_truth_S25_R75_20b)[-1]

state_truth_S25_R75_20b$location <- 'hstatebins'
state_truth_S25_R75_20b$detection <- 0.25
state_truth_S25_R75_20b$eradication <- 0.75
state_truth_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20 <- fread(file_name)
state_truth_S5_R5_20 <- data.frame(state_truth_S5_R5_20)[-1]

state_truth_S5_R5_20$location <- 'hstatebins'
state_truth_S5_R5_20$detection <- 0.5
state_truth_S5_R5_20$eradication <- 0.5
state_truth_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20b <- fread(file_name)
state_truth_S5_R5_20b <- data.frame(state_truth_S5_R5_20b)[-1]

state_truth_S5_R5_20b$location <- 'hstatebins'
state_truth_S5_R5_20b$detection <- 0.5
state_truth_S5_R5_20b$eradication <- 0.5
state_truth_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20 <- fread(file_name)
state_truth_S5_R75_20 <- data.frame(state_truth_S5_R75_20)[-1]

state_truth_S5_R75_20$location <- 'hstatebins'
state_truth_S5_R75_20$detection <- 0.5
state_truth_S5_R75_20$eradication <- 0.75
state_truth_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20b <- fread(file_name)
state_truth_S5_R75_20b <- data.frame(state_truth_S5_R75_20b)[-1]

state_truth_S5_R75_20b$location <- 'hstatebins'
state_truth_S5_R75_20b$detection <- 0.5
state_truth_S5_R75_20b$eradication <- 0.75
state_truth_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20 <- fread(file_name)
state_truth_S75_R5_20 <- data.frame(state_truth_S75_R5_20)[-1]

state_truth_S75_R5_20$location <- 'hstatebins'
state_truth_S75_R5_20$detection <- 0.75
state_truth_S75_R5_20$eradication <- 0.5
state_truth_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20b <- fread(file_name)
state_truth_S75_R5_20b <- data.frame(state_truth_S75_R5_20b)[-1]

state_truth_S75_R5_20b$location <- 'hstatebins'
state_truth_S75_R5_20b$detection <- 0.75
state_truth_S75_R5_20b$eradication <- 0.5
state_truth_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20 <- fread(file_name)
state_truth_S75_R75_20 <- data.frame(state_truth_S75_R75_20)[-1]

state_truth_S75_R75_20$location <- 'hstatebins'
state_truth_S75_R75_20$detection <- 0.75
state_truth_S75_R75_20$eradication <- 0.75
state_truth_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20b <- fread(file_name)
state_truth_S75_R75_20b <- data.frame(state_truth_S75_R75_20b)[-1]

state_truth_S75_R75_20b$location <- 'hstatebins'
state_truth_S75_R75_20b$detection <- 0.75
state_truth_S75_R75_20b$eradication <- 0.75
state_truth_S75_R75_20b$budget <- 20

#--- Combine state_truths ---#
state_truth_20 <- rbind(state_truth_S25_R5_20,state_truth_S25_R5_20b,
                        state_truth_S25_R75_20,state_truth_S25_R75_20b,
                        state_truth_S5_R5_20,state_truth_S5_R5_20b,
                  state_truth_S5_R75_20,state_truth_S5_R75_20b,
                  state_truth_S75_R5_20,state_truth_S75_R5_20b,
                  state_truth_S75_R75_20,state_truth_S5_R75_20b)

state_truth_hstatebins <- rbind(state_truth_20)

##### linear #####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20 <- fread(file_name)
state_truth_S25_R5_20 <- data.frame(state_truth_S25_R5_20)[-1]

state_truth_S25_R5_20$location <- 'linear'
state_truth_S25_R5_20$detection <- 0.25
state_truth_S25_R5_20$eradication <- 0.5
state_truth_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20b <- fread(file_name)
state_truth_S25_R5_20b <- data.frame(state_truth_S25_R5_20b)[-1]

state_truth_S25_R5_20b$location <- 'linear'
state_truth_S25_R5_20b$detection <- 0.25
state_truth_S25_R5_20b$eradication <- 0.5
state_truth_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20 <- fread(file_name)
state_truth_S25_R75_20 <- data.frame(state_truth_S25_R75_20)[-1]

state_truth_S25_R75_20$location <- 'linear'
state_truth_S25_R75_20$detection <- 0.25
state_truth_S25_R75_20$eradication <- 0.75
state_truth_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20b <- fread(file_name)
state_truth_S25_R75_20b <- data.frame(state_truth_S25_R75_20b)[-1]

state_truth_S25_R75_20b$location <- 'linear'
state_truth_S25_R75_20b$detection <- 0.25
state_truth_S25_R75_20b$eradication <- 0.75
state_truth_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20 <- fread(file_name)
state_truth_S5_R5_20 <- data.frame(state_truth_S5_R5_20)[-1]

state_truth_S5_R5_20$location <- 'linear'
state_truth_S5_R5_20$detection <- 0.5
state_truth_S5_R5_20$eradication <- 0.5
state_truth_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20b <- fread(file_name)
state_truth_S5_R5_20b <- data.frame(state_truth_S5_R5_20b)[-1]

state_truth_S5_R5_20b$location <- 'linear'
state_truth_S5_R5_20b$detection <- 0.5
state_truth_S5_R5_20b$eradication <- 0.5
state_truth_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20 <- fread(file_name)
state_truth_S5_R75_20 <- data.frame(state_truth_S5_R75_20)[-1]

state_truth_S5_R75_20$location <- 'linear'
state_truth_S5_R75_20$detection <- 0.5
state_truth_S5_R75_20$eradication <- 0.75
state_truth_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20b <- fread(file_name)
state_truth_S5_R75_20b <- data.frame(state_truth_S5_R75_20b)[-1]

state_truth_S5_R75_20b$location <- 'linear'
state_truth_S5_R75_20b$detection <- 0.5
state_truth_S5_R75_20b$eradication <- 0.75
state_truth_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20 <- fread(file_name)
state_truth_S75_R5_20 <- data.frame(state_truth_S75_R5_20)[-1]

state_truth_S75_R5_20$location <- 'linear'
state_truth_S75_R5_20$detection <- 0.75
state_truth_S75_R5_20$eradication <- 0.5
state_truth_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20b <- fread(file_name)
state_truth_S75_R5_20b <- data.frame(state_truth_S75_R5_20b)[-1]

state_truth_S75_R5_20b$location <- 'linear'
state_truth_S75_R5_20b$detection <- 0.75
state_truth_S75_R5_20b$eradication <- 0.5
state_truth_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20 <- fread(file_name)
state_truth_S75_R75_20 <- data.frame(state_truth_S75_R75_20)[-1]

state_truth_S75_R75_20$location <- 'linear'
state_truth_S75_R75_20$detection <- 0.75
state_truth_S75_R75_20$eradication <- 0.75
state_truth_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20b <- fread(file_name)
state_truth_S75_R75_20b <- data.frame(state_truth_S75_R75_20b)[-1]

state_truth_S75_R75_20b$location <- 'linear'
state_truth_S75_R75_20b$detection <- 0.75
state_truth_S75_R75_20b$eradication <- 0.75
state_truth_S75_R75_20b$budget <- 20

#--- Combine state_truths ---#
state_truth_20 <- rbind(state_truth_S25_R5_20,state_truth_S25_R5_20b,
                        state_truth_S25_R75_20,state_truth_S25_R75_20b,
                        state_truth_S5_R5_20,state_truth_S5_R5_20b,
                        state_truth_S5_R75_20,state_truth_S5_R75_20b,
                        state_truth_S75_R5_20,state_truth_S75_R5_20b,
                        state_truth_S75_R75_20,state_truth_S5_R75_20b)

state_truth_linear <- rbind(state_truth_20)


#### Combine ####
state_truth <- rbind(state_truth_hstatebins, state_truth_linear)
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

budget20_suppress <- finstate_truth %>% 
  filter(Budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(state),
            max_c = max(state))

budget20_suppress

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

budget20_contain <- fininv_truth %>% 
  filter(Budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv))

budget20_contain 

#### Bias state ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S25_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_20 <- fread(file_name)
hsb_biasstate_S25_R5_20 <- data.frame(hsb_biasstate_S25_R5_20)[-1]

hsb_biasstate_S25_R5_20$location <- 'hstatebins'
hsb_biasstate_S25_R5_20$detection <- 0.25
hsb_biasstate_S25_R5_20$eradication <- 0.5
hsb_biasstate_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S25_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_20b <- fread(file_name)
hsb_biasstate_S25_R5_20b <- data.frame(hsb_biasstate_S25_R5_20b)[-1]

hsb_biasstate_S25_R5_20b$location <- 'hstatebins'
hsb_biasstate_S25_R5_20b$detection <- 0.25
hsb_biasstate_S25_R5_20b$eradication <- 0.5
hsb_biasstate_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S25_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_20 <- fread(file_name)
hsb_biasstate_S25_R75_20 <- data.frame(hsb_biasstate_S25_R75_20)[-1]

hsb_biasstate_S25_R75_20$location <- 'hstatebins'
hsb_biasstate_S25_R75_20$detection <- 0.25
hsb_biasstate_S25_R75_20$eradication <- 0.75
hsb_biasstate_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S25_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_20b <- fread(file_name)
hsb_biasstate_S25_R75_20b <- data.frame(hsb_biasstate_S25_R75_20b)[-1]

hsb_biasstate_S25_R75_20b$location <- 'hstatebins'
hsb_biasstate_S25_R75_20b$detection <- 0.25
hsb_biasstate_S25_R75_20b$eradication <- 0.75
hsb_biasstate_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S5_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_20 <- fread(file_name)
hsb_biasstate_S5_R5_20 <- data.frame(hsb_biasstate_S5_R5_20)[-1]

hsb_biasstate_S5_R5_20$location <- 'hstatebins'
hsb_biasstate_S5_R5_20$detection <- 0.5
hsb_biasstate_S5_R5_20$eradication <- 0.5
hsb_biasstate_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S5_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_20b <- fread(file_name)
hsb_biasstate_S5_R5_20b <- data.frame(hsb_biasstate_S5_R5_20b)[-1]

hsb_biasstate_S5_R5_20b$location <- 'hstatebins'
hsb_biasstate_S5_R5_20b$detection <- 0.5
hsb_biasstate_S5_R5_20b$eradication <- 0.5
hsb_biasstate_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_20 <- fread(file_name)
hsb_biasstate_S5_R75_20 <- data.frame(hsb_biasstate_S5_R75_20)[-1]

hsb_biasstate_S5_R75_20$location <- 'hstatebins'
hsb_biasstate_S5_R75_20$detection <- 0.5
hsb_biasstate_S5_R75_20$eradication <- 0.75
hsb_biasstate_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_20b <- fread(file_name)
hsb_biasstate_S5_R75_20b <- data.frame(hsb_biasstate_S5_R75_20b)[-1]

hsb_biasstate_S5_R75_20b$location <- 'hstatebins'
hsb_biasstate_S5_R75_20b$detection <- 0.5
hsb_biasstate_S5_R75_20b$eradication <- 0.75
hsb_biasstate_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S75_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_20 <- fread(file_name)
hsb_biasstate_S75_R5_20 <- data.frame(hsb_biasstate_S75_R5_20)[-1]

hsb_biasstate_S75_R5_20$location <- 'hstatebins'
hsb_biasstate_S75_R5_20$detection <- 0.75
hsb_biasstate_S75_R5_20$eradication <- 0.5
hsb_biasstate_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S75_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_20b <- fread(file_name)
hsb_biasstate_S75_R5_20b <- data.frame(hsb_biasstate_S75_R5_20b)[-1]

hsb_biasstate_S75_R5_20b$location <- 'hstatebins'
hsb_biasstate_S75_R5_20b$detection <- 0.75
hsb_biasstate_S75_R5_20b$eradication <- 0.5
hsb_biasstate_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S75_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_20 <- fread(file_name)
hsb_biasstate_S75_R75_20 <- data.frame(hsb_biasstate_S75_R75_20)[-1]

hsb_biasstate_S75_R75_20$location <- 'hstatebins'
hsb_biasstate_S75_R75_20$detection <- 0.75
hsb_biasstate_S75_R75_20$eradication <- 0.75
hsb_biasstate_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S75_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_20b <- fread(file_name)
hsb_biasstate_S75_R75_20b <- data.frame(hsb_biasstate_S75_R75_20b)[-1]

hsb_biasstate_S75_R75_20b$location <- 'hstatebins'
hsb_biasstate_S75_R75_20b$detection <- 0.75
hsb_biasstate_S75_R75_20b$eradication <- 0.75
hsb_biasstate_S75_R75_20b$budget <- 20


#----- linear -----#
path <- 'E:\\Chapter3\\results\\budget20\\linear_S25_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_20 <- fread(file_name)
linear_biasstate_S25_R5_20 <- data.frame(linear_biasstate_S25_R5_20)[-1]

linear_biasstate_S25_R5_20$location <- 'linear'
linear_biasstate_S25_R5_20$detection <- 0.25
linear_biasstate_S25_R5_20$eradication <- 0.5
linear_biasstate_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S25_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_20b <- fread(file_name)
linear_biasstate_S25_R5_20b <- data.frame(linear_biasstate_S25_R5_20b)[-1]

linear_biasstate_S25_R5_20b$location <- 'linear'
linear_biasstate_S25_R5_20b$detection <- 0.25
linear_biasstate_S25_R5_20b$eradication <- 0.5
linear_biasstate_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\linear_S25_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_20 <- fread(file_name)
linear_biasstate_S25_R75_20 <- data.frame(linear_biasstate_S25_R75_20)[-1]

linear_biasstate_S25_R75_20$location <- 'linear'
linear_biasstate_S25_R75_20$detection <- 0.25
linear_biasstate_S25_R75_20$eradication <- 0.75
linear_biasstate_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S25_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_20b <- fread(file_name)
linear_biasstate_S25_R75_20b <- data.frame(linear_biasstate_S25_R75_20b)[-1]

linear_biasstate_S25_R75_20b$location <- 'linear'
linear_biasstate_S25_R75_20b$detection <- 0.25
linear_biasstate_S25_R75_20b$eradication <- 0.75
linear_biasstate_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\budget20\\linear_S5_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_20 <- fread(file_name)
linear_biasstate_S5_R5_20 <- data.frame(linear_biasstate_S5_R5_20)[-1]

linear_biasstate_S5_R5_20$location <- 'linear'
linear_biasstate_S5_R5_20$detection <- 0.5
linear_biasstate_S5_R5_20$eradication <- 0.5
linear_biasstate_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S5_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_20b <- fread(file_name)
linear_biasstate_S5_R5_20b <- data.frame(linear_biasstate_S5_R5_20b)[-1]

linear_biasstate_S5_R5_20b$location <- 'linear'
linear_biasstate_S5_R5_20b$detection <- 0.5
linear_biasstate_S5_R5_20b$eradication <- 0.5
linear_biasstate_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_20 <- fread(file_name)
linear_biasstate_S5_R75_20 <- data.frame(linear_biasstate_S5_R75_20)[-1]

linear_biasstate_S5_R75_20$location <- 'linear'
linear_biasstate_S5_R75_20$detection <- 0.5
linear_biasstate_S5_R75_20$eradication <- 0.75
linear_biasstate_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_20b <- fread(file_name)
linear_biasstate_S5_R75_20b <- data.frame(linear_biasstate_S5_R75_20b)[-1]

linear_biasstate_S5_R75_20b$location <- 'linear'
linear_biasstate_S5_R75_20b$detection <- 0.5
linear_biasstate_S5_R75_20b$eradication <- 0.75
linear_biasstate_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\budget20\\linear_S75_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_20 <- fread(file_name)
linear_biasstate_S75_R5_20 <- data.frame(linear_biasstate_S75_R5_20)[-1]

linear_biasstate_S75_R5_20$location <- 'linear'
linear_biasstate_S75_R5_20$detection <- 0.75
linear_biasstate_S75_R5_20$eradication <- 0.5
linear_biasstate_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S75_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_20b <- fread(file_name)
linear_biasstate_S75_R5_20b <- data.frame(linear_biasstate_S75_R5_20b)[-1]

linear_biasstate_S75_R5_20b$location <- 'linear'
linear_biasstate_S75_R5_20b$detection <- 0.75
linear_biasstate_S75_R5_20b$eradication <- 0.5
linear_biasstate_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\linear_S75_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_20 <- fread(file_name)
linear_biasstate_S75_R75_20 <- data.frame(linear_biasstate_S75_R75_20)[-1]

linear_biasstate_S75_R75_20$location <- 'linear'
linear_biasstate_S75_R75_20$detection <- 0.75
linear_biasstate_S75_R75_20$eradication <- 0.75
linear_biasstate_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S75_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_20b <- fread(file_name)
linear_biasstate_S75_R75_20b <- data.frame(linear_biasstate_S75_R75_20b)[-1]

linear_biasstate_S75_R75_20b$location <- 'linear'
linear_biasstate_S75_R75_20b$detection <- 0.75
linear_biasstate_S75_R75_20b$eradication <- 0.75
linear_biasstate_S75_R75_20b$budget <- 20


#--- Combine bias_states ---#
bias_state_20 <- rbind(hsb_biasstate_S25_R5_20,hsb_biasstate_S25_R5_20b,
                       hsb_biasstate_S25_R75_20,hsb_biasstate_S25_R75_20b,
                       hsb_biasstate_S5_R5_20,hsb_biasstate_S5_R5_20b,
                       hsb_biasstate_S5_R75_20,hsb_biasstate_S5_R75_20b,
                       hsb_biasstate_S75_R5_20,hsb_biasstate_S75_R5_20b,
                       hsb_biasstate_S75_R75_20,hsb_biasstate_S75_R75_20b,
                       linear_biasstate_S25_R5_20,linear_biasstate_S25_R5_20b,
                       linear_biasstate_S25_R75_20,linear_biasstate_S25_R75_20b,
                       linear_biasstate_S5_R5_20,linear_biasstate_S5_R5_20b,
                       linear_biasstate_S5_R75_20,linear_biasstate_S5_R75_20b,
                       linear_biasstate_S75_R5_20,linear_biasstate_S75_R5_20b,
                       linear_biasstate_S75_R75_20,linear_biasstate_S75_R75_20b)


#-- Combine Bias --#
bias_state <- rbind(bias_state_20)

##### results ####
bias_state$rates <- paste0('(p = )', bias_state$detection, ',  \u03F5 = ', bias_state$eradication)
bias_state$rates2 <- paste0('(', bias_state$detection, ', ', bias_state$eradication, ")")
colnames(bias_state)[5] <- 'Budget'
bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication)

budget20_biasstate <- bias_state %>% 
  filter(Budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))


budget20_biasstate

#### Bias params ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S25_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_20 <- fread(file_name)
hsb_biasparam_S25_R5_20 <- data.frame(hsb_biasparam_S25_R5_20)[-1]

hsb_biasparam_S25_R5_20$location <- 'hstatebins'
hsb_biasparam_S25_R5_20$detection <- 0.25
hsb_biasparam_S25_R5_20$eradication <- 0.5
hsb_biasparam_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S25_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_20b <- fread(file_name)
hsb_biasparam_S25_R5_20b <- data.frame(hsb_biasparam_S25_R5_20b)[-1]

hsb_biasparam_S25_R5_20b$location <- 'hstatebins'
hsb_biasparam_S25_R5_20b$detection <- 0.25
hsb_biasparam_S25_R5_20b$eradication <- 0.5
hsb_biasparam_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S25_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_20 <- fread(file_name)
hsb_biasparam_S25_R75_20 <- data.frame(hsb_biasparam_S25_R75_20)[-1]

hsb_biasparam_S25_R75_20$location <- 'hstatebins'
hsb_biasparam_S25_R75_20$detection <- 0.25
hsb_biasparam_S25_R75_20$eradication <- 0.75
hsb_biasparam_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S25_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_20b <- fread(file_name)
hsb_biasparam_S25_R75_20b <- data.frame(hsb_biasparam_S25_R75_20b)[-1]

hsb_biasparam_S25_R75_20b$location <- 'hstatebins'
hsb_biasparam_S25_R75_20b$detection <- 0.25
hsb_biasparam_S25_R75_20b$eradication <- 0.75
hsb_biasparam_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S5_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_20 <- fread(file_name)
hsb_biasparam_S5_R5_20 <- data.frame(hsb_biasparam_S5_R5_20)[-1]

hsb_biasparam_S5_R5_20$location <- 'hstatebins'
hsb_biasparam_S5_R5_20$detection <- 0.5
hsb_biasparam_S5_R5_20$eradication <- 0.5
hsb_biasparam_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S5_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_20b <- fread(file_name)
hsb_biasparam_S5_R5_20b <- data.frame(hsb_biasparam_S5_R5_20b)[-1]

hsb_biasparam_S5_R5_20b$location <- 'hstatebins'
hsb_biasparam_S5_R5_20b$detection <- 0.5
hsb_biasparam_S5_R5_20b$eradication <- 0.5
hsb_biasparam_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_20 <- fread(file_name)
hsb_biasparam_S5_R75_20 <- data.frame(hsb_biasparam_S5_R75_20)[-1]

hsb_biasparam_S5_R75_20$location <- 'hstatebins'
hsb_biasparam_S5_R75_20$detection <- 0.5
hsb_biasparam_S5_R75_20$eradication <- 0.75
hsb_biasparam_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_20b <- fread(file_name)
hsb_biasparam_S5_R75_20b <- data.frame(hsb_biasparam_S5_R75_20b)[-1]

hsb_biasparam_S5_R75_20b$location <- 'hstatebins'
hsb_biasparam_S5_R75_20b$detection <- 0.5
hsb_biasparam_S5_R75_20b$eradication <- 0.75
hsb_biasparam_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S75_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_20 <- fread(file_name)
hsb_biasparam_S75_R5_20 <- data.frame(hsb_biasparam_S75_R5_20)[-1]

hsb_biasparam_S75_R5_20$location <- 'hstatebins'
hsb_biasparam_S75_R5_20$detection <- 0.75
hsb_biasparam_S75_R5_20$eradication <- 0.5
hsb_biasparam_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S75_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_20b <- fread(file_name)
hsb_biasparam_S75_R5_20b <- data.frame(hsb_biasparam_S75_R5_20b)[-1]

hsb_biasparam_S75_R5_20b$location <- 'hstatebins'
hsb_biasparam_S75_R5_20b$detection <- 0.75
hsb_biasparam_S75_R5_20b$eradication <- 0.5
hsb_biasparam_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S75_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_20 <- fread(file_name)
hsb_biasparam_S75_R75_20 <- data.frame(hsb_biasparam_S75_R75_20)[-1]

hsb_biasparam_S75_R75_20$location <- 'hstatebins'
hsb_biasparam_S75_R75_20$detection <- 0.75
hsb_biasparam_S75_R75_20$eradication <- 0.75
hsb_biasparam_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\hstatebins_S75_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_20b <- fread(file_name)
hsb_biasparam_S75_R75_20b <- data.frame(hsb_biasparam_S75_R75_20b)[-1]

hsb_biasparam_S75_R75_20b$location <- 'hstatebins'
hsb_biasparam_S75_R75_20b$detection <- 0.75
hsb_biasparam_S75_R75_20b$eradication <- 0.75
hsb_biasparam_S75_R75_20b$budget <- 20


#----- linear -----#
path <- 'E:\\Chapter3\\results\\budget20\\linear_S25_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_20 <- fread(file_name)
linear_biasparam_S25_R5_20 <- data.frame(linear_biasparam_S25_R5_20)[-1]

linear_biasparam_S25_R5_20$location <- 'linear'
linear_biasparam_S25_R5_20$detection <- 0.25
linear_biasparam_S25_R5_20$eradication <- 0.5
linear_biasparam_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S25_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_20b <- fread(file_name)
linear_biasparam_S25_R5_20b <- data.frame(linear_biasparam_S25_R5_20b)[-1]

linear_biasparam_S25_R5_20b$location <- 'linear'
linear_biasparam_S25_R5_20b$detection <- 0.25
linear_biasparam_S25_R5_20b$eradication <- 0.5
linear_biasparam_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\linear_S25_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_20 <- fread(file_name)
linear_biasparam_S25_R75_20 <- data.frame(linear_biasparam_S25_R75_20)[-1]

linear_biasparam_S25_R75_20$location <- 'linear'
linear_biasparam_S25_R75_20$detection <- 0.25
linear_biasparam_S25_R75_20$eradication <- 0.75
linear_biasparam_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S25_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_20b <- fread(file_name)
linear_biasparam_S25_R75_20b <- data.frame(linear_biasparam_S25_R75_20b)[-1]

linear_biasparam_S25_R75_20b$location <- 'linear'
linear_biasparam_S25_R75_20b$detection <- 0.25
linear_biasparam_S25_R75_20b$eradication <- 0.75
linear_biasparam_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\budget20\\linear_S5_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_20 <- fread(file_name)
linear_biasparam_S5_R5_20 <- data.frame(linear_biasparam_S5_R5_20)[-1]

linear_biasparam_S5_R5_20$location <- 'linear'
linear_biasparam_S5_R5_20$detection <- 0.5
linear_biasparam_S5_R5_20$eradication <- 0.5
linear_biasparam_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S5_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_20b <- fread(file_name)
linear_biasparam_S5_R5_20b <- data.frame(linear_biasparam_S5_R5_20b)[-1]

linear_biasparam_S5_R5_20b$location <- 'linear'
linear_biasparam_S5_R5_20b$detection <- 0.5
linear_biasparam_S5_R5_20b$eradication <- 0.5
linear_biasparam_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_20 <- fread(file_name)
linear_biasparam_S5_R75_20 <- data.frame(linear_biasparam_S5_R75_20)[-1]

linear_biasparam_S5_R75_20$location <- 'linear'
linear_biasparam_S5_R75_20$detection <- 0.5
linear_biasparam_S5_R75_20$eradication <- 0.75
linear_biasparam_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_20b <- fread(file_name)
linear_biasparam_S5_R75_20b <- data.frame(linear_biasparam_S5_R75_20b)[-1]

linear_biasparam_S5_R75_20b$location <- 'linear'
linear_biasparam_S5_R75_20b$detection <- 0.5
linear_biasparam_S5_R75_20b$eradication <- 0.75
linear_biasparam_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\budget20\\linear_S75_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_20 <- fread(file_name)
linear_biasparam_S75_R5_20 <- data.frame(linear_biasparam_S75_R5_20)[-1]

linear_biasparam_S75_R5_20$location <- 'linear'
linear_biasparam_S75_R5_20$detection <- 0.75
linear_biasparam_S75_R5_20$eradication <- 0.5
linear_biasparam_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S75_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_20b <- fread(file_name)
linear_biasparam_S75_R5_20b <- data.frame(linear_biasparam_S75_R5_20b)[-1]

linear_biasparam_S75_R5_20b$location <- 'linear'
linear_biasparam_S75_R5_20b$detection <- 0.75
linear_biasparam_S75_R5_20b$eradication <- 0.5
linear_biasparam_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\budget20\\linear_S75_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_20 <- fread(file_name)
linear_biasparam_S75_R75_20 <- data.frame(linear_biasparam_S75_R75_20)[-1]

linear_biasparam_S75_R75_20$location <- 'linear'
linear_biasparam_S75_R75_20$detection <- 0.75
linear_biasparam_S75_R75_20$eradication <- 0.75
linear_biasparam_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\budget20\\linear_S75_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_20b <- fread(file_name)
linear_biasparam_S75_R75_20b <- data.frame(linear_biasparam_S75_R75_20b)[-1]

linear_biasparam_S75_R75_20b$location <- 'linear'
linear_biasparam_S75_R75_20b$detection <- 0.75
linear_biasparam_S75_R75_20b$eradication <- 0.75
linear_biasparam_S75_R75_20b$budget <- 20


#--- Combine bias_params ---#
bias_param_20 <- rbind(hsb_biasparam_S25_R5_20,hsb_biasparam_S25_R5_20b,
                       hsb_biasparam_S25_R75_20,hsb_biasparam_S25_R75_20b,
                       hsb_biasparam_S5_R5_20,hsb_biasparam_S5_R5_20b,
                       hsb_biasparam_S5_R75_20,hsb_biasparam_S5_R75_20b,
                       hsb_biasparam_S75_R5_20,hsb_biasparam_S75_R5_20b,
                       hsb_biasparam_S75_R75_20,hsb_biasparam_S75_R75_20b,
                       linear_biasparam_S25_R5_20,linear_biasparam_S25_R5_20b,
                       linear_biasparam_S25_R75_20,linear_biasparam_S25_R75_20b,
                       linear_biasparam_S5_R5_20,linear_biasparam_S5_R5_20b,
                       linear_biasparam_S5_R75_20,linear_biasparam_S5_R75_20b,
                       linear_biasparam_S75_R5_20,linear_biasparam_S75_R5_20b,
                       linear_biasparam_S75_R75_20,linear_biasparam_S75_R75_20b)


#-- Combine bias --#
bias_params <- rbind(bias_param_20)

##### results -p ####
bias_params$rates <- paste0('(p = )', bias_params$detection, ',  \u03F5 = ', bias_params$eradication)
bias_params$rates2 <- paste0('(', bias_params$detection, ', ', bias_params$eradication, ")")
colnames(bias_params)[5] <- 'Budget'
bias_params$loc2 <- paste0(bias_params$location, bias_params$detection, bias_params$eradication)

bias_param_detect  <- bias_param %>% filter(param %in% c("B0.p.h", "B0.p.h", "B1.p.l", "B1.p.h"))

budget20_bias_param_detect <- bias_param_detect %>% 
  filter(budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget20_bias_param_detect


##### results -eps ####
bias_param_eps  <- bias_param %>% filter(param %in% c("B0.eps.h", "B0.eps.h", "B1.eps.l", "B1.eps.h"))

budget20_bias_param_eps <- bias_param_eps %>% 
  filter(budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget20_bias_param_eps

#### PLOTS ####
cols <- brewer.pal(12, "Paired") 
colors <- c(cols[1:4], cols[9:10])

colors2 <- c('deeppink3', 'grey50')

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
                              "linear0.750.5"),
                   labels=c(
                     
                     "hstatebins0.750.5" = "",
                     "linear0.750.5" = ""))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c('High invasion', 'Linear') )+
  
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
  group_by(location, year, rates, rates2, Budget) %>%
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