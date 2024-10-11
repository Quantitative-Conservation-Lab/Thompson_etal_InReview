library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States truth ####
path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\hstatebins_S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_40 <- fread(file_name)
hsbstate_truth_S5_R75_40 <- data.frame(hsbstate_truth_S5_R75_40)[-1]

hsbstate_truth_S5_R75_40$location <- 'hstatebins'
hsbstate_truth_S5_R75_40$detection <- 0.5
hsbstate_truth_S5_R75_40$eradication <- 0.75
hsbstate_truth_S5_R75_40$budget <- 40
hsbstate_truth_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\hstatebins_S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_40b <- fread(file_name)
hsbstate_truth_S5_R75_40b <- data.frame(hsbstate_truth_S5_R75_40b)[-1]

hsbstate_truth_S5_R75_40b$location <- 'hstatebins'
hsbstate_truth_S5_R75_40b$detection <- 0.5
hsbstate_truth_S5_R75_40b$eradication <- 0.75
hsbstate_truth_S5_R75_40b$budget <- 40
hsbstate_truth_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40 <- fread(file_name)
epistate_truth_S5_R75_40 <- data.frame(epistate_truth_S5_R75_40)[-1]

epistate_truth_S5_R75_40$location <- 'epicenter'
epistate_truth_S5_R75_40$detection <- 0.5
epistate_truth_S5_R75_40$eradication <- 0.75
epistate_truth_S5_R75_40$budget <- 40
epistate_truth_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40b <- fread(file_name)
epistate_truth_S5_R75_40b <- data.frame(epistate_truth_S5_R75_40b)[-1]

epistate_truth_S5_R75_40b$location <- 'epicenter'
epistate_truth_S5_R75_40b$detection <- 0.5
epistate_truth_S5_R75_40b$eradication <- 0.75
epistate_truth_S5_R75_40b$budget <- 40
epistate_truth_S5_R75_40b$data <- 'both'

#--- Combine state_truths ---#
state_truth_40 <- rbind(hsbstate_truth_S5_R75_40,hsbstate_truth_S5_R75_40b,
                        epistate_truth_S5_R75_40,epistate_truth_S5_R75_40b)


state_truth <- rbind(state_truth_40)

#### Bias state ####
#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\hstatebins_S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_40 <- fread(file_name)
hsb_biasstate_S5_R75_40 <- data.frame(hsb_biasstate_S5_R75_40)[-1]

hsb_biasstate_S5_R75_40$location <- 'hstatebins'
hsb_biasstate_S5_R75_40$detection <- 0.5
hsb_biasstate_S5_R75_40$eradication <- 0.75
hsb_biasstate_S5_R75_40$budget <- 40
hsb_biasstate_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\hstatebins_S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_40b <- fread(file_name)
hsb_biasstate_S5_R75_40b <- data.frame(hsb_biasstate_S5_R75_40b)[-1]

hsb_biasstate_S5_R75_40b$location <- 'hstatebins'
hsb_biasstate_S5_R75_40b$detection <- 0.5
hsb_biasstate_S5_R75_40b$eradication <- 0.75
hsb_biasstate_S5_R75_40b$budget <- 40
hsb_biasstate_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40 <- fread(file_name)
epi_biasstate_S5_R75_40 <- data.frame(epi_biasstate_S5_R75_40)[-1]

epi_biasstate_S5_R75_40$location <- 'epicenter'
epi_biasstate_S5_R75_40$detection <- 0.5
epi_biasstate_S5_R75_40$eradication <- 0.75
epi_biasstate_S5_R75_40$budget <- 40
epi_biasstate_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40b <- fread(file_name)
epi_biasstate_S5_R75_40b <- data.frame(epi_biasstate_S5_R75_40b)[-1]

epi_biasstate_S5_R75_40b$location <- 'epicenter'
epi_biasstate_S5_R75_40b$detection <- 0.5
epi_biasstate_S5_R75_40b$eradication <- 0.75
epi_biasstate_S5_R75_40b$budget <- 40
epi_biasstate_S5_R75_40b$data <- 'both'

#--- Combine bias_states ---#
bias_state_40 <- rbind(hsb_biasstate_S5_R75_40,hsb_biasstate_S5_R75_40b,
                       epi_biasstate_S5_R75_40,epi_biasstate_S5_R75_40b)

#-- Combine Bias --#
bias_state <- rbind(bias_state_40)

#### Bias params ####
#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\hstatebins_S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_40 <- fread(file_name)
hsb_biasparam_S5_R75_40 <- data.frame(hsb_biasparam_S5_R75_40)[-1]

hsb_biasparam_S5_R75_40$location <- 'hstatebins'
hsb_biasparam_S5_R75_40$detection <- 0.5
hsb_biasparam_S5_R75_40$eradication <- 0.75
hsb_biasparam_S5_R75_40$budget <- 40
hsb_biasparam_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\hstatebins_S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_40b <- fread(file_name)
hsb_biasparam_S5_R75_40b <- data.frame(hsb_biasparam_S5_R75_40b)[-1]

hsb_biasparam_S5_R75_40b$location <- 'hstatebins'
hsb_biasparam_S5_R75_40b$detection <- 0.5
hsb_biasparam_S5_R75_40b$eradication <- 0.75
hsb_biasparam_S5_R75_40b$budget <- 40
hsb_biasparam_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40 <- fread(file_name)
epi_biasparam_S5_R75_40 <- data.frame(epi_biasparam_S5_R75_40)[-1]

epi_biasparam_S5_R75_40$location <- 'epicenter'
epi_biasparam_S5_R75_40$detection <- 0.5
epi_biasparam_S5_R75_40$eradication <- 0.75
epi_biasparam_S5_R75_40$budget <- 40
epi_biasparam_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth-space2\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40b <- fread(file_name)
epi_biasparam_S5_R75_40b <- data.frame(epi_biasparam_S5_R75_40b)[-1]

epi_biasparam_S5_R75_40b$location <- 'epicenter'
epi_biasparam_S5_R75_40b$detection <- 0.5
epi_biasparam_S5_R75_40b$eradication <- 0.75
epi_biasparam_S5_R75_40b$budget <- 40
epi_biasparam_S5_R75_40b$data <- 'both'

#--- Combine bias_params ---#
bias_param_40 <- rbind(hsb_biasparam_S5_R75_40,hsb_biasparam_S5_R75_40b,
                       epi_biasparam_S5_R75_40,epi_biasparam_S5_R75_40b)

#-- Combine bias --#
bias_params <- rbind(bias_param_40)

#### Save CSVs ####
path <- 'E:\\Chapter3\\results-datboth-space2'

file_name = paste(path, 'states_truth.csv',sep = '/')
fwrite(state_truth,file_name)

state_truth_all_fin <- state_truth %>% filter(week == 5 & year == 7)
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
fwrite(state_truth_all_fin,file_name)

file_name = paste(path, 'bias_state.csv',sep = '/')
fwrite(bias_state,file_name)

file_name = paste(path, 'bias_params.csv',sep = '/')
fwrite(bias_params,file_name)

