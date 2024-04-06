library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States ####
#-Budget 20-#
#-- epicenter_S25_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_20 <- fread(file_name)
epistate_S25_R75_20 <- data.frame(epistate_S25_R75_20)[-1]

epistate_S25_R75_20$location <- 'epicenter'
epistate_S25_R75_20$detection <- 0.25
epistate_S25_R75_20$eradication <- 0.75
epistate_S25_R75_20$budget <- 20
epistate_S25_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_20b <- fread(file_name)
epistate_S25_R75_20b <- data.frame(epistate_S25_R75_20b)[-1]

epistate_S25_R75_20b$location <- 'epicenter'
epistate_S25_R75_20b$detection <- 0.25
epistate_S25_R75_20b$eradication <- 0.75
epistate_S25_R75_20b$budget <- 20
epistate_S25_R75_20b$data <- 'both'

#-- epicenter_S5_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_20 <- fread(file_name)
epistate_S5_R75_20 <- data.frame(epistate_S5_R75_20)[-1]

epistate_S5_R75_20$location <- 'epicenter'
epistate_S5_R75_20$detection <- 0.5
epistate_S5_R75_20$eradication <- 0.75
epistate_S5_R75_20$budget <- 20
epistate_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_20b <- fread(file_name)
epistate_S5_R75_20b <- data.frame(epistate_S5_R75_20b)[-1]

epistate_S5_R75_20b$location <- 'epicenter'
epistate_S5_R75_20b$detection <- 0.5
epistate_S5_R75_20b$eradication <- 0.75
epistate_S5_R75_20b$budget <- 20
epistate_S5_R75_20b$data <- 'both'

#-- linear_S5_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
linstate_S5_R75_20 <- fread(file_name)
linstate_S5_R75_20 <- data.frame(linstate_S5_R75_20)[-1]

linstate_S5_R75_20$location <- 'linear'
linstate_S5_R75_20$detection <- 0.5
linstate_S5_R75_20$eradication <- 0.75
linstate_S5_R75_20$budget <- 20
linstate_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
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
path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_40 <- fread(file_name)
epistate_S25_R75_40 <- data.frame(epistate_S25_R75_40)[-1]

epistate_S25_R75_40$location <- 'epicenter'
epistate_S25_R75_40$detection <- 0.25
epistate_S25_R75_40$eradication <- 0.75
epistate_S25_R75_40$budget <- 40
epistate_S25_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_40b <- fread(file_name)
epistate_S25_R75_40b <- data.frame(epistate_S25_R75_40b)[-1]

epistate_S25_R75_40b$location <- 'epicenter'
epistate_S25_R75_40b$detection <- 0.25
epistate_S25_R75_40b$eradication <- 0.75
epistate_S25_R75_40b$budget <- 40
epistate_S25_R75_40b$data <- 'both'

#-- epicenter_S5_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_40 <- fread(file_name)
epistate_S5_R75_40 <- data.frame(epistate_S5_R75_40)[-1]

epistate_S5_R75_40$location <- 'epicenter'
epistate_S5_R75_40$detection <- 0.5
epistate_S5_R75_40$eradication <- 0.75
epistate_S5_R75_40$budget <- 40
epistate_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_40b <- fread(file_name)
epistate_S5_R75_40b <- data.frame(epistate_S5_R75_40b)[-1]

epistate_S5_R75_40b$location <- 'epicenter'
epistate_S5_R75_40b$detection <- 0.5
epistate_S5_R75_40b$eradication <- 0.75
epistate_S5_R75_40b$budget <- 40
epistate_S5_R75_40b$data <- 'both'

#-- epicenter_S5_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_certain'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_40c <- fread(file_name)
epistate_S5_R75_40c <- data.frame(epistate_S5_R75_40c)[-1]

