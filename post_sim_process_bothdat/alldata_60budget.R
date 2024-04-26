library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States truth ####
path <- 'E:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_60 <- fread(file_name)
hsbstate_truth_S5_R75_60 <- data.frame(hsbstate_truth_S5_R75_60)[-1]

hsbstate_truth_S5_R75_60$location <- 'hstatebins'
hsbstate_truth_S5_R75_60$detection <- 0.5
hsbstate_truth_S5_R75_60$eradication <- 0.75
hsbstate_truth_S5_R75_60$budget <- 60
hsbstate_truth_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_60b <- fread(file_name)
hsbstate_truth_S5_R75_60b <- data.frame(hsbstate_truth_S5_R75_60b)[-1]

hsbstate_truth_S5_R75_60b$location <- 'hstatebins'
hsbstate_truth_S5_R75_60b$detection <- 0.5
hsbstate_truth_S5_R75_60b$eradication <- 0.75
hsbstate_truth_S5_R75_60b$budget <- 60
hsbstate_truth_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_60 <- fread(file_name)
epistate_truth_S5_R75_60 <- data.frame(epistate_truth_S5_R75_60)[-1]

epistate_truth_S5_R75_60$location <- 'epicenter'
epistate_truth_S5_R75_60$detection <- 0.5
epistate_truth_S5_R75_60$eradication <- 0.75
epistate_truth_S5_R75_60$budget <- 60
epistate_truth_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_60b <- fread(file_name)
epistate_truth_S5_R75_60b <- data.frame(epistate_truth_S5_R75_60b)[-1]

epistate_truth_S5_R75_60b$location <- 'epicenter'
epistate_truth_S5_R75_60b$detection <- 0.5
epistate_truth_S5_R75_60b$eradication <- 0.75
epistate_truth_S5_R75_60b$budget <- 60
epistate_truth_S5_R75_60b$data <- 'both'

#--- Combine state_truths ---#
state_truth_60 <- rbind(hsbstate_truth_S5_R75_60,hsbstate_truth_S5_R75_60b,
                        epistate_truth_S5_R75_60,epistate_truth_S5_R75_60b)


state_truth <- rbind(state_truth_60)

#### Bias state ####
#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_60 <- fread(file_name)
hsb_biasstate_S5_R75_60 <- data.frame(hsb_biasstate_S5_R75_60)[-1]

hsb_biasstate_S5_R75_60$location <- 'hstatebins'
hsb_biasstate_S5_R75_60$detection <- 0.5
hsb_biasstate_S5_R75_60$eradication <- 0.75
hsb_biasstate_S5_R75_60$budget <- 60
hsb_biasstate_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_60b <- fread(file_name)
hsb_biasstate_S5_R75_60b <- data.frame(hsb_biasstate_S5_R75_60b)[-1]

hsb_biasstate_S5_R75_60b$location <- 'hstatebins'
hsb_biasstate_S5_R75_60b$detection <- 0.5
hsb_biasstate_S5_R75_60b$eradication <- 0.75
hsb_biasstate_S5_R75_60b$budget <- 60
hsb_biasstate_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_60 <- fread(file_name)
epi_biasstate_S5_R75_60 <- data.frame(epi_biasstate_S5_R75_60)[-1]

epi_biasstate_S5_R75_60$location <- 'epicenter'
epi_biasstate_S5_R75_60$detection <- 0.5
epi_biasstate_S5_R75_60$eradication <- 0.75
epi_biasstate_S5_R75_60$budget <- 60
epi_biasstate_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_60b <- fread(file_name)
epi_biasstate_S5_R75_60b <- data.frame(epi_biasstate_S5_R75_60b)[-1]

epi_biasstate_S5_R75_60b$location <- 'epicenter'
epi_biasstate_S5_R75_60b$detection <- 0.5
epi_biasstate_S5_R75_60b$eradication <- 0.75
epi_biasstate_S5_R75_60b$budget <- 60
epi_biasstate_S5_R75_60b$data <- 'both'

#--- Combine bias_states ---#
bias_state_60 <- rbind(hsb_biasstate_S5_R75_60,hsb_biasstate_S5_R75_60b,
                       epi_biasstate_S5_R75_60,epi_biasstate_S5_R75_60b)

#-- Combine Bias --#
bias_state <- rbind(bias_state_60)

#### Bias params ####
#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_60 <- fread(file_name)
hsb_biasparam_S5_R75_60 <- data.frame(hsb_biasparam_S5_R75_60)[-1]

hsb_biasparam_S5_R75_60$location <- 'hstatebins'
hsb_biasparam_S5_R75_60$detection <- 0.5
hsb_biasparam_S5_R75_60$eradication <- 0.75
hsb_biasparam_S5_R75_60$budget <- 60
hsb_biasparam_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget60\\hstatebins_S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_60b <- fread(file_name)
hsb_biasparam_S5_R75_60b <- data.frame(hsb_biasparam_S5_R75_60b)[-1]

hsb_biasparam_S5_R75_60b$location <- 'hstatebins'
hsb_biasparam_S5_R75_60b$detection <- 0.5
hsb_biasparam_S5_R75_60b$eradication <- 0.75
hsb_biasparam_S5_R75_60b$budget <- 60
hsb_biasparam_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_60 <- fread(file_name)
epi_biasparam_S5_R75_60 <- data.frame(epi_biasparam_S5_R75_60)[-1]

epi_biasparam_S5_R75_60$location <- 'epicenter'
epi_biasparam_S5_R75_60$detection <- 0.5
epi_biasparam_S5_R75_60$eradication <- 0.75
epi_biasparam_S5_R75_60$budget <- 60
epi_biasparam_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_60b <- fread(file_name)
epi_biasparam_S5_R75_60b <- data.frame(epi_biasparam_S5_R75_60b)[-1]

epi_biasparam_S5_R75_60b$location <- 'epicenter'
epi_biasparam_S5_R75_60b$detection <- 0.5
epi_biasparam_S5_R75_60b$eradication <- 0.75
epi_biasparam_S5_R75_60b$budget <- 60
epi_biasparam_S5_R75_60b$data <- 'both'

#--- Combine bias_params ---#
bias_param_60 <- rbind(hsb_biasparam_S5_R75_60,hsb_biasparam_S5_R75_60b,
                       epi_biasparam_S5_R75_60,epi_biasparam_S5_R75_60b)

#-- Combine bias --#
bias_params <- rbind(bias_param_60)

#### Save CSVs ####
path <- 'E:\\Chapter3\\results-datboth'

file_name = paste(path, 'states_truth.csv',sep = '/')
fwrite(state_truth,file_name)

state_truth_all_fin <- state_truth %>% filter(week == 5 & year == 7)
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
fwrite(state_truth_all_fin,file_name)

file_name = paste(path, 'bias_state.csv',sep = '/')
fwrite(bias_state,file_name)

file_name = paste(path, 'bias_params.csv',sep = '/')
fwrite(bias_params,file_name)

