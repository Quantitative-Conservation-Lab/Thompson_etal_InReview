library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States ####
#-Budget 20-#
#-- epicenter_S25_R75 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_20 <- fread(file_name)
epistate_S25_R75_20 <- data.frame(epistate_S25_R75_20)[-1]

epistate_S25_R75_20$location <- 'epicenter'
epistate_S25_R75_20$detection <- 0.25
epistate_S25_R75_20$eradication <- 0.75
epistate_S25_R75_20$budget <- 20
epistate_S25_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_20b <- fread(file_name)
epistate_S25_R75_20b <- data.frame(epistate_S25_R75_20b)[-1]

epistate_S25_R75_20b$location <- 'epicenter'
epistate_S25_R75_20b$detection <- 0.25
epistate_S25_R75_20b$eradication <- 0.75
epistate_S25_R75_20b$budget <- 20
epistate_S25_R75_20b$data <- 'both'

#-- epicenter_S5_R75 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_20 <- fread(file_name)
epistate_S5_R75_20 <- data.frame(epistate_S5_R75_20)[-1]

epistate_S5_R75_20$location <- 'epicenter'
epistate_S5_R75_20$detection <- 0.5
epistate_S5_R75_20$eradication <- 0.75
epistate_S5_R75_20$budget <- 20
epistate_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_20b <- fread(file_name)
epistate_S5_R75_20b <- data.frame(epistate_S5_R75_20b)[-1]

epistate_S5_R75_20b$location <- 'epicenter'
epistate_S5_R75_20b$detection <- 0.5
epistate_S5_R75_20b$eradication <- 0.75
epistate_S5_R75_20b$budget <- 20
epistate_S5_R75_20b$data <- 'both'

#-- linear_S5_R75 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
linstate_S5_R75_20 <- fread(file_name)
linstate_S5_R75_20 <- data.frame(linstate_S5_R75_20)[-1]

linstate_S5_R75_20$location <- 'linear'
linstate_S5_R75_20$detection <- 0.5
linstate_S5_R75_20$eradication <- 0.75
linstate_S5_R75_20$budget <- 20
linstate_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
linstate_S5_R75_20b <- fread(file_name)
linstate_S5_R75_20b <- data.frame(linstate_S5_R75_20b)[-1]

linstate_S5_R75_20b$location <- 'linear'
linstate_S5_R75_20b$detection <- 0.5
linstate_S5_R75_20b$eradication <- 0.75
linstate_S5_R75_20b$budget <- 20
linstate_S5_R75_20b$data <- 'both'



#--- Combine states ---#
state_20 <- rbind(epistate_S25_R75_20, epistate_S25_R75_20b, 
                  epistate_S5_R75_20, epistate_S5_R75_20b,
                  linstate_S5_R75_20, linstate_S5_R75_20b)

#-Budget 40 - #
#-- epicenter_S25_R75 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_40 <- fread(file_name)
epistate_S25_R75_40 <- data.frame(epistate_S25_R75_40)[-1]

epistate_S25_R75_40$location <- 'epicenter'
epistate_S25_R75_40$detection <- 0.25
epistate_S25_R75_40$eradication <- 0.75
epistate_S25_R75_40$budget <- 40
epistate_S25_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_40b <- fread(file_name)
epistate_S25_R75_40b <- data.frame(epistate_S25_R75_40b)[-1]

epistate_S25_R75_40b$location <- 'epicenter'
epistate_S25_R75_40b$detection <- 0.25
epistate_S25_R75_40b$eradication <- 0.75
epistate_S25_R75_40b$budget <- 40
epistate_S25_R75_40b$data <- 'both'

#-- epicenter_S5_R75 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_40 <- fread(file_name)
epistate_S5_R75_40 <- data.frame(epistate_S5_R75_40)[-1]

epistate_S5_R75_40$location <- 'epicenter'
epistate_S5_R75_40$detection <- 0.5
epistate_S5_R75_40$eradication <- 0.75
epistate_S5_R75_40$budget <- 40
epistate_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_40b <- fread(file_name)
epistate_S5_R75_40b <- data.frame(epistate_S5_R75_40b)[-1]

epistate_S5_R75_40b$location <- 'epicenter'
epistate_S5_R75_40b$detection <- 0.5
epistate_S5_R75_40b$eradication <- 0.75
epistate_S5_R75_40b$budget <- 40
epistate_S5_R75_40b$data <- 'both'

#-- linear_S5_R75 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
linstate_S5_R75_40 <- fread(file_name)
linstate_S5_R75_40 <- data.frame(linstate_S5_R75_40)[-1]

linstate_S5_R75_40$location <- 'linear'
linstate_S5_R75_40$detection <- 0.5
linstate_S5_R75_40$eradication <- 0.75
linstate_S5_R75_40$budget <- 40
linstate_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
linstate_S5_R75_40b <- fread(file_name)
linstate_S5_R75_40b <- data.frame(linstate_S5_R75_40b)[-1]

linstate_S5_R75_40b$location <- 'linear'
linstate_S5_R75_40b$detection <- 0.5
linstate_S5_R75_40b$eradication <- 0.75
linstate_S5_R75_40b$budget <- 40
linstate_S5_R75_40b$data <- 'both'



#--- Combine states ---#
state_40 <- rbind(epistate_S25_R75_40, epistate_S25_R75_40b, 
                  epistate_S5_R75_40, epistate_S5_R75_40b,
                  linstate_S5_R75_40, linstate_S5_R75_40b)


#- Budget 60 -#
#-- epicenter_S25_R75 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_60 <- fread(file_name)
epistate_S25_R75_60 <- data.frame(epistate_S25_R75_60)[-1]

epistate_S25_R75_60$location <- 'epicenter'
epistate_S25_R75_60$detection <- 0.25
epistate_S25_R75_60$eradication <- 0.75
epistate_S25_R75_60$budget <- 60
epistate_S25_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_60b <- fread(file_name)
epistate_S25_R75_60b <- data.frame(epistate_S25_R75_60b)[-1]

epistate_S25_R75_60b$location <- 'epicenter'
epistate_S25_R75_60b$detection <- 0.25
epistate_S25_R75_60b$eradication <- 0.75
epistate_S25_R75_60b$budget <- 60
epistate_S25_R75_60b$data <- 'both'

#-- epicenter_S5_R75 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_60 <- fread(file_name)
epistate_S5_R75_60 <- data.frame(epistate_S5_R75_60)[-1]

epistate_S5_R75_60$location <- 'epicenter'
epistate_S5_R75_60$detection <- 0.5
epistate_S5_R75_60$eradication <- 0.75
epistate_S5_R75_60$budget <- 60
epistate_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_60b <- fread(file_name)
epistate_S5_R75_60b <- data.frame(epistate_S5_R75_60b)[-1]

epistate_S5_R75_60b$location <- 'epicenter'
epistate_S5_R75_60b$detection <- 0.5
epistate_S5_R75_60b$eradication <- 0.75
epistate_S5_R75_60b$budget <- 60
epistate_S5_R75_60b$data <- 'both'

#-- linear_S5_R75 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
linstate_S5_R75_60 <- fread(file_name)
linstate_S5_R75_60 <- data.frame(linstate_S5_R75_60)[-1]

linstate_S5_R75_60$location <- 'linear'
linstate_S5_R75_60$detection <- 0.5
linstate_S5_R75_60$eradication <- 0.75
linstate_S5_R75_60$budget <- 60
linstate_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
linstate_S5_R75_60b <- fread(file_name)
linstate_S5_R75_60b <- data.frame(linstate_S5_R75_60b)[-1]

linstate_S5_R75_60b$location <- 'linear'
linstate_S5_R75_60b$detection <- 0.5
linstate_S5_R75_60b$eradication <- 0.75
linstate_S5_R75_60b$budget <- 60
linstate_S5_R75_60b$data <- 'both'


#--- Combine states ---#
state_60 <- rbind(epistate_S25_R75_60, epistate_S25_R75_60b, 
                  epistate_S5_R75_60, epistate_S5_R75_60b,
                  linstate_S5_R75_60, linstate_S5_R75_60b)



#-- Combine states --#
states <- rbind(state_20, state_40, state_60 )

#### States truth ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_20 <- fread(file_name)
epistate_truth_S25_R75_20 <- data.frame(epistate_truth_S25_R75_20)[-1]

epistate_truth_S25_R75_20$location <- 'epicenter'
epistate_truth_S25_R75_20$detection <- 0.25
epistate_truth_S25_R75_20$eradication <- 0.75
epistate_truth_S25_R75_20$budget <- 20
epistate_truth_S25_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_20b <- fread(file_name)
epistate_truth_S25_R75_20b <- data.frame(epistate_truth_S25_R75_20b)[-1]

epistate_truth_S25_R75_20b$location <- 'epicenter'
epistate_truth_S25_R75_20b$detection <- 0.25
epistate_truth_S25_R75_20b$eradication <- 0.75
epistate_truth_S25_R75_20b$budget <- 20
epistate_truth_S25_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_20 <- fread(file_name)
epistate_truth_S5_R75_20 <- data.frame(epistate_truth_S5_R75_20b)[-1]

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
state_truth_20 <- rbind(epistate_truth_S25_R75_20,epistate_truth_S25_R75_20b,
                        epistate_truth_S5_R75_20,epistate_truth_S5_R75_20b,
                        epilin_truth_S5_R75_20,epilin_truth_S5_R75_20b)

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_40 <- fread(file_name)
epistate_truth_S25_R75_40 <- data.frame(epistate_truth_S25_R75_40)[-1]

epistate_truth_S25_R75_40$location <- 'epicenter'
epistate_truth_S25_R75_40$detection <- 0.25
epistate_truth_S25_R75_40$eradication <- 0.75
epistate_truth_S25_R75_40$budget <- 40
epistate_truth_S25_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_40b <- fread(file_name)
epistate_truth_S25_R75_40b <- data.frame(epistate_truth_S25_R75_40b)[-1]

epistate_truth_S25_R75_40b$location <- 'epicenter'
epistate_truth_S25_R75_40b$detection <- 0.25
epistate_truth_S25_R75_40b$eradication <- 0.75
epistate_truth_S25_R75_40b$budget <- 40
epistate_truth_S25_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40 <- fread(file_name)
epistate_truth_S5_R75_40 <- data.frame(epistate_truth_S5_R75_40)[-1]

epistate_truth_S5_R75_40$location <- 'epicenter'
epistate_truth_S5_R75_40$detection <- 0.5
epistate_truth_S5_R75_40$eradication <- 0.75
epistate_truth_S5_R75_40$budget <- 40
epistate_truth_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40b <- fread(file_name)
epistate_truth_S5_R75_40b <- data.frame(epistate_truth_S5_R75_40b)[-1]

