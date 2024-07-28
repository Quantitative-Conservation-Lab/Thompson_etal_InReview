library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States est ####
path <- 'D:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
hsbstate_S5_R75_20 <- fread(file_name)
hsbstate_S5_R75_20 <- data.frame(hsbstate_S5_R75_20)[-1]

hsbstate_S5_R75_20$location <- 'hstatebins'
hsbstate_S5_R75_20$detection <- 0.5
hsbstate_S5_R75_20$eradication <- 0.75
hsbstate_S5_R75_20$budget <- 20
hsbstate_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
hsbstate_S5_R75_20b <- fread(file_name)
hsbstate_S5_R75_20b <- data.frame(hsbstate_S5_R75_20b)[-1]

hsbstate_S5_R75_20b$location <- 'hstatebins'
hsbstate_S5_R75_20b$detection <- 0.5
hsbstate_S5_R75_20b$eradication <- 0.75
hsbstate_S5_R75_20b$budget <- 20
hsbstate_S5_R75_20b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\smartepicenter_S5_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_20 <- fread(file_name)
epistate_S5_R75_20 <- data.frame(epistate_S5_R75_20)[-1]

epistate_S5_R75_20$location <- 'smartepicenter'
epistate_S5_R75_20$detection <- 0.5
epistate_S5_R75_20$eradication <- 0.75
epistate_S5_R75_20$budget <- 20
epistate_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\smartepicenter_S5_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_20b <- fread(file_name)
epistate_S5_R75_20b <- data.frame(epistate_S5_R75_20b)[-1]

epistate_S5_R75_20b$location <- 'smartepicenter'
epistate_S5_R75_20b$detection <- 0.5
epistate_S5_R75_20b$eradication <- 0.75
epistate_S5_R75_20b$budget <- 20
epistate_S5_R75_20b$data <- 'both'

#--- Combine states ---#
state_20 <- rbind(hsbstate_S5_R75_20,hsbstate_S5_R75_20b,
                        epistate_S5_R75_20,epistate_S5_R75_20b)

path <- 'D:\\Chapter3\\results-datboth\\budget40\\hstatebins_S5_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
hsbstate_S5_R75_40 <- fread(file_name)
hsbstate_S5_R75_40 <- data.frame(hsbstate_S5_R75_40)[-1]

hsbstate_S5_R75_40$location <- 'hstatebins'
hsbstate_S5_R75_40$detection <- 0.5
hsbstate_S5_R75_40$eradication <- 0.75
hsbstate_S5_R75_40$budget <- 40
hsbstate_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\hstatebins_S5_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
hsbstate_S5_R75_40b <- fread(file_name)
hsbstate_S5_R75_40b <- data.frame(hsbstate_S5_R75_40b)[-1]

hsbstate_S5_R75_40b$location <- 'hstatebins'
hsbstate_S5_R75_40b$detection <- 0.5
hsbstate_S5_R75_40b$eradication <- 0.75
hsbstate_S5_R75_40b$budget <- 40
hsbstate_S5_R75_40b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\smartepicenter_S5_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_40 <- fread(file_name)
epistate_S5_R75_40 <- data.frame(epistate_S5_R75_40)[-1]

epistate_S5_R75_40$location <- 'smartepicenter'
epistate_S5_R75_40$detection <- 0.5
epistate_S5_R75_40$eradication <- 0.75
epistate_S5_R75_40$budget <- 40
epistate_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\smartepicenter_S5_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_40b <- fread(file_name)
epistate_S5_R75_40b <- data.frame(epistate_S5_R75_40b)[-1]

epistate_S5_R75_40b$location <- 'smartepicenter'
epistate_S5_R75_40b$detection <- 0.5
epistate_S5_R75_40b$eradication <- 0.75
epistate_S5_R75_40b$budget <- 40
epistate_S5_R75_40b$data <- 'both'

