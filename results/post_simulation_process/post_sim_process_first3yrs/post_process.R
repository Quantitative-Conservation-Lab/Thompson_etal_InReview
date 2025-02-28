library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States ####
#-Budget 20-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_20'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s1_20 <- fread(file_name)
first3state_s1_20 <- data.frame(first3state_s1_20)[-1]
first3state_s1_20$budget <- 20
first3state_s1_20$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_20_b'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s1_20b <- fread(file_name)
first3state_s1_20b <- data.frame(first3state_s1_20b)[-1]
first3state_s1_20b$budget <- 20
first3state_s1_20b$space <- 'space1'
first3state_s1_20b$sim <- first3state_s1_20b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_20'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s2_20 <- fread(file_name)
first3state_s2_20 <- data.frame(first3state_s2_20)[-1]
first3state_s2_20$budget <- 20
first3state_s2_20$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_20_b'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s2_20b <- fread(file_name)
first3state_s2_20b <- data.frame(first3state_s2_20b)[-1]
first3state_s2_20b$budget <- 20
first3state_s2_20b$space <- 'space2'
first3state_s2_20b$sim <- first3state_s2_20b$sim + 100

#-Budget 40-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_40'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s1_40 <- fread(file_name)
first3state_s1_40 <- data.frame(first3state_s1_40)[-1]
first3state_s1_40$budget <- 40
first3state_s1_40$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_40_b'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s1_40b <- fread(file_name)
first3state_s1_40b <- data.frame(first3state_s1_40b)[-1]
first3state_s1_40b$budget <- 40
first3state_s1_40b$space <- 'space1'
first3state_s1_40b$sim <- first3state_s1_40b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_40'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s2_40 <- fread(file_name)
first3state_s2_40 <- data.frame(first3state_s2_40)[-1]
first3state_s2_40$budget <- 40
first3state_s2_40$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_40_b'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s2_40b <- fread(file_name)
first3state_s2_40b <- data.frame(first3state_s2_40b)[-1]
first3state_s2_40b$budget <- 40
first3state_s2_40b$space <- 'space2'
first3state_s2_40b$sim <- first3state_s2_40b$sim + 100

#-Budget 60-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_60'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s1_60 <- fread(file_name)
first3state_s1_60 <- data.frame(first3state_s1_60)[-1]
first3state_s1_60$budget <- 60
first3state_s1_60$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_60_b'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s1_60b <- fread(file_name)
first3state_s1_60b <- data.frame(first3state_s1_60b)[-1]
first3state_s1_60b$budget <- 60
first3state_s1_60b$space <- 'space1'
first3state_s1_60b$sim <- first3state_s1_60b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_60'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s2_60 <- fread(file_name)
first3state_s2_60 <- data.frame(first3state_s2_60)[-1]
first3state_s2_60$budget <- 60
first3state_s2_60$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_60_b'
file_name = paste(path, 'states.csv',sep = '/')
first3state_s2_60b <- fread(file_name)
first3state_s2_60b <- data.frame(first3state_s2_60b)[-1]
first3state_s2_60b$budget <- 60
first3state_s2_60b$space <- 'space2'
first3state_s2_60b$sim <- first3state_s2_60b$sim + 100

#--- Combine states ---#
states <- rbind(first3state_s1_20,first3state_s1_20b,
                  first3state_s2_20,first3state_s2_20b,
                  first3state_s1_40,first3state_s1_40b,
                  first3state_s2_40,first3state_s2_40b,
                  first3state_s1_60,first3state_s1_60b,
                  first3state_s2_60,first3state_s2_60b)