epistate_truth_S5_R75_40b$location <- 'epicenter'
epistate_truth_S5_R75_40b$detection <- 0.5
epistate_truth_S5_R75_40b$eradication <- 0.75
epistate_truth_S5_R75_40b$budget <- 40
epistate_truth_S5_R75_40b$data <- 'both'

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epilin_truth_S5_R75_40 <- fread(file_name)
epilin_truth_S5_R75_40 <- data.frame(epilin_truth_S5_R75_40b)[-1]

epilin_truth_S5_R75_40$location <- 'linear'
epilin_truth_S5_R75_40$detection <- 0.5
epilin_truth_S5_R75_40$eradication <- 0.75
epilin_truth_S5_R75_40$budget <- 40
epilin_truth_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epilin_truth_S5_R75_40b <- fread(file_name)
epilin_truth_S5_R75_40b <- data.frame(epilin_truth_S5_R75_40b)[-1]

epilin_truth_S5_R75_40b$location <- 'linear'
epilin_truth_S5_R75_40b$detection <- 0.5
epilin_truth_S5_R75_40b$eradication <- 0.75
epilin_truth_S5_R75_40b$budget <- 40
epilin_truth_S5_R75_40b$data <- 'both'


#--- Combine state_truths ---#
state_truth_40 <- rbind(epistate_truth_S25_R75_40,epistate_truth_S25_R75_40b,
                        epistate_truth_S5_R75_40,epistate_truth_S5_R75_40b,
                        epilin_truth_S5_R75_40,epilin_truth_S5_R75_40b)



#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_60 <- fread(file_name)
epistate_truth_S25_R75_60 <- data.frame(epistate_truth_S25_R75_60)[-1]

epistate_truth_S25_R75_60$location <- 'epicenter'
epistate_truth_S25_R75_60$detection <- 0.25
epistate_truth_S25_R75_60$eradication <- 0.75
epistate_truth_S25_R75_60$budget <- 60
epistate_truth_S25_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_60b <- fread(file_name)
epistate_truth_S25_R75_60b <- data.frame(epistate_truth_S25_R75_60b)[-1]

epistate_truth_S25_R75_60b$location <- 'epicenter'
epistate_truth_S25_R75_60b$detection <- 0.25
epistate_truth_S25_R75_60b$eradication <- 0.75
epistate_truth_S25_R75_60b$budget <- 60
epistate_truth_S25_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_60 <- fread(file_name)
epistate_truth_S5_R75_60 <- data.frame(epistate_truth_S5_R75_60)[-1]

epistate_truth_S5_R75_60$location <- 'epicenter'
epistate_truth_S5_R75_60$detection <- 0.5
epistate_truth_S5_R75_60$eradication <- 0.75
epistate_truth_S5_R75_60$budget <- 60
epistate_truth_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_60b <- fread(file_name)
epistate_truth_S5_R75_60b <- data.frame(epistate_truth_S5_R75_60b)[-1]

epistate_truth_S5_R75_60b$location <- 'epicenter'
epistate_truth_S5_R75_60b$detection <- 0.5
epistate_truth_S5_R75_60b$eradication <- 0.75
epistate_truth_S5_R75_60b$budget <- 60
epistate_truth_S5_R75_60b$data <- 'both'

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
epilin_truth_S5_R75_60 <- fread(file_name)
epilin_truth_S5_R75_60 <- data.frame(epilin_truth_S5_R75_60)[-1]

epilin_truth_S5_R75_60$location <- 'linear'
epilin_truth_S5_R75_60$detection <- 0.5
epilin_truth_S5_R75_60$eradication <- 0.75
epilin_truth_S5_R75_60$budget <- 60
epilin_truth_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epilin_truth_S5_R75_60b <- fread(file_name)
epilin_truth_S5_R75_60b <- data.frame(epilin_truth_S5_R75_60b)[-1]

epilin_truth_S5_R75_60b$location <- 'linear'
epilin_truth_S5_R75_60b$detection <- 0.5
epilin_truth_S5_R75_60b$eradication <- 0.75
epilin_truth_S5_R75_60b$budget <- 60
epilin_truth_S5_R75_60b$data <- 'both'


#--- Combine state_truths ---#
state_truth_60 <- rbind(epistate_truth_S25_R75_60,epistate_truth_S25_R75_60b,
                        epistate_truth_S5_R75_60,epistate_truth_S5_R75_60b,
                        epilin_truth_S5_R75_60,epilin_truth_S5_R75_60b)


state_truth <- rbind(state_truth_20, state_truth_40, state_truth_60)

#### Bias state ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_20 <- fread(file_name)
epi_biasstate_S25_R75_20 <- data.frame(epi_biasstate_S25_R75_20)[-1]

epi_biasstate_S25_R75_20$location <- 'epicenter'
epi_biasstate_S25_R75_20$detection <- 0.25
epi_biasstate_S25_R75_20$eradication <- 0.75
epi_biasstate_S25_R75_20$budget <- 20
epi_biasstate_S25_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_20b <- fread(file_name)
epi_biasstate_S25_R75_20b <- data.frame(epi_biasstate_S25_R75_20b)[-1]

epi_biasstate_S25_R75_20b$location <- 'epicenter'
epi_biasstate_S25_R75_20b$detection <- 0.25
epi_biasstate_S25_R75_20b$eradication <- 0.75
epi_biasstate_S25_R75_20b$budget <- 20
epi_biasstate_S25_R75_20b$data <- 'both'

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

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_20 <- fread(file_name)
epi_biasstate_S5_R75_20 <- data.frame(epi_biasstate_S5_R75_20)[-1]

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
bias_state_20 <- rbind(epi_biasstate_S25_R75_20,epi_biasstate_S25_R75_20b,
                       epi_biasstate_S5_R75_20,epi_biasstate_S5_R75_20b,
                       lin_biasstate_S5_R75_20,lin_biasstate_S5_R75_20b)

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_40 <- fread(file_name)
epi_biasstate_S25_R75_40 <- data.frame(epi_biasstate_S25_R75_40)[-1]

epi_biasstate_S25_R75_40$location <- 'epicenter'
epi_biasstate_S25_R75_40$detection <- 0.25
epi_biasstate_S25_R75_40$eradication <- 0.75
epi_biasstate_S25_R75_40$budget <- 40
epi_biasstate_S25_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_40b <- fread(file_name)
epi_biasstate_S25_R75_40b <- data.frame(epi_biasstate_S25_R75_40b)[-1]

epi_biasstate_S25_R75_40b$location <- 'epicenter'
epi_biasstate_S25_R75_40b$detection <- 0.25
epi_biasstate_S25_R75_40b$eradication <- 0.75
epi_biasstate_S25_R75_40b$budget <- 40
epi_biasstate_S25_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40 <- fread(file_name)
epi_biasstate_S5_R75_40 <- data.frame(epi_biasstate_S5_R75_40)[-1]

epi_biasstate_S5_R75_40$location <- 'epicenter'
epi_biasstate_S5_R75_40$detection <- 0.5
epi_biasstate_S5_R75_40$eradication <- 0.75
epi_biasstate_S5_R75_40$budget <- 40
epi_biasstate_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40b <- fread(file_name)
epi_biasstate_S5_R75_40b <- data.frame(epi_biasstate_S5_R75_40b)[-1]

epi_biasstate_S5_R75_40b$location <- 'epicenter'
epi_biasstate_S5_R75_40b$detection <- 0.5
epi_biasstate_S5_R75_40b$eradication <- 0.75
epi_biasstate_S5_R75_40b$budget <- 40
epi_biasstate_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40 <- fread(file_name)
epi_biasstate_S5_R75_40 <- data.frame(epi_biasstate_S5_R75_40)[-1]

lin_biasstate_S5_R75_40$location <- 'linear'
lin_biasstate_S5_R75_40$detection <- 0.5
lin_biasstate_S5_R75_40$eradication <- 0.75
lin_biasstate_S5_R75_40$budget <- 40
lin_biasstate_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
lin_biasstate_S5_R75_40b <- fread(file_name)
lin_biasstate_S5_R75_40b <- data.frame(lin_biasstate_S5_R75_40b)[-1]

lin_biasstate_S5_R75_40b$location <- 'linear'
lin_biasstate_S5_R75_40b$detection <- 0.5
lin_biasstate_S5_R75_40b$eradication <- 0.75
lin_biasstate_S5_R75_40b$budget <- 40
lin_biasstate_S5_R75_40b$data <- 'both'


#--- Combine bias_states ---#
bias_state_40 <- rbind(epi_biasstate_S25_R75_40,epi_biasstate_S25_R75_40b,
                       epi_biasstate_S5_R75_40,epi_biasstate_S5_R75_40b,
                       lin_biasstate_S5_R75_40,lin_biasstate_S5_R75_40b)

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_60 <- fread(file_name)
epi_biasstate_S25_R75_60 <- data.frame(epi_biasstate_S25_R75_60)[-1]

epi_biasstate_S25_R75_60$location <- 'epicenter'
epi_biasstate_S25_R75_60$detection <- 0.25
epi_biasstate_S25_R75_60$eradication <- 0.75
epi_biasstate_S25_R75_60$budget <- 60
epi_biasstate_S25_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_60b <- fread(file_name)
epi_biasstate_S25_R75_60b <- data.frame(epi_biasstate_S25_R75_60b)[-1]

epi_biasstate_S25_R75_60b$location <- 'epicenter'
epi_biasstate_S25_R75_60b$detection <- 0.25
epi_biasstate_S25_R75_60b$eradication <- 0.75
epi_biasstate_S25_R75_60b$budget <- 60
epi_biasstate_S25_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_60 <- fread(file_name)
epi_biasstate_S5_R75_60 <- data.frame(epi_biasstate_S5_R75_60)[-1]

epi_biasstate_S5_R75_60$location <- 'epicenter'
epi_biasstate_S5_R75_60$detection <- 0.5
epi_biasstate_S5_R75_60$eradication <- 0.75
epi_biasstate_S5_R75_60$budget <- 60
epi_biasstate_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_60b <- fread(file_name)
epi_biasstate_S5_R75_60b <- data.frame(epi_biasstate_S5_R75_60b)[-1]

epi_biasstate_S5_R75_60b$location <- 'epicenter'
epi_biasstate_S5_R75_60b$detection <- 0.5
epi_biasstate_S5_R75_60b$eradication <- 0.75
epi_biasstate_S5_R75_60b$budget <- 60
epi_biasstate_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_60 <- fread(file_name)
epi_biasstate_S5_R75_60 <- data.frame(epi_biasstate_S5_R75_60)[-1]