#--- Combine states ---#
state_40 <- rbind(hsbstate_S5_R75_40,hsbstate_S5_R75_40b,
                        epistate_S5_R75_40,epistate_S5_R75_40b)
path <- 'D:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
hsbstate_S5_R75_60 <- fread(file_name)
hsbstate_S5_R75_60 <- data.frame(hsbstate_S5_R75_60)[-1]

hsbstate_S5_R75_60$location <- 'hstatebins'
hsbstate_S5_R75_60$detection <- 0.5
hsbstate_S5_R75_60$eradication <- 0.75
hsbstate_S5_R75_60$budget <- 60
hsbstate_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
hsbstate_S5_R75_60b <- fread(file_name)
hsbstate_S5_R75_60b <- data.frame(hsbstate_S5_R75_60b)[-1]

hsbstate_S5_R75_60b$location <- 'hstatebins'
hsbstate_S5_R75_60b$detection <- 0.5
hsbstate_S5_R75_60b$eradication <- 0.75
hsbstate_S5_R75_60b$budget <- 60
hsbstate_S5_R75_60b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\smartepicenter_S5_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_60 <- fread(file_name)
epistate_S5_R75_60 <- data.frame(epistate_S5_R75_60)[-1]

epistate_S5_R75_60$location <- 'smartepicenter'
epistate_S5_R75_60$detection <- 0.5
epistate_S5_R75_60$eradication <- 0.75
epistate_S5_R75_60$budget <- 60
epistate_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\smartepicenter_S5_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_60b <- fread(file_name)
epistate_S5_R75_60b <- data.frame(epistate_S5_R75_60b)[-1]

epistate_S5_R75_60b$location <- 'smartepicenter'
epistate_S5_R75_60b$detection <- 0.5
epistate_S5_R75_60b$eradication <- 0.75
epistate_S5_R75_60b$budget <- 60
epistate_S5_R75_60b$data <- 'both'

#--- Combine states ---#
state_60 <- rbind(hsbstate_S5_R75_60,hsbstate_S5_R75_60b,
                        epistate_S5_R75_60,epistate_S5_R75_60b)

state <- rbind(state_20, state_40, state_60)


#### States truth ####
path <- 'D:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_20 <- fread(file_name)
hsbstate_truth_S5_R75_20 <- data.frame(hsbstate_truth_S5_R75_20)[-1]

hsbstate_truth_S5_R75_20$location <- 'hstatebins'
hsbstate_truth_S5_R75_20$detection <- 0.5
hsbstate_truth_S5_R75_20$eradication <- 0.75
hsbstate_truth_S5_R75_20$budget <- 20
hsbstate_truth_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_20b <- fread(file_name)
hsbstate_truth_S5_R75_20b <- data.frame(hsbstate_truth_S5_R75_20b)[-1]

hsbstate_truth_S5_R75_20b$location <- 'hstatebins'
hsbstate_truth_S5_R75_20b$detection <- 0.5
hsbstate_truth_S5_R75_20b$eradication <- 0.75
hsbstate_truth_S5_R75_20b$budget <- 20
hsbstate_truth_S5_R75_20b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\smartepicenter_S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_20 <- fread(file_name)
epistate_truth_S5_R75_20 <- data.frame(epistate_truth_S5_R75_20)[-1]

epistate_truth_S5_R75_20$location <- 'smartepicenter'
epistate_truth_S5_R75_20$detection <- 0.5
epistate_truth_S5_R75_20$eradication <- 0.75
epistate_truth_S5_R75_20$budget <- 20
epistate_truth_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\smartepicenter_S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_20b <- fread(file_name)
epistate_truth_S5_R75_20b <- data.frame(epistate_truth_S5_R75_20b)[-1]

epistate_truth_S5_R75_20b$location <- 'smartepicenter'
epistate_truth_S5_R75_20b$detection <- 0.5
epistate_truth_S5_R75_20b$eradication <- 0.75
epistate_truth_S5_R75_20b$budget <- 20
epistate_truth_S5_R75_20b$data <- 'both'