#### States truth ####
#-Budget 20-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s1_20 <- fread(file_name)
first3statetruth_s1_20 <- data.frame(first3statetruth_s1_20)[-1]
first3statetruth_s1_20$budget <- 20
first3statetruth_s1_20$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s1_20b <- fread(file_name)
first3statetruth_s1_20b <- data.frame(first3statetruth_s1_20b)[-1]
first3statetruth_s1_20b$budget <- 20
first3statetruth_s1_20b$space <- 'space1'
first3statetruth_s1_20b$sim <- first3statetruth_s1_20b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s2_20 <- fread(file_name)
first3statetruth_s2_20 <- data.frame(first3statetruth_s2_20)[-1]
first3statetruth_s2_20$budget <- 20
first3statetruth_s2_20$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s2_20b <- fread(file_name)
first3statetruth_s2_20b <- data.frame(first3statetruth_s2_20b)[-1]
first3statetruth_s2_20b$budget <- 20
first3statetruth_s2_20b$space <- 'space2'
first3statetruth_s2_20b$sim <- first3statetruth_s2_20b$sim + 100

#-Budget 40-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s1_40 <- fread(file_name)
first3statetruth_s1_40 <- data.frame(first3statetruth_s1_40)[-1]
first3statetruth_s1_40$budget <- 40
first3statetruth_s1_40$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s1_40b <- fread(file_name)
first3statetruth_s1_40b <- data.frame(first3statetruth_s1_40b)[-1]
first3statetruth_s1_40b$budget <- 40
first3statetruth_s1_40b$space <- 'space1'
first3statetruth_s1_40b$sim <- first3statetruth_s1_40b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s2_40 <- fread(file_name)
first3statetruth_s2_40 <- data.frame(first3statetruth_s2_40)[-1]
first3statetruth_s2_40$budget <- 40
first3statetruth_s2_40$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s2_40b <- fread(file_name)
first3statetruth_s2_40b <- data.frame(first3statetruth_s2_40b)[-1]
first3statetruth_s2_40b$budget <- 40
first3statetruth_s2_40b$space <- 'space2'
first3statetruth_s2_40b$sim <- first3statetruth_s2_40b$sim + 100

#-Budget 60-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s1_60 <- fread(file_name)
first3statetruth_s1_60 <- data.frame(first3statetruth_s1_60)[-1]
first3statetruth_s1_60$budget <- 60
first3statetruth_s1_60$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s1_60b <- fread(file_name)
first3statetruth_s1_60b <- data.frame(first3statetruth_s1_60b)[-1]
first3statetruth_s1_60b$budget <- 60
first3statetruth_s1_60b$space <- 'space1'
first3statetruth_s1_60b$sim <- first3statetruth_s1_60b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s2_60 <- fread(file_name)
first3statetruth_s2_60 <- data.frame(first3statetruth_s2_60)[-1]
first3statetruth_s2_60$budget <- 60
first3statetruth_s2_60$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
first3statetruth_s2_60b <- fread(file_name)
first3statetruth_s2_60b <- data.frame(first3statetruth_s2_60b)[-1]
first3statetruth_s2_60b$budget <- 60
first3statetruth_s2_60b$space <- 'space2'
first3statetruth_s2_60b$sim <- first3statetruth_s2_60b$sim + 100

#--- Combine states ---#
states_truth <- rbind(first3statetruth_s1_20,first3statetruth_s1_20b,
                first3statetruth_s2_20,first3statetruth_s2_20b,
                first3statetruth_s1_40,first3statetruth_s1_40b,
                first3statetruth_s2_40,first3statetruth_s2_40b,
                first3statetruth_s1_60,first3statetruth_s1_60b,
                first3statetruth_s2_60,first3statetruth_s2_60b)

#### Bias state ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')