lin_biasstate_S5_R75_60$location <- 'linear'
lin_biasstate_S5_R75_60$detection <- 0.5
lin_biasstate_S5_R75_60$eradication <- 0.75
lin_biasstate_S5_R75_60$budget <- 60
lin_biasstate_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
lin_biasstate_S5_R75_60b <- fread(file_name)
lin_biasstate_S5_R75_60b <- data.frame(lin_biasstate_S5_R75_60b)[-1]

lin_biasstate_S5_R75_60b$location <- 'linear'
lin_biasstate_S5_R75_60b$detection <- 0.5
lin_biasstate_S5_R75_60b$eradication <- 0.75
lin_biasstate_S5_R75_60b$budget <- 60
lin_biasstate_S5_R75_60b$data <- 'both'


#--- Combine bias_states ---#
bias_state_60 <- rbind(epi_biasstate_S25_R75_60,epi_biasstate_S25_R75_60b,
                       epi_biasstate_S5_R75_60,epi_biasstate_S5_R75_60b,
                       lin_biasstate_S5_R75_60,lin_biasstate_S5_R75_60b)

#-- Combine Bias --#
bias_state <- rbind(bias_state_20, bias_state_40, bias_state_60 )

#### CI state ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S25_R75_20 <- fread(file_name)
epi_CIstate_S25_R75_20 <- data.frame(epi_CIstate_S25_R75_20)[-1]

epi_CIstate_S25_R75_20$location <- 'epicenter'
epi_CIstate_S25_R75_20$detection <- 0.25
epi_CIstate_S25_R75_20$eradication <- 0.75
epi_CIstate_S25_R75_20$budget <- 20
epi_CIstate_S25_R75_20$data <- 'both'


path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S25_R75_20b <- fread(file_name)
epi_CIstate_S25_R75_20b <- data.frame(epi_CIstate_S25_R75_20b)[-1]

epi_CIstate_S25_R75_20b$location <- 'epicenter'
epi_CIstate_S25_R75_20b$detection <- 0.25
epi_CIstate_S25_R75_20b$eradication <- 0.75
epi_CIstate_S25_R75_20b$budget <- 20
epi_CIstate_S25_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S5_R75_20 <- fread(file_name)
epi_CIstate_S5_R75_20 <- data.frame(epi_CIstate_S5_R75_20)[-1]

epi_CIstate_S5_R75_20$location <- 'epicenter'
epi_CIstate_S5_R75_20$detection <- 0.5
epi_CIstate_S5_R75_20$eradication <- 0.75
epi_CIstate_S5_R75_20$budget <- 20
epi_CIstate_S5_R75_20$data <- 'both'


path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S5_R75_20b <- fread(file_name)
epi_CIstate_S5_R75_20b <- data.frame(epi_CIstate_S5_R75_20b)[-1]

epi_CIstate_S5_R75_20b$location <- 'epicenter'
epi_CIstate_S5_R75_20b$detection <- 0.5
epi_CIstate_S5_R75_20b$eradication <- 0.75
epi_CIstate_S5_R75_20b$budget <- 20
epi_CIstate_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'CI_state.csv',sep = '/')
lin_CIstate_S5_R75_20 <- fread(file_name)
lin_CIstate_S5_R75_20 <- data.frame(lin_CIstate_S5_R75_20)[-1]

lin_CIstate_S5_R75_20$location <- 'linear'
lin_CIstate_S5_R75_20$detection <- 0.5
lin_CIstate_S5_R75_20$eradication <- 0.75
lin_CIstate_S5_R75_20$budget <- 20
lin_CIstate_S5_R75_20$data <- 'both'


path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
lin_CIstate_S5_R75_20b <- fread(file_name)
lin_CIstate_S5_R75_20b <- data.frame(lin_CIstate_S5_R75_20b)[-1]

lin_CIstate_S5_R75_20b$location <- 'linear'
lin_CIstate_S5_R75_20b$detection <- 0.5
lin_CIstate_S5_R75_20b$eradication <- 0.75
lin_CIstate_S5_R75_20b$budget <- 20
lin_CIstate_S5_R75_20b$data <- 'both'


#--- Combine CI_states ---#
CI_state_20 <- rbind(epi_CIstate_S25_R75_20,epi_CIstate_S25_R75_20b,
                     epi_CIstate_S5_R75_20,epi_CIstate_S5_R75_20b,
                     lin_CIstate_S5_R75_20,lin_CIstate_S5_R75_20b)

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S25_R75_40 <- fread(file_name)
epi_CIstate_S25_R75_40 <- data.frame(epi_CIstate_S25_R75_40)[-1]

epi_CIstate_S25_R75_40$location <- 'epicenter'
epi_CIstate_S25_R75_40$detection <- 0.25
epi_CIstate_S25_R75_40$eradication <- 0.75
epi_CIstate_S25_R75_40$budget <- 40
epi_CIstate_S25_R75_40$data <- 'both'


path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S25_R75_40b <- fread(file_name)
epi_CIstate_S25_R75_40b <- data.frame(epi_CIstate_S25_R75_40b)[-1]

epi_CIstate_S25_R75_40b$location <- 'epicenter'
epi_CIstate_S25_R75_40b$detection <- 0.25
epi_CIstate_S25_R75_40b$eradication <- 0.75
epi_CIstate_S25_R75_40b$budget <- 40
epi_CIstate_S25_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S5_R75_40 <- fread(file_name)
epi_CIstate_S5_R75_40 <- data.frame(epi_CIstate_S5_R75_40)[-1]

epi_CIstate_S5_R75_40$location <- 'epicenter'
epi_CIstate_S5_R75_40$detection <- 0.5
epi_CIstate_S5_R75_40$eradication <- 0.75
epi_CIstate_S5_R75_40$budget <- 40
epi_CIstate_S5_R75_40$data <- 'both'


path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S5_R75_40b <- fread(file_name)
epi_CIstate_S5_R75_40b <- data.frame(epi_CIstate_S5_R75_40b)[-1]

epi_CIstate_S5_R75_40b$location <- 'epicenter'
epi_CIstate_S5_R75_40b$detection <- 0.5
epi_CIstate_S5_R75_40b$eradication <- 0.75
epi_CIstate_S5_R75_40b$budget <- 40
epi_CIstate_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'CI_state.csv',sep = '/')
lin_CIstate_S5_R75_40 <- fread(file_name)
lin_CIstate_S5_R75_40 <- data.frame(lin_CIstate_S5_R75_40)[-1]

lin_CIstate_S5_R75_40$location <- 'linear'
lin_CIstate_S5_R75_40$detection <- 0.5
lin_CIstate_S5_R75_40$eradication <- 0.75
lin_CIstate_S5_R75_40$budget <- 40
lin_CIstate_S5_R75_40$data <- 'both'


path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
lin_CIstate_S5_R75_40b <- fread(file_name)
lin_CIstate_S5_R75_40b <- data.frame(lin_CIstate_S5_R75_40b)[-1]

lin_CIstate_S5_R75_40b$location <- 'linear'
lin_CIstate_S5_R75_40b$detection <- 0.5
lin_CIstate_S5_R75_40b$eradication <- 0.75
lin_CIstate_S5_R75_40b$budget <- 40
lin_CIstate_S5_R75_40b$data <- 'both'


#--- Combine CI_states ---#
CI_state_40 <- rbind(epi_CIstate_S25_R75_40,epi_CIstate_S25_R75_40b,
                     epi_CIstate_S5_R75_40,epi_CIstate_S5_R75_40b,
                     lin_CIstate_S5_R75_40,lin_CIstate_S5_R75_40b)

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S25_R75_60 <- fread(file_name)
epi_CIstate_S25_R75_60 <- data.frame(epi_CIstate_S25_R75_60)[-1]

epi_CIstate_S25_R75_60$location <- 'epicenter'
epi_CIstate_S25_R75_60$detection <- 0.25
epi_CIstate_S25_R75_60$eradication <- 0.75
epi_CIstate_S25_R75_60$budget <- 60
epi_CIstate_S25_R75_60$data <- 'both'


path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S25_R75_60b <- fread(file_name)
epi_CIstate_S25_R75_60b <- data.frame(epi_CIstate_S25_R75_60b)[-1]

epi_CIstate_S25_R75_60b$location <- 'epicenter'
epi_CIstate_S25_R75_60b$detection <- 0.25
epi_CIstate_S25_R75_60b$eradication <- 0.75
epi_CIstate_S25_R75_60b$budget <- 60
epi_CIstate_S25_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S5_R75_60 <- fread(file_name)
epi_CIstate_S5_R75_60 <- data.frame(epi_CIstate_S5_R75_60)[-1]

epi_CIstate_S5_R75_60$location <- 'epicenter'
epi_CIstate_S5_R75_60$detection <- 0.5
epi_CIstate_S5_R75_60$eradication <- 0.75
epi_CIstate_S5_R75_60$budget <- 60
epi_CIstate_S5_R75_60$data <- 'both'


path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
epi_CIstate_S5_R75_60b <- fread(file_name)
epi_CIstate_S5_R75_60b <- data.frame(epi_CIstate_S5_R75_60b)[-1]

epi_CIstate_S5_R75_60b$location <- 'epicenter'
epi_CIstate_S5_R75_60b$detection <- 0.5
epi_CIstate_S5_R75_60b$eradication <- 0.75
epi_CIstate_S5_R75_60b$budget <- 60
epi_CIstate_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'CI_state.csv',sep = '/')
lin_CIstate_S5_R75_60 <- fread(file_name)
lin_CIstate_S5_R75_60 <- data.frame(lin_CIstate_S5_R75_60)[-1]

lin_CIstate_S5_R75_60$location <- 'linear'
lin_CIstate_S5_R75_60$detection <- 0.5
lin_CIstate_S5_R75_60$eradication <- 0.75
lin_CIstate_S5_R75_60$budget <- 60
lin_CIstate_S5_R75_60$data <- 'both'


path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
lin_CIstate_S5_R75_60b <- fread(file_name)
lin_CIstate_S5_R75_60b <- data.frame(lin_CIstate_S5_R75_60b)[-1]

lin_CIstate_S5_R75_60b$location <- 'linear'
lin_CIstate_S5_R75_60b$detection <- 0.5
lin_CIstate_S5_R75_60b$eradication <- 0.75
lin_CIstate_S5_R75_60b$budget <- 60
lin_CIstate_S5_R75_60b$data <- 'both'


#--- Combine CI_states ---#
CI_state_60 <- rbind(epi_CIstate_S25_R75_60,epi_CIstate_S25_R75_60b,
                     epi_CIstate_S5_R75_60,epi_CIstate_S5_R75_60b,
                     lin_CIstate_S5_R75_60,lin_CIstate_S5_R75_60b)