#--- Combine state_truths ---#
state_truth_20 <- rbind(hsbstate_truth_S5_R75_20,hsbstate_truth_S5_R75_20b,
                        epistate_truth_S5_R75_20,epistate_truth_S5_R75_20b)

path <- 'D:\\Chapter3\\results-datboth\\budget40\\hstatebins_S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_40 <- fread(file_name)
hsbstate_truth_S5_R75_40 <- data.frame(hsbstate_truth_S5_R75_40)[-1]

hsbstate_truth_S5_R75_40$location <- 'hstatebins'
hsbstate_truth_S5_R75_40$detection <- 0.5
hsbstate_truth_S5_R75_40$eradication <- 0.75
hsbstate_truth_S5_R75_40$budget <- 40
hsbstate_truth_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\hstatebins_S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_40b <- fread(file_name)
hsbstate_truth_S5_R75_40b <- data.frame(hsbstate_truth_S5_R75_40b)[-1]

hsbstate_truth_S5_R75_40b$location <- 'hstatebins'
hsbstate_truth_S5_R75_40b$detection <- 0.5
hsbstate_truth_S5_R75_40b$eradication <- 0.75
hsbstate_truth_S5_R75_40b$budget <- 40
hsbstate_truth_S5_R75_40b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\smartepicenter_S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40 <- fread(file_name)
epistate_truth_S5_R75_40 <- data.frame(epistate_truth_S5_R75_40)[-1]

epistate_truth_S5_R75_40$location <- 'smartepicenter'
epistate_truth_S5_R75_40$detection <- 0.5
epistate_truth_S5_R75_40$eradication <- 0.75
epistate_truth_S5_R75_40$budget <- 40
epistate_truth_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\smartepicenter_S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40b <- fread(file_name)
epistate_truth_S5_R75_40b <- data.frame(epistate_truth_S5_R75_40b)[-1]

epistate_truth_S5_R75_40b$location <- 'smartepicenter'
epistate_truth_S5_R75_40b$detection <- 0.5
epistate_truth_S5_R75_40b$eradication <- 0.75
epistate_truth_S5_R75_40b$budget <- 40
epistate_truth_S5_R75_40b$data <- 'both'

#--- Combine state_truths ---#
state_truth_40 <- rbind(hsbstate_truth_S5_R75_40,hsbstate_truth_S5_R75_40b,
                        epistate_truth_S5_R75_40,epistate_truth_S5_R75_40b)
path <- 'D:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_60 <- fread(file_name)
hsbstate_truth_S5_R75_60 <- data.frame(hsbstate_truth_S5_R75_60)[-1]

hsbstate_truth_S5_R75_60$location <- 'hstatebins'
hsbstate_truth_S5_R75_60$detection <- 0.5
hsbstate_truth_S5_R75_60$eradication <- 0.75
hsbstate_truth_S5_R75_60$budget <- 60
hsbstate_truth_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_60b <- fread(file_name)
hsbstate_truth_S5_R75_60b <- data.frame(hsbstate_truth_S5_R75_60b)[-1]

hsbstate_truth_S5_R75_60b$location <- 'hstatebins'
hsbstate_truth_S5_R75_60b$detection <- 0.5
hsbstate_truth_S5_R75_60b$eradication <- 0.75
hsbstate_truth_S5_R75_60b$budget <- 60
hsbstate_truth_S5_R75_60b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\smartepicenter_S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_60 <- fread(file_name)
epistate_truth_S5_R75_60 <- data.frame(epistate_truth_S5_R75_60)[-1]

epistate_truth_S5_R75_60$location <- 'smartepicenter'
epistate_truth_S5_R75_60$detection <- 0.5
epistate_truth_S5_R75_60$eradication <- 0.75
epistate_truth_S5_R75_60$budget <- 60
epistate_truth_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\smartepicenter_S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_60b <- fread(file_name)
epistate_truth_S5_R75_60b <- data.frame(epistate_truth_S5_R75_60b)[-1]

