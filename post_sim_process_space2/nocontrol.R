library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States truth ####
path <- 'E:\\Chapter3\\results_space2\\noremoval\\noremoval'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_noremoval <- fread(file_name)
state_truth_noremoval <- data.frame(state_truth_noremoval)[-1]

state_truth_noremoval$location <- 'noremoval'
state_truth_noremoval$detection <- 0
state_truth_noremoval$eradication <- 0
state_truth_noremoval$budget <- 0

path <- 'E:\\Chapter3\\results_space2\\noremoval\\noremoval_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_noremovalb <- fread(file_name)
state_truth_noremovalb <- data.frame(state_truth_noremovalb)[-1]

state_truth_noremovalb$location <- 'noremoval'
state_truth_noremovalb$detection <- 0
state_truth_noremovalb$eradication <- 0
state_truth_noremovalb$budget <- 0

state_truth_all <- rbind(state_truth_noremoval, state_truth_noremovalb)

#### Save CSVs ####
path <- 'E:\\Chapter3\\results_space2\\noremoval'

file_name = paste(path, 'states_truth.csv',sep = '/')
fwrite(state_truth_all,file_name)

state_truth_all_fin <- state_truth_all %>% filter(week == 5 & year == 10)
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
fwrite(state_truth_all_fin,file_name)

