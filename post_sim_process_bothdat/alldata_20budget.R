library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States truth ####
path <- 'E:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_20 <- fread(file_name)
hsbstate_truth_S5_R75_20 <- data.frame(hsbstate_truth_S5_R75_20)[-1]

hsbstate_truth_S5_R75_20$location <- 'hstatebins'
hsbstate_truth_S5_R75_20$detection <- 0.5
hsbstate_truth_S5_R75_20$eradication <- 0.75
hsbstate_truth_S5_R75_20$budget <- 20
hsbstate_truth_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
hsbstate_truth_S5_R75_20b <- fread(file_name)
hsbstate_truth_S5_R75_20b <- data.frame(hsbstate_truth_S5_R75_20b)[-1]

hsbstate_truth_S5_R75_20b$location <- 'hstatebins'
hsbstate_truth_S5_R75_20b$detection <- 0.5
hsbstate_truth_S5_R75_20b$eradication <- 0.75
hsbstate_truth_S5_R75_20b$budget <- 20
hsbstate_truth_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_20 <- fread(file_name)
epistate_truth_S5_R75_20 <- data.frame(epistate_truth_S5_R75_20)[-1]

epistate_truth_S5_R75_20$location <- 'epicenter'
epistate_truth_S5_R75_20$detection <- 0.5
epistate_truth_S5_R75_20$eradication <- 0.75
epistate_truth_S5_R75_20$budget <- 20
epistate_truth_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_20b <- fread(file_name)
epistate_truth_S5_R75_20b <- data.frame(epistate_truth_S5_R75_20b)[-1]

epistate_truth_S5_R75_20b$location <- 'epicenter'
epistate_truth_S5_R75_20b$detection <- 0.5
epistate_truth_S5_R75_20b$eradication <- 0.75
epistate_truth_S5_R75_20b$budget <- 20
epistate_truth_S5_R75_20b$data <- 'both'

#--- Combine state_truths ---#
state_truth_20 <- rbind(hsbstate_truth_S5_R75_20,hsbstate_truth_S5_R75_20b,
                        epistate_truth_S5_R75_20,epistate_truth_S5_R75_20b)


state_truth <- rbind(state_truth_20)

#### Bias state ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_20 <- fread(file_name)
hsb_biasstate_S5_R75_20 <- data.frame(hsb_biasstate_S5_R75_20)[-1]

hsb_biasstate_S5_R75_20$location <- 'hstatebins'
hsb_biasstate_S5_R75_20$detection <- 0.5
hsb_biasstate_S5_R75_20$eradication <- 0.75
hsb_biasstate_S5_R75_20$budget <- 20
hsb_biasstate_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_20b <- fread(file_name)
hsb_biasstate_S5_R75_20b <- data.frame(hsb_biasstate_S5_R75_20b)[-1]

hsb_biasstate_S5_R75_20b$location <- 'hstatebins'
hsb_biasstate_S5_R75_20b$detection <- 0.5
hsb_biasstate_S5_R75_20b$eradication <- 0.75
hsb_biasstate_S5_R75_20b$budget <- 20
hsb_biasstate_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_20 <- fread(file_name)
epi_biasstate_S5_R75_20 <- data.frame(epi_biasstate_S5_R75_20)[-1]

epi_biasstate_S5_R75_20$location <- 'epicenter'
epi_biasstate_S5_R75_20$detection <- 0.5
epi_biasstate_S5_R75_20$eradication <- 0.75
epi_biasstate_S5_R75_20$budget <- 20
epi_biasstate_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_20b <- fread(file_name)
epi_biasstate_S5_R75_20b <- data.frame(epi_biasstate_S5_R75_20b)[-1]

epi_biasstate_S5_R75_20b$location <- 'epicenter'
epi_biasstate_S5_R75_20b$detection <- 0.5
epi_biasstate_S5_R75_20b$eradication <- 0.75
epi_biasstate_S5_R75_20b$budget <- 20
epi_biasstate_S5_R75_20b$data <- 'both'

#--- Combine bias_states ---#
bias_state_20 <- rbind(hsb_biasstate_S5_R75_20,hsb_biasstate_S5_R75_20b,
                       epi_biasstate_S5_R75_20,epi_biasstate_S5_R75_20b)

#-- Combine Bias --#
bias_state <- rbind(bias_state_20)

#### Bias params ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_20 <- fread(file_name)
hsb_biasparam_S5_R75_20 <- data.frame(hsb_biasparam_S5_R75_20)[-1]

hsb_biasparam_S5_R75_20$location <- 'hstatebins'
hsb_biasparam_S5_R75_20$detection <- 0.5
hsb_biasparam_S5_R75_20$eradication <- 0.75
hsb_biasparam_S5_R75_20$budget <- 20
hsb_biasparam_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget20\\hstatebins_S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_20b <- fread(file_name)
hsb_biasparam_S5_R75_20b <- data.frame(hsb_biasparam_S5_R75_20b)[-1]

hsb_biasparam_S5_R75_20b$location <- 'hstatebins'
hsb_biasparam_S5_R75_20b$detection <- 0.5
hsb_biasparam_S5_R75_20b$eradication <- 0.75
hsb_biasparam_S5_R75_20b$budget <- 20
hsb_biasparam_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_20 <- fread(file_name)
epi_biasparam_S5_R75_20 <- data.frame(epi_biasparam_S5_R75_20)[-1]

epi_biasparam_S5_R75_20$location <- 'epicenter'
epi_biasparam_S5_R75_20$detection <- 0.5
epi_biasparam_S5_R75_20$eradication <- 0.75
epi_biasparam_S5_R75_20$budget <- 20
epi_biasparam_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results-datboth\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_20b <- fread(file_name)
epi_biasparam_S5_R75_20b <- data.frame(epi_biasparam_S5_R75_20b)[-1]

epi_biasparam_S5_R75_20b$location <- 'epicenter'
epi_biasparam_S5_R75_20b$detection <- 0.5
epi_biasparam_S5_R75_20b$eradication <- 0.75
epi_biasparam_S5_R75_20b$budget <- 20
epi_biasparam_S5_R75_20b$data <- 'both'

#--- Combine bias_params ---#
bias_param_20 <- rbind(hsb_biasparam_S5_R75_20,hsb_biasparam_S5_R75_20b,
                       epi_biasparam_S5_R75_20,epi_biasparam_S5_R75_20b)

#-- Combine bias --#
bias_params <- rbind(bias_param_20)

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