epistate_S5_R75_40c$location <- 'epicenter'
epistate_S5_R75_40c$detection <- 1
epistate_S5_R75_40c$eradication <- 0.75
epistate_S5_R75_40c$budget <- 40
epistate_S5_R75_40c$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_certain_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_40cb <- fread(file_name)
epistate_S5_R75_40cb <- data.frame(epistate_S5_R75_40cb)[-1]

epistate_S5_R75_40cb$location <- 'epicenter'
epistate_S5_R75_40cb$detection <- 1
epistate_S5_R75_40cb$eradication <- 0.75
epistate_S5_R75_40cb$budget <- 40
epistate_S5_R75_40cb$data <- 'both'

#-- linear_S5_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
linstate_S5_R75_40 <- fread(file_name)
linstate_S5_R75_40 <- data.frame(linstate_S5_R75_40)[-1]

linstate_S5_R75_40$location <- 'linear'
linstate_S5_R75_40$detection <- 0.5
linstate_S5_R75_40$eradication <- 0.75
linstate_S5_R75_40$budget <- 40
linstate_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
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
                  epistate_S5_R75_40c, epistate_S5_R75_40cb,
                  linstate_S5_R75_40, linstate_S5_R75_40b)


#- Budget 60 -#
#-- epicenter_S25_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_60 <- fread(file_name)
epistate_S25_R75_60 <- data.frame(epistate_S25_R75_60)[-1]

epistate_S25_R75_60$location <- 'epicenter'
epistate_S25_R75_60$detection <- 0.25
epistate_S25_R75_60$eradication <- 0.75
epistate_S25_R75_60$budget <- 60
epistate_S25_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S25_R75_60b <- fread(file_name)
epistate_S25_R75_60b <- data.frame(epistate_S25_R75_60b)[-1]

epistate_S25_R75_60b$location <- 'epicenter'
epistate_S25_R75_60b$detection <- 0.25
epistate_S25_R75_60b$eradication <- 0.75
epistate_S25_R75_60b$budget <- 60
epistate_S25_R75_60b$data <- 'both'

#-- epicenter_S5_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_60 <- fread(file_name)
epistate_S5_R75_60 <- data.frame(epistate_S5_R75_60)[-1]

epistate_S5_R75_60$location <- 'epicenter'
epistate_S5_R75_60$detection <- 0.5
epistate_S5_R75_60$eradication <- 0.75
epistate_S5_R75_60$budget <- 60
epistate_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
epistate_S5_R75_60b <- fread(file_name)
epistate_S5_R75_60b <- data.frame(epistate_S5_R75_60b)[-1]

epistate_S5_R75_60b$location <- 'epicenter'
epistate_S5_R75_60b$detection <- 0.5
epistate_S5_R75_60b$eradication <- 0.75
epistate_S5_R75_60b$budget <- 60
epistate_S5_R75_60b$data <- 'both'

#-- linear_S5_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
linstate_S5_R75_60 <- fread(file_name)
linstate_S5_R75_60 <- data.frame(linstate_S5_R75_60)[-1]

linstate_S5_R75_60$location <- 'linear'
linstate_S5_R75_60$detection <- 0.5
linstate_S5_R75_60$eradication <- 0.75
linstate_S5_R75_60$budget <- 60
linstate_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
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
path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_20 <- fread(file_name)
epistate_truth_S25_R75_20 <- data.frame(epistate_truth_S25_R75_20)[-1]

epistate_truth_S25_R75_20$location <- 'epicenter'
epistate_truth_S25_R75_20$detection <- 0.25
epistate_truth_S25_R75_20$eradication <- 0.75
epistate_truth_S25_R75_20$budget <- 20
epistate_truth_S25_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_20b <- fread(file_name)
epistate_truth_S25_R75_20b <- data.frame(epistate_truth_S25_R75_20b)[-1]