epistate_truth_S5_R75_60b$location <- 'smartepicenter'
epistate_truth_S5_R75_60b$detection <- 0.5
epistate_truth_S5_R75_60b$eradication <- 0.75
epistate_truth_S5_R75_60b$budget <- 60
epistate_truth_S5_R75_60b$data <- 'both'

#--- Combine state_truths ---#
state_truth_60 <- rbind(hsbstate_truth_S5_R75_60,hsbstate_truth_S5_R75_60b,
                        epistate_truth_S5_R75_60,epistate_truth_S5_R75_60b)

state_truth <- rbind(state_truth_20, state_truth_40, state_truth_60)

#### rmse state ####

state_est_week5 <- state
state_est_week5$rmse <- sqrt((state_est_week5$mean - state_est_week5$truth)^2)

state_est_week5$loc2 <- paste0(state_est_week5$location, state_est_week5$detection, state_est_week5$eradication)

state_rmse20 <- state_est_week5 %>% 
  filter(budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rmse),
            max_c = max(rmse))

state_rmse20

state_rmse40 <- state_est_week5 %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rmse),
            max_c = max(rmse))

state_rmse40


state_rmse60 <- state_est_week5 %>% 
  filter(budget == 60) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rmse),
            max_c = max(rmse))

state_rmse60

#### Bias state ####
#-- Budget = 20 --#
path <- 'D:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_20 <- fread(file_name)
hsb_biasstate_S5_R75_20 <- data.frame(hsb_biasstate_S5_R75_20)[-1]

hsb_biasstate_S5_R75_20$location <- 'hstatebins'
hsb_biasstate_S5_R75_20$detection <- 0.5
hsb_biasstate_S5_R75_20$eradication <- 0.75
hsb_biasstate_S5_R75_20$budget <- 20
hsb_biasstate_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_20b <- fread(file_name)
hsb_biasstate_S5_R75_20b <- data.frame(hsb_biasstate_S5_R75_20b)[-1]

hsb_biasstate_S5_R75_20b$location <- 'hstatebins'
hsb_biasstate_S5_R75_20b$detection <- 0.5
hsb_biasstate_S5_R75_20b$eradication <- 0.75
hsb_biasstate_S5_R75_20b$budget <- 20
hsb_biasstate_S5_R75_20b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\smartepicenter_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_20 <- fread(file_name)
epi_biasstate_S5_R75_20 <- data.frame(epi_biasstate_S5_R75_20)[-1]

epi_biasstate_S5_R75_20$location <- 'smartepicenter'
epi_biasstate_S5_R75_20$detection <- 0.5
epi_biasstate_S5_R75_20$eradication <- 0.75
epi_biasstate_S5_R75_20$budget <- 20
epi_biasstate_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\smartepicenter_S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_20b <- fread(file_name)
epi_biasstate_S5_R75_20b <- data.frame(epi_biasstate_S5_R75_20b)[-1]

epi_biasstate_S5_R75_20b$location <- 'smartepicenter'
epi_biasstate_S5_R75_20b$detection <- 0.5
epi_biasstate_S5_R75_20b$eradication <- 0.75
epi_biasstate_S5_R75_20b$budget <- 20
epi_biasstate_S5_R75_20b$data <- 'both'

#--- Combine bias_states ---#
bias_state_20 <- rbind(hsb_biasstate_S5_R75_20,hsb_biasstate_S5_R75_20b,
                       epi_biasstate_S5_R75_20,epi_biasstate_S5_R75_20b)

#-- Budget = 40 --#
path <- 'D:\\Chapter3\\results-datboth\\budget40\\hstatebins_S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_40 <- fread(file_name)
hsb_biasstate_S5_R75_40 <- data.frame(hsb_biasstate_S5_R75_40)[-1]