#-- Combine CI --#
CI_state <- c(CI_state_20, CI_state_40, CI_state_60)

#### Params ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S25_R75_20 <- fread(file_name)
epi_param_S25_R75_20 <- data.frame(epi_param_S25_R75_20)[-1]

epi_param_S25_R75_20$location <- 'epicenter'
epi_param_S25_R75_20$detection <- 0.25
epi_param_S25_R75_20$eradication <- 0.75
epi_param_S25_R75_20$budget <- 20
epi_param_S25_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S25_R75_20b <- fread(file_name)
epi_param_S25_R75_20b <- data.frame(epi_param_S25_R75_20b)[-1]

epi_param_S25_R75_20b$location <- 'epicenter'
epi_param_S25_R75_20b$detection <- 0.25
epi_param_S25_R75_20b$eradication <- 0.75
epi_param_S25_R75_20b$budget <- 20
epi_param_S25_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S5_R75_20 <- fread(file_name)
epi_param_S5_R75_20 <- data.frame(epi_param_S5_R75_20)[-1]

epi_param_S5_R75_20$location <- 'epicenter'
epi_param_S5_R75_20$detection <- 0.5
epi_param_S5_R75_20$eradication <- 0.75
epi_param_S5_R75_20$budget <- 20
epi_param_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S5_R75_20b <- fread(file_name)
epi_param_S5_R75_20b <- data.frame(epi_param_S5_R75_20b)[-1]

epi_param_S5_R75_20b$location <- 'epicenter'
epi_param_S5_R75_20b$detection <- 0.5
epi_param_S5_R75_20b$eradication <- 0.75
epi_param_S5_R75_20b$budget <- 20
epi_param_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'params.csv',sep = '/')
lin_param_S5_R75_20 <- fread(file_name)
lin_param_S5_R75_20 <- data.frame(lin_param_S5_R75_20)[-1]

lin_param_S5_R75_20$location <- 'linear'
lin_param_S5_R75_20$detection <- 0.5
lin_param_S5_R75_20$eradication <- 0.75
lin_param_S5_R75_20$budget <- 20
lin_param_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'params.csv',sep = '/')
lin_param_S5_R75_20b <- fread(file_name)
lin_param_S5_R75_20b <- data.frame(lin_param_S5_R75_20b)[-1]

lin_param_S5_R75_20b$location <- 'linear'
lin_param_S5_R75_20b$detection <- 0.5
lin_param_S5_R75_20b$eradication <- 0.75
lin_param_S5_R75_20b$budget <- 20
lin_param_S5_R75_20b$data <- 'both'


#--- Combine params ---#
param_20 <- rbind(epi_param_S25_R75_20,epi_param_S25_R75_20b,
                  epi_param_S5_R75_20,epi_param_S5_R75_20b,
                  lin_param_S5_R75_20,lin_param_S5_R75_20b)

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S25_R75_40 <- fread(file_name)
epi_param_S25_R75_40 <- data.frame(epi_param_S25_R75_40)[-1]

epi_param_S25_R75_40$location <- 'epicenter'
epi_param_S25_R75_40$detection <- 0.25
epi_param_S25_R75_40$eradication <- 0.75
epi_param_S25_R75_40$budget <- 40
epi_param_S25_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S25_R75_40b <- fread(file_name)
epi_param_S25_R75_40b <- data.frame(epi_param_S25_R75_40b)[-1]

epi_param_S25_R75_40b$location <- 'epicenter'
epi_param_S25_R75_40b$detection <- 0.25
epi_param_S25_R75_40b$eradication <- 0.75
epi_param_S25_R75_40b$budget <- 40
epi_param_S25_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S5_R75_40 <- fread(file_name)
epi_param_S5_R75_40 <- data.frame(epi_param_S5_R75_40)[-1]

epi_param_S5_R75_40$location <- 'epicenter'
epi_param_S5_R75_40$detection <- 0.5
epi_param_S5_R75_40$eradication <- 0.75
epi_param_S5_R75_40$budget <- 40
epi_param_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S5_R75_40b <- fread(file_name)
epi_param_S5_R75_40b <- data.frame(epi_param_S5_R75_40b)[-1]

epi_param_S5_R75_40b$location <- 'epicenter'
epi_param_S5_R75_40b$detection <- 0.5
epi_param_S5_R75_40b$eradication <- 0.75
epi_param_S5_R75_40b$budget <- 40
epi_param_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'params.csv',sep = '/')
lin_param_S5_R75_40 <- fread(file_name)
lin_param_S5_R75_40 <- data.frame(lin_param_S5_R75_40)[-1]

lin_param_S5_R75_40$location <- 'linear'
lin_param_S5_R75_40$detection <- 0.5
lin_param_S5_R75_40$eradication <- 0.75
lin_param_S5_R75_40$budget <- 40
lin_param_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'params.csv',sep = '/')
lin_param_S5_R75_40b <- fread(file_name)
lin_param_S5_R75_40b <- data.frame(lin_param_S5_R75_40b)[-1]

lin_param_S5_R75_40b$location <- 'linear'
lin_param_S5_R75_40b$detection <- 0.5
lin_param_S5_R75_40b$eradication <- 0.75
lin_param_S5_R75_40b$budget <- 40
lin_param_S5_R75_40b$data <- 'both'


#--- Combine params ---#
param_40 <- rbind(epi_param_S25_R75_40,epi_param_S25_R75_40b,
                  epi_param_S5_R75_40,epi_param_S5_R75_40b,
                  lin_param_S5_R75_40,lin_param_S5_R75_40b)

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S25_R75_60 <- fread(file_name)
epi_param_S25_R75_60 <- data.frame(epi_param_S25_R75_60)[-1]

epi_param_S25_R75_60$location <- 'epicenter'
epi_param_S25_R75_60$detection <- 0.25
epi_param_S25_R75_60$eradication <- 0.75
epi_param_S25_R75_60$budget <- 60
epi_param_S25_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S25_R75_60b <- fread(file_name)
epi_param_S25_R75_60b <- data.frame(epi_param_S25_R75_60b)[-1]

epi_param_S25_R75_60b$location <- 'epicenter'
epi_param_S25_R75_60b$detection <- 0.25
epi_param_S25_R75_60b$eradication <- 0.75
epi_param_S25_R75_60b$budget <- 60
epi_param_S25_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S5_R75_60 <- fread(file_name)
epi_param_S5_R75_60 <- data.frame(epi_param_S5_R75_60)[-1]

epi_param_S5_R75_60$location <- 'epicenter'
epi_param_S5_R75_60$detection <- 0.5
epi_param_S5_R75_60$eradication <- 0.75
epi_param_S5_R75_60$budget <- 60
epi_param_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'params.csv',sep = '/')
epi_param_S5_R75_60b <- fread(file_name)
epi_param_S5_R75_60b <- data.frame(epi_param_S5_R75_60b)[-1]

epi_param_S5_R75_60b$location <- 'epicenter'
epi_param_S5_R75_60b$detection <- 0.5
epi_param_S5_R75_60b$eradication <- 0.75
epi_param_S5_R75_60b$budget <- 60
epi_param_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'params.csv',sep = '/')
lin_param_S5_R75_60 <- fread(file_name)
lin_param_S5_R75_60 <- data.frame(lin_param_S5_R75_60)[-1]

lin_param_S5_R75_60$location <- 'linear'
lin_param_S5_R75_60$detection <- 0.5
lin_param_S5_R75_60$eradication <- 0.75
lin_param_S5_R75_60$budget <- 60
lin_param_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'params.csv',sep = '/')
lin_param_S5_R75_60b <- fread(file_name)
lin_param_S5_R75_60b <- data.frame(lin_param_S5_R75_60b)[-1]

lin_param_S5_R75_60b$location <- 'linear'
lin_param_S5_R75_60b$detection <- 0.5
lin_param_S5_R75_60b$eradication <- 0.75
lin_param_S5_R75_60b$budget <- 60
lin_param_S5_R75_60b$data <- 'both'


#--- Combine params ---#
param_60 <- rbind(epi_param_S25_R75_60,epi_param_S25_R75_60b,
                  epi_param_S5_R75_60,epi_param_S5_R75_60b,
                  lin_param_S5_R75_60,lin_param_S5_R75_60b)

#-- Combine params --#
params <- rbind(param_20, param_40, param_60 )

#### Bias params ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_20 <- fread(file_name)
epi_biasparam_S25_R75_20 <- data.frame(epi_biasparam_S25_R75_20)[-1]

epi_biasparam_S25_R75_20$location <- 'epicenter'
epi_biasparam_S25_R75_20$detection <- 0.25
epi_biasparam_S25_R75_20$eradication <- 0.75
epi_biasparam_S25_R75_20$budget <- 20
epi_biasparam_S25_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_20b <- fread(file_name)
epi_biasparam_S25_R75_20b <- data.frame(epi_biasparam_S25_R75_20b)[-1]

epi_biasparam_S25_R75_20b$location <- 'epicenter'
epi_biasparam_S25_R75_20b$detection <- 0.25
epi_biasparam_S25_R75_20b$eradication <- 0.75
epi_biasparam_S25_R75_20b$budget <- 20
epi_biasparam_S25_R75_20b$data <- 'both'

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
bias_param_20 <- rbind(epi_biasparam_S25_R75_20, epi_biasparam_S25_R75_20b,
                       epi_biasparam_S5_R75_20,epi_biasparam_S5_R75_20b,
                       lin_biasparam_S5_R75_20,lin_biasparam_S5_R75_20b)

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_40 <- fread(file_name)
epi_biasparam_S25_R75_40 <- data.frame(epi_biasparam_S25_R75_40)[-1]

epi_biasparam_S25_R75_40$location <- 'epicenter'
epi_biasparam_S25_R75_40$detection <- 0.25
epi_biasparam_S25_R75_40$eradication <- 0.75
epi_biasparam_S25_R75_40$budget <- 40
epi_biasparam_S25_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_40b <- fread(file_name)
epi_biasparam_S25_R75_40b <- data.frame(epi_biasparam_S25_R75_40b)[-1]

epi_biasparam_S25_R75_40b$location <- 'epicenter'
epi_biasparam_S25_R75_40b$detection <- 0.25
epi_biasparam_S25_R75_40b$eradication <- 0.75
epi_biasparam_S25_R75_40b$budget <- 40
epi_biasparam_S25_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40 <- fread(file_name)
epi_biasparam_S5_R75_40 <- data.frame(epi_biasparam_S5_R75_40)[-1]