epistate_truth_S25_R75_20b$location <- 'epicenter'
epistate_truth_S25_R75_20b$detection <- 0.25
epistate_truth_S25_R75_20b$eradication <- 0.75
epistate_truth_S25_R75_20b$budget <- 20
epistate_truth_S25_R75_20b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_20 <- fread(file_name)
epistate_truth_S5_R75_20 <- data.frame(epistate_truth_S5_R75_20)[-1]

epistate_truth_S5_R75_20$location <- 'epicenter'
epistate_truth_S5_R75_20$detection <- 0.5
epistate_truth_S5_R75_20$eradication <- 0.75
epistate_truth_S5_R75_20$budget <- 20
epistate_truth_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_20b <- fread(file_name)
epistate_truth_S5_R75_20b <- data.frame(epistate_truth_S5_R75_20b)[-1]

epistate_truth_S5_R75_20b$location <- 'epicenter'
epistate_truth_S5_R75_20b$detection <- 0.5
epistate_truth_S5_R75_20b$eradication <- 0.75
epistate_truth_S5_R75_20b$budget <- 20
epistate_truth_S5_R75_20b$data <- 'both'

#--- S5_R5_20 ---#
path <- 'D:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
epilin_truth_S5_R75_20 <- fread(file_name)
epilin_truth_S5_R75_20 <- data.frame(epilin_truth_S5_R75_20)[-1]

epilin_truth_S5_R75_20$location <- 'linear'
epilin_truth_S5_R75_20$detection <- 0.5
epilin_truth_S5_R75_20$eradication <- 0.75
epilin_truth_S5_R75_20$budget <- 20
epilin_truth_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
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
path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_40 <- fread(file_name)
epistate_truth_S25_R75_40 <- data.frame(epistate_truth_S25_R75_40)[-1]

epistate_truth_S25_R75_40$location <- 'epicenter'
epistate_truth_S25_R75_40$detection <- 0.25
epistate_truth_S25_R75_40$eradication <- 0.75
epistate_truth_S25_R75_40$budget <- 40
epistate_truth_S25_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_40b <- fread(file_name)
epistate_truth_S25_R75_40b <- data.frame(epistate_truth_S25_R75_40b)[-1]

epistate_truth_S25_R75_40b$location <- 'epicenter'
epistate_truth_S25_R75_40b$detection <- 0.25
epistate_truth_S25_R75_40b$eradication <- 0.75
epistate_truth_S25_R75_40b$budget <- 40
epistate_truth_S25_R75_40b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40 <- fread(file_name)
epistate_truth_S5_R75_40 <- data.frame(epistate_truth_S5_R75_40)[-1]

epistate_truth_S5_R75_40$location <- 'epicenter'
epistate_truth_S5_R75_40$detection <- 0.5
epistate_truth_S5_R75_40$eradication <- 0.75
epistate_truth_S5_R75_40$budget <- 40
epistate_truth_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40b <- fread(file_name)
epistate_truth_S5_R75_40b <- data.frame(epistate_truth_S5_R75_40b)[-1]

epistate_truth_S5_R75_40b$location <- 'epicenter'
epistate_truth_S5_R75_40b$detection <- 0.5
epistate_truth_S5_R75_40b$eradication <- 0.75
epistate_truth_S5_R75_40b$budget <- 40
epistate_truth_S5_R75_40b$data <- 'both'

#-- epicenter_S5_R75 --#
path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_certain'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40c <- fread(file_name)
epistate_truth_S5_R75_40c <- data.frame(epistate_truth_S5_R75_40c)[-1]

epistate_truth_S5_R75_40c$location <- 'epicenter'
epistate_truth_S5_R75_40c$detection <- 1
epistate_truth_S5_R75_40c$eradication <- 0.75
epistate_truth_S5_R75_40c$budget <- 40
epistate_truth_S5_R75_40c$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_certain_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40cb <- fread(file_name)
epistate_truth_S5_R75_40cb <- data.frame(epistate_truth_S5_R75_40cb)[-1]