#-Budget 20-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s1_20 <- fread(file_name)
first3statebias_s1_20 <- data.frame(first3statebias_s1_20)[-1]
first3statebias_s1_20$budget <- 20
first3statebias_s1_20$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s1_20b <- fread(file_name)
first3statebias_s1_20b <- data.frame(first3statebias_s1_20b)[-1]
first3statebias_s1_20b$budget <- 20
first3statebias_s1_20b$space <- 'space1'
first3statebias_s1_20b$sim <- first3statebias_s1_20b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s2_20 <- fread(file_name)
first3statebias_s2_20 <- data.frame(first3statebias_s2_20)[-1]
first3statebias_s2_20$budget <- 20
first3statebias_s2_20$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s2_20b <- fread(file_name)
first3statebias_s2_20b <- data.frame(first3statebias_s2_20b)[-1]
first3statebias_s2_20b$budget <- 20
first3statebias_s2_20b$space <- 'space2'
first3statebias_s2_20b$sim <- first3statebias_s2_20b$sim + 100

#-Budget 40-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s1_40 <- fread(file_name)
first3statebias_s1_40 <- data.frame(first3statebias_s1_40)[-1]
first3statebias_s1_40$budget <- 40
first3statebias_s1_40$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s1_40b <- fread(file_name)
first3statebias_s1_40b <- data.frame(first3statebias_s1_40b)[-1]
first3statebias_s1_40b$budget <- 40
first3statebias_s1_40b$space <- 'space1'
first3statebias_s1_40b$sim <- first3statebias_s1_40b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s2_40 <- fread(file_name)
first3statebias_s2_40 <- data.frame(first3statebias_s2_40)[-1]
first3statebias_s2_40$budget <- 40
first3statebias_s2_40$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s2_40b <- fread(file_name)
first3statebias_s2_40b <- data.frame(first3statebias_s2_40b)[-1]
first3statebias_s2_40b$budget <- 40
first3statebias_s2_40b$space <- 'space2'
first3statebias_s2_40b$sim <- first3statebias_s2_40b$sim + 100

#-Budget 60-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s1_60 <- fread(file_name)
first3statebias_s1_60 <- data.frame(first3statebias_s1_60)[-1]
first3statebias_s1_60$budget <- 60
first3statebias_s1_60$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s1_60b <- fread(file_name)
first3statebias_s1_60b <- data.frame(first3statebias_s1_60b)[-1]
first3statebias_s1_60b$budget <- 60
first3statebias_s1_60b$space <- 'space1'
first3statebias_s1_60b$sim <- first3statebias_s1_60b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s2_60 <- fread(file_name)
first3statebias_s2_60 <- data.frame(first3statebias_s2_60)[-1]
first3statebias_s2_60$budget <- 60
first3statebias_s2_60$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
first3statebias_s2_60b <- fread(file_name)
first3statebias_s2_60b <- data.frame(first3statebias_s2_60b)[-1]
first3statebias_s2_60b$budget <- 60
first3statebias_s2_60b$space <- 'space2'
first3statebias_s2_60b$sim <- first3statebias_s2_60b$sim + 100

#--- Combine states ---#
bias_state <- rbind(first3statebias_s1_20,first3statebias_s1_20b,
                first3statebias_s2_20,first3statebias_s2_20b,
                first3statebias_s1_40,first3statebias_s1_40b,
                first3statebias_s2_40,first3statebias_s2_40b,
                first3statebias_s1_60,first3statebias_s1_60b,
                first3statebias_s2_60,first3statebias_s2_60b)

#### Bias params ####
#-Budget 20-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s1_20 <- fread(file_name)
first3parambias_s1_20 <- data.frame(first3parambias_s1_20)[-1]
first3parambias_s1_20$budget <- 20
first3parambias_s1_20$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s1_20b <- fread(file_name)
first3parambias_s1_20b <- data.frame(first3parambias_s1_20b)[-1]
first3parambias_s1_20b$budget <- 20
first3parambias_s1_20b$space <- 'space1'
first3parambias_s1_20b$sim <- first3parambias_s1_20b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s2_20 <- fread(file_name)
first3parambias_s2_20 <- data.frame(first3parambias_s2_20)[-1]
first3parambias_s2_20$budget <- 20
first3parambias_s2_20$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s2_20b <- fread(file_name)
first3parambias_s2_20b <- data.frame(first3parambias_s2_20b)[-1]
first3parambias_s2_20b$budget <- 20
first3parambias_s2_20b$space <- 'space2'
first3parambias_s2_20b$sim <- first3parambias_s2_20b$sim + 100