epi_biasparam_S5_R75_40$location <- 'epicenter'
epi_biasparam_S5_R75_40$detection <- 0.5
epi_biasparam_S5_R75_40$eradication <- 0.75
epi_biasparam_S5_R75_40$budget <- 40
epi_biasparam_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40b <- fread(file_name)
epi_biasparam_S5_R75_40b <- data.frame(epi_biasparam_S5_R75_40b)[-1]

epi_biasparam_S5_R75_40b$location <- 'epicenter'
epi_biasparam_S5_R75_40b$detection <- 0.5
epi_biasparam_S5_R75_40b$eradication <- 0.75
epi_biasparam_S5_R75_40b$budget <- 40
epi_biasparam_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
lin_biasparam_S5_R75_40 <- fread(file_name)
lin_biasparam_S5_R75_40 <- data.frame(lin_biasparam_S5_R75_40)[-1]

lin_biasparam_S5_R75_40$location <- 'linear'
lin_biasparam_S5_R75_40$detection <- 0.5
lin_biasparam_S5_R75_40$eradication <- 0.75
lin_biasparam_S5_R75_40$budget <- 40
lin_biasparam_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
lin_biasparam_S5_R75_40b <- fread(file_name)
lin_biasparam_S5_R75_40b <- data.frame(lin_biasparam_S5_R75_40b)[-1]

lin_biasparam_S5_R75_40b$location <- 'linear'
lin_biasparam_S5_R75_40b$detection <- 0.5
lin_biasparam_S5_R75_40b$eradication <- 0.75
lin_biasparam_S5_R75_40b$budget <- 40
lin_biasparam_S5_R75_40b$data <- 'both'

#--- Combine bias_params ---#
bias_param_40 <- rbind(epi_biasparam_S25_R75_40, epi_biasparam_S25_R75_40b,
                       epi_biasparam_S5_R75_40,epi_biasparam_S5_R75_40b,
                       lin_biasparam_S5_R75_40,lin_biasparam_S5_R75_40b)

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_60 <- fread(file_name)
epi_biasparam_S25_R75_60 <- data.frame(epi_biasparam_S25_R75_60)[-1]

epi_biasparam_S25_R75_60$location <- 'epicenter'
epi_biasparam_S25_R75_60$detection <- 0.25
epi_biasparam_S25_R75_60$eradication <- 0.75
epi_biasparam_S25_R75_60$budget <- 60
epi_biasparam_S25_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_60b <- fread(file_name)
epi_biasparam_S25_R75_60b <- data.frame(epi_biasparam_S25_R75_60b)[-1]

epi_biasparam_S25_R75_60b$location <- 'epicenter'
epi_biasparam_S25_R75_60b$detection <- 0.25
epi_biasparam_S25_R75_60b$eradication <- 0.75
epi_biasparam_S25_R75_60b$budget <- 60
epi_biasparam_S25_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_60 <- fread(file_name)
epi_biasparam_S5_R75_60 <- data.frame(epi_biasparam_S5_R75_60)[-1]

epi_biasparam_S5_R75_60$location <- 'epicenter'
epi_biasparam_S5_R75_60$detection <- 0.5
epi_biasparam_S5_R75_60$eradication <- 0.75
epi_biasparam_S5_R75_60$budget <- 60
epi_biasparam_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_60b <- fread(file_name)
epi_biasparam_S5_R75_60b <- data.frame(epi_biasparam_S5_R75_60b)[-1]

epi_biasparam_S5_R75_60b$location <- 'epicenter'
epi_biasparam_S5_R75_60b$detection <- 0.5
epi_biasparam_S5_R75_60b$eradication <- 0.75
epi_biasparam_S5_R75_60b$budget <- 60
epi_biasparam_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
lin_biasparam_S5_R75_60 <- fread(file_name)
lin_biasparam_S5_R75_60 <- data.frame(lin_biasparam_S5_R75_60)[-1]

lin_biasparam_S5_R75_60$location <- 'linear'
lin_biasparam_S5_R75_60$detection <- 0.5
lin_biasparam_S5_R75_60$eradication <- 0.75
lin_biasparam_S5_R75_60$budget <- 60
lin_biasparam_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
lin_biasparam_S5_R75_60b <- fread(file_name)
lin_biasparam_S5_R75_60b <- data.frame(lin_biasparam_S5_R75_60b)[-1]

lin_biasparam_S5_R75_60b$location <- 'linear'
lin_biasparam_S5_R75_60b$detection <- 0.5
lin_biasparam_S5_R75_60b$eradication <- 0.75
lin_biasparam_S5_R75_60b$budget <- 60
lin_biasparam_S5_R75_60b$data <- 'both'

#--- Combine bias_params ---#
bias_param_60 <- rbind(epi_biasparam_S25_R75_60, epi_biasparam_S25_R75_60b,
                       epi_biasparam_S5_R75_60,epi_biasparam_S5_R75_60b,
                       lin_biasparam_S5_R75_60,lin_biasparam_S5_R75_60b)

#-- Combine bias --#
bias_params <- rbind(bias_param_20, bias_param_40, bias_param_60 )


#### CI params ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S25_R75_20 <- fread(file_name)
epi_CIparam_S25_R75_20 <- data.frame(epi_CIparam_S25_R75_20)[-1]

epi_CIparam_S25_R75_20$location <- 'epicenter'
epi_CIparam_S25_R75_20$detection <- 0.25
epi_CIparam_S25_R75_20$eradication <- 0.75
epi_CIparam_S25_R75_20$budget <- 20
epi_CIparam_S25_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S25_R75_20b <- fread(file_name)
epi_CIparam_S25_R75_20b <- data.frame(epi_CIparam_S25_R75_20b)[-1]

epi_CIparam_S25_R75_20b$location <- 'epicenter'
epi_CIparam_S25_R75_20b$detection <- 0.25
epi_CIparam_S25_R75_20b$eradication <- 0.75
epi_CIparam_S25_R75_20b$budget <- 20
epi_CIparam_S25_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S5_R75_20 <- fread(file_name)
epi_CIparam_S5_R75_20 <- data.frame(epi_CIparam_S5_R75_20)[-1]

epi_CIparam_S5_R75_20$location <- 'epicenter'
epi_CIparam_S5_R75_20$detection <- 0.5
epi_CIparam_S5_R75_20$eradication <- 0.75
epi_CIparam_S5_R75_20$budget <- 20
epi_CIparam_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S5_R75_20b <- fread(file_name)
epi_CIparam_S5_R75_20b <- data.frame(epi_CIparam_S5_R75_20b)[-1]

epi_CIparam_S5_R75_20b$location <- 'epicenter'
epi_CIparam_S5_R75_20b$detection <- 0.5
epi_CIparam_S5_R75_20b$eradication <- 0.75
epi_CIparam_S5_R75_20b$budget <- 20
epi_CIparam_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'CI_param.csv',sep = '/')
lin_CIparam_S5_R75_20 <- fread(file_name)
lin_CIparam_S5_R75_20 <- data.frame(lin_CIparam_S5_R75_20)[-1]

lin_CIparam_S5_R75_20$location <- 'linear'
lin_CIparam_S5_R75_20$detection <- 0.25
lin_CIparam_S5_R75_20$eradication <- 0.75
lin_CIparam_S5_R75_20$budget <- 20
lin_CIparam_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
lin_CIparam_S5_R75_20b <- fread(file_name)
lin_CIparam_S5_R75_20b <- data.frame(lin_CIparam_S5_R75_20b)[-1]

lin_CIparam_S5_R75_20b$location <- 'linear'
lin_CIparam_S5_R75_20b$detection <- 0.25
lin_CIparam_S5_R75_20b$eradication <- 0.75
lin_CIparam_S5_R75_20b$budget <- 20
lin_CIparam_S5_R75_20b$data <- 'both'


#--- Combine CI_params ---#
CI_param_20 <- rbind(epi_CIparam_S25_R75_20,epi_CIparam_S25_R75_20b,
                     epi_CIparam_S5_R75_20,epi_CIparam_S5_R75_20b,
                     lin_CIparam_S5_R75_20,lin_CIparam_S5_R75_20b)

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S25_R75_40 <- fread(file_name)
epi_CIparam_S25_R75_40 <- data.frame(epi_CIparam_S25_R75_40)[-1]

epi_CIparam_S25_R75_40$location <- 'epicenter'
epi_CIparam_S25_R75_40$detection <- 0.25
epi_CIparam_S25_R75_40$eradication <- 0.75
epi_CIparam_S25_R75_40$budget <- 40
epi_CIparam_S25_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S25_R75_40b <- fread(file_name)
epi_CIparam_S25_R75_40b <- data.frame(epi_CIparam_S25_R75_40b)[-1]

epi_CIparam_S25_R75_40b$location <- 'epicenter'
epi_CIparam_S25_R75_40b$detection <- 0.25
epi_CIparam_S25_R75_40b$eradication <- 0.75
epi_CIparam_S25_R75_40b$budget <- 40
epi_CIparam_S25_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S5_R75_40 <- fread(file_name)
epi_CIparam_S5_R75_40 <- data.frame(epi_CIparam_S5_R75_40)[-1]

epi_CIparam_S5_R75_40$location <- 'epicenter'
epi_CIparam_S5_R75_40$detection <- 0.5
epi_CIparam_S5_R75_40$eradication <- 0.75
epi_CIparam_S5_R75_40$budget <- 40
epi_CIparam_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S5_R75_40b <- fread(file_name)
epi_CIparam_S5_R75_40b <- data.frame(epi_CIparam_S5_R75_40b)[-1]

epi_CIparam_S5_R75_40b$location <- 'epicenter'
epi_CIparam_S5_R75_40b$detection <- 0.5
epi_CIparam_S5_R75_40b$eradication <- 0.75
epi_CIparam_S5_R75_40b$budget <- 40
epi_CIparam_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'CI_param.csv',sep = '/')
lin_CIparam_S5_R75_40 <- fread(file_name)
lin_CIparam_S5_R75_40 <- data.frame(lin_CIparam_S5_R75_40)[-1]

lin_CIparam_S5_R75_40$location <- 'linear'
lin_CIparam_S5_R75_40$detection <- 0.25
lin_CIparam_S5_R75_40$eradication <- 0.75
lin_CIparam_S5_R75_40$budget <- 40
lin_CIparam_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
lin_CIparam_S5_R75_40b <- fread(file_name)
lin_CIparam_S5_R75_40b <- data.frame(lin_CIparam_S5_R75_40b)[-1]

lin_CIparam_S5_R75_40b$location <- 'linear'
lin_CIparam_S5_R75_40b$detection <- 0.25
lin_CIparam_S5_R75_40b$eradication <- 0.75
lin_CIparam_S5_R75_40b$budget <- 40
lin_CIparam_S5_R75_40b$data <- 'both'