epistate_truth_S5_R75_40cb$location <- 'epicenter'
epistate_truth_S5_R75_40cb$detection <- 1
epistate_truth_S5_R75_40cb$eradication <- 0.75
epistate_truth_S5_R75_40cb$budget <- 40
epistate_truth_S5_R75_40cb$data <- 'both'

#--- S5_R5_40 ---#
path <- 'D:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epilin_truth_S5_R75_40 <- fread(file_name)
epilin_truth_S5_R75_40 <- data.frame(epilin_truth_S5_R75_40)[-1]

epilin_truth_S5_R75_40$location <- 'linear'
epilin_truth_S5_R75_40$detection <- 0.5
epilin_truth_S5_R75_40$eradication <- 0.75
epilin_truth_S5_R75_40$budget <- 40
epilin_truth_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
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
                        epistate_truth_S5_R75_40c, epistate_truth_S5_R75_40cb, 
                        epilin_truth_S5_R75_40,epilin_truth_S5_R75_40b)



#-- Budget = 60 --#
path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_60 <- fread(file_name)
epistate_truth_S25_R75_60 <- data.frame(epistate_truth_S25_R75_60)[-1]

epistate_truth_S25_R75_60$location <- 'epicenter'
epistate_truth_S25_R75_60$detection <- 0.25
epistate_truth_S25_R75_60$eradication <- 0.75
epistate_truth_S25_R75_60$budget <- 60
epistate_truth_S25_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S25_R75_60b <- fread(file_name)
epistate_truth_S25_R75_60b <- data.frame(epistate_truth_S25_R75_60b)[-1]

epistate_truth_S25_R75_60b$location <- 'epicenter'
epistate_truth_S25_R75_60b$detection <- 0.25
epistate_truth_S25_R75_60b$eradication <- 0.75
epistate_truth_S25_R75_60b$budget <- 60
epistate_truth_S25_R75_60b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_60 <- fread(file_name)
epistate_truth_S5_R75_60 <- data.frame(epistate_truth_S5_R75_60)[-1]

epistate_truth_S5_R75_60$location <- 'epicenter'
epistate_truth_S5_R75_60$detection <- 0.5
epistate_truth_S5_R75_60$eradication <- 0.75
epistate_truth_S5_R75_60$budget <- 60
epistate_truth_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_60b <- fread(file_name)
epistate_truth_S5_R75_60b <- data.frame(epistate_truth_S5_R75_60b)[-1]

epistate_truth_S5_R75_60b$location <- 'epicenter'
epistate_truth_S5_R75_60b$detection <- 0.5
epistate_truth_S5_R75_60b$eradication <- 0.75
epistate_truth_S5_R75_60b$budget <- 60
epistate_truth_S5_R75_60b$data <- 'both'

#--- S5_R5_60 ---#
path <- 'D:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
epilin_truth_S5_R75_60 <- fread(file_name)
epilin_truth_S5_R75_60 <- data.frame(epilin_truth_S5_R75_60)[-1]

epilin_truth_S5_R75_60$location <- 'linear'
epilin_truth_S5_R75_60$detection <- 0.5
epilin_truth_S5_R75_60$eradication <- 0.75
epilin_truth_S5_R75_60$budget <- 60
epilin_truth_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
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
path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_20 <- fread(file_name)
epi_biasstate_S25_R75_20 <- data.frame(epi_biasstate_S25_R75_20)[-1]

epi_biasstate_S25_R75_20$location <- 'epicenter'
epi_biasstate_S25_R75_20$detection <- 0.25
epi_biasstate_S25_R75_20$eradication <- 0.75
epi_biasstate_S25_R75_20$budget <- 20
epi_biasstate_S25_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_20b <- fread(file_name)
epi_biasstate_S25_R75_20b <- data.frame(epi_biasstate_S25_R75_20b)[-1]