hsb_biasstate_S5_R75_40$location <- 'hstatebins'
hsb_biasstate_S5_R75_40$detection <- 0.5
hsb_biasstate_S5_R75_40$eradication <- 0.75
hsb_biasstate_S5_R75_40$budget <- 40
hsb_biasstate_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\hstatebins_S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_40b <- fread(file_name)
hsb_biasstate_S5_R75_40b <- data.frame(hsb_biasstate_S5_R75_40b)[-1]

hsb_biasstate_S5_R75_40b$location <- 'hstatebins'
hsb_biasstate_S5_R75_40b$detection <- 0.5
hsb_biasstate_S5_R75_40b$eradication <- 0.75
hsb_biasstate_S5_R75_40b$budget <- 40
hsb_biasstate_S5_R75_40b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\smartepicenter_S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40 <- fread(file_name)
epi_biasstate_S5_R75_40 <- data.frame(epi_biasstate_S5_R75_40)[-1]

epi_biasstate_S5_R75_40$location <- 'smartepicenter'
epi_biasstate_S5_R75_40$detection <- 0.5
epi_biasstate_S5_R75_40$eradication <- 0.75
epi_biasstate_S5_R75_40$budget <- 40
epi_biasstate_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\smartepicenter_S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40b <- fread(file_name)
epi_biasstate_S5_R75_40b <- data.frame(epi_biasstate_S5_R75_40b)[-1]

epi_biasstate_S5_R75_40b$location <- 'smartepicenter'
epi_biasstate_S5_R75_40b$detection <- 0.5
epi_biasstate_S5_R75_40b$eradication <- 0.75
epi_biasstate_S5_R75_40b$budget <- 40
epi_biasstate_S5_R75_40b$data <- 'both'

#--- Combine bias_states ---#
bias_state_40 <- rbind(hsb_biasstate_S5_R75_40,hsb_biasstate_S5_R75_40b,
                       epi_biasstate_S5_R75_40,epi_biasstate_S5_R75_40b)

#-- Budget = 60 --#
path <- 'D:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_60 <- fread(file_name)
hsb_biasstate_S5_R75_60 <- data.frame(hsb_biasstate_S5_R75_60)[-1]

hsb_biasstate_S5_R75_60$location <- 'hstatebins'
hsb_biasstate_S5_R75_60$detection <- 0.5
hsb_biasstate_S5_R75_60$eradication <- 0.75
hsb_biasstate_S5_R75_60$budget <- 60
hsb_biasstate_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_60b <- fread(file_name)
hsb_biasstate_S5_R75_60b <- data.frame(hsb_biasstate_S5_R75_60b)[-1]

hsb_biasstate_S5_R75_60b$location <- 'hstatebins'
hsb_biasstate_S5_R75_60b$detection <- 0.5
hsb_biasstate_S5_R75_60b$eradication <- 0.75
hsb_biasstate_S5_R75_60b$budget <- 60
hsb_biasstate_S5_R75_60b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\smartepicenter_S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_60 <- fread(file_name)
epi_biasstate_S5_R75_60 <- data.frame(epi_biasstate_S5_R75_60)[-1]

epi_biasstate_S5_R75_60$location <- 'smartepicenter'
epi_biasstate_S5_R75_60$detection <- 0.5
epi_biasstate_S5_R75_60$eradication <- 0.75
epi_biasstate_S5_R75_60$budget <- 60
epi_biasstate_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\smartepicenter_S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_60b <- fread(file_name)
epi_biasstate_S5_R75_60b <- data.frame(epi_biasstate_S5_R75_60b)[-1]

epi_biasstate_S5_R75_60b$location <- 'smartepicenter'
epi_biasstate_S5_R75_60b$detection <- 0.5
epi_biasstate_S5_R75_60b$eradication <- 0.75
epi_biasstate_S5_R75_60b$budget <- 60
epi_biasstate_S5_R75_60b$data <- 'both'