#--- Combine CI_params ---#
CI_param_40 <- rbind(epi_CIparam_S25_R75_40,epi_CIparam_S25_R75_40b,
                     epi_CIparam_S5_R75_40,epi_CIparam_S5_R75_40b,
                     lin_CIparam_S5_R75_40,lin_CIparam_S5_R75_40b)


#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S25_R75_60 <- fread(file_name)
epi_CIparam_S25_R75_60 <- data.frame(epi_CIparam_S25_R75_60)[-1]

epi_CIparam_S25_R75_60$location <- 'epicenter'
epi_CIparam_S25_R75_60$detection <- 0.25
epi_CIparam_S25_R75_60$eradication <- 0.75
epi_CIparam_S25_R75_60$budget <- 60
epi_CIparam_S25_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S25_R75_60b <- fread(file_name)
epi_CIparam_S25_R75_60b <- data.frame(epi_CIparam_S25_R75_60b)[-1]

epi_CIparam_S25_R75_60b$location <- 'epicenter'
epi_CIparam_S25_R75_60b$detection <- 0.25
epi_CIparam_S25_R75_60b$eradication <- 0.75
epi_CIparam_S25_R75_60b$budget <- 60
epi_CIparam_S25_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S5_R75_60 <- fread(file_name)
epi_CIparam_S5_R75_60 <- data.frame(epi_CIparam_S5_R75_60)[-1]

epi_CIparam_S5_R75_60$location <- 'epicenter'
epi_CIparam_S5_R75_60$detection <- 0.5
epi_CIparam_S5_R75_60$eradication <- 0.75
epi_CIparam_S5_R75_60$budget <- 60
epi_CIparam_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
epi_CIparam_S5_R75_60b <- fread(file_name)
epi_CIparam_S5_R75_60b <- data.frame(epi_CIparam_S5_R75_60b)[-1]

epi_CIparam_S5_R75_60b$location <- 'epicenter'
epi_CIparam_S5_R75_60b$detection <- 0.5
epi_CIparam_S5_R75_60b$eradication <- 0.75
epi_CIparam_S5_R75_60b$budget <- 60
epi_CIparam_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'CI_param.csv',sep = '/')
lin_CIparam_S5_R75_60 <- fread(file_name)
lin_CIparam_S5_R75_60 <- data.frame(lin_CIparam_S5_R75_60)[-1]

lin_CIparam_S5_R75_60$location <- 'linear'
lin_CIparam_S5_R75_60$detection <- 0.25
lin_CIparam_S5_R75_60$eradication <- 0.75
lin_CIparam_S5_R75_60$budget <- 60
lin_CIparam_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
lin_CIparam_S5_R75_60b <- fread(file_name)
lin_CIparam_S5_R75_60b <- data.frame(lin_CIparam_S5_R75_60b)[-1]

lin_CIparam_S5_R75_60b$location <- 'linear'
lin_CIparam_S5_R75_60b$detection <- 0.25
lin_CIparam_S5_R75_60b$eradication <- 0.75
lin_CIparam_S5_R75_60b$budget <- 60
lin_CIparam_S5_R75_60b$data <- 'both'


#--- Combine CI_params ---#
CI_param_60 <- rbind(epi_CIparam_S25_R75_60,epi_CIparam_S25_R75_60b,
                     epi_CIparam_S5_R75_60,epi_CIparam_S5_R75_60b,
                     lin_CIparam_S5_R75_60,lin_CIparam_S5_R75_60b)

CI_param <- rbind(CI_param_20, CI_param_40, CI_param_60 )


#### Param summary ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S25_R75_20 <- fread(file_name)
epi_paramsum_S25_R75_20 <- data.frame(epi_paramsum_S25_R75_20)[-1]

epi_paramsum_S25_R75_20$location <- 'epicenter'
epi_paramsum_S25_R75_20$detection <- 0.25
epi_paramsum_S25_R75_20$eradication <- 0.75
epi_paramsum_S25_R75_20$budget <- 20
epi_paramsum_S25_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S25_R75_20b <- fread(file_name)
epi_paramsum_S25_R75_20b <- data.frame(epi_paramsum_S25_R75_20b)[-1]

epi_paramsum_S25_R75_20b$location <- 'epicenter'
epi_paramsum_S25_R75_20b$detection <- 0.25
epi_paramsum_S25_R75_20b$eradication <- 0.75
epi_paramsum_S25_R75_20b$budget <- 20
epi_paramsum_S25_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S5_R75_20 <- fread(file_name)
epi_paramsum_S5_R75_20 <- data.frame(epi_paramsum_S5_R75_20)[-1]

epi_paramsum_S5_R75_20$location <- 'epicenter'
epi_paramsum_S5_R75_20$detection <- 0.5
epi_paramsum_S5_R75_20$eradication <- 0.75
epi_paramsum_S5_R75_20$budget <- 20
epi_paramsum_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S5_R75_20b <- fread(file_name)
epi_paramsum_S5_R75_20b <- data.frame(epi_paramsum_S5_R75_20b)[-1]

epi_paramsum_S5_R75_20b$location <- 'epicenter'
epi_paramsum_S5_R75_20b$detection <- 0.5
epi_paramsum_S5_R75_20b$eradication <- 0.75
epi_paramsum_S5_R75_20b$budget <- 20
epi_paramsum_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'par_summary.csv',sep = '/')
lin_paramsum_S5_R75_20 <- fread(file_name)
lin_paramsum_S5_R75_20 <- data.frame(lin_paramsum_S5_R75_20)[-1]

lin_paramsum_S5_R75_20$location <- 'linear'
lin_paramsum_S5_R75_20$detection <- 0.5
lin_paramsum_S5_R75_20$eradication <- 0.75
lin_paramsum_S5_R75_20$budget <- 20
lin_paramsum_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
lin_paramsum_S5_R75_20b <- fread(file_name)
lin_paramsum_S5_R75_20b <- data.frame(lin_paramsum_S5_R75_20b)[-1]

lin_paramsum_S5_R75_20b$location <- 'linear'
lin_paramsum_S5_R75_20b$detection <- 0.5
lin_paramsum_S5_R75_20b$eradication <- 0.75
lin_paramsum_S5_R75_20b$budget <- 20
lin_paramsum_S5_R75_20b$data <- 'both'

param_summary_20 <- rbind(epi_paramsum_S25_R75_20,epi_paramsum_S25_R75_20b,
                          epi_paramsum_S5_R75_20,epi_paramsum_S5_R75_20b,
                          lin_paramsum_S5_R75_20,lin_paramsum_S5_R75_20b)

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S25_R75_40 <- fread(file_name)
epi_paramsum_S25_R75_40 <- data.frame(epi_paramsum_S25_R75_40)[-1]

epi_paramsum_S25_R75_40$location <- 'epicenter'
epi_paramsum_S25_R75_40$detection <- 0.25
epi_paramsum_S25_R75_40$eradication <- 0.75
epi_paramsum_S25_R75_40$budget <- 40
epi_paramsum_S25_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S25_R75_40b <- fread(file_name)
epi_paramsum_S25_R75_40b <- data.frame(epi_paramsum_S25_R75_40b)[-1]

epi_paramsum_S25_R75_40b$location <- 'epicenter'
epi_paramsum_S25_R75_40b$detection <- 0.25
epi_paramsum_S25_R75_40b$eradication <- 0.75
epi_paramsum_S25_R75_40b$budget <- 40
epi_paramsum_S25_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S5_R75_40 <- fread(file_name)
epi_paramsum_S5_R75_40 <- data.frame(epi_paramsum_S5_R75_40)[-1]

epi_paramsum_S5_R75_40$location <- 'epicenter'
epi_paramsum_S5_R75_40$detection <- 0.5
epi_paramsum_S5_R75_40$eradication <- 0.75
epi_paramsum_S5_R75_40$budget <- 40
epi_paramsum_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S5_R75_40b <- fread(file_name)
epi_paramsum_S5_R75_40b <- data.frame(epi_paramsum_S5_R75_40b)[-1]

epi_paramsum_S5_R75_40b$location <- 'epicenter'
epi_paramsum_S5_R75_40b$detection <- 0.5
epi_paramsum_S5_R75_40b$eradication <- 0.75
epi_paramsum_S5_R75_40b$budget <- 40
epi_paramsum_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'par_summary.csv',sep = '/')
lin_paramsum_S5_R75_40 <- fread(file_name)
lin_paramsum_S5_R75_40 <- data.frame(lin_paramsum_S5_R75_40)[-1]

lin_paramsum_S5_R75_40$location <- 'linear'
lin_paramsum_S5_R75_40$detection <- 0.5
lin_paramsum_S5_R75_40$eradication <- 0.75
lin_paramsum_S5_R75_40$budget <- 40
lin_paramsum_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
lin_paramsum_S5_R75_40b <- fread(file_name)
lin_paramsum_S5_R75_40b <- data.frame(lin_paramsum_S25_R75_40b)[-1]

lin_paramsum_S5_R75_40b$location <- 'linear'
lin_paramsum_S5_R75_40b$detection <- 0.5
lin_paramsum_S5_R75_40b$eradication <- 0.75
lin_paramsum_S5_R75_40b$budget <- 40
lin_paramsum_S5_R75_40b$data <- 'both'

param_summary_40 <- rbind(epi_paramsum_S25_R75_40,epi_paramsum_S25_R75_40b,
                          epi_paramsum_S5_R75_40,epi_paramsum_S5_R75_40b,
                          lin_paramsum_S5_R75_40,lin_paramsum_S5_R75_40b)

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S25_R75_60 <- fread(file_name)
epi_paramsum_S25_R75_60 <- data.frame(epi_paramsum_S25_R75_60)[-1]

epi_paramsum_S25_R75_60$location <- 'epicenter'
epi_paramsum_S25_R75_60$detection <- 0.25
epi_paramsum_S25_R75_60$eradication <- 0.75
epi_paramsum_S25_R75_60$budget <- 60
epi_paramsum_S25_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S25_R75_60b <- fread(file_name)
epi_paramsum_S25_R75_60b <- data.frame(epi_paramsum_S25_R75_60b)[-1]

epi_paramsum_S25_R75_60b$location <- 'epicenter'
epi_paramsum_S25_R75_60b$detection <- 0.25
epi_paramsum_S25_R75_60b$eradication <- 0.75
epi_paramsum_S25_R75_60b$budget <- 60
epi_paramsum_S25_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S5_R75_60 <- fread(file_name)
epi_paramsum_S5_R75_60 <- data.frame(epi_paramsum_S5_R75_60)[-1]

