library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States ####

#### States truth ####
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_20 <- fread(file_name)
epistate_truth_S5_R75_20 <- data.frame(epistate_truth_S5_R75_20)[-1]

epistate_truth_S5_R75_20$location <- 'epicenter'
epistate_truth_S5_R75_20$detection <- 0.5
epistate_truth_S5_R75_20$eradication <- 0.75
epistate_truth_S5_R75_20$budget <- 20
epistate_truth_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_20b <- fread(file_name)
epistate_truth_S5_R75_20b <- data.frame(epistate_truth_S5_R75_20b)[-1]

epistate_truth_S5_R75_20b$location <- 'epicenter'
epistate_truth_S5_R75_20b$detection <- 0.5
epistate_truth_S5_R75_20b$eradication <- 0.75
epistate_truth_S5_R75_20b$budget <- 20
epistate_truth_S5_R75_20b$data <- 'both'

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
epilin_truth_S5_R75_20 <- fread(file_name)
epilin_truth_S5_R75_20 <- data.frame(epilin_truth_S5_R75_20)[-1]

epilin_truth_S5_R75_20$location <- 'linear'
epilin_truth_S5_R75_20$detection <- 0.5
epilin_truth_S5_R75_20$eradication <- 0.75
epilin_truth_S5_R75_20$budget <- 20
epilin_truth_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epilin_truth_S5_R75_20b <- fread(file_name)
epilin_truth_S5_R75_20b <- data.frame(epilin_truth_S5_R75_20b)[-1]

epilin_truth_S5_R75_20b$location <- 'linear'
epilin_truth_S5_R75_20b$detection <- 0.5
epilin_truth_S5_R75_20b$eradication <- 0.75
epilin_truth_S5_R75_20b$budget <- 20
epilin_truth_S5_R75_20b$data <- 'both'


#--- Combine state_truths ---#
state_truth_20 <- rbind(
                        epistate_truth_S5_R75_20,epistate_truth_S5_R75_20b,
                        epilin_truth_S5_R75_20,epilin_truth_S5_R75_20b)


state_truth <- rbind(state_truth_20)

#### Bias state ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_20 <- fread(file_name)
epi_biasstate_S5_R75_20 <- data.frame(epi_biasstate_S5_R75_20)[-1]

epi_biasstate_S5_R75_20$location <- 'epicenter'
epi_biasstate_S5_R75_20$detection <- 0.5
epi_biasstate_S5_R75_20$eradication <- 0.75
epi_biasstate_S5_R75_20$budget <- 20
epi_biasstate_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_20b <- fread(file_name)
epi_biasstate_S5_R75_20b <- data.frame(epi_biasstate_S5_R75_20b)[-1]

epi_biasstate_S5_R75_20b$location <- 'epicenter'
epi_biasstate_S5_R75_20b$detection <- 0.5
epi_biasstate_S5_R75_20b$eradication <- 0.75
epi_biasstate_S5_R75_20b$budget <- 20
epi_biasstate_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
lin_biasstate_S5_R75_20 <- fread(file_name)
lin_biasstate_S5_R75_20 <- data.frame(lin_biasstate_S5_R75_20)[-1]

lin_biasstate_S5_R75_20$location <- 'linear'
lin_biasstate_S5_R75_20$detection <- 0.5
lin_biasstate_S5_R75_20$eradication <- 0.75
lin_biasstate_S5_R75_20$budget <- 20
lin_biasstate_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
lin_biasstate_S5_R75_20b <- fread(file_name)
lin_biasstate_S5_R75_20b <- data.frame(lin_biasstate_S5_R75_20b)[-1]

lin_biasstate_S5_R75_20b$location <- 'linear'
lin_biasstate_S5_R75_20b$detection <- 0.5
lin_biasstate_S5_R75_20b$eradication <- 0.75
lin_biasstate_S5_R75_20b$budget <- 20
lin_biasstate_S5_R75_20b$data <- 'both'


#--- Combine bias_states ---#
bias_state_20 <- rbind(
                       epi_biasstate_S5_R75_20,epi_biasstate_S5_R75_20b,
                       lin_biasstate_S5_R75_20,lin_biasstate_S5_R75_20b)


#-- Combine Bias --#
bias_state <- rbind(bias_state_20)

#### Bias params ####
#-- Budget = 20 --#

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_20 <- fread(file_name)
epi_biasparam_S5_R75_20 <- data.frame(epi_biasparam_S5_R75_20)[-1]

epi_biasparam_S5_R75_20$location <- 'epicenter'
epi_biasparam_S5_R75_20$detection <- 0.5
epi_biasparam_S5_R75_20$eradication <- 0.75
epi_biasparam_S5_R75_20$budget <- 20
epi_biasparam_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_20b <- fread(file_name)
epi_biasparam_S5_R75_20b <- data.frame(epi_biasparam_S5_R75_20b)[-1]

epi_biasparam_S5_R75_20b$location <- 'epicenter'
epi_biasparam_S5_R75_20b$detection <- 0.5
epi_biasparam_S5_R75_20b$eradication <- 0.75
epi_biasparam_S5_R75_20b$budget <- 20
epi_biasparam_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
lin_biasparam_S5_R75_20 <- fread(file_name)
lin_biasparam_S5_R75_20 <- data.frame(lin_biasparam_S5_R75_20)[-1]

lin_biasparam_S5_R75_20$location <- 'linear'
lin_biasparam_S5_R75_20$detection <- 0.5
lin_biasparam_S5_R75_20$eradication <- 0.75
lin_biasparam_S5_R75_20$budget <- 20
lin_biasparam_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
lin_biasparam_S5_R75_20b <- fread(file_name)
lin_biasparam_S5_R75_20b <- data.frame(lin_biasparam_S5_R75_20b)[-1]

lin_biasparam_S5_R75_20b$location <- 'linear'
lin_biasparam_S5_R75_20b$detection <- 0.5
lin_biasparam_S5_R75_20b$eradication <- 0.75
lin_biasparam_S5_R75_20b$budget <- 20
lin_biasparam_S5_R75_20b$data <- 'both'

#--- Combine bias_params ---#
bias_param_20 <- rbind(
                       epi_biasparam_S5_R75_20,epi_biasparam_S5_R75_20b,
                       lin_biasparam_S5_R75_20,lin_biasparam_S5_R75_20b)

#-- Combine bias --#
bias_params <- rbind(bias_param_20)



#### Save CSVs ####
path <- 'E:\\Chapter3\\results_both'

file_name = paste(path, 'states_truth.csv',sep = '/')
fwrite(state_truth,file_name)

state_truth_all_fin <- state_truth %>% filter(week == 5 & year == 10)
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
fwrite(state_truth_all_fin,file_name)

file_name = paste(path, 'bias_state.csv',sep = '/')
fwrite(bias_state,file_name)

file_name = paste(path, 'bias_params.csv',sep = '/')
fwrite(bias_params,file_name)