#-Budget 40-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s1_40 <- fread(file_name)
first3parambias_s1_40 <- data.frame(first3parambias_s1_40)[-1]
first3parambias_s1_40$budget <- 40
first3parambias_s1_40$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s1_40b <- fread(file_name)
first3parambias_s1_40b <- data.frame(first3parambias_s1_40b)[-1]
first3parambias_s1_40b$budget <- 40
first3parambias_s1_40b$space <- 'space1'
first3parambias_s1_40b$sim <- first3parambias_s1_40b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s2_40 <- fread(file_name)
first3parambias_s2_40 <- data.frame(first3parambias_s2_40)[-1]
first3parambias_s2_40$budget <- 40
first3parambias_s2_40$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s2_40b <- fread(file_name)
first3parambias_s2_40b <- data.frame(first3parambias_s2_40b)[-1]
first3parambias_s2_40b$budget <- 40
first3parambias_s2_40b$space <- 'space2'
first3parambias_s2_40b$sim <- first3parambias_s2_40b$sim + 100

#-Budget 60-#
#-- space 1 --#
path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s1_60 <- fread(file_name)
first3parambias_s1_60 <- data.frame(first3parambias_s1_60)[-1]
first3parambias_s1_60$budget <- 60
first3parambias_s1_60$space <- 'space1'

path <- 'E:\\Chapter3\\results\\first3yrs\\first3yrs_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s1_60b <- fread(file_name)
first3parambias_s1_60b <- data.frame(first3parambias_s1_60b)[-1]
first3parambias_s1_60b$budget <- 60
first3parambias_s1_60b$space <- 'space1'
first3parambias_s1_60b$sim <- first3parambias_s1_60b$sim + 100

#-- space 2 --#
path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s2_60 <- fread(file_name)
first3parambias_s2_60 <- data.frame(first3parambias_s2_60)[-1]
first3parambias_s2_60$budget <- 60
first3parambias_s2_60$space <- 'space2'

path <- 'E:\\Chapter3\\results-space2\\first3yrs\\first3yrs_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
first3parambias_s2_60b <- fread(file_name)
first3parambias_s2_60b <- data.frame(first3parambias_s2_60b)[-1]
first3parambias_s2_60b$budget <- 60
first3parambias_s2_60b$space <- 'space2'
first3parambias_s2_60b$sim <- first3parambias_s2_60b$sim + 100

#--- Combine states ---#
bias_params <- rbind(first3parambias_s1_20,first3parambias_s1_20b,
                    first3parambias_s2_20,first3parambias_s2_20b,
                    first3parambias_s1_40,first3parambias_s1_40b,
                    first3parambias_s2_40,first3parambias_s2_40b,
                    first3parambias_s1_60,first3parambias_s1_60b,
                    first3parambias_s2_60,first3parambias_s2_60b)



#### Save CSVs ####
path <- 'E:\\Chapter3\\results_3yrs'

file_name = paste(path, 'states.csv',sep = '/')
fwrite(states,file_name)

states_fin <- states %>% filter(year == 3)
file_name = paste(path, 'states_fin.csv',sep = '/')
fwrite(states_fin,file_name)

file_name = paste(path, 'states_truth.csv',sep = '/')
fwrite(states_truth,file_name)

state_truth_all_fin <- states_truth %>% filter(week == 5 & year == 3)
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
fwrite(state_truth_all_fin,file_name)

file_name = paste(path, 'bias_state.csv',sep = '/')
fwrite(bias_state,file_name)

file_name = paste(path, 'bias_params.csv',sep = '/')
fwrite(bias_params,file_name)