epi_biasstate_S25_R75_20b$location <- 'epicenter'
epi_biasstate_S25_R75_20b$detection <- 0.25
epi_biasstate_S25_R75_20b$eradication <- 0.75
epi_biasstate_S25_R75_20b$budget <- 20
epi_biasstate_S25_R75_20b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_20 <- fread(file_name)
epi_biasstate_S5_R75_20 <- data.frame(epi_biasstate_S5_R75_20)[-1]

epi_biasstate_S5_R75_20$location <- 'epicenter'
epi_biasstate_S5_R75_20$detection <- 0.5
epi_biasstate_S5_R75_20$eradication <- 0.75
epi_biasstate_S5_R75_20$budget <- 20
epi_biasstate_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_20b <- fread(file_name)
epi_biasstate_S5_R75_20b <- data.frame(epi_biasstate_S5_R75_20b)[-1]

epi_biasstate_S5_R75_20b$location <- 'epicenter'
epi_biasstate_S5_R75_20b$detection <- 0.5
epi_biasstate_S5_R75_20b$eradication <- 0.75
epi_biasstate_S5_R75_20b$budget <- 20
epi_biasstate_S5_R75_20b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
lin_biasstate_S5_R75_20 <- fread(file_name)
lin_biasstate_S5_R75_20 <- data.frame(lin_biasstate_S5_R75_20)[-1]

lin_biasstate_S5_R75_20$location <- 'linear'
lin_biasstate_S5_R75_20$detection <- 0.5
lin_biasstate_S5_R75_20$eradication <- 0.75
lin_biasstate_S5_R75_20$budget <- 20
lin_biasstate_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
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
path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_40 <- fread(file_name)
epi_biasstate_S25_R75_40 <- data.frame(epi_biasstate_S25_R75_40)[-1]

epi_biasstate_S25_R75_40$location <- 'epicenter'
epi_biasstate_S25_R75_40$detection <- 0.25
epi_biasstate_S25_R75_40$eradication <- 0.75
epi_biasstate_S25_R75_40$budget <- 40
epi_biasstate_S25_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_40b <- fread(file_name)
epi_biasstate_S25_R75_40b <- data.frame(epi_biasstate_S25_R75_40b)[-1]

epi_biasstate_S25_R75_40b$location <- 'epicenter'
epi_biasstate_S25_R75_40b$detection <- 0.25
epi_biasstate_S25_R75_40b$eradication <- 0.75
epi_biasstate_S25_R75_40b$budget <- 40
epi_biasstate_S25_R75_40b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40 <- fread(file_name)
epi_biasstate_S5_R75_40 <- data.frame(epi_biasstate_S5_R75_40)[-1]

epi_biasstate_S5_R75_40$location <- 'epicenter'
epi_biasstate_S5_R75_40$detection <- 0.5
epi_biasstate_S5_R75_40$eradication <- 0.75
epi_biasstate_S5_R75_40$budget <- 40
epi_biasstate_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40b <- fread(file_name)
epi_biasstate_S5_R75_40b <- data.frame(epi_biasstate_S5_R75_40b)[-1]

epi_biasstate_S5_R75_40b$location <- 'epicenter'
epi_biasstate_S5_R75_40b$detection <- 0.5
epi_biasstate_S5_R75_40b$eradication <- 0.75
epi_biasstate_S5_R75_40b$budget <- 40
epi_biasstate_S5_R75_40b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_certain'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40c <- fread(file_name)
epi_biasstate_S5_R75_40c <- data.frame(epi_biasstate_S5_R75_40c)[-1]

epi_biasstate_S5_R75_40c$location <- 'epicenter'
epi_biasstate_S5_R75_40c$detection <- 1
epi_biasstate_S5_R75_40c$eradication <- 0.75
epi_biasstate_S5_R75_40c$budget <- 40
epi_biasstate_S5_R75_40c$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_certain_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40cb <- fread(file_name)
epi_biasstate_S5_R75_40cb <- data.frame(epi_biasstate_S5_R75_40cb)[-1]