#--- Combine bias_states ---#
bias_state_60 <- rbind(hsb_biasstate_S5_R75_60,hsb_biasstate_S5_R75_60b,
                       epi_biasstate_S5_R75_60,epi_biasstate_S5_R75_60b)

#-- Combine Bias --#
bias_state <- rbind(bias_state_20, bias_state_40, bias_state_60)

#### Bias params ####
#-- Budget = 20 --#
path <- 'D:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_20 <- fread(file_name)
hsb_biasparam_S5_R75_20 <- data.frame(hsb_biasparam_S5_R75_20)[-1]

hsb_biasparam_S5_R75_20$location <- 'hstatebins'
hsb_biasparam_S5_R75_20$detection <- 0.5
hsb_biasparam_S5_R75_20$eradication <- 0.75
hsb_biasparam_S5_R75_20$budget <- 20
hsb_biasparam_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_20b <- fread(file_name)
hsb_biasparam_S5_R75_20b <- data.frame(hsb_biasparam_S5_R75_20b)[-1]

hsb_biasparam_S5_R75_20b$location <- 'hstatebins'
hsb_biasparam_S5_R75_20b$detection <- 0.5
hsb_biasparam_S5_R75_20b$eradication <- 0.75
hsb_biasparam_S5_R75_20b$budget <- 20
hsb_biasparam_S5_R75_20b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\smartepicenter_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_20 <- fread(file_name)
epi_biasparam_S5_R75_20 <- data.frame(epi_biasparam_S5_R75_20)[-1]

epi_biasparam_S5_R75_20$location <- 'smartepicenter'
epi_biasparam_S5_R75_20$detection <- 0.5
epi_biasparam_S5_R75_20$eradication <- 0.75
epi_biasparam_S5_R75_20$budget <- 20
epi_biasparam_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget20\\smartepicenter_S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_20b <- fread(file_name)
epi_biasparam_S5_R75_20b <- data.frame(epi_biasparam_S5_R75_20b)[-1]

epi_biasparam_S5_R75_20b$location <- 'smartepicenter'
epi_biasparam_S5_R75_20b$detection <- 0.5
epi_biasparam_S5_R75_20b$eradication <- 0.75
epi_biasparam_S5_R75_20b$budget <- 20
epi_biasparam_S5_R75_20b$data <- 'both'

#--- Combine bias_params ---#
bias_param_20 <- rbind(hsb_biasparam_S5_R75_20,hsb_biasparam_S5_R75_20b,
                       epi_biasparam_S5_R75_20,epi_biasparam_S5_R75_20b)

#-- Budget = 40 --#
path <- 'D:\\Chapter3\\results-datboth\\budget40\\hstatebins_S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_40 <- fread(file_name)
hsb_biasparam_S5_R75_40 <- data.frame(hsb_biasparam_S5_R75_40)[-1]

hsb_biasparam_S5_R75_40$location <- 'hstatebins'
hsb_biasparam_S5_R75_40$detection <- 0.5
hsb_biasparam_S5_R75_40$eradication <- 0.75
hsb_biasparam_S5_R75_40$budget <- 40
hsb_biasparam_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\hstatebins_S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_40b <- fread(file_name)
hsb_biasparam_S5_R75_40b <- data.frame(hsb_biasparam_S5_R75_40b)[-1]

hsb_biasparam_S5_R75_40b$location <- 'hstatebins'
hsb_biasparam_S5_R75_40b$detection <- 0.5
hsb_biasparam_S5_R75_40b$eradication <- 0.75
hsb_biasparam_S5_R75_40b$budget <- 40
hsb_biasparam_S5_R75_40b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\smartepicenter_S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40 <- fread(file_name)
epi_biasparam_S5_R75_40 <- data.frame(epi_biasparam_S5_R75_40)[-1]