epi_paramsum_S5_R75_60$location <- 'epicenter'
epi_paramsum_S5_R75_60$detection <- 0.5
epi_paramsum_S5_R75_60$eradication <- 0.75
epi_paramsum_S5_R75_60$budget <- 60
epi_paramsum_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
epi_paramsum_S5_R75_60b <- fread(file_name)
epi_paramsum_S5_R75_60b <- data.frame(epi_paramsum_S5_R75_60b)[-1]

epi_paramsum_S5_R75_60b$location <- 'epicenter'
epi_paramsum_S5_R75_60b$detection <- 0.5
epi_paramsum_S5_R75_60b$eradication <- 0.75
epi_paramsum_S5_R75_60b$budget <- 60
epi_paramsum_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'par_summary.csv',sep = '/')
lin_paramsum_S5_R75_60 <- fread(file_name)
lin_paramsum_S5_R75_60 <- data.frame(lin_paramsum_S5_R75_60)[-1]

lin_paramsum_S5_R75_60$location <- 'linear'
lin_paramsum_S5_R75_60$detection <- 0.5
lin_paramsum_S5_R75_60$eradication <- 0.75
lin_paramsum_S5_R75_60$budget <- 60
lin_paramsum_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
lin_paramsum_S5_R75_60b <- fread(file_name)
lin_paramsum_S5_R75_60b <- data.frame(lin_paramsum_S5_R75_60b)[-1]

lin_paramsum_S5_R75_60b$location <- 'linear'
lin_paramsum_S5_R75_60b$detection <- 0.5
lin_paramsum_S5_R75_60b$eradication <- 0.75
lin_paramsum_S5_R75_60b$budget <- 60
lin_paramsum_S5_R75_60b$data <- 'both'

param_summary_60 <- rbind(epi_paramsum_S25_R75_60,epi_paramsum_S25_R75_60b,
                          epi_paramsum_S5_R75_60,epi_paramsum_S5_R75_60b,
                          lin_paramsum_S5_R75_60,lin_paramsum_S5_R75_60b)

param_summary <- rbind(param_summary_20, param_summary_40, param_summary_60)

#### Dist travel ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S25_R75_20 <- fread(file_name)
epi_dist_S25_R75_20 <- data.frame(epi_dist_S25_R75_20)[-1]

epi_dist_S25_R75_20$location <- 'epicenter'
epi_dist_S25_R75_20$detection <- 0.25
epi_dist_S25_R75_20$eradication <- 0.75
epi_dist_S25_R75_20$budget <- 20
epi_dist_S25_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S25_R75_20b <- fread(file_name)
epi_dist_S25_R75_20b <- data.frame(epi_dist_S25_R75_20b)[-1]

epi_dist_S25_R75_20b$location <- 'epicenter'
epi_dist_S25_R75_20b$detection <- 0.25
epi_dist_S25_R75_20b$eradication <- 0.75
epi_dist_S25_R75_20b$budget <- 20
epi_dist_S25_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S5_R75_20 <- fread(file_name)
epi_dist_S5_R75_20 <- data.frame(epi_dist_S5_R75_20)[-1]

epi_dist_S5_R75_20$location <- 'epicenter'
epi_dist_S5_R75_20$detection <- 0.5
epi_dist_S5_R75_20$eradication <- 0.75
epi_dist_S5_R75_20$budget <- 20
epi_dist_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S5_R75_20b <- fread(file_name)
epi_dist_S5_R75_20b <- data.frame(epi_dist_S5_R75_20b)[-1]

epi_dist_S5_R75_20b$location <- 'epicenter'
epi_dist_S5_R75_20b$detection <- 0.5
epi_dist_S5_R75_20b$eradication <- 0.75
epi_dist_S5_R75_20b$budget <- 20
epi_dist_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
lin_dist_S5_R75_20 <- fread(file_name)
lin_dist_S5_R75_20 <- data.frame(lin_dist_S5_R75_20)[-1]

lin_dist_S5_R75_20$location <- 'linear'
lin_dist_S5_R75_20$detection <- 0.5
lin_dist_S5_R75_20$eradication <- 0.75
lin_dist_S5_R75_20$budget <- 20
lin_dist_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
lin_dist_S5_R75_20b <- fread(file_name)
lin_dist_S5_R75_20b <- data.frame(lin_dist_S5_R75_20b)[-1]

lin_dist_S5_R75_20b$location <- 'linear'
lin_dist_S5_R75_20b$detection <- 0.5
lin_dist_S5_R75_20b$eradication <- 0.75
lin_dist_S5_R75_20b$budget <- 20
lin_dist_S5_R75_20b$data <- 'both'


#--- Combine dists ---#
dist_20 <- rbind(epi_dist_S25_R75_20,epi_dist_S25_R75_20b,
                 epi_dist_S5_R75_20,epi_dist_S5_R75_20,
                 lin_dist_S5_R75_20,lin_dist_S5_R75_20b)

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S25_R75_40 <- fread(file_name)
epi_dist_S25_R75_40 <- data.frame(epi_dist_S25_R75_40)[-1]

epi_dist_S25_R75_40$location <- 'epicenter'
epi_dist_S25_R75_40$detection <- 0.25
epi_dist_S25_R75_40$eradication <- 0.75
epi_dist_S25_R75_40$budget <- 40
epi_dist_S25_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S25_R75_40b <- fread(file_name)
epi_dist_S25_R75_40b <- data.frame(epi_dist_S25_R75_40b)[-1]

epi_dist_S25_R75_40b$location <- 'epicenter'
epi_dist_S25_R75_40b$detection <- 0.25
epi_dist_S25_R75_40b$eradication <- 0.75
epi_dist_S25_R75_40b$budget <- 40
epi_dist_S25_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S5_R75_40 <- fread(file_name)
epi_dist_S5_R75_40 <- data.frame(epi_dist_S5_R75_40)[-1]

epi_dist_S5_R75_40$location <- 'epicenter'
epi_dist_S5_R75_40$detection <- 0.5
epi_dist_S5_R75_40$eradication <- 0.75
epi_dist_S5_R75_40$budget <- 40
epi_dist_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S5_R75_40b <- fread(file_name)
epi_dist_S5_R75_40b <- data.frame(epi_dist_S5_R75_40b)[-1]

epi_dist_S5_R75_40b$location <- 'epicenter'
epi_dist_S5_R75_40b$detection <- 0.5
epi_dist_S5_R75_40b$eradication <- 0.75
epi_dist_S5_R75_40b$budget <- 40
epi_dist_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
lin_dist_S5_R75_40 <- fread(file_name)
lin_dist_S5_R75_40 <- data.frame(lin_dist_S5_R75_40)[-1]

lin_dist_S5_R75_40$location <- 'linear'
lin_dist_S5_R75_40$detection <- 0.5
lin_dist_S5_R75_40$eradication <- 0.75
lin_dist_S5_R75_40$budget <- 40
lin_dist_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
lin_dist_S5_R75_40b <- fread(file_name)
lin_dist_S5_R75_40b <- data.frame(lin_dist_S5_R75_40b)[-1]

lin_dist_S5_R75_40b$location <- 'linear'
lin_dist_S5_R75_40b$detection <- 0.5
lin_dist_S5_R75_40b$eradication <- 0.75
lin_dist_S5_R75_40b$budget <- 40
lin_dist_S5_R75_40b$data <- 'both'


#--- Combine dists ---#
dist_40 <- rbind(epi_dist_S25_R75_40,epi_dist_S25_R75_40b,
                 epi_dist_S5_R75_40,epi_dist_S5_R75_40,
                 lin_dist_S5_R75_40,lin_dist_S5_R75_40b)

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S25_R75_60 <- fread(file_name)
epi_dist_S25_R75_60 <- data.frame(epi_dist_S25_R75_60)[-1]

epi_dist_S25_R75_60$location <- 'epicenter'
epi_dist_S25_R75_60$detection <- 0.25
epi_dist_S25_R75_60$eradication <- 0.75
epi_dist_S25_R75_60$budget <- 60
epi_dist_S25_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S25_R75_60b <- fread(file_name)
epi_dist_S25_R75_60b <- data.frame(epi_dist_S25_R75_60b)[-1]

epi_dist_S25_R75_60b$location <- 'epicenter'
epi_dist_S25_R75_60b$detection <- 0.25
epi_dist_S25_R75_60b$eradication <- 0.75
epi_dist_S25_R75_60b$budget <- 60
epi_dist_S25_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S5_R75_60 <- fread(file_name)
epi_dist_S5_R75_60 <- data.frame(epi_dist_S5_R75_60)[-1]

epi_dist_S5_R75_60$location <- 'epicenter'
epi_dist_S5_R75_60$detection <- 0.5
epi_dist_S5_R75_60$eradication <- 0.75
epi_dist_S5_R75_60$budget <- 60
epi_dist_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
epi_dist_S5_R75_60b <- fread(file_name)
epi_dist_S5_R75_60b <- data.frame(epi_dist_S5_R75_60b)[-1]

epi_dist_S5_R75_60b$location <- 'epicenter'
epi_dist_S5_R75_60b$detection <- 0.5
epi_dist_S5_R75_60b$eradication <- 0.75
epi_dist_S5_R75_60b$budget <- 60
epi_dist_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
lin_dist_S5_R75_60 <- fread(file_name)
lin_dist_S5_R75_60 <- data.frame(lin_dist_S5_R75_60)[-1]

lin_dist_S5_R75_60$location <- 'linear'
lin_dist_S5_R75_60$detection <- 0.5
lin_dist_S5_R75_60$eradication <- 0.75
lin_dist_S5_R75_60$budget <- 60
lin_dist_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
lin_dist_S5_R75_60b <- fread(file_name)
lin_dist_S5_R75_60b <- data.frame(lin_dist_S5_R75_60b)[-1]

lin_dist_S5_R75_60b$location <- 'linear'
lin_dist_S5_R75_60b$detection <- 0.5
lin_dist_S5_R75_60b$eradication <- 0.75
lin_dist_S5_R75_60b$budget <- 60
lin_dist_S5_R75_60b$data <- 'both'


#--- Combine dists ---#
dist_60 <- rbind(epi_dist_S25_R75_60,epi_dist_S25_R75_60b,
                 epi_dist_S5_R75_60,epi_dist_S5_R75_60,
                 lin_dist_S5_R75_60,lin_dist_S5_R75_60b)

dist <- rbind(dist_20, dist_40, dist_60)

#### Sites Visit ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S25_R75_20 <- fread(file_name)
epi_sites_S25_R75_20 <- data.frame(epi_sites_S25_R75_20)[-1]

epi_sites_S25_R75_20$location <- 'epicenter'
epi_sites_S25_R75_20$detection <- 0.25
epi_sites_S25_R75_20$eradication <- 0.75
epi_sites_S25_R75_20$budget <- 20
epi_sites_S25_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S25_R75_20b <- fread(file_name)
epi_sites_S25_R75_20b <- data.frame(epi_sites_S25_R75_20b)[-1]