epi_biasstate_S5_R75_40cb$location <- 'epicenter'
epi_biasstate_S5_R75_40cb$detection <- 1
epi_biasstate_S5_R75_40cb$eradication <- 0.75
epi_biasstate_S5_R75_40cb$budget <- 40
epi_biasstate_S5_R75_40cb$data <- 'both'


path <- 'D:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
lin_biasstate_S5_R75_40 <- fread(file_name)
lin_biasstate_S5_R75_40 <- data.frame(lin_biasstate_S5_R75_40)[-1]

lin_biasstate_S5_R75_40$location <- 'linear'
lin_biasstate_S5_R75_40$detection <- 0.5
lin_biasstate_S5_R75_40$eradication <- 0.75
lin_biasstate_S5_R75_40$budget <- 40
lin_biasstate_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
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
                       epi_biasstate_S5_R75_40c,epi_biasstate_S5_R75_40cb,
                       lin_biasstate_S5_R75_40,lin_biasstate_S5_R75_40b)

#-- Budget = 60 --#
path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_60 <- fread(file_name)
epi_biasstate_S25_R75_60 <- data.frame(epi_biasstate_S25_R75_60)[-1]

epi_biasstate_S25_R75_60$location <- 'epicenter'
epi_biasstate_S25_R75_60$detection <- 0.25
epi_biasstate_S25_R75_60$eradication <- 0.75
epi_biasstate_S25_R75_60$budget <- 60
epi_biasstate_S25_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S25_R75_60b <- fread(file_name)
epi_biasstate_S25_R75_60b <- data.frame(epi_biasstate_S25_R75_60b)[-1]

epi_biasstate_S25_R75_60b$location <- 'epicenter'
epi_biasstate_S25_R75_60b$detection <- 0.25
epi_biasstate_S25_R75_60b$eradication <- 0.75
epi_biasstate_S25_R75_60b$budget <- 60
epi_biasstate_S25_R75_60b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_60 <- fread(file_name)
epi_biasstate_S5_R75_60 <- data.frame(epi_biasstate_S5_R75_60)[-1]

epi_biasstate_S5_R75_60$location <- 'epicenter'
epi_biasstate_S5_R75_60$detection <- 0.5
epi_biasstate_S5_R75_60$eradication <- 0.75
epi_biasstate_S5_R75_60$budget <- 60
epi_biasstate_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_60b <- fread(file_name)
epi_biasstate_S5_R75_60b <- data.frame(epi_biasstate_S5_R75_60b)[-1]

epi_biasstate_S5_R75_60b$location <- 'epicenter'
epi_biasstate_S5_R75_60b$detection <- 0.5
epi_biasstate_S5_R75_60b$eradication <- 0.75
epi_biasstate_S5_R75_60b$budget <- 60
epi_biasstate_S5_R75_60b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
lin_biasstate_S5_R75_60 <- fread(file_name)
lin_biasstate_S5_R75_60 <- data.frame(lin_biasstate_S5_R75_60)[-1]

lin_biasstate_S5_R75_60$location <- 'linear'
lin_biasstate_S5_R75_60$detection <- 0.5
lin_biasstate_S5_R75_60$eradication <- 0.75
lin_biasstate_S5_R75_60$budget <- 60
lin_biasstate_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
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

#### Bias params ####
#-- Budget = 20 --#
path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_20 <- fread(file_name)
epi_biasparam_S25_R75_20 <- data.frame(epi_biasparam_S25_R75_20)[-1]

epi_biasparam_S25_R75_20$location <- 'epicenter'
epi_biasparam_S25_R75_20$detection <- 0.25
epi_biasparam_S25_R75_20$eradication <- 0.75
epi_biasparam_S25_R75_20$budget <- 20
epi_biasparam_S25_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S25_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_20b <- fread(file_name)
epi_biasparam_S25_R75_20b <- data.frame(epi_biasparam_S25_R75_20b)[-1]