epi_biasparam_S5_R75_40$location <- 'smartepicenter'
epi_biasparam_S5_R75_40$detection <- 0.5
epi_biasparam_S5_R75_40$eradication <- 0.75
epi_biasparam_S5_R75_40$budget <- 40
epi_biasparam_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget40\\smartepicenter_S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40b <- fread(file_name)
epi_biasparam_S5_R75_40b <- data.frame(epi_biasparam_S5_R75_40b)[-1]

epi_biasparam_S5_R75_40b$location <- 'smartepicenter'
epi_biasparam_S5_R75_40b$detection <- 0.5
epi_biasparam_S5_R75_40b$eradication <- 0.75
epi_biasparam_S5_R75_40b$budget <- 40
epi_biasparam_S5_R75_40b$data <- 'both'

#--- Combine bias_params ---#
bias_param_40 <- rbind(hsb_biasparam_S5_R75_40,hsb_biasparam_S5_R75_40b,
                       epi_biasparam_S5_R75_40,epi_biasparam_S5_R75_40b)

#-- Budget = 60 --#
path <- 'D:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_60 <- fread(file_name)
hsb_biasparam_S5_R75_60 <- data.frame(hsb_biasparam_S5_R75_60)[-1]

hsb_biasparam_S5_R75_60$location <- 'hstatebins'
hsb_biasparam_S5_R75_60$detection <- 0.5
hsb_biasparam_S5_R75_60$eradication <- 0.75
hsb_biasparam_S5_R75_60$budget <- 60
hsb_biasparam_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_60b <- fread(file_name)
hsb_biasparam_S5_R75_60b <- data.frame(hsb_biasparam_S5_R75_60b)[-1]

hsb_biasparam_S5_R75_60b$location <- 'hstatebins'
hsb_biasparam_S5_R75_60b$detection <- 0.5
hsb_biasparam_S5_R75_60b$eradication <- 0.75
hsb_biasparam_S5_R75_60b$budget <- 60
hsb_biasparam_S5_R75_60b$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\smartepicenter_S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_60 <- fread(file_name)
epi_biasparam_S5_R75_60 <- data.frame(epi_biasparam_S5_R75_60)[-1]

epi_biasparam_S5_R75_60$location <- 'smartepicenter'
epi_biasparam_S5_R75_60$detection <- 0.5
epi_biasparam_S5_R75_60$eradication <- 0.75
epi_biasparam_S5_R75_60$budget <- 60
epi_biasparam_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results-datboth\\budget60\\smartepicenter_S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_60b <- fread(file_name)
epi_biasparam_S5_R75_60b <- data.frame(epi_biasparam_S5_R75_60b)[-1]

epi_biasparam_S5_R75_60b$location <- 'smartepicenter'
epi_biasparam_S5_R75_60b$detection <- 0.5
epi_biasparam_S5_R75_60b$eradication <- 0.75
epi_biasparam_S5_R75_60b$budget <- 60
epi_biasparam_S5_R75_60b$data <- 'both'

#--- Combine bias_params ---#
bias_param_60 <- rbind(hsb_biasparam_S5_R75_60,hsb_biasparam_S5_R75_60b,
                       epi_biasparam_S5_R75_60,epi_biasparam_S5_R75_60b)

#-- Combine bias --#
bias_params <- rbind(bias_param_20, bias_param_40, bias_param_60)

#### Save CSVs ####
path <- 'D:\\Chapter3\\results-datboth'

file_name = paste(path, 'states_truth.csv',sep = '/')
fwrite(state_truth,file_name)

state_truth_all_fin <- state_truth %>% filter(week == 5 & year == 7)
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
fwrite(state_truth_all_fin,file_name)

file_name = paste(path, 'bias_state.csv',sep = '/')
fwrite(bias_state,file_name)

file_name = paste(path, 'bias_params.csv',sep = '/')
fwrite(bias_params,file_name)