epi_sites_S25_R75_20b$location <- 'epicenter'
epi_sites_S25_R75_20b$detection <- 0.25
epi_sites_S25_R75_20b$eradication <- 0.75
epi_sites_S25_R75_20b$budget <- 20
epi_sites_S25_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S5_R75_20 <- fread(file_name)
epi_sites_S5_R75_20 <- data.frame(epi_sites_S5_R75_20)[-1]

epi_sites_S5_R75_20$location <- 'epicenter'
epi_sites_S5_R75_20$detection <- 0.5
epi_sites_S5_R75_20$eradication <- 0.75
epi_sites_S5_R75_20$budget <- 20
epi_sites_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S5_R75_20b <- fread(file_name)
epi_sites_S5_R75_20b <- data.frame(epi_sites_S5_R75_20b)[-1]

epi_sites_S5_R75_20b$location <- 'epicenter'
epi_sites_S5_R75_20b$detection <- 0.5
epi_sites_S5_R75_20b$eradication <- 0.75
epi_sites_S5_R75_20b$budget <- 20
epi_sites_S5_R75_20b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
lin_sites_S5_R75_20 <- fread(file_name)
lin_sites_S5_R75_20 <- data.frame(lin_sites_S5_R75_20)[-1]

lin_sites_S5_R75_20$location <- 'linear'
lin_sites_S5_R75_20$detection <- 0.5
lin_sites_S5_R75_20$eradication <- 0.75
lin_sites_S5_R75_20$budget <- 20
lin_sites_S5_R75_20$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
lin_sites_S5_R75_20b <- fread(file_name)
lin_sites_S5_R75_20b <- data.frame(lin_sites_S5_R75_20b)[-1]

lin_sites_S5_R75_20b$location <- 'linear'
lin_sites_S5_R75_20b$detection <- 0.5
lin_sites_S5_R75_20b$eradication <- 0.75
lin_sites_S5_R75_20b$budget <- 20
lin_sites_S5_R75_20b$data <- 'both'

#--- Combine dists ---#
sites_20 <- rbind(epi_sites_S25_R75_20,epi_sites_S25_R75_20b,
                  epi_sites_S5_R75_20,epi_sites_S5_R75_20b,
                  lin_sites_S5_R75_20,lin_sites_S5_R75_20b)

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S25_R75_40 <- fread(file_name)
epi_sites_S25_R75_40 <- data.frame(epi_sites_S25_R75_40)[-1]

epi_sites_S25_R75_40$location <- 'epicenter'
epi_sites_S25_R75_40$detection <- 0.25
epi_sites_S25_R75_40$eradication <- 0.75
epi_sites_S25_R75_40$budget <- 40
epi_sites_S25_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S25_R75_40b <- fread(file_name)
epi_sites_S25_R75_40b <- data.frame(epi_sites_S25_R75_40b)[-1]

epi_sites_S25_R75_40b$location <- 'epicenter'
epi_sites_S25_R75_40b$detection <- 0.25
epi_sites_S25_R75_40b$eradication <- 0.75
epi_sites_S25_R75_40b$budget <- 40
epi_sites_S25_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S5_R75_40 <- fread(file_name)
epi_sites_S5_R75_40 <- data.frame(epi_sites_S5_R75_40)[-1]

epi_sites_S5_R75_40$location <- 'epicenter'
epi_sites_S5_R75_40$detection <- 0.5
epi_sites_S5_R75_40$eradication <- 0.75
epi_sites_S5_R75_40$budget <- 40
epi_sites_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S5_R75_40b <- fread(file_name)
epi_sites_S5_R75_40b <- data.frame(epi_sites_S5_R75_40b)[-1]

epi_sites_S5_R75_40b$location <- 'epicenter'
epi_sites_S5_R75_40b$detection <- 0.5
epi_sites_S5_R75_40b$eradication <- 0.75
epi_sites_S5_R75_40b$budget <- 40
epi_sites_S5_R75_40b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
lin_sites_S5_R75_40 <- fread(file_name)
lin_sites_S5_R75_40 <- data.frame(lin_sites_S5_R75_40)[-1]

lin_sites_S5_R75_40$location <- 'linear'
lin_sites_S5_R75_40$detection <- 0.5
lin_sites_S5_R75_40$eradication <- 0.75
lin_sites_S5_R75_40$budget <- 40
lin_sites_S5_R75_40$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
lin_sites_S5_R75_40b <- fread(file_name)
lin_sites_S5_R75_40b <- data.frame(lin_sites_S5_R75_40b)[-1]

lin_sites_S5_R75_40b$location <- 'linear'
lin_sites_S5_R75_40b$detection <- 0.5
lin_sites_S5_R75_40b$eradication <- 0.75
lin_sites_S5_R75_40b$budget <- 40
lin_sites_S5_R75_40b$data <- 'both'

#--- Combine dists ---#
sites_40 <- rbind(epi_sites_S25_R75_40,epi_sites_S25_R75_40b,
                  epi_sites_S5_R75_40,epi_sites_S5_R75_40b,
                  lin_sites_S5_R75_40,lin_sites_S5_R75_40b)

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S25_R75_60 <- fread(file_name)
epi_sites_S25_R75_60 <- data.frame(epi_sites_S25_R75_60)[-1]

epi_sites_S25_R75_60$location <- 'epicenter'
epi_sites_S25_R75_60$detection <- 0.25
epi_sites_S25_R75_60$eradication <- 0.75
epi_sites_S25_R75_60$budget <- 60
epi_sites_S25_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S25_R75_60b <- fread(file_name)
epi_sites_S25_R75_60b <- data.frame(epi_sites_S25_R75_60b)[-1]

epi_sites_S25_R75_60b$location <- 'epicenter'
epi_sites_S25_R75_60b$detection <- 0.25
epi_sites_S25_R75_60b$eradication <- 0.75
epi_sites_S25_R75_60b$budget <- 60
epi_sites_S25_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S5_R75_60 <- fread(file_name)
epi_sites_S5_R75_60 <- data.frame(epi_sites_S5_R75_60)[-1]

epi_sites_S5_R75_60$location <- 'epicenter'
epi_sites_S5_R75_60$detection <- 0.5
epi_sites_S5_R75_60$eradication <- 0.75
epi_sites_S5_R75_60$budget <- 60
epi_sites_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
epi_sites_S5_R75_60b <- fread(file_name)
epi_sites_S5_R75_60b <- data.frame(epi_sites_S5_R75_60b)[-1]

epi_sites_S5_R75_60b$location <- 'epicenter'
epi_sites_S5_R75_60b$detection <- 0.5
epi_sites_S5_R75_60b$eradication <- 0.75
epi_sites_S5_R75_60b$budget <- 60
epi_sites_S5_R75_60b$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
lin_sites_S5_R75_60 <- fread(file_name)
lin_sites_S5_R75_60 <- data.frame(lin_sites_S5_R75_60)[-1]

lin_sites_S5_R75_60$location <- 'linear'
lin_sites_S5_R75_60$detection <- 0.5
lin_sites_S5_R75_60$eradication <- 0.75
lin_sites_S5_R75_60$budget <- 60
lin_sites_S5_R75_60$data <- 'both'

path <- 'E:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
lin_sites_S5_R75_60b <- fread(file_name)
lin_sites_S5_R75_60b <- data.frame(lin_sites_S5_R75_60b)[-1]

lin_sites_S5_R75_60b$location <- 'linear'
lin_sites_S5_R75_60b$detection <- 0.5
lin_sites_S5_R75_60b$eradication <- 0.75
lin_sites_S5_R75_60b$budget <- 60
lin_sites_S5_R75_60b$data <- 'both'

#--- Combine dists ---#
sites_60 <- rbind(epi_sites_S25_R75_60,epi_sites_S25_R75_60b,
                  epi_sites_S5_R75_60,epi_sites_S5_R75_60b,
                  lin_sites_S5_R75_60,lin_sites_S5_R75_60b)

sites <- rbind(sites_20, sites_40, sites_60)

#### Total visit ####
sites_total_visit <- sites
sites_total_visit <- linear_sites
sites_total_visit$visit[sites_total_visit$visit == 2] <- 1 

sites_total_visit <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                                data = as.data.frame(sites_total_visit), 
                                FUN = sum)

sites_total_visit <- sites_total_visit %>% filter(week < 5)
sites_total_visit$visit <- sites_total_visit$visit/40 #as a percentage

total_visit <- sites_total_visit

#### Total remove ####
sites_total_rem <- sites
sites_total_rem$visit[sites_total_rem$visit == 1] <- 0 
sites_total_rem$visit[sites_total_rem$visit == 2] <- 1 

sites_total_rem <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                              data = as.data.frame(sites_total_rem), 
                              FUN = sum)

sites_total_rem <- sites_total_rem %>% filter(week < 5)
sites_total_rem$visit <- sites_total_rem$visit/40 #as a percentage

total_rem <- sites_total_rem

#### Save CSVs ####
path <- 'E:\\Chapter3\\results_both'

file_name = paste(path, 'states.csv',sep = '/')
fwrite(states,file_name)

states_fin <- states %>% filter(year == 10)
file_name = paste(path, 'states_fin.csv',sep = '/')
fwrite(states_fin,file_name)

file_name = paste(path, 'states_truth.csv',sep = '/')
fwrite(state_truth,file_name)

state_truth_all_fin <- state_truth %>% filter(week == 5 & year == 10)
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
fwrite(state_truth_all_fin,file_name)

file_name = paste(path, 'bias_state.csv',sep = '/')
fwrite(bias_state,file_name)

file_name = paste(path, 'CI_state.csv',sep = '/')
fwrite(CI_state,file_name)

file_name = paste(path, 'params.csv',sep = '/')
fwrite(params,file_name)

file_name = paste(path, 'bias_params.csv',sep = '/')
fwrite(bias_params,file_name)

file_name = paste(path, 'CI_param.csv',sep = '/')
fwrite(CI_param,file_name)

file_name = paste(path, 'param_summary.csv',sep = '/')
fwrite(param_summary,file_name)


dist_traveled <- aggregate(distance ~ sim + location + detection + eradication + budget, 
                          data = as.data.frame(dist), 
                          FUN = sum)

file_name = paste(path, 'dist.csv',sep = '/')
fwrite(dist_traveled,file_name)

file_name = paste(path, 'sites.csv',sep = '/')
fwrite(sites,file_name)

file_name = paste(path, 'total_visit.csv',sep = '/')
fwrite(total_visit,file_name)

file_name = paste(path, 'total_rem.csv',sep = '/')
fwrite(total_rem,file_name)
