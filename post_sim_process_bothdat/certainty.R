library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States truth ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_datboth\\budget40\\epicenter_S5_R75_40_certain'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40 <- fread(file_name)
epistate_truth_S5_R75_40 <- data.frame(epistate_truth_S5_R75_40)[-1]

epistate_truth_S5_R75_40$location <- 'epicenter'
epistate_truth_S5_R75_40$detection <- 0.5
epistate_truth_S5_R75_40$eradication <- 0.5
epistate_truth_S5_R75_40$budget <- 40
epistate_truth_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_datboth\\budget40\\epicenter_S5_R75_40_certain_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40b <- fread(file_name)
epistate_truth_S5_R75_40b <- data.frame(epistate_truth_S5_R75_40b)[-1]

epistate_truth_S5_R75_40b$location <- 'epicenter'
epistate_truth_S5_R75_40b$detection <- 0.5
epistate_truth_S5_R75_40b$eradication <- 0.5
epistate_truth_S5_R75_40b$budget <- 40
epistate_truth_S5_R75_40b$data <- 'both'


states_fin_truth <- epistate_truth_S5_R75_40b %>% filter(week == 5 & year == 10)

finstate_truth <- aggregate(state ~ sim + location + detection + eradication + budget, 
                            data = as.data.frame(states_fin_truth), 
                            FUN = mean)

finstate_truth %>% 
  filter(budget == 40) %>% 
  summarise(mean_c = mean(state),
            max_c = max(state),
            lower = quantile(state, 0.1),
            upper = quantile(state, 0.9))