epi_biasparam_S25_R75_20b$location <- 'epicenter'
epi_biasparam_S25_R75_20b$detection <- 0.25
epi_biasparam_S25_R75_20b$eradication <- 0.75
epi_biasparam_S25_R75_20b$budget <- 20
epi_biasparam_S25_R75_20b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_20 <- fread(file_name)
epi_biasparam_S5_R75_20 <- data.frame(epi_biasparam_S5_R75_20)[-1]

epi_biasparam_S5_R75_20$location <- 'epicenter'
epi_biasparam_S5_R75_20$detection <- 0.5
epi_biasparam_S5_R75_20$eradication <- 0.75
epi_biasparam_S5_R75_20$budget <- 20
epi_biasparam_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\epicenter_S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_20b <- fread(file_name)
epi_biasparam_S5_R75_20b <- data.frame(epi_biasparam_S5_R75_20b)[-1]

epi_biasparam_S5_R75_20b$location <- 'epicenter'
epi_biasparam_S5_R75_20b$detection <- 0.5
epi_biasparam_S5_R75_20b$eradication <- 0.75
epi_biasparam_S5_R75_20b$budget <- 20
epi_biasparam_S5_R75_20b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
lin_biasparam_S5_R75_20 <- fread(file_name)
lin_biasparam_S5_R75_20 <- data.frame(lin_biasparam_S5_R75_20)[-1]

lin_biasparam_S5_R75_20$location <- 'linear'
lin_biasparam_S5_R75_20$detection <- 0.5
lin_biasparam_S5_R75_20$eradication <- 0.75
lin_biasparam_S5_R75_20$budget <- 20
lin_biasparam_S5_R75_20$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget20\\linear_S5_R75_20_b'
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
path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_40 <- fread(file_name)
epi_biasparam_S25_R75_40 <- data.frame(epi_biasparam_S25_R75_40)[-1]

epi_biasparam_S25_R75_40$location <- 'epicenter'
epi_biasparam_S25_R75_40$detection <- 0.25
epi_biasparam_S25_R75_40$eradication <- 0.75
epi_biasparam_S25_R75_40$budget <- 40
epi_biasparam_S25_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S25_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_40b <- fread(file_name)
epi_biasparam_S25_R75_40b <- data.frame(epi_biasparam_S25_R75_40b)[-1]

epi_biasparam_S25_R75_40b$location <- 'epicenter'
epi_biasparam_S25_R75_40b$detection <- 0.25
epi_biasparam_S25_R75_40b$eradication <- 0.75
epi_biasparam_S25_R75_40b$budget <- 40
epi_biasparam_S25_R75_40b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40 <- fread(file_name)
epi_biasparam_S5_R75_40 <- data.frame(epi_biasparam_S5_R75_40)[-1]

epi_biasparam_S5_R75_40$location <- 'epicenter'
epi_biasparam_S5_R75_40$detection <- 0.5
epi_biasparam_S5_R75_40$eradication <- 0.75
epi_biasparam_S5_R75_40$budget <- 40
epi_biasparam_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40b <- fread(file_name)
epi_biasparam_S5_R75_40b <- data.frame(epi_biasparam_S5_R75_40b)[-1]

epi_biasparam_S5_R75_40b$location <- 'epicenter'
epi_biasparam_S5_R75_40b$detection <- 0.5
epi_biasparam_S5_R75_40b$eradication <- 0.75
epi_biasparam_S5_R75_40b$budget <- 40
epi_biasparam_S5_R75_40b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_certain'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40c <- fread(file_name)
epi_biasparam_S5_R75_40c <- data.frame(epi_biasparam_S5_R75_40c)[-1]

epi_biasparam_S5_R75_40c$location <- 'epicenter'
epi_biasparam_S5_R75_40c$detection <- 1
epi_biasparam_S5_R75_40c$eradication <- 0.75
epi_biasparam_S5_R75_40c$budget <- 40
epi_biasparam_S5_R75_40c$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\epicenter_S5_R75_40_certain_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40cb <- fread(file_name)
epi_biasparam_S5_R75_40cb <- data.frame(epi_biasparam_S5_R75_40cb)[-1]

epi_biasparam_S5_R75_40cb$location <- 'epicenter'
epi_biasparam_S5_R75_40cb$detection <- 1
epi_biasparam_S5_R75_40cb$eradication <- 0.75
epi_biasparam_S5_R75_40cb$budget <- 40
epi_biasparam_S5_R75_40cb$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
lin_biasparam_S5_R75_40 <- fread(file_name)
lin_biasparam_S5_R75_40 <- data.frame(lin_biasparam_S5_R75_40)[-1]

lin_biasparam_S5_R75_40$location <- 'linear'
lin_biasparam_S5_R75_40$detection <- 0.5
lin_biasparam_S5_R75_40$eradication <- 0.75
lin_biasparam_S5_R75_40$budget <- 40
lin_biasparam_S5_R75_40$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget40\\linear_S5_R75_40_b'
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
                       epi_biasparam_S5_R75_40c,epi_biasparam_S5_R75_40cb,
                       lin_biasparam_S5_R75_40,lin_biasparam_S5_R75_40b)

#-- Budget = 60 --#
path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_60 <- fread(file_name)
epi_biasparam_S25_R75_60 <- data.frame(epi_biasparam_S25_R75_60)[-1]

epi_biasparam_S25_R75_60$location <- 'epicenter'
epi_biasparam_S25_R75_60$detection <- 0.25
epi_biasparam_S25_R75_60$eradication <- 0.75
epi_biasparam_S25_R75_60$budget <- 60
epi_biasparam_S25_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S25_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S25_R75_60b <- fread(file_name)
epi_biasparam_S25_R75_60b <- data.frame(epi_biasparam_S25_R75_60b)[-1]

epi_biasparam_S25_R75_60b$location <- 'epicenter'
epi_biasparam_S25_R75_60b$detection <- 0.25
epi_biasparam_S25_R75_60b$eradication <- 0.75
epi_biasparam_S25_R75_60b$budget <- 60
epi_biasparam_S25_R75_60b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_60 <- fread(file_name)
epi_biasparam_S5_R75_60 <- data.frame(epi_biasparam_S5_R75_60)[-1]

epi_biasparam_S5_R75_60$location <- 'epicenter'
epi_biasparam_S5_R75_60$detection <- 0.5
epi_biasparam_S5_R75_60$eradication <- 0.75
epi_biasparam_S5_R75_60$budget <- 60
epi_biasparam_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\epicenter_S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_60b <- fread(file_name)
epi_biasparam_S5_R75_60b <- data.frame(epi_biasparam_S5_R75_60b)[-1]

epi_biasparam_S5_R75_60b$location <- 'epicenter'
epi_biasparam_S5_R75_60b$detection <- 0.5
epi_biasparam_S5_R75_60b$eradication <- 0.75
epi_biasparam_S5_R75_60b$budget <- 60
epi_biasparam_S5_R75_60b$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
lin_biasparam_S5_R75_60 <- fread(file_name)
lin_biasparam_S5_R75_60 <- data.frame(lin_biasparam_S5_R75_60)[-1]

lin_biasparam_S5_R75_60$location <- 'linear'
lin_biasparam_S5_R75_60$detection <- 0.5
lin_biasparam_S5_R75_60$eradication <- 0.75
lin_biasparam_S5_R75_60$budget <- 60
lin_biasparam_S5_R75_60$data <- 'both'

path <- 'D:\\Chapter3\\results_both\\budget60\\linear_S5_R75_60_b'
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



#### Save CSVs ####
path <- 'D:\\Chapter3\\results_both'

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

file_name = paste(path, 'bias_params.csv',sep = '/')
fwrite(bias_params,file_name)

