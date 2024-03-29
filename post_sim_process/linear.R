library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R5_20 <- fread(file_name)
state_S25_R5_20 <- data.frame(state_S25_R5_20)[-1]

state_S25_R5_20$location <- 'linear'
state_S25_R5_20$detection <- 0.25
state_S25_R5_20$eradication <- 0.5
state_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R5_20b <- fread(file_name)
state_S25_R5_20b <- data.frame(state_S25_R5_20b)[-1]

state_S25_R5_20b$location <- 'linear'
state_S25_R5_20b$detection <- 0.25
state_S25_R5_20b$eradication <- 0.5
state_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R75_20 <- fread(file_name)
state_S25_R75_20 <- data.frame(state_S25_R75_20)[-1]

state_S25_R75_20$location <- 'linear'
state_S25_R75_20$detection <- 0.25
state_S25_R75_20$eradication <- 0.75
state_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R75_20b <- fread(file_name)
state_S25_R75_20b <- data.frame(state_S25_R75_20b)[-1]

state_S25_R75_20b$location <- 'linear'
state_S25_R75_20b$detection <- 0.25
state_S25_R75_20b$eradication <- 0.75
state_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R5_20 <- fread(file_name)
state_S5_R5_20 <- data.frame(state_S5_R5_20)[-1]

state_S5_R5_20$location <- 'linear'
state_S5_R5_20$detection <- 0.5
state_S5_R5_20$eradication <- 0.5
state_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R5_20b <- fread(file_name)
state_S5_R5_20b <- data.frame(state_S5_R5_20b)[-1]

state_S5_R5_20b$location <- 'linear'
state_S5_R5_20b$detection <- 0.5
state_S5_R5_20b$eradication <- 0.5
state_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R75_20 <- fread(file_name)
state_S5_R75_20 <- data.frame(state_S5_R75_20)[-1]

state_S5_R75_20$location <- 'linear'
state_S5_R75_20$detection <- 0.5
state_S5_R75_20$eradication <- 0.75
state_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R75_20b <- fread(file_name)
state_S5_R75_20b <- data.frame(state_S5_R75_20b)[-1]

state_S5_R75_20b$location <- 'linear'
state_S5_R75_20b$detection <- 0.5
state_S5_R75_20b$eradication <- 0.75
state_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R5_20 <- fread(file_name)
state_S75_R5_20 <- data.frame(state_S75_R5_20)[-1]

state_S75_R5_20$location <- 'linear'
state_S75_R5_20$detection <- 0.75
state_S75_R5_20$eradication <- 0.5
state_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R5_20b <- fread(file_name)
state_S75_R5_20b <- data.frame(state_S75_R5_20b)[-1]

state_S75_R5_20b$location <- 'linear'
state_S75_R5_20b$detection <- 0.75
state_S75_R5_20b$eradication <- 0.5
state_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R75_20 <- fread(file_name)
state_S75_R75_20 <- data.frame(state_S75_R75_20)[-1]

state_S75_R75_20$location <- 'linear'
state_S75_R75_20$detection <- 0.75
state_S75_R75_20$eradication <- 0.75
state_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R75_20b <- fread(file_name)
state_S75_R75_20b <- data.frame(state_S75_R75_20b)[-1]

state_S75_R75_20b$location <- 'linear'
state_S75_R75_20b$detection <- 0.75
state_S75_R75_20b$eradication <- 0.75
state_S75_R75_20b$budget <- 20

#--- Combine states ---#
state_20 <- rbind(state_S25_R5_20,state_S25_R5_20b,
                  state_S25_R75_20,state_S25_R75_20b,
                  state_S5_R5_20,state_S5_R5_20b,
                  state_S5_R75_20,state_S5_R75_20b,
                  state_S75_R5_20,state_S75_R5_20b,
                  state_S75_R75_20,state_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R5_40 <- fread(file_name)
state_S25_R5_40 <- data.frame(state_S25_R5_40)[-1]

state_S25_R5_40$location <- 'linear'
state_S25_R5_40$detection <- 0.25
state_S25_R5_40$eradication <- 0.5
state_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R5_40b <- fread(file_name)
state_S25_R5_40b <- data.frame(state_S25_R5_40b)[-1]

state_S25_R5_40b$location <- 'linear'
state_S25_R5_40b$detection <- 0.25
state_S25_R5_40b$eradication <- 0.5
state_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R75_40 <- fread(file_name)
state_S25_R75_40 <- data.frame(state_S25_R75_40)[-1]

state_S25_R75_40$location <- 'linear'
state_S25_R75_40$detection <- 0.25
state_S25_R75_40$eradication <- 0.75
state_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R75_40b <- fread(file_name)
state_S25_R75_40b <- data.frame(state_S25_R75_40b)[-1]

state_S25_R75_40b$location <- 'linear'
state_S25_R75_40b$detection <- 0.25
state_S25_R75_40b$eradication <- 0.75
state_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R5_40 <- fread(file_name)
state_S5_R5_40 <- data.frame(state_S5_R5_40)[-1]

state_S5_R5_40$location <- 'linear'
state_S5_R5_40$detection <- 0.5
state_S5_R5_40$eradication <- 0.5
state_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R5_40b <- fread(file_name)
state_S5_R5_40b <- data.frame(state_S5_R5_40b)[-1]

state_S5_R5_40b$location <- 'linear'
state_S5_R5_40b$detection <- 0.5
state_S5_R5_40b$eradication <- 0.5
state_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R75_40 <- fread(file_name)
state_S5_R75_40 <- data.frame(state_S5_R75_40)[-1]

state_S5_R75_40$location <- 'linear'
state_S5_R75_40$detection <- 0.5
state_S5_R75_40$eradication <- 0.75
state_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R75_40b <- fread(file_name)
state_S5_R75_40b <- data.frame(state_S5_R75_40b)[-1]

state_S5_R75_40b$location <- 'linear'
state_S5_R75_40b$detection <- 0.5
state_S5_R75_40b$eradication <- 0.75
state_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R5_40 <- fread(file_name)
state_S75_R5_40 <- data.frame(state_S75_R5_40)[-1]

state_S75_R5_40$location <- 'linear'
state_S75_R5_40$detection <- 0.75
state_S75_R5_40$eradication <- 0.5
state_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R5_40b <- fread(file_name)
state_S75_R5_40b <- data.frame(state_S75_R5_40b)[-1]

state_S75_R5_40b$location <- 'linear'
state_S75_R5_40b$detection <- 0.75
state_S75_R5_40b$eradication <- 0.5
state_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R75_40 <- fread(file_name)
state_S75_R75_40 <- data.frame(state_S75_R75_40)[-1]

state_S75_R75_40$location <- 'linear'
state_S75_R75_40$detection <- 0.75
state_S75_R75_40$eradication <- 0.75
state_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R75_40b <- fread(file_name)
state_S75_R75_40b <- data.frame(state_S75_R75_40b)[-1]

state_S75_R75_40b$location <- 'linear'
state_S75_R75_40b$detection <- 0.75
state_S75_R75_40b$eradication <- 0.75
state_S75_R75_40b$budget <- 40

#---Combine states ---#
state_40 <- rbind(state_S25_R5_40,state_S25_R5_40b,
                  state_S25_R75_40,state_S25_R75_40b,
                  state_S5_R5_40,state_S5_R5_40b,
                  state_S5_R75_40,state_S5_R75_40b,
                  state_S75_R5_40,state_S75_R5_40b,
                  state_S75_R75_40,state_S5_R75_40b)


#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R5_60 <- fread(file_name)
state_S25_R5_60 <- data.frame(state_S25_R5_60)[-1]

state_S25_R5_60$location <- 'linear'
state_S25_R5_60$detection <- 0.25
state_S25_R5_60$eradication <- 0.5
state_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R5_60b <- fread(file_name)
state_S25_R5_60b <- data.frame(state_S25_R5_60b)[-1]

state_S25_R5_60b$location <- 'linear'
state_S25_R5_60b$detection <- 0.25
state_S25_R5_60b$eradication <- 0.5
state_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R75_60 <- fread(file_name)
state_S25_R75_60 <- data.frame(state_S25_R75_60)[-1]

state_S25_R75_60$location <- 'linear'
state_S25_R75_60$detection <- 0.25
state_S25_R75_60$eradication <- 0.75
state_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S25_R75_60b <- fread(file_name)
state_S25_R75_60b <- data.frame(state_S25_R75_60b)[-1]

state_S25_R75_60b$location <- 'linear'
state_S25_R75_60b$detection <- 0.25
state_S25_R75_60b$eradication <- 0.75
state_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R5_60 <- fread(file_name)
state_S5_R5_60 <- data.frame(state_S5_R5_60)[-1]

state_S5_R5_60$location <- 'linear'
state_S5_R5_60$detection <- 0.5
state_S5_R5_60$eradication <- 0.5
state_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R5_60b <- fread(file_name)
state_S5_R5_60b <- data.frame(state_S5_R5_60b)[-1]

state_S5_R5_60b$location <- 'linear'
state_S5_R5_60b$detection <- 0.5
state_S5_R5_60b$eradication <- 0.5
state_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R75_60 <- fread(file_name)
state_S5_R75_60 <- data.frame(state_S5_R75_60)[-1]

state_S5_R75_60$location <- 'linear'
state_S5_R75_60$detection <- 0.5
state_S5_R75_60$eradication <- 0.75
state_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S5_R75_60b <- fread(file_name)
state_S5_R75_60b <- data.frame(state_S5_R75_60b)[-1]

state_S5_R75_60b$location <- 'linear'
state_S5_R75_60b$detection <- 0.5
state_S5_R75_60b$eradication <- 0.75
state_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R5_60 <- fread(file_name)
state_S75_R5_60 <- data.frame(state_S75_R5_60)[-1]

state_S75_R5_60$location <- 'linear'
state_S75_R5_60$detection <- 0.75
state_S75_R5_60$eradication <- 0.5
state_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R5_60b <- fread(file_name)
state_S75_R5_60b <- data.frame(state_S75_R5_60b)[-1]

state_S75_R5_60b$location <- 'linear'
state_S75_R5_60b$detection <- 0.75
state_S75_R5_60b$eradication <- 0.5
state_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R75_60 <- fread(file_name)
state_S75_R75_60 <- data.frame(state_S75_R75_60)[-1]

state_S75_R75_60$location <- 'linear'
state_S75_R75_60$detection <- 0.75
state_S75_R75_60$eradication <- 0.75
state_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'states.csv',sep = '/')
state_S75_R75_60b <- fread(file_name)
state_S75_R75_60b <- data.frame(state_S75_R75_60b)[-1]

state_S75_R75_60b$location <- 'linear'
state_S75_R75_60b$detection <- 0.75
state_S75_R75_60b$eradication <- 0.75
state_S75_R75_60b$budget <- 60

#--- Combine states ---#
state_60 <- rbind(state_S25_R5_60,state_S25_R5_60b,
                  state_S25_R75_60,state_S25_R75_60b,
                  state_S5_R5_60,state_S5_R5_60b,
                  state_S5_R75_60,state_S5_R75_60b,
                  state_S75_R5_60,state_S75_R5_60b,
                  state_S75_R75_60,state_S5_R75_60b)

#-- Combine states --#
states <- rbind(state_20, state_40, state_60 )

#### States truth ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20 <- fread(file_name)
state_truth_S25_R5_20 <- data.frame(state_truth_S25_R5_20)[-1]

state_truth_S25_R5_20$location <- 'linear'
state_truth_S25_R5_20$detection <- 0.25
state_truth_S25_R5_20$eradication <- 0.5
state_truth_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20b <- fread(file_name)
state_truth_S25_R5_20b <- data.frame(state_truth_S25_R5_20b)[-1]

state_truth_S25_R5_20b$location <- 'linear'
state_truth_S25_R5_20b$detection <- 0.25
state_truth_S25_R5_20b$eradication <- 0.5
state_truth_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20 <- fread(file_name)
state_truth_S25_R75_20 <- data.frame(state_truth_S25_R75_20)[-1]

state_truth_S25_R75_20$location <- 'linear'
state_truth_S25_R75_20$detection <- 0.25
state_truth_S25_R75_20$eradication <- 0.75
state_truth_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20b <- fread(file_name)
state_truth_S25_R75_20b <- data.frame(state_truth_S25_R75_20b)[-1]

state_truth_S25_R75_20b$location <- 'linear'
state_truth_S25_R75_20b$detection <- 0.25
state_truth_S25_R75_20b$eradication <- 0.75
state_truth_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20 <- fread(file_name)
state_truth_S5_R5_20 <- data.frame(state_truth_S5_R5_20)[-1]

state_truth_S5_R5_20$location <- 'linear'
state_truth_S5_R5_20$detection <- 0.5
state_truth_S5_R5_20$eradication <- 0.5
state_truth_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20b <- fread(file_name)
state_truth_S5_R5_20b <- data.frame(state_truth_S5_R5_20b)[-1]

state_truth_S5_R5_20b$location <- 'linear'
state_truth_S5_R5_20b$detection <- 0.5
state_truth_S5_R5_20b$eradication <- 0.5
state_truth_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20 <- fread(file_name)
state_truth_S5_R75_20 <- data.frame(state_truth_S5_R75_20)[-1]

state_truth_S5_R75_20$location <- 'linear'
state_truth_S5_R75_20$detection <- 0.5
state_truth_S5_R75_20$eradication <- 0.75
state_truth_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20b <- fread(file_name)
state_truth_S5_R75_20b <- data.frame(state_truth_S5_R75_20b)[-1]

state_truth_S5_R75_20b$location <- 'linear'
state_truth_S5_R75_20b$detection <- 0.5
state_truth_S5_R75_20b$eradication <- 0.75
state_truth_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20 <- fread(file_name)
state_truth_S75_R5_20 <- data.frame(state_truth_S75_R5_20)[-1]

state_truth_S75_R5_20$location <- 'linear'
state_truth_S75_R5_20$detection <- 0.75
state_truth_S75_R5_20$eradication <- 0.5
state_truth_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20b <- fread(file_name)
state_truth_S75_R5_20b <- data.frame(state_truth_S75_R5_20b)[-1]

state_truth_S75_R5_20b$location <- 'linear'
state_truth_S75_R5_20b$detection <- 0.75
state_truth_S75_R5_20b$eradication <- 0.5
state_truth_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20 <- fread(file_name)
state_truth_S75_R75_20 <- data.frame(state_truth_S75_R75_20)[-1]

state_truth_S75_R75_20$location <- 'linear'
state_truth_S75_R75_20$detection <- 0.75
state_truth_S75_R75_20$eradication <- 0.75
state_truth_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20b <- fread(file_name)
state_truth_S75_R75_20b <- data.frame(state_truth_S75_R75_20b)[-1]

state_truth_S75_R75_20b$location <- 'linear'
state_truth_S75_R75_20b$detection <- 0.75
state_truth_S75_R75_20b$eradication <- 0.75
state_truth_S75_R75_20b$budget <- 20

#--- Combine state_truths ---#
state_truth_20 <- rbind(state_truth_S25_R5_20,state_truth_S25_R5_20b,
                        state_truth_S25_R75_20,state_truth_S25_R75_20b,
                        state_truth_S5_R5_20,state_truth_S5_R5_20b,
                  state_truth_S5_R75_20,state_truth_S5_R75_20b,
                  state_truth_S75_R5_20,state_truth_S75_R5_20b,
                  state_truth_S75_R75_20,state_truth_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40 <- fread(file_name)
state_truth_S25_R5_40 <- data.frame(state_truth_S25_R5_40)[-1]

state_truth_S25_R5_40$location <- 'linear'
state_truth_S25_R5_40$detection <- 0.25
state_truth_S25_R5_40$eradication <- 0.5
state_truth_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40b <- fread(file_name)
state_truth_S25_R5_40b <- data.frame(state_truth_S25_R5_40b)[-1]

state_truth_S25_R5_40b$location <- 'linear'
state_truth_S25_R5_40b$detection <- 0.25
state_truth_S25_R5_40b$eradication <- 0.5
state_truth_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40 <- fread(file_name)
state_truth_S25_R75_40 <- data.frame(state_truth_S25_R75_40)[-1]

state_truth_S25_R75_40$location <- 'linear'
state_truth_S25_R75_40$detection <- 0.25
state_truth_S25_R75_40$eradication <- 0.75
state_truth_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40b <- fread(file_name)
state_truth_S25_R75_40b <- data.frame(state_truth_S25_R75_40b)[-1]

state_truth_S25_R75_40b$location <- 'linear'
state_truth_S25_R75_40b$detection <- 0.25
state_truth_S25_R75_40b$eradication <- 0.75
state_truth_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40 <- fread(file_name)
state_truth_S5_R5_40 <- data.frame(state_truth_S5_R5_40)[-1]

state_truth_S5_R5_40$location <- 'linear'
state_truth_S5_R5_40$detection <- 0.5
state_truth_S5_R5_40$eradication <- 0.5
state_truth_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40b <- fread(file_name)
state_truth_S5_R5_40b <- data.frame(state_truth_S5_R5_40b)[-1]

state_truth_S5_R5_40b$location <- 'linear'
state_truth_S5_R5_40b$detection <- 0.5
state_truth_S5_R5_40b$eradication <- 0.5
state_truth_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'linear'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'linear'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40 <- fread(file_name)
state_truth_S75_R5_40 <- data.frame(state_truth_S75_R5_40)[-1]

state_truth_S75_R5_40$location <- 'linear'
state_truth_S75_R5_40$detection <- 0.75
state_truth_S75_R5_40$eradication <- 0.5
state_truth_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40b <- fread(file_name)
state_truth_S75_R5_40b <- data.frame(state_truth_S75_R5_40b)[-1]

state_truth_S75_R5_40b$location <- 'linear'
state_truth_S75_R5_40b$detection <- 0.75
state_truth_S75_R5_40b$eradication <- 0.5
state_truth_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40 <- fread(file_name)
state_truth_S75_R75_40 <- data.frame(state_truth_S75_R75_40)[-1]

state_truth_S75_R75_40$location <- 'linear'
state_truth_S75_R75_40$detection <- 0.75
state_truth_S75_R75_40$eradication <- 0.75
state_truth_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40b <- fread(file_name)
state_truth_S75_R75_40b <- data.frame(state_truth_S75_R75_40b)[-1]

state_truth_S75_R75_40b$location <- 'linear'
state_truth_S75_R75_40b$detection <- 0.75
state_truth_S75_R75_40b$eradication <- 0.75
state_truth_S75_R75_40b$budget <- 40

#--- Combine state_truths ---#
state_truth_40 <- rbind(state_truth_S25_R5_40,state_truth_S25_R5_40b,
                        state_truth_S25_R75_40,state_truth_S25_R75_40b,
                        state_truth_S5_R5_40,state_truth_S5_R5_40b,
                        state_truth_S5_R75_40,state_truth_S5_R75_40b,
                        state_truth_S75_R5_40,state_truth_S75_R5_40b,
                        state_truth_S75_R75_40,state_truth_S5_R75_40b)



#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_60 <- fread(file_name)
state_truth_S25_R5_60 <- data.frame(state_truth_S25_R5_60)[-1]

state_truth_S25_R5_60$location <- 'linear'
state_truth_S25_R5_60$detection <- 0.25
state_truth_S25_R5_60$eradication <- 0.5
state_truth_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_60b <- fread(file_name)
state_truth_S25_R5_60b <- data.frame(state_truth_S25_R5_60b)[-1]

state_truth_S25_R5_60b$location <- 'linear'
state_truth_S25_R5_60b$detection <- 0.25
state_truth_S25_R5_60b$eradication <- 0.5
state_truth_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_60 <- fread(file_name)
state_truth_S25_R75_60 <- data.frame(state_truth_S25_R75_60)[-1]

state_truth_S25_R75_60$location <- 'linear'
state_truth_S25_R75_60$detection <- 0.25
state_truth_S25_R75_60$eradication <- 0.75
state_truth_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_60b <- fread(file_name)
state_truth_S25_R75_60b <- data.frame(state_truth_S25_R75_60b)[-1]

state_truth_S25_R75_60b$location <- 'linear'
state_truth_S25_R75_60b$detection <- 0.25
state_truth_S25_R75_60b$eradication <- 0.75
state_truth_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_60 <- fread(file_name)
state_truth_S5_R5_60 <- data.frame(state_truth_S5_R5_60)[-1]

state_truth_S5_R5_60$location <- 'linear'
state_truth_S5_R5_60$detection <- 0.5
state_truth_S5_R5_60$eradication <- 0.5
state_truth_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_60b <- fread(file_name)
state_truth_S5_R5_60b <- data.frame(state_truth_S5_R5_60b)[-1]

state_truth_S5_R5_60b$location <- 'linear'
state_truth_S5_R5_60b$detection <- 0.5
state_truth_S5_R5_60b$eradication <- 0.5
state_truth_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_60 <- fread(file_name)
state_truth_S5_R75_60 <- data.frame(state_truth_S5_R75_60)[-1]

state_truth_S5_R75_60$location <- 'linear'
state_truth_S5_R75_60$detection <- 0.5
state_truth_S5_R75_60$eradication <- 0.75
state_truth_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_60b <- fread(file_name)
state_truth_S5_R75_60b <- data.frame(state_truth_S5_R75_60b)[-1]

state_truth_S5_R75_60b$location <- 'linear'
state_truth_S5_R75_60b$detection <- 0.5
state_truth_S5_R75_60b$eradication <- 0.75
state_truth_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_60 <- fread(file_name)
state_truth_S75_R5_60 <- data.frame(state_truth_S75_R5_60)[-1]

state_truth_S75_R5_60$location <- 'linear'
state_truth_S75_R5_60$detection <- 0.75
state_truth_S75_R5_60$eradication <- 0.5
state_truth_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_60b <- fread(file_name)
state_truth_S75_R5_60b <- data.frame(state_truth_S75_R5_60b)[-1]

state_truth_S75_R5_60b$location <- 'linear'
state_truth_S75_R5_60b$detection <- 0.75
state_truth_S75_R5_60b$eradication <- 0.5
state_truth_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_60 <- fread(file_name)
state_truth_S75_R75_60 <- data.frame(state_truth_S75_R75_60)[-1]

state_truth_S75_R75_60$location <- 'linear'
state_truth_S75_R75_60$detection <- 0.75
state_truth_S75_R75_60$eradication <- 0.75
state_truth_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_60b <- fread(file_name)
state_truth_S75_R75_60b <- data.frame(state_truth_S75_R75_60b)[-1]

state_truth_S75_R75_60b$location <- 'linear'
state_truth_S75_R75_60b$detection <- 0.75
state_truth_S75_R75_60b$eradication <- 0.75
state_truth_S75_R75_60b$budget <- 60

#--- Combine state_truths ---#
state_truth_60 <- rbind(state_truth_S25_R5_60,state_truth_S25_R5_60b,
                        state_truth_S25_R75_60,state_truth_S25_R75_60b,
                        state_truth_S5_R5_60,state_truth_S5_R5_60b,
                        state_truth_S5_R75_60,state_truth_S5_R75_60b,
                        state_truth_S75_R5_60,state_truth_S75_R5_60b,
                        state_truth_S75_R75_60,state_truth_S5_R75_60b)


state_truth <- rbind(state_truth_20, state_truth_40, state_truth_60)

#### Bias state ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R5_20 <- fread(file_name)
bias_state_S25_R5_20 <- data.frame(bias_state_S25_R5_20)[-1]

bias_state_S25_R5_20$location <- 'linear'
bias_state_S25_R5_20$detection <- 0.25
bias_state_S25_R5_20$eradication <- 0.5
bias_state_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R5_20b <- fread(file_name)
bias_state_S25_R5_20b <- data.frame(bias_state_S25_R5_20b)[-1]

bias_state_S25_R5_20b$location <- 'linear'
bias_state_S25_R5_20b$detection <- 0.25
bias_state_S25_R5_20b$eradication <- 0.5
bias_state_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R75_20 <- fread(file_name)
bias_state_S25_R75_20 <- data.frame(bias_state_S25_R75_20)[-1]

bias_state_S25_R75_20$location <- 'linear'
bias_state_S25_R75_20$detection <- 0.25
bias_state_S25_R75_20$eradication <- 0.75
bias_state_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R75_20b <- fread(file_name)
bias_state_S25_R75_20b <- data.frame(bias_state_S25_R75_20b)[-1]

bias_state_S25_R75_20b$location <- 'linear'
bias_state_S25_R75_20b$detection <- 0.25
bias_state_S25_R75_20b$eradication <- 0.75
bias_state_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_20 <- fread(file_name)
bias_state_S5_R5_20 <- data.frame(bias_state_S5_R5_20)[-1]

bias_state_S5_R5_20$location <- 'linear'
bias_state_S5_R5_20$detection <- 0.5
bias_state_S5_R5_20$eradication <- 0.5
bias_state_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_20b <- fread(file_name)
bias_state_S5_R5_20b <- data.frame(bias_state_S5_R5_20b)[-1]

bias_state_S5_R5_20b$location <- 'linear'
bias_state_S5_R5_20b$detection <- 0.5
bias_state_S5_R5_20b$eradication <- 0.5
bias_state_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_20 <- fread(file_name)
bias_state_S5_R75_20 <- data.frame(bias_state_S5_R75_20)[-1]

bias_state_S5_R75_20$location <- 'linear'
bias_state_S5_R75_20$detection <- 0.5
bias_state_S5_R75_20$eradication <- 0.75
bias_state_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_20b <- fread(file_name)
bias_state_S5_R75_20b <- data.frame(bias_state_S5_R75_20b)[-1]

bias_state_S5_R75_20b$location <- 'linear'
bias_state_S5_R75_20b$detection <- 0.5
bias_state_S5_R75_20b$eradication <- 0.75
bias_state_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R5_20 <- fread(file_name)
bias_state_S75_R5_20 <- data.frame(bias_state_S75_R5_20)[-1]

bias_state_S75_R5_20$location <- 'linear'
bias_state_S75_R5_20$detection <- 0.75
bias_state_S75_R5_20$eradication <- 0.5
bias_state_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R5_20b <- fread(file_name)
bias_state_S75_R5_20b <- data.frame(bias_state_S75_R5_20b)[-1]

bias_state_S75_R5_20b$location <- 'linear'
bias_state_S75_R5_20b$detection <- 0.75
bias_state_S75_R5_20b$eradication <- 0.5
bias_state_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R75_20 <- fread(file_name)
bias_state_S75_R75_20 <- data.frame(bias_state_S75_R75_20)[-1]

bias_state_S75_R75_20$location <- 'linear'
bias_state_S75_R75_20$detection <- 0.75
bias_state_S75_R75_20$eradication <- 0.75
bias_state_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R75_20b <- fread(file_name)
bias_state_S75_R75_20b <- data.frame(bias_state_S75_R75_20b)[-1]

bias_state_S75_R75_20b$location <- 'linear'
bias_state_S75_R75_20b$detection <- 0.75
bias_state_S75_R75_20b$eradication <- 0.75
bias_state_S75_R75_20b$budget <- 20

#--- Combine bias_states ---#
bias_state_20 <- rbind(bias_state_S25_R5_20,bias_state_S25_R5_20b,
                       bias_state_S25_R75_20,bias_state_S25_R75_20b,
                       bias_state_S5_R5_20,bias_state_S5_R5_20b,
                       bias_state_S5_R75_20,bias_state_S5_R75_20b,
                       bias_state_S75_R5_20,bias_state_S75_R5_20b,
                       bias_state_S75_R75_20,bias_state_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R5_40 <- fread(file_name)
bias_state_S25_R5_40 <- data.frame(bias_state_S25_R5_40)[-1]

bias_state_S25_R5_40$location <- 'linear'
bias_state_S25_R5_40$detection <- 0.25
bias_state_S25_R5_40$eradication <- 0.5
bias_state_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R5_40b <- fread(file_name)
bias_state_S25_R5_40b <- data.frame(bias_state_S25_R5_40b)[-1]

bias_state_S25_R5_40b$location <- 'linear'
bias_state_S25_R5_40b$detection <- 0.25
bias_state_S25_R5_40b$eradication <- 0.5
bias_state_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R75_40 <- fread(file_name)
bias_state_S25_R75_40 <- data.frame(bias_state_S25_R75_40)[-1]

bias_state_S25_R75_40$location <- 'linear'
bias_state_S25_R75_40$detection <- 0.25
bias_state_S25_R75_40$eradication <- 0.75
bias_state_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R75_40b <- fread(file_name)
bias_state_S25_R75_40b <- data.frame(bias_state_S25_R75_40b)[-1]

bias_state_S25_R75_40b$location <- 'linear'
bias_state_S25_R75_40b$detection <- 0.25
bias_state_S25_R75_40b$eradication <- 0.75
bias_state_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_40 <- fread(file_name)
bias_state_S5_R5_40 <- data.frame(bias_state_S5_R5_40)[-1]

bias_state_S5_R5_40$location <- 'linear'
bias_state_S5_R5_40$detection <- 0.5
bias_state_S5_R5_40$eradication <- 0.5
bias_state_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_40b <- fread(file_name)
bias_state_S5_R5_40b <- data.frame(bias_state_S5_R5_40b)[-1]

bias_state_S5_R5_40b$location <- 'linear'
bias_state_S5_R5_40b$detection <- 0.5
bias_state_S5_R5_40b$eradication <- 0.5
bias_state_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_40 <- fread(file_name)
bias_state_S5_R75_40 <- data.frame(bias_state_S5_R75_40)[-1]

bias_state_S5_R75_40$location <- 'linear'
bias_state_S5_R75_40$detection <- 0.5
bias_state_S5_R75_40$eradication <- 0.75
bias_state_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_40b <- fread(file_name)
bias_state_S5_R75_40b <- data.frame(bias_state_S5_R75_40b)[-1]

bias_state_S5_R75_40b$location <- 'linear'
bias_state_S5_R75_40b$detection <- 0.5
bias_state_S5_R75_40b$eradication <- 0.75
bias_state_S5_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_40 <- fread(file_name)
bias_state_S5_R5_40 <- data.frame(bias_state_S5_R5_40)[-1]

bias_state_S5_R5_40$location <- 'linear'
bias_state_S5_R5_40$detection <- 0.5
bias_state_S5_R5_40$eradication <- 0.5
bias_state_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_40b <- fread(file_name)
bias_state_S5_R5_40b <- data.frame(bias_state_S5_R5_40b)[-1]

bias_state_S5_R5_40b$location <- 'linear'
bias_state_S5_R5_40b$detection <- 0.5
bias_state_S5_R5_40b$eradication <- 0.5
bias_state_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_40 <- fread(file_name)
bias_state_S5_R75_40 <- data.frame(bias_state_S5_R75_40)[-1]

bias_state_S5_R75_40$location <- 'linear'
bias_state_S5_R75_40$detection <- 0.5
bias_state_S5_R75_40$eradication <- 0.75
bias_state_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_40b <- fread(file_name)
bias_state_S5_R75_40b <- data.frame(bias_state_S5_R75_40b)[-1]

bias_state_S5_R75_40b$location <- 'linear'
bias_state_S5_R75_40b$detection <- 0.5
bias_state_S5_R75_40b$eradication <- 0.75
bias_state_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R5_40 <- fread(file_name)
bias_state_S75_R5_40 <- data.frame(bias_state_S75_R5_40)[-1]

bias_state_S75_R5_40$location <- 'linear'
bias_state_S75_R5_40$detection <- 0.75
bias_state_S75_R5_40$eradication <- 0.5
bias_state_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R5_40b <- fread(file_name)
bias_state_S75_R5_40b <- data.frame(bias_state_S75_R5_40b)[-1]

bias_state_S75_R5_40b$location <- 'linear'
bias_state_S75_R5_40b$detection <- 0.75
bias_state_S75_R5_40b$eradication <- 0.5
bias_state_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R75_40 <- fread(file_name)
bias_state_S75_R75_40 <- data.frame(bias_state_S75_R75_40)[-1]

bias_state_S75_R75_40$location <- 'linear'
bias_state_S75_R75_40$detection <- 0.75
bias_state_S75_R75_40$eradication <- 0.75
bias_state_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R75_40b <- fread(file_name)
bias_state_S75_R75_40b <- data.frame(bias_state_S75_R75_40b)[-1]

bias_state_S75_R75_40b$location <- 'linear'
bias_state_S75_R75_40b$detection <- 0.75
bias_state_S75_R75_40b$eradication <- 0.75
bias_state_S75_R75_40b$budget <- 40

#--- Combine bias_states ---#
bias_state_40 <- rbind(bias_state_S25_R5_40,bias_state_S25_R5_40b,
                       bias_state_S25_R75_40,bias_state_S25_R75_40b,
                       bias_state_S5_R5_40,bias_state_S5_R5_40b,
                       bias_state_S5_R75_40,bias_state_S5_R75_40b,
                       bias_state_S75_R5_40,bias_state_S75_R5_40b,
                       bias_state_S75_R75_40,bias_state_S5_R75_40b)

#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R5_60 <- fread(file_name)
bias_state_S25_R5_60 <- data.frame(bias_state_S25_R5_60)[-1]

bias_state_S25_R5_60$location <- 'linear'
bias_state_S25_R5_60$detection <- 0.25
bias_state_S25_R5_60$eradication <- 0.5
bias_state_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R5_60b <- fread(file_name)
bias_state_S25_R5_60b <- data.frame(bias_state_S25_R5_60b)[-1]

bias_state_S25_R5_60b$location <- 'linear'
bias_state_S25_R5_60b$detection <- 0.25
bias_state_S25_R5_60b$eradication <- 0.5
bias_state_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R75_60 <- fread(file_name)
bias_state_S25_R75_60 <- data.frame(bias_state_S25_R75_60)[-1]

bias_state_S25_R75_60$location <- 'linear'
bias_state_S25_R75_60$detection <- 0.25
bias_state_S25_R75_60$eradication <- 0.75
bias_state_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S25_R75_60b <- fread(file_name)
bias_state_S25_R75_60b <- data.frame(bias_state_S25_R75_60b)[-1]

bias_state_S25_R75_60b$location <- 'linear'
bias_state_S25_R75_60b$detection <- 0.25
bias_state_S25_R75_60b$eradication <- 0.75
bias_state_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_60 <- fread(file_name)
bias_state_S5_R5_60 <- data.frame(bias_state_S5_R5_60)[-1]

bias_state_S5_R5_60$location <- 'linear'
bias_state_S5_R5_60$detection <- 0.5
bias_state_S5_R5_60$eradication <- 0.5
bias_state_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_60b <- fread(file_name)
bias_state_S5_R5_60b <- data.frame(bias_state_S5_R5_60b)[-1]

bias_state_S5_R5_60b$location <- 'linear'
bias_state_S5_R5_60b$detection <- 0.5
bias_state_S5_R5_60b$eradication <- 0.5
bias_state_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_60 <- fread(file_name)
bias_state_S5_R75_60 <- data.frame(bias_state_S5_R75_60)[-1]

bias_state_S5_R75_60$location <- 'linear'
bias_state_S5_R75_60$detection <- 0.5
bias_state_S5_R75_60$eradication <- 0.75
bias_state_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_60b <- fread(file_name)
bias_state_S5_R75_60b <- data.frame(bias_state_S5_R75_60b)[-1]

bias_state_S5_R75_60b$location <- 'linear'
bias_state_S5_R75_60b$detection <- 0.5
bias_state_S5_R75_60b$eradication <- 0.75
bias_state_S5_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_60 <- fread(file_name)
bias_state_S5_R5_60 <- data.frame(bias_state_S5_R5_60)[-1]

bias_state_S5_R5_60$location <- 'linear'
bias_state_S5_R5_60$detection <- 0.5
bias_state_S5_R5_60$eradication <- 0.5
bias_state_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R5_60b <- fread(file_name)
bias_state_S5_R5_60b <- data.frame(bias_state_S5_R5_60b)[-1]

bias_state_S5_R5_60b$location <- 'linear'
bias_state_S5_R5_60b$detection <- 0.5
bias_state_S5_R5_60b$eradication <- 0.5
bias_state_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_60 <- fread(file_name)
bias_state_S5_R75_60 <- data.frame(bias_state_S5_R75_60)[-1]

bias_state_S5_R75_60$location <- 'linear'
bias_state_S5_R75_60$detection <- 0.5
bias_state_S5_R75_60$eradication <- 0.75
bias_state_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S5_R75_60b <- fread(file_name)
bias_state_S5_R75_60b <- data.frame(bias_state_S5_R75_60b)[-1]

bias_state_S5_R75_60b$location <- 'linear'
bias_state_S5_R75_60b$detection <- 0.5
bias_state_S5_R75_60b$eradication <- 0.75
bias_state_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R5_60 <- fread(file_name)
bias_state_S75_R5_60 <- data.frame(bias_state_S75_R5_60)[-1]

bias_state_S75_R5_60$location <- 'linear'
bias_state_S75_R5_60$detection <- 0.75
bias_state_S75_R5_60$eradication <- 0.5
bias_state_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R5_60b <- fread(file_name)
bias_state_S75_R5_60b <- data.frame(bias_state_S75_R5_60b)[-1]

bias_state_S75_R5_60b$location <- 'linear'
bias_state_S75_R5_60b$detection <- 0.75
bias_state_S75_R5_60b$eradication <- 0.5
bias_state_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R75_60 <- fread(file_name)
bias_state_S75_R75_60 <- data.frame(bias_state_S75_R75_60)[-1]

bias_state_S75_R75_60$location <- 'linear'
bias_state_S75_R75_60$detection <- 0.75
bias_state_S75_R75_60$eradication <- 0.75
bias_state_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
bias_state_S75_R75_60b <- fread(file_name)
bias_state_S75_R75_60b <- data.frame(bias_state_S75_R75_60b)[-1]

bias_state_S75_R75_60b$location <- 'linear'
bias_state_S75_R75_60b$detection <- 0.75
bias_state_S75_R75_60b$eradication <- 0.75
bias_state_S75_R75_60b$budget <- 60

#--- Combine bias_states ---#
bias_state_60 <- rbind(bias_state_S25_R5_60,bias_state_S25_R5_60b,
                       bias_state_S25_R75_60,bias_state_S25_R75_60b,
                       bias_state_S5_R5_60,bias_state_S5_R5_60b,
                       bias_state_S5_R75_60,bias_state_S5_R75_60b,
                       bias_state_S75_R5_60,bias_state_S75_R5_60b,
                       bias_state_S75_R75_60,bias_state_S5_R75_60b)


#-- Combine Bias --#
bias_state <- rbind(bias_state_20, bias_state_40, bias_state_60 )

#### CI state ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R5_20 <- fread(file_name)
CI_state_S25_R5_20 <- data.frame(CI_state_S25_R5_20)[-1]

CI_state_S25_R5_20$location <- 'linear'
CI_state_S25_R5_20$detection <- 0.25
CI_state_S25_R5_20$eradication <- 0.5
CI_state_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R5_20b <- fread(file_name)
CI_state_S25_R5_20b <- data.frame(CI_state_S25_R5_20b)[-1]

CI_state_S25_R5_20b$location <- 'linear'
CI_state_S25_R5_20b$detection <- 0.25
CI_state_S25_R5_20b$eradication <- 0.5
CI_state_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R75_20 <- fread(file_name)
CI_state_S25_R75_20 <- data.frame(CI_state_S25_R75_20)[-1]

CI_state_S25_R75_20$location <- 'linear'
CI_state_S25_R75_20$detection <- 0.25
CI_state_S25_R75_20$eradication <- 0.75
CI_state_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R75_20b <- fread(file_name)
CI_state_S25_R75_20b <- data.frame(CI_state_S25_R75_20b)[-1]

CI_state_S25_R75_20b$location <- 'linear'
CI_state_S25_R75_20b$detection <- 0.25
CI_state_S25_R75_20b$eradication <- 0.75
CI_state_S25_R75_20b$budget <- 20


#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R5_20 <- fread(file_name)
CI_state_S5_R5_20 <- data.frame(CI_state_S5_R5_20)[-1]

CI_state_S5_R5_20$location <- 'linear'
CI_state_S5_R5_20$detection <- 0.5
CI_state_S5_R5_20$eradication <- 0.5
CI_state_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R5_20b <- fread(file_name)
CI_state_S5_R5_20b <- data.frame(CI_state_S5_R5_20b)[-1]

CI_state_S5_R5_20b$location <- 'linear'
CI_state_S5_R5_20b$detection <- 0.5
CI_state_S5_R5_20b$eradication <- 0.5
CI_state_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R75_20 <- fread(file_name)
CI_state_S5_R75_20 <- data.frame(CI_state_S5_R75_20)[-1]

CI_state_S5_R75_20$location <- 'linear'
CI_state_S5_R75_20$detection <- 0.5
CI_state_S5_R75_20$eradication <- 0.75
CI_state_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R75_20b <- fread(file_name)
CI_state_S5_R75_20b <- data.frame(CI_state_S5_R75_20b)[-1]

CI_state_S5_R75_20b$location <- 'linear'
CI_state_S5_R75_20b$detection <- 0.5
CI_state_S5_R75_20b$eradication <- 0.75
CI_state_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R5_20 <- fread(file_name)
CI_state_S75_R5_20 <- data.frame(CI_state_S75_R5_20)[-1]

CI_state_S75_R5_20$location <- 'linear'
CI_state_S75_R5_20$detection <- 0.75
CI_state_S75_R5_20$eradication <- 0.5
CI_state_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R5_20b <- fread(file_name)
CI_state_S75_R5_20b <- data.frame(CI_state_S75_R5_20b)[-1]

CI_state_S75_R5_20b$location <- 'linear'
CI_state_S75_R5_20b$detection <- 0.75
CI_state_S75_R5_20b$eradication <- 0.5
CI_state_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R75_20 <- fread(file_name)
CI_state_S75_R75_20 <- data.frame(CI_state_S75_R75_20)[-1]

CI_state_S75_R75_20$location <- 'linear'
CI_state_S75_R75_20$detection <- 0.75
CI_state_S75_R75_20$eradication <- 0.75
CI_state_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R75_20b <- fread(file_name)
CI_state_S75_R75_20b <- data.frame(CI_state_S75_R75_20b)[-1]

CI_state_S75_R75_20b$location <- 'linear'
CI_state_S75_R75_20b$detection <- 0.75
CI_state_S75_R75_20b$eradication <- 0.75
CI_state_S75_R75_20b$budget <- 20

#--- Combine CI_states ---#
CI_state_20 <- rbind(CI_state_S25_R5_20,CI_state_S25_R5_20b,
                     CI_state_S25_R75_20,CI_state_S25_R75_20b,
                     CI_state_S5_R5_20,CI_state_S5_R5_20b,
                       CI_state_S5_R75_20,CI_state_S5_R75_20b,
                       CI_state_S75_R5_20,CI_state_S75_R5_20b,
                       CI_state_S75_R75_20,CI_state_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R5_40 <- fread(file_name)
CI_state_S25_R5_40 <- data.frame(CI_state_S25_R5_40)[-1]

CI_state_S25_R5_40$location <- 'linear'
CI_state_S25_R5_40$detection <- 0.25
CI_state_S25_R5_40$eradication <- 0.5
CI_state_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R5_40b <- fread(file_name)
CI_state_S25_R5_40b <- data.frame(CI_state_S25_R5_40b)[-1]

CI_state_S25_R5_40b$location <- 'linear'
CI_state_S25_R5_40b$detection <- 0.25
CI_state_S25_R5_40b$eradication <- 0.5
CI_state_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R75_40 <- fread(file_name)
CI_state_S25_R75_40 <- data.frame(CI_state_S25_R75_40)[-1]

CI_state_S25_R75_40$location <- 'linear'
CI_state_S25_R75_40$detection <- 0.25
CI_state_S25_R75_40$eradication <- 0.75
CI_state_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R75_40b <- fread(file_name)
CI_state_S25_R75_40b <- data.frame(CI_state_S25_R75_40b)[-1]

CI_state_S25_R75_40b$location <- 'linear'
CI_state_S25_R75_40b$detection <- 0.25
CI_state_S25_R75_40b$eradication <- 0.75
CI_state_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R5_40 <- fread(file_name)
CI_state_S5_R5_40 <- data.frame(CI_state_S5_R5_40)[-1]

CI_state_S5_R5_40$location <- 'linear'
CI_state_S5_R5_40$detection <- 0.5
CI_state_S5_R5_40$eradication <- 0.5
CI_state_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R5_40b <- fread(file_name)
CI_state_S5_R5_40b <- data.frame(CI_state_S5_R5_40b)[-1]

CI_state_S5_R5_40b$location <- 'linear'
CI_state_S5_R5_40b$detection <- 0.5
CI_state_S5_R5_40b$eradication <- 0.5
CI_state_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R75_40 <- fread(file_name)
CI_state_S5_R75_40 <- data.frame(CI_state_S5_R75_40)[-1]

CI_state_S5_R75_40$location <- 'linear'
CI_state_S5_R75_40$detection <- 0.5
CI_state_S5_R75_40$eradication <- 0.75
CI_state_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R75_40b <- fread(file_name)
CI_state_S5_R75_40b <- data.frame(CI_state_S5_R75_40b)[-1]

CI_state_S5_R75_40b$location <- 'linear'
CI_state_S5_R75_40b$detection <- 0.5
CI_state_S5_R75_40b$eradication <- 0.75
CI_state_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R5_40 <- fread(file_name)
CI_state_S75_R5_40 <- data.frame(CI_state_S75_R5_40)[-1]

CI_state_S75_R5_40$location <- 'linear'
CI_state_S75_R5_40$detection <- 0.75
CI_state_S75_R5_40$eradication <- 0.5
CI_state_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R5_40b <- fread(file_name)
CI_state_S75_R5_40b <- data.frame(CI_state_S75_R5_40b)[-1]

CI_state_S75_R5_40b$location <- 'linear'
CI_state_S75_R5_40b$detection <- 0.75
CI_state_S75_R5_40b$eradication <- 0.5
CI_state_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R75_40 <- fread(file_name)
CI_state_S75_R75_40 <- data.frame(CI_state_S75_R75_40)[-1]

CI_state_S75_R75_40$location <- 'linear'
CI_state_S75_R75_40$detection <- 0.75
CI_state_S75_R75_40$eradication <- 0.75
CI_state_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R75_40b <- fread(file_name)
CI_state_S75_R75_40b <- data.frame(CI_state_S75_R75_40b)[-1]

CI_state_S75_R75_40b$location <- 'linear'
CI_state_S75_R75_40b$detection <- 0.75
CI_state_S75_R75_40b$eradication <- 0.75
CI_state_S75_R75_40b$budget <- 40

#--- Combine CI_states ---#
CI_state_40 <- rbind(CI_state_S25_R5_40,CI_state_S25_R5_40b,
                     CI_state_S25_R75_40,CI_state_S25_R75_40b,
                     CI_state_S5_R5_40,CI_state_S5_R5_40b,
                     CI_state_S5_R75_40,CI_state_S5_R75_40b,
                     CI_state_S75_R5_40,CI_state_S75_R5_40b,
                     CI_state_S75_R75_40,CI_state_S5_R75_40b)

#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R5_60 <- fread(file_name)
CI_state_S25_R5_60 <- data.frame(CI_state_S25_R5_60)[-1]

CI_state_S25_R5_60$location <- 'linear'
CI_state_S25_R5_60$detection <- 0.25
CI_state_S25_R5_60$eradication <- 0.5
CI_state_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R5_60b <- fread(file_name)
CI_state_S25_R5_60b <- data.frame(CI_state_S25_R5_60b)[-1]

CI_state_S25_R5_60b$location <- 'linear'
CI_state_S25_R5_60b$detection <- 0.25
CI_state_S25_R5_60b$eradication <- 0.5
CI_state_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R75_60 <- fread(file_name)
CI_state_S25_R75_60 <- data.frame(CI_state_S25_R75_60)[-1]

CI_state_S25_R75_60$location <- 'linear'
CI_state_S25_R75_60$detection <- 0.25
CI_state_S25_R75_60$eradication <- 0.75
CI_state_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S25_R75_60b <- fread(file_name)
CI_state_S25_R75_60b <- data.frame(CI_state_S25_R75_60b)[-1]

CI_state_S25_R75_60b$location <- 'linear'
CI_state_S25_R75_60b$detection <- 0.25
CI_state_S25_R75_60b$eradication <- 0.75
CI_state_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R5_60 <- fread(file_name)
CI_state_S5_R5_60 <- data.frame(CI_state_S5_R5_60)[-1]

CI_state_S5_R5_60$location <- 'linear'
CI_state_S5_R5_60$detection <- 0.5
CI_state_S5_R5_60$eradication <- 0.5
CI_state_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R5_60b <- fread(file_name)
CI_state_S5_R5_60b <- data.frame(CI_state_S5_R5_60b)[-1]

CI_state_S5_R5_60b$location <- 'linear'
CI_state_S5_R5_60b$detection <- 0.5
CI_state_S5_R5_60b$eradication <- 0.5
CI_state_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R75_60 <- fread(file_name)
CI_state_S5_R75_60 <- data.frame(CI_state_S5_R75_60)[-1]

CI_state_S5_R75_60$location <- 'linear'
CI_state_S5_R75_60$detection <- 0.5
CI_state_S5_R75_60$eradication <- 0.75
CI_state_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S5_R75_60b <- fread(file_name)
CI_state_S5_R75_60b <- data.frame(CI_state_S5_R75_60b)[-1]

CI_state_S5_R75_60b$location <- 'linear'
CI_state_S5_R75_60b$detection <- 0.5
CI_state_S5_R75_60b$eradication <- 0.75
CI_state_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R5_60 <- fread(file_name)
CI_state_S75_R5_60 <- data.frame(CI_state_S75_R5_60)[-1]

CI_state_S75_R5_60$location <- 'linear'
CI_state_S75_R5_60$detection <- 0.75
CI_state_S75_R5_60$eradication <- 0.5
CI_state_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R5_60b <- fread(file_name)
CI_state_S75_R5_60b <- data.frame(CI_state_S75_R5_60b)[-1]

CI_state_S75_R5_60b$location <- 'linear'
CI_state_S75_R5_60b$detection <- 0.75
CI_state_S75_R5_60b$eradication <- 0.5
CI_state_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R75_60 <- fread(file_name)
CI_state_S75_R75_60 <- data.frame(CI_state_S75_R75_60)[-1]

CI_state_S75_R75_60$location <- 'linear'
CI_state_S75_R75_60$detection <- 0.75
CI_state_S75_R75_60$eradication <- 0.75
CI_state_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'CI_state.csv',sep = '/')
CI_state_S75_R75_60b <- fread(file_name)
CI_state_S75_R75_60b <- data.frame(CI_state_S75_R75_60b)[-1]

CI_state_S75_R75_60b$location <- 'linear'
CI_state_S75_R75_60b$detection <- 0.75
CI_state_S75_R75_60b$eradication <- 0.75
CI_state_S75_R75_60b$budget <- 60

#--- Combine CI_states ---#
CI_state_60 <- rbind(CI_state_S25_R5_60,CI_state_S25_R5_60b,
                     CI_state_S25_R75_60,CI_state_S25_R75_60b,
                     CI_state_S5_R5_60,CI_state_S5_R5_60b,
                     CI_state_S5_R75_60,CI_state_S5_R75_60b,
                     CI_state_S75_R5_60,CI_state_S75_R5_60b,
                     CI_state_S75_R75_60,CI_state_S5_R75_60b)

#-- Combine CI --#
CI_state <- c(CI_state_20, CI_state_40, CI_state_60)

#### Params ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R5_20 <- fread(file_name)
param_S25_R5_20 <- data.frame(param_S25_R5_20)[-1]

param_S25_R5_20$location <- 'linear'
param_S25_R5_20$detection <- 0.25
param_S25_R5_20$eradication <- 0.5
param_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R5_20b <- fread(file_name)
param_S25_R5_20b <- data.frame(param_S25_R5_20b)[-1]

param_S25_R5_20b$location <- 'linear'
param_S25_R5_20b$detection <- 0.25
param_S25_R5_20b$eradication <- 0.5
param_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R75_20 <- fread(file_name)
param_S25_R75_20 <- data.frame(param_S25_R75_20)[-1]

param_S25_R75_20$location <- 'linear'
param_S25_R75_20$detection <- 0.25
param_S25_R75_20$eradication <- 0.75
param_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R75_20b <- fread(file_name)
param_S25_R75_20b <- data.frame(param_S25_R75_20b)[-1]

param_S25_R75_20b$location <- 'linear'
param_S25_R75_20b$detection <- 0.25
param_S25_R75_20b$eradication <- 0.75
param_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R5_20 <- fread(file_name)
param_S5_R5_20 <- data.frame(param_S5_R5_20)[-1]

param_S5_R5_20$location <- 'linear'
param_S5_R5_20$detection <- 0.5
param_S5_R5_20$eradication <- 0.5
param_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R5_20b <- fread(file_name)
param_S5_R5_20b <- data.frame(param_S5_R5_20b)[-1]

param_S5_R5_20b$location <- 'linear'
param_S5_R5_20b$detection <- 0.5
param_S5_R5_20b$eradication <- 0.5
param_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R75_20 <- fread(file_name)
param_S5_R75_20 <- data.frame(param_S5_R75_20)[-1]

param_S5_R75_20$location <- 'linear'
param_S5_R75_20$detection <- 0.5
param_S5_R75_20$eradication <- 0.75
param_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R75_20b <- fread(file_name)
param_S5_R75_20b <- data.frame(param_S5_R75_20b)[-1]

param_S5_R75_20b$location <- 'linear'
param_S5_R75_20b$detection <- 0.5
param_S5_R75_20b$eradication <- 0.75
param_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R5_20 <- fread(file_name)
param_S75_R5_20 <- data.frame(param_S75_R5_20)[-1]

param_S75_R5_20$location <- 'linear'
param_S75_R5_20$detection <- 0.75
param_S75_R5_20$eradication <- 0.5
param_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R5_20b <- fread(file_name)
param_S75_R5_20b <- data.frame(param_S75_R5_20b)[-1]

param_S75_R5_20b$location <- 'linear'
param_S75_R5_20b$detection <- 0.75
param_S75_R5_20b$eradication <- 0.5
param_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R75_20 <- fread(file_name)
param_S75_R75_20 <- data.frame(param_S75_R75_20)[-1]

param_S75_R75_20$location <- 'linear'
param_S75_R75_20$detection <- 0.75
param_S75_R75_20$eradication <- 0.75
param_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R75_20b <- fread(file_name)
param_S75_R75_20b <- data.frame(param_S75_R75_20b)[-1]

param_S75_R75_20b$location <- 'linear'
param_S75_R75_20b$detection <- 0.75
param_S75_R75_20b$eradication <- 0.75
param_S75_R75_20b$budget <- 20

#--- Combine params ---#
param_20 <- rbind(param_S25_R5_20,param_S25_R5_20b,
                  param_S25_R75_20,param_S25_R75_20b,
                  param_S5_R5_20,param_S5_R5_20b,
                  param_S5_R75_20,param_S5_R75_20b,
                  param_S75_R5_20,param_S75_R5_20b,
                  param_S75_R75_20,param_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R5_40 <- fread(file_name)
param_S25_R5_40 <- data.frame(param_S25_R5_40)[-1]

param_S25_R5_40$location <- 'linear'
param_S25_R5_40$detection <- 0.25
param_S25_R5_40$eradication <- 0.5
param_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R5_40b <- fread(file_name)
param_S25_R5_40b <- data.frame(param_S25_R5_40b)[-1]

param_S25_R5_40b$location <- 'linear'
param_S25_R5_40b$detection <- 0.25
param_S25_R5_40b$eradication <- 0.5
param_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R75_40 <- fread(file_name)
param_S25_R75_40 <- data.frame(param_S25_R75_40)[-1]

param_S25_R75_40$location <- 'linear'
param_S25_R75_40$detection <- 0.25
param_S25_R75_40$eradication <- 0.75
param_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R75_40b <- fread(file_name)
param_S25_R75_40b <- data.frame(param_S25_R75_40b)[-1]

param_S25_R75_40b$location <- 'linear'
param_S25_R75_40b$detection <- 0.25
param_S25_R75_40b$eradication <- 0.75
param_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R5_40 <- fread(file_name)
param_S5_R5_40 <- data.frame(param_S5_R5_40)[-1]

param_S5_R5_40$location <- 'linear'
param_S5_R5_40$detection <- 0.5
param_S5_R5_40$eradication <- 0.5
param_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R5_40b <- fread(file_name)
param_S5_R5_40b <- data.frame(param_S5_R5_40b)[-1]

param_S5_R5_40b$location <- 'linear'
param_S5_R5_40b$detection <- 0.5
param_S5_R5_40b$eradication <- 0.5
param_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R75_40 <- fread(file_name)
param_S5_R75_40 <- data.frame(param_S5_R75_40)[-1]

param_S5_R75_40$location <- 'linear'
param_S5_R75_40$detection <- 0.5
param_S5_R75_40$eradication <- 0.75
param_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R75_40b <- fread(file_name)
param_S5_R75_40b <- data.frame(param_S5_R75_40b)[-1]

param_S5_R75_40b$location <- 'linear'
param_S5_R75_40b$detection <- 0.5
param_S5_R75_40b$eradication <- 0.75
param_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R5_40 <- fread(file_name)
param_S75_R5_40 <- data.frame(param_S75_R5_40)[-1]

param_S75_R5_40$location <- 'linear'
param_S75_R5_40$detection <- 0.75
param_S75_R5_40$eradication <- 0.5
param_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R5_40b <- fread(file_name)
param_S75_R5_40b <- data.frame(param_S75_R5_40b)[-1]

param_S75_R5_40b$location <- 'linear'
param_S75_R5_40b$detection <- 0.75
param_S75_R5_40b$eradication <- 0.5
param_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R75_40 <- fread(file_name)
param_S75_R75_40 <- data.frame(param_S75_R75_40)[-1]

param_S75_R75_40$location <- 'linear'
param_S75_R75_40$detection <- 0.75
param_S75_R75_40$eradication <- 0.75
param_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R75_40b <- fread(file_name)
param_S75_R75_40b <- data.frame(param_S75_R75_40b)[-1]

param_S75_R75_40b$location <- 'linear'
param_S75_R75_40b$detection <- 0.75
param_S75_R75_40b$eradication <- 0.75
param_S75_R75_40b$budget <- 40

#--- Combine params ---#
param_40 <- rbind(param_S25_R5_40,param_S25_R5_40b,
                  param_S25_R75_40,param_S25_R75_40b,
                  param_S5_R5_40,param_S5_R5_40b,
                  param_S5_R75_40,param_S5_R75_40b,
                  param_S75_R5_40,param_S75_R5_40b,
                  param_S75_R75_40,param_S5_R75_40b)

#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R5_60 <- fread(file_name)
param_S25_R5_60 <- data.frame(param_S25_R5_60)[-1]

param_S25_R5_60$location <- 'linear'
param_S25_R5_60$detection <- 0.25
param_S25_R5_60$eradication <- 0.5
param_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R5_60b <- fread(file_name)
param_S25_R5_60b <- data.frame(param_S25_R5_60b)[-1]

param_S25_R5_60b$location <- 'linear'
param_S25_R5_60b$detection <- 0.25
param_S25_R5_60b$eradication <- 0.5
param_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R75_60 <- fread(file_name)
param_S25_R75_60 <- data.frame(param_S25_R75_60)[-1]

param_S25_R75_60$location <- 'linear'
param_S25_R75_60$detection <- 0.25
param_S25_R75_60$eradication <- 0.75
param_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S25_R75_60b <- fread(file_name)
param_S25_R75_60b <- data.frame(param_S25_R75_60b)[-1]

param_S25_R75_60b$location <- 'linear'
param_S25_R75_60b$detection <- 0.25
param_S25_R75_60b$eradication <- 0.75
param_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R5_60 <- fread(file_name)
param_S5_R5_60 <- data.frame(param_S5_R5_60)[-1]

param_S5_R5_60$location <- 'linear'
param_S5_R5_60$detection <- 0.5
param_S5_R5_60$eradication <- 0.5
param_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R5_60b <- fread(file_name)
param_S5_R5_60b <- data.frame(param_S5_R5_60b)[-1]

param_S5_R5_60b$location <- 'linear'
param_S5_R5_60b$detection <- 0.5
param_S5_R5_60b$eradication <- 0.5
param_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R75_60 <- fread(file_name)
param_S5_R75_60 <- data.frame(param_S5_R75_60)[-1]

param_S5_R75_60$location <- 'linear'
param_S5_R75_60$detection <- 0.5
param_S5_R75_60$eradication <- 0.75
param_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S5_R75_60b <- fread(file_name)
param_S5_R75_60b <- data.frame(param_S5_R75_60b)[-1]

param_S5_R75_60b$location <- 'linear'
param_S5_R75_60b$detection <- 0.5
param_S5_R75_60b$eradication <- 0.75
param_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R5_60 <- fread(file_name)
param_S75_R5_60 <- data.frame(param_S75_R5_60)[-1]

param_S75_R5_60$location <- 'linear'
param_S75_R5_60$detection <- 0.75
param_S75_R5_60$eradication <- 0.5
param_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R5_60b <- fread(file_name)
param_S75_R5_60b <- data.frame(param_S75_R5_60b)[-1]

param_S75_R5_60b$location <- 'linear'
param_S75_R5_60b$detection <- 0.75
param_S75_R5_60b$eradication <- 0.5
param_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R75_60 <- fread(file_name)
param_S75_R75_60 <- data.frame(param_S75_R75_60)[-1]

param_S75_R75_60$location <- 'linear'
param_S75_R75_60$detection <- 0.75
param_S75_R75_60$eradication <- 0.75
param_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'params.csv',sep = '/')
param_S75_R75_60b <- fread(file_name)
param_S75_R75_60b <- data.frame(param_S75_R75_60b)[-1]

param_S75_R75_60b$location <- 'linear'
param_S75_R75_60b$detection <- 0.75
param_S75_R75_60b$eradication <- 0.75
param_S75_R75_60b$budget <- 60

#--- Combine params ---#
param_60 <- rbind(param_S25_R5_60,param_S25_R5_60b,
                  param_S25_R75_60,param_S25_R75_60b,
                  param_S5_R5_60,param_S5_R5_60b,
                  param_S5_R75_60,param_S5_R75_60b,
                  param_S75_R5_60,param_S75_R5_60b,
                  param_S75_R75_60,param_S5_R75_60b)

#-- Combine params --#
params <- rbind(param_20, param_40, param_60 )

#### Bias params ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R5_20 <- fread(file_name)
bias_param_S25_R5_20 <- data.frame(bias_param_S25_R5_20)[-1]

bias_param_S25_R5_20$location <- 'linear'
bias_param_S25_R5_20$detection <- 0.25
bias_param_S25_R5_20$eradication <- 0.5
bias_param_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R5_20b <- fread(file_name)
bias_param_S25_R5_20b <- data.frame(bias_param_S25_R5_20b)[-1]

bias_param_S25_R5_20b$location <- 'linear'
bias_param_S25_R5_20b$detection <- 0.25
bias_param_S25_R5_20b$eradication <- 0.5
bias_param_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R75_20 <- fread(file_name)
bias_param_S25_R75_20 <- data.frame(bias_param_S25_R75_20)[-1]

bias_param_S25_R75_20$location <- 'linear'
bias_param_S25_R75_20$detection <- 0.25
bias_param_S25_R75_20$eradication <- 0.75
bias_param_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R75_20b <- fread(file_name)
bias_param_S25_R75_20b <- data.frame(bias_param_S25_R75_20b)[-1]

bias_param_S25_R75_20b$location <- 'linear'
bias_param_S25_R75_20b$detection <- 0.25
bias_param_S25_R75_20b$eradication <- 0.75
bias_param_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R5_20 <- fread(file_name)
bias_param_S5_R5_20 <- data.frame(bias_param_S5_R5_20)[-1]

bias_param_S5_R5_20$location <- 'linear'
bias_param_S5_R5_20$detection <- 0.5
bias_param_S5_R5_20$eradication <- 0.5
bias_param_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R5_20b <- fread(file_name)
bias_param_S5_R5_20b <- data.frame(bias_param_S5_R5_20b)[-1]

bias_param_S5_R5_20b$location <- 'linear'
bias_param_S5_R5_20b$detection <- 0.5
bias_param_S5_R5_20b$eradication <- 0.5
bias_param_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R75_20 <- fread(file_name)
bias_param_S5_R75_20 <- data.frame(bias_param_S5_R75_20)[-1]

bias_param_S5_R75_20$location <- 'linear'
bias_param_S5_R75_20$detection <- 0.5
bias_param_S5_R75_20$eradication <- 0.75
bias_param_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R75_20b <- fread(file_name)
bias_param_S5_R75_20b <- data.frame(bias_param_S5_R75_20b)[-1]

bias_param_S5_R75_20b$location <- 'linear'
bias_param_S5_R75_20b$detection <- 0.5
bias_param_S5_R75_20b$eradication <- 0.75
bias_param_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R5_20 <- fread(file_name)
bias_param_S75_R5_20 <- data.frame(bias_param_S75_R5_20)[-1]

bias_param_S75_R5_20$location <- 'linear'
bias_param_S75_R5_20$detection <- 0.75
bias_param_S75_R5_20$eradication <- 0.5
bias_param_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R5_20b <- fread(file_name)
bias_param_S75_R5_20b <- data.frame(bias_param_S75_R5_20b)[-1]

bias_param_S75_R5_20b$location <- 'linear'
bias_param_S75_R5_20b$detection <- 0.75
bias_param_S75_R5_20b$eradication <- 0.5
bias_param_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R75_20 <- fread(file_name)
bias_param_S75_R75_20 <- data.frame(bias_param_S75_R75_20)[-1]

bias_param_S75_R75_20$location <- 'linear'
bias_param_S75_R75_20$detection <- 0.75
bias_param_S75_R75_20$eradication <- 0.75
bias_param_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R75_20b <- fread(file_name)
bias_param_S75_R75_20b <- data.frame(bias_param_S75_R75_20b)[-1]

bias_param_S75_R75_20b$location <- 'linear'
bias_param_S75_R75_20b$detection <- 0.75
bias_param_S75_R75_20b$eradication <- 0.75
bias_param_S75_R75_20b$budget <- 20

#--- Combine bias_params ---#
bias_param_20 <- rbind(bias_param_S25_R5_20,bias_param_S25_R5_20b,
                       bias_param_S25_R75_20,bias_param_S25_R75_20b,
                       bias_param_S5_R5_20,bias_param_S5_R5_20b,
                  bias_param_S5_R75_20,bias_param_S5_R75_20b,
                  bias_param_S75_R5_20,bias_param_S75_R5_20b,
                  bias_param_S75_R75_20,bias_param_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R5_40 <- fread(file_name)
bias_param_S25_R5_40 <- data.frame(bias_param_S25_R5_40)[-1]

bias_param_S25_R5_40$location <- 'linear'
bias_param_S25_R5_40$detection <- 0.25
bias_param_S25_R5_40$eradication <- 0.5
bias_param_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R5_40b <- fread(file_name)
bias_param_S25_R5_40b <- data.frame(bias_param_S25_R5_40b)[-1]

bias_param_S25_R5_40b$location <- 'linear'
bias_param_S25_R5_40b$detection <- 0.25
bias_param_S25_R5_40b$eradication <- 0.5
bias_param_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R75_40 <- fread(file_name)
bias_param_S25_R75_40 <- data.frame(bias_param_S25_R75_40)[-1]

bias_param_S25_R75_40$location <- 'linear'
bias_param_S25_R75_40$detection <- 0.25
bias_param_S25_R75_40$eradication <- 0.75
bias_param_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R75_40b <- fread(file_name)
bias_param_S25_R75_40b <- data.frame(bias_param_S25_R75_40b)[-1]

bias_param_S25_R75_40b$location <- 'linear'
bias_param_S25_R75_40b$detection <- 0.25
bias_param_S25_R75_40b$eradication <- 0.75
bias_param_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R5_40 <- fread(file_name)
bias_param_S5_R5_40 <- data.frame(bias_param_S5_R5_40)[-1]

bias_param_S5_R5_40$location <- 'linear'
bias_param_S5_R5_40$detection <- 0.5
bias_param_S5_R5_40$eradication <- 0.5
bias_param_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R5_40b <- fread(file_name)
bias_param_S5_R5_40b <- data.frame(bias_param_S5_R5_40b)[-1]

bias_param_S5_R5_40b$location <- 'linear'
bias_param_S5_R5_40b$detection <- 0.5
bias_param_S5_R5_40b$eradication <- 0.5
bias_param_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R75_40 <- fread(file_name)
bias_param_S5_R75_40 <- data.frame(bias_param_S5_R75_40)[-1]

bias_param_S5_R75_40$location <- 'linear'
bias_param_S5_R75_40$detection <- 0.5
bias_param_S5_R75_40$eradication <- 0.75
bias_param_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R75_40b <- fread(file_name)
bias_param_S5_R75_40b <- data.frame(bias_param_S5_R75_40b)[-1]

bias_param_S5_R75_40b$location <- 'linear'
bias_param_S5_R75_40b$detection <- 0.5
bias_param_S5_R75_40b$eradication <- 0.75
bias_param_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R5_40 <- fread(file_name)
bias_param_S75_R5_40 <- data.frame(bias_param_S75_R5_40)[-1]

bias_param_S75_R5_40$location <- 'linear'
bias_param_S75_R5_40$detection <- 0.75
bias_param_S75_R5_40$eradication <- 0.5
bias_param_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R5_40b <- fread(file_name)
bias_param_S75_R5_40b <- data.frame(bias_param_S75_R5_40b)[-1]

bias_param_S75_R5_40b$location <- 'linear'
bias_param_S75_R5_40b$detection <- 0.75
bias_param_S75_R5_40b$eradication <- 0.5
bias_param_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R75_40 <- fread(file_name)
bias_param_S75_R75_40 <- data.frame(bias_param_S75_R75_40)[-1]

bias_param_S75_R75_40$location <- 'linear'
bias_param_S75_R75_40$detection <- 0.75
bias_param_S75_R75_40$eradication <- 0.75
bias_param_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R75_40b <- fread(file_name)
bias_param_S75_R75_40b <- data.frame(bias_param_S75_R75_40b)[-1]

bias_param_S75_R75_40b$location <- 'linear'
bias_param_S75_R75_40b$detection <- 0.75
bias_param_S75_R75_40b$eradication <- 0.75
bias_param_S75_R75_40b$budget <- 40

#--- Combine bias_params ---#
bias_param_40 <- rbind(bias_param_S25_R5_40,bias_param_S25_R5_40b,
                       bias_param_S25_R75_40,bias_param_S25_R75_40b,
                       bias_param_S5_R5_40,bias_param_S5_R5_40b,
                       bias_param_S5_R75_40,bias_param_S5_R75_40b,
                       bias_param_S75_R5_40,bias_param_S75_R5_40b,
                       bias_param_S75_R75_40,bias_param_S5_R75_40b)

#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R5_60 <- fread(file_name)
bias_param_S25_R5_60 <- data.frame(bias_param_S25_R5_60)[-1]

bias_param_S25_R5_60$location <- 'linear'
bias_param_S25_R5_60$detection <- 0.25
bias_param_S25_R5_60$eradication <- 0.5
bias_param_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R5_60b <- fread(file_name)
bias_param_S25_R5_60b <- data.frame(bias_param_S25_R5_60b)[-1]

bias_param_S25_R5_60b$location <- 'linear'
bias_param_S25_R5_60b$detection <- 0.25
bias_param_S25_R5_60b$eradication <- 0.5
bias_param_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R75_60 <- fread(file_name)
bias_param_S25_R75_60 <- data.frame(bias_param_S25_R75_60)[-1]

bias_param_S25_R75_60$location <- 'linear'
bias_param_S25_R75_60$detection <- 0.25
bias_param_S25_R75_60$eradication <- 0.75
bias_param_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S25_R75_60b <- fread(file_name)
bias_param_S25_R75_60b <- data.frame(bias_param_S25_R75_60b)[-1]

bias_param_S25_R75_60b$location <- 'linear'
bias_param_S25_R75_60b$detection <- 0.25
bias_param_S25_R75_60b$eradication <- 0.75
bias_param_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R5_60 <- fread(file_name)
bias_param_S5_R5_60 <- data.frame(bias_param_S5_R5_60)[-1]

bias_param_S5_R5_60$location <- 'linear'
bias_param_S5_R5_60$detection <- 0.5
bias_param_S5_R5_60$eradication <- 0.5
bias_param_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R5_60b <- fread(file_name)
bias_param_S5_R5_60b <- data.frame(bias_param_S5_R5_60b)[-1]

bias_param_S5_R5_60b$location <- 'linear'
bias_param_S5_R5_60b$detection <- 0.5
bias_param_S5_R5_60b$eradication <- 0.5
bias_param_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R75_60 <- fread(file_name)
bias_param_S5_R75_60 <- data.frame(bias_param_S5_R75_60)[-1]

bias_param_S5_R75_60$location <- 'linear'
bias_param_S5_R75_60$detection <- 0.5
bias_param_S5_R75_60$eradication <- 0.75
bias_param_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S5_R75_60b <- fread(file_name)
bias_param_S5_R75_60b <- data.frame(bias_param_S5_R75_60b)[-1]

bias_param_S5_R75_60b$location <- 'linear'
bias_param_S5_R75_60b$detection <- 0.5
bias_param_S5_R75_60b$eradication <- 0.75
bias_param_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R5_60 <- fread(file_name)
bias_param_S75_R5_60 <- data.frame(bias_param_S75_R5_60)[-1]

bias_param_S75_R5_60$location <- 'linear'
bias_param_S75_R5_60$detection <- 0.75
bias_param_S75_R5_60$eradication <- 0.5
bias_param_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R5_60b <- fread(file_name)
bias_param_S75_R5_60b <- data.frame(bias_param_S75_R5_60b)[-1]

bias_param_S75_R5_60b$location <- 'linear'
bias_param_S75_R5_60b$detection <- 0.75
bias_param_S75_R5_60b$eradication <- 0.5
bias_param_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R75_60 <- fread(file_name)
bias_param_S75_R75_60 <- data.frame(bias_param_S75_R75_60)[-1]

bias_param_S75_R75_60$location <- 'linear'
bias_param_S75_R75_60$detection <- 0.75
bias_param_S75_R75_60$eradication <- 0.75
bias_param_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param_S75_R75_60b <- fread(file_name)
bias_param_S75_R75_60b <- data.frame(bias_param_S75_R75_60b)[-1]

bias_param_S75_R75_60b$location <- 'linear'
bias_param_S75_R75_60b$detection <- 0.75
bias_param_S75_R75_60b$eradication <- 0.75
bias_param_S75_R75_60b$budget <- 60

#--- Combine bias_params ---#
bias_param_60 <- rbind(bias_param_S25_R5_60,bias_param_S25_R5_60b,
                       bias_param_S25_R75_60,bias_param_S25_R75_60b,
                       bias_param_S5_R5_60,bias_param_S5_R5_60b,
                       bias_param_S5_R75_60,bias_param_S5_R75_60b,
                       bias_param_S75_R5_60,bias_param_S75_R5_60b,
                       bias_param_S75_R75_60,bias_param_S5_R75_60b)

#-- Combine bias --#
bias_params <- rbind(bias_param_20, bias_param_40, bias_param_60 )


#### CI params ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R5_20 <- fread(file_name)
CI_param_S25_R5_20 <- data.frame(CI_param_S25_R5_20)[-1]

CI_param_S25_R5_20$location <- 'linear'
CI_param_S25_R5_20$detection <- 0.25
CI_param_S25_R5_20$eradication <- 0.5
CI_param_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R5_20b <- fread(file_name)
CI_param_S25_R5_20b <- data.frame(CI_param_S25_R5_20b)[-1]

CI_param_S25_R5_20b$location <- 'linear'
CI_param_S25_R5_20b$detection <- 0.25
CI_param_S25_R5_20b$eradication <- 0.5
CI_param_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R75_20 <- fread(file_name)
CI_param_S25_R75_20 <- data.frame(CI_param_S25_R75_20)[-1]

CI_param_S25_R75_20$location <- 'linear'
CI_param_S25_R75_20$detection <- 0.25
CI_param_S25_R75_20$eradication <- 0.75
CI_param_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R75_20b <- fread(file_name)
CI_param_S25_R75_20b <- data.frame(CI_param_S25_R75_20b)[-1]

CI_param_S25_R75_20b$location <- 'linear'
CI_param_S25_R75_20b$detection <- 0.25
CI_param_S25_R75_20b$eradication <- 0.75
CI_param_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R5_20 <- fread(file_name)
CI_param_S5_R5_20 <- data.frame(CI_param_S5_R5_20)[-1]

CI_param_S5_R5_20$location <- 'linear'
CI_param_S5_R5_20$detection <- 0.5
CI_param_S5_R5_20$eradication <- 0.5
CI_param_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R5_20b <- fread(file_name)
CI_param_S5_R5_20b <- data.frame(CI_param_S5_R5_20b)[-1]

CI_param_S5_R5_20b$location <- 'linear'
CI_param_S5_R5_20b$detection <- 0.5
CI_param_S5_R5_20b$eradication <- 0.5
CI_param_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R75_20 <- fread(file_name)
CI_param_S5_R75_20 <- data.frame(CI_param_S5_R75_20)[-1]

CI_param_S5_R75_20$location <- 'linear'
CI_param_S5_R75_20$detection <- 0.5
CI_param_S5_R75_20$eradication <- 0.75
CI_param_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R75_20b <- fread(file_name)
CI_param_S5_R75_20b <- data.frame(CI_param_S5_R75_20b)[-1]

CI_param_S5_R75_20b$location <- 'linear'
CI_param_S5_R75_20b$detection <- 0.5
CI_param_S5_R75_20b$eradication <- 0.75
CI_param_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R5_20 <- fread(file_name)
CI_param_S75_R5_20 <- data.frame(CI_param_S75_R5_20)[-1]

CI_param_S75_R5_20$location <- 'linear'
CI_param_S75_R5_20$detection <- 0.75
CI_param_S75_R5_20$eradication <- 0.5
CI_param_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R5_20b <- fread(file_name)
CI_param_S75_R5_20b <- data.frame(CI_param_S75_R5_20b)[-1]

CI_param_S75_R5_20b$location <- 'linear'
CI_param_S75_R5_20b$detection <- 0.75
CI_param_S75_R5_20b$eradication <- 0.5
CI_param_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R75_20 <- fread(file_name)
CI_param_S75_R75_20 <- data.frame(CI_param_S75_R75_20)[-1]

CI_param_S75_R75_20$location <- 'linear'
CI_param_S75_R75_20$detection <- 0.75
CI_param_S75_R75_20$eradication <- 0.75
CI_param_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R75_20b <- fread(file_name)
CI_param_S75_R75_20b <- data.frame(CI_param_S75_R75_20b)[-1]

CI_param_S75_R75_20b$location <- 'linear'
CI_param_S75_R75_20b$detection <- 0.75
CI_param_S75_R75_20b$eradication <- 0.75
CI_param_S75_R75_20b$budget <- 20

#--- Combine CI_params ---#
CI_param_20 <- rbind(CI_param_S25_R5_20,CI_param_S25_R5_20b,
                     CI_param_S25_R75_20,CI_param_S25_R75_20b,
                     CI_param_S5_R5_20,CI_param_S5_R5_20b,
                       CI_param_S5_R75_20,CI_param_S5_R75_20b,
                       CI_param_S75_R5_20,CI_param_S75_R5_20b,
                       CI_param_S75_R75_20,CI_param_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R5_40 <- fread(file_name)
CI_param_S25_R5_40 <- data.frame(CI_param_S25_R5_40)[-1]

CI_param_S25_R5_40$location <- 'linear'
CI_param_S25_R5_40$detection <- 0.25
CI_param_S25_R5_40$eradication <- 0.5
CI_param_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R5_40b <- fread(file_name)
CI_param_S25_R5_40b <- data.frame(CI_param_S25_R5_40b)[-1]

CI_param_S25_R5_40b$location <- 'linear'
CI_param_S25_R5_40b$detection <- 0.25
CI_param_S25_R5_40b$eradication <- 0.5
CI_param_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R75_40 <- fread(file_name)
CI_param_S25_R75_40 <- data.frame(CI_param_S25_R75_40)[-1]

CI_param_S25_R75_40$location <- 'linear'
CI_param_S25_R75_40$detection <- 0.25
CI_param_S25_R75_40$eradication <- 0.75
CI_param_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R75_40b <- fread(file_name)
CI_param_S25_R75_40b <- data.frame(CI_param_S25_R75_40b)[-1]

CI_param_S25_R75_40b$location <- 'linear'
CI_param_S25_R75_40b$detection <- 0.25
CI_param_S25_R75_40b$eradication <- 0.75
CI_param_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R5_40 <- fread(file_name)
CI_param_S5_R5_40 <- data.frame(CI_param_S5_R5_40)[-1]

CI_param_S5_R5_40$location <- 'linear'
CI_param_S5_R5_40$detection <- 0.5
CI_param_S5_R5_40$eradication <- 0.5
CI_param_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R5_40b <- fread(file_name)
CI_param_S5_R5_40b <- data.frame(CI_param_S5_R5_40b)[-1]

CI_param_S5_R5_40b$location <- 'linear'
CI_param_S5_R5_40b$detection <- 0.5
CI_param_S5_R5_40b$eradication <- 0.5
CI_param_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R75_40 <- fread(file_name)
CI_param_S5_R75_40 <- data.frame(CI_param_S5_R75_40)[-1]

CI_param_S5_R75_40$location <- 'linear'
CI_param_S5_R75_40$detection <- 0.5
CI_param_S5_R75_40$eradication <- 0.75
CI_param_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R75_40b <- fread(file_name)
CI_param_S5_R75_40b <- data.frame(CI_param_S5_R75_40b)[-1]

CI_param_S5_R75_40b$location <- 'linear'
CI_param_S5_R75_40b$detection <- 0.5
CI_param_S5_R75_40b$eradication <- 0.75
CI_param_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R5_40 <- fread(file_name)
CI_param_S75_R5_40 <- data.frame(CI_param_S75_R5_40)[-1]

CI_param_S75_R5_40$location <- 'linear'
CI_param_S75_R5_40$detection <- 0.75
CI_param_S75_R5_40$eradication <- 0.5
CI_param_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R5_40b <- fread(file_name)
CI_param_S75_R5_40b <- data.frame(CI_param_S75_R5_40b)[-1]

CI_param_S75_R5_40b$location <- 'linear'
CI_param_S75_R5_40b$detection <- 0.75
CI_param_S75_R5_40b$eradication <- 0.5
CI_param_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R75_40 <- fread(file_name)
CI_param_S75_R75_40 <- data.frame(CI_param_S75_R75_40)[-1]

CI_param_S75_R75_40$location <- 'linear'
CI_param_S75_R75_40$detection <- 0.75
CI_param_S75_R75_40$eradication <- 0.75
CI_param_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R75_40b <- fread(file_name)
CI_param_S75_R75_40b <- data.frame(CI_param_S75_R75_40b)[-1]

CI_param_S75_R75_40b$location <- 'linear'
CI_param_S75_R75_40b$detection <- 0.75
CI_param_S75_R75_40b$eradication <- 0.75
CI_param_S75_R75_40b$budget <- 40

#--- Combine CI_params ---#
CI_param_40 <- rbind(CI_param_S25_R5_40,CI_param_S25_R5_40b,
                     CI_param_S25_R75_40,CI_param_S25_R75_40b,
                     CI_param_S5_R5_40,CI_param_S5_R5_40b,
                     CI_param_S5_R75_40,CI_param_S5_R75_40b,
                     CI_param_S75_R5_40,CI_param_S75_R5_40b,
                     CI_param_S75_R75_40,CI_param_S5_R75_40b)


#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R5_60 <- fread(file_name)
CI_param_S25_R5_60 <- data.frame(CI_param_S25_R5_60)[-1]

CI_param_S25_R5_60$location <- 'linear'
CI_param_S25_R5_60$detection <- 0.25
CI_param_S25_R5_60$eradication <- 0.5
CI_param_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R5_60b <- fread(file_name)
CI_param_S25_R5_60b <- data.frame(CI_param_S25_R5_60b)[-1]

CI_param_S25_R5_60b$location <- 'linear'
CI_param_S25_R5_60b$detection <- 0.25
CI_param_S25_R5_60b$eradication <- 0.5
CI_param_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R75_60 <- fread(file_name)
CI_param_S25_R75_60 <- data.frame(CI_param_S25_R75_60)[-1]

CI_param_S25_R75_60$location <- 'linear'
CI_param_S25_R75_60$detection <- 0.25
CI_param_S25_R75_60$eradication <- 0.75
CI_param_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S25_R75_60b <- fread(file_name)
CI_param_S25_R75_60b <- data.frame(CI_param_S25_R75_60b)[-1]

CI_param_S25_R75_60b$location <- 'linear'
CI_param_S25_R75_60b$detection <- 0.25
CI_param_S25_R75_60b$eradication <- 0.75
CI_param_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R5_60 <- fread(file_name)
CI_param_S5_R5_60 <- data.frame(CI_param_S5_R5_60)[-1]

CI_param_S5_R5_60$location <- 'linear'
CI_param_S5_R5_60$detection <- 0.5
CI_param_S5_R5_60$eradication <- 0.5
CI_param_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R5_60b <- fread(file_name)
CI_param_S5_R5_60b <- data.frame(CI_param_S5_R5_60b)[-1]

CI_param_S5_R5_60b$location <- 'linear'
CI_param_S5_R5_60b$detection <- 0.5
CI_param_S5_R5_60b$eradication <- 0.5
CI_param_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R75_60 <- fread(file_name)
CI_param_S5_R75_60 <- data.frame(CI_param_S5_R75_60)[-1]

CI_param_S5_R75_60$location <- 'linear'
CI_param_S5_R75_60$detection <- 0.5
CI_param_S5_R75_60$eradication <- 0.75
CI_param_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S5_R75_60b <- fread(file_name)
CI_param_S5_R75_60b <- data.frame(CI_param_S5_R75_60b)[-1]

CI_param_S5_R75_60b$location <- 'linear'
CI_param_S5_R75_60b$detection <- 0.5
CI_param_S5_R75_60b$eradication <- 0.75
CI_param_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R5_60 <- fread(file_name)
CI_param_S75_R5_60 <- data.frame(CI_param_S75_R5_60)[-1]

CI_param_S75_R5_60$location <- 'linear'
CI_param_S75_R5_60$detection <- 0.75
CI_param_S75_R5_60$eradication <- 0.5
CI_param_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R5_60b <- fread(file_name)
CI_param_S75_R5_60b <- data.frame(CI_param_S75_R5_60b)[-1]

CI_param_S75_R5_60b$location <- 'linear'
CI_param_S75_R5_60b$detection <- 0.75
CI_param_S75_R5_60b$eradication <- 0.5
CI_param_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R75_60 <- fread(file_name)
CI_param_S75_R75_60 <- data.frame(CI_param_S75_R75_60)[-1]

CI_param_S75_R75_60$location <- 'linear'
CI_param_S75_R75_60$detection <- 0.75
CI_param_S75_R75_60$eradication <- 0.75
CI_param_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'CI_param.csv',sep = '/')
CI_param_S75_R75_60b <- fread(file_name)
CI_param_S75_R75_60b <- data.frame(CI_param_S75_R75_60b)[-1]

CI_param_S75_R75_60b$location <- 'linear'
CI_param_S75_R75_60b$detection <- 0.75
CI_param_S75_R75_60b$eradication <- 0.75
CI_param_S75_R75_60b$budget <- 60

#--- Combine CI_params ---#
CI_param_60 <- rbind(CI_param_S25_R5_60,CI_param_S25_R5_60b,
                     CI_param_S25_R75_60,CI_param_S25_R75_60b,
                     CI_param_S5_R5_60,CI_param_S5_R5_60b,
                     CI_param_S5_R75_60,CI_param_S5_R75_60b,
                     CI_param_S75_R5_60,CI_param_S75_R5_60b,
                     CI_param_S75_R75_60,CI_param_S5_R75_60b)

CI_param <- rbind(CI_param_20, CI_param_40, CI_param_60 )

#### Param summary ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R5_20 <- fread(file_name)
param_summary_S25_R5_20 <- data.frame(param_summary_S25_R5_20)[-1]

param_summary_S25_R5_20$location <- 'linear'
param_summary_S25_R5_20$detection <- 0.25
param_summary_S25_R5_20$eradication <- 0.5
param_summary_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R5_20b <- fread(file_name)
param_summary_S25_R5_20b <- data.frame(param_summary_S25_R5_20b)[-1]

param_summary_S25_R5_20b$location <- 'linear'
param_summary_S25_R5_20b$detection <- 0.25
param_summary_S25_R5_20b$eradication <- 0.5
param_summary_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R75_20 <- fread(file_name)
param_summary_S25_R75_20 <- data.frame(param_summary_S25_R75_20)[-1]

param_summary_S25_R75_20$location <- 'linear'
param_summary_S25_R75_20$detection <- 0.25
param_summary_S25_R75_20$eradication <- 0.75
param_summary_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R75_20b <- fread(file_name)
param_summary_S25_R75_20b <- data.frame(param_summary_S25_R75_20b)[-1]

param_summary_S25_R75_20b$location <- 'linear'
param_summary_S25_R75_20b$detection <- 0.25
param_summary_S25_R75_20b$eradication <- 0.75
param_summary_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R5_20 <- fread(file_name)
param_summary_S5_R5_20 <- data.frame(param_summary_S5_R5_20)[-1]

param_summary_S5_R5_20$location <- 'linear'
param_summary_S5_R5_20$detection <- 0.5
param_summary_S5_R5_20$eradication <- 0.5
param_summary_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R5_20b <- fread(file_name)
param_summary_S5_R5_20b <- data.frame(param_summary_S5_R5_20b)[-1]

param_summary_S5_R5_20b$location <- 'linear'
param_summary_S5_R5_20b$detection <- 0.5
param_summary_S5_R5_20b$eradication <- 0.5
param_summary_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R75_20 <- fread(file_name)
param_summary_S5_R75_20 <- data.frame(param_summary_S5_R75_20)[-1]

param_summary_S5_R75_20$location <- 'linear'
param_summary_S5_R75_20$detection <- 0.5
param_summary_S5_R75_20$eradication <- 0.75
param_summary_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R75_20b <- fread(file_name)
param_summary_S5_R75_20b <- data.frame(param_summary_S5_R75_20b)[-1]

param_summary_S5_R75_20b$location <- 'linear'
param_summary_S5_R75_20b$detection <- 0.5
param_summary_S5_R75_20b$eradication <- 0.75
param_summary_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R5_20 <- fread(file_name)
param_summary_S75_R5_20 <- data.frame(param_summary_S75_R5_20)[-1]

param_summary_S75_R5_20$location <- 'linear'
param_summary_S75_R5_20$detection <- 0.75
param_summary_S75_R5_20$eradication <- 0.5
param_summary_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R5_20b <- fread(file_name)
param_summary_S75_R5_20b <- data.frame(param_summary_S75_R5_20b)[-1]

param_summary_S75_R5_20b$location <- 'linear'
param_summary_S75_R5_20b$detection <- 0.75
param_summary_S75_R5_20b$eradication <- 0.5
param_summary_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R75_20 <- fread(file_name)
param_summary_S75_R75_20 <- data.frame(param_summary_S75_R75_20)[-1]

param_summary_S75_R75_20$location <- 'linear'
param_summary_S75_R75_20$detection <- 0.75
param_summary_S75_R75_20$eradication <- 0.75
param_summary_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R75_20b <- fread(file_name)
param_summary_S75_R75_20b <- data.frame(param_summary_S75_R75_20b)[-1]

param_summary_S75_R75_20b$location <- 'linear'
param_summary_S75_R75_20b$detection <- 0.75
param_summary_S75_R75_20b$eradication <- 0.75
param_summary_S75_R75_20b$budget <- 20

#--- Combine param_summary ---#
param_summary_20 <- rbind(param_summary_S25_R5_20,param_summary_S25_R5_20b,
                          param_summary_S25_R75_20,param_summary_S25_R75_20b,
                          param_summary_S5_R5_20,param_summary_S5_R5_20b,
                  param_summary_S5_R75_20,param_summary_S5_R75_20b,
                  param_summary_S75_R5_20,param_summary_S75_R5_20b,
                  param_summary_S75_R75_20,param_summary_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R5_40 <- fread(file_name)
param_summary_S25_R5_40 <- data.frame(param_summary_S25_R5_40)[-1]

param_summary_S25_R5_40$location <- 'linear'
param_summary_S25_R5_40$detection <- 0.25
param_summary_S25_R5_40$eradication <- 0.5
param_summary_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R5_40b <- fread(file_name)
param_summary_S25_R5_40b <- data.frame(param_summary_S25_R5_40b)[-1]

param_summary_S25_R5_40b$location <- 'linear'
param_summary_S25_R5_40b$detection <- 0.25
param_summary_S25_R5_40b$eradication <- 0.5
param_summary_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R75_40 <- fread(file_name)
param_summary_S25_R75_40 <- data.frame(param_summary_S25_R75_40)[-1]

param_summary_S25_R75_40$location <- 'linear'
param_summary_S25_R75_40$detection <- 0.25
param_summary_S25_R75_40$eradication <- 0.75
param_summary_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R75_40b <- fread(file_name)
param_summary_S25_R75_40b <- data.frame(param_summary_S25_R75_40b)[-1]

param_summary_S25_R75_40b$location <- 'linear'
param_summary_S25_R75_40b$detection <- 0.25
param_summary_S25_R75_40b$eradication <- 0.75
param_summary_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R5_40 <- fread(file_name)
param_summary_S5_R5_40 <- data.frame(param_summary_S5_R5_40)[-1]

param_summary_S5_R5_40$location <- 'linear'
param_summary_S5_R5_40$detection <- 0.5
param_summary_S5_R5_40$eradication <- 0.5
param_summary_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R5_40b <- fread(file_name)
param_summary_S5_R5_40b <- data.frame(param_summary_S5_R5_40b)[-1]

param_summary_S5_R5_40b$location <- 'linear'
param_summary_S5_R5_40b$detection <- 0.5
param_summary_S5_R5_40b$eradication <- 0.5
param_summary_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R75_40 <- fread(file_name)
param_summary_S5_R75_40 <- data.frame(param_summary_S5_R75_40)[-1]

param_summary_S5_R75_40$location <- 'linear'
param_summary_S5_R75_40$detection <- 0.5
param_summary_S5_R75_40$eradication <- 0.75
param_summary_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R75_40b <- fread(file_name)
param_summary_S5_R75_40b <- data.frame(param_summary_S5_R75_40b)[-1]

param_summary_S5_R75_40b$location <- 'linear'
param_summary_S5_R75_40b$detection <- 0.5
param_summary_S5_R75_40b$eradication <- 0.75
param_summary_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R5_40 <- fread(file_name)
param_summary_S75_R5_40 <- data.frame(param_summary_S75_R5_40)[-1]

param_summary_S75_R5_40$location <- 'linear'
param_summary_S75_R5_40$detection <- 0.75
param_summary_S75_R5_40$eradication <- 0.5
param_summary_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R5_40b <- fread(file_name)
param_summary_S75_R5_40b <- data.frame(param_summary_S75_R5_40b)[-1]

param_summary_S75_R5_40b$location <- 'linear'
param_summary_S75_R5_40b$detection <- 0.75
param_summary_S75_R5_40b$eradication <- 0.5
param_summary_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R75_40 <- fread(file_name)
param_summary_S75_R75_40 <- data.frame(param_summary_S75_R75_40)[-1]

param_summary_S75_R75_40$location <- 'linear'
param_summary_S75_R75_40$detection <- 0.75
param_summary_S75_R75_40$eradication <- 0.75
param_summary_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R75_40b <- fread(file_name)
param_summary_S75_R75_40b <- data.frame(param_summary_S75_R75_40b)[-1]

param_summary_S75_R75_40b$location <- 'linear'
param_summary_S75_R75_40b$detection <- 0.75
param_summary_S75_R75_40b$eradication <- 0.75
param_summary_S75_R75_40b$budget <- 40

#--- Combine param_summary ---#
param_summary_40 <- rbind(param_summary_S25_R5_40,param_summary_S25_R5_40b,
                          param_summary_S25_R75_40,param_summary_S25_R75_40b,
                          param_summary_S5_R5_40,param_summary_S5_R5_40b,
                          param_summary_S5_R75_40,param_summary_S5_R75_40b,
                          param_summary_S75_R5_40,param_summary_S75_R5_40b,
                          param_summary_S75_R75_40,param_summary_S5_R75_40b)


#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R5_60 <- fread(file_name)
param_summary_S25_R5_60 <- data.frame(param_summary_S25_R5_60)[-1]

param_summary_S25_R5_60$location <- 'linear'
param_summary_S25_R5_60$detection <- 0.25
param_summary_S25_R5_60$eradication <- 0.5
param_summary_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R5_60b <- fread(file_name)
param_summary_S25_R5_60b <- data.frame(param_summary_S25_R5_60b)[-1]

param_summary_S25_R5_60b$location <- 'linear'
param_summary_S25_R5_60b$detection <- 0.25
param_summary_S25_R5_60b$eradication <- 0.5
param_summary_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R75_60 <- fread(file_name)
param_summary_S25_R75_60 <- data.frame(param_summary_S25_R75_60)[-1]

param_summary_S25_R75_60$location <- 'linear'
param_summary_S25_R75_60$detection <- 0.25
param_summary_S25_R75_60$eradication <- 0.75
param_summary_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S25_R75_60b <- fread(file_name)
param_summary_S25_R75_60b <- data.frame(param_summary_S25_R75_60b)[-1]

param_summary_S25_R75_60b$location <- 'linear'
param_summary_S25_R75_60b$detection <- 0.25
param_summary_S25_R75_60b$eradication <- 0.75
param_summary_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R5_60 <- fread(file_name)
param_summary_S5_R5_60 <- data.frame(param_summary_S5_R5_60)[-1]

param_summary_S5_R5_60$location <- 'linear'
param_summary_S5_R5_60$detection <- 0.5
param_summary_S5_R5_60$eradication <- 0.5
param_summary_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R5_60b <- fread(file_name)
param_summary_S5_R5_60b <- data.frame(param_summary_S5_R5_60b)[-1]

param_summary_S5_R5_60b$location <- 'linear'
param_summary_S5_R5_60b$detection <- 0.5
param_summary_S5_R5_60b$eradication <- 0.5
param_summary_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R75_60 <- fread(file_name)
param_summary_S5_R75_60 <- data.frame(param_summary_S5_R75_60)[-1]

param_summary_S5_R75_60$location <- 'linear'
param_summary_S5_R75_60$detection <- 0.5
param_summary_S5_R75_60$eradication <- 0.75
param_summary_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S5_R75_60b <- fread(file_name)
param_summary_S5_R75_60b <- data.frame(param_summary_S5_R75_60b)[-1]

param_summary_S5_R75_60b$location <- 'linear'
param_summary_S5_R75_60b$detection <- 0.5
param_summary_S5_R75_60b$eradication <- 0.75
param_summary_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R5_60 <- fread(file_name)
param_summary_S75_R5_60 <- data.frame(param_summary_S75_R5_60)[-1]

param_summary_S75_R5_60$location <- 'linear'
param_summary_S75_R5_60$detection <- 0.75
param_summary_S75_R5_60$eradication <- 0.5
param_summary_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R5_60b <- fread(file_name)
param_summary_S75_R5_60b <- data.frame(param_summary_S75_R5_60b)[-1]

param_summary_S75_R5_60b$location <- 'linear'
param_summary_S75_R5_60b$detection <- 0.75
param_summary_S75_R5_60b$eradication <- 0.5
param_summary_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R75_60 <- fread(file_name)
param_summary_S75_R75_60 <- data.frame(param_summary_S75_R75_60)[-1]

param_summary_S75_R75_60$location <- 'linear'
param_summary_S75_R75_60$detection <- 0.75
param_summary_S75_R75_60$eradication <- 0.75
param_summary_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'par_summary.csv',sep = '/')
param_summary_S75_R75_60b <- fread(file_name)
param_summary_S75_R75_60b <- data.frame(param_summary_S75_R75_60b)[-1]

param_summary_S75_R75_60b$location <- 'linear'
param_summary_S75_R75_60b$detection <- 0.75
param_summary_S75_R75_60b$eradication <- 0.75
param_summary_S75_R75_60b$budget <- 60

#--- Combine param_summary ---#
param_summary_60 <- rbind(param_summary_S25_R5_60,param_summary_S25_R5_60b,
                          param_summary_S25_R75_60,param_summary_S25_R75_60b,
                          param_summary_S5_R5_60,param_summary_S5_R5_60b,
                          param_summary_S5_R75_60,param_summary_S5_R75_60b,
                          param_summary_S75_R5_60,param_summary_S75_R5_60b,
                          param_summary_S75_R75_60,param_summary_S5_R75_60b)

param_summary <- rbind(param_summary_20, param_summary_40, param_summary_60)

#### Dist travel ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_20 <- fread(file_name)
dist_S25_R5_20 <- data.frame(dist_S25_R5_20)[-1]

dist_S25_R5_20$location <- 'linear'
dist_S25_R5_20$detection <- 0.25
dist_S25_R5_20$eradication <- 0.5
dist_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_20b <- fread(file_name)
dist_S25_R5_20b <- data.frame(dist_S25_R5_20b)[-1]

dist_S25_R5_20b$location <- 'linear'
dist_S25_R5_20b$detection <- 0.25
dist_S25_R5_20b$eradication <- 0.5
dist_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_20 <- fread(file_name)
dist_S25_R75_20 <- data.frame(dist_S25_R75_20)[-1]

dist_S25_R75_20$location <- 'linear'
dist_S25_R75_20$detection <- 0.25
dist_S25_R75_20$eradication <- 0.75
dist_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_20b <- fread(file_name)
dist_S25_R75_20b <- data.frame(dist_S25_R75_20b)[-1]

dist_S25_R75_20b$location <- 'linear'
dist_S25_R75_20b$detection <- 0.25
dist_S25_R75_20b$eradication <- 0.75
dist_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_20 <- fread(file_name)
dist_S5_R5_20 <- data.frame(dist_S5_R5_20)[-1]

dist_S5_R5_20$location <- 'linear'
dist_S5_R5_20$detection <- 0.5
dist_S5_R5_20$eradication <- 0.5
dist_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_20b <- fread(file_name)
dist_S5_R5_20b <- data.frame(dist_S5_R5_20b)[-1]

dist_S5_R5_20b$location <- 'linear'
dist_S5_R5_20b$detection <- 0.5
dist_S5_R5_20b$eradication <- 0.5
dist_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_20 <- fread(file_name)
dist_S5_R75_20 <- data.frame(dist_S5_R75_20)[-1]

dist_S5_R75_20$location <- 'linear'
dist_S5_R75_20$detection <- 0.5
dist_S5_R75_20$eradication <- 0.75
dist_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_20b <- fread(file_name)
dist_S5_R75_20b <- data.frame(dist_S5_R75_20b)[-1]

dist_S5_R75_20b$location <- 'linear'
dist_S5_R75_20b$detection <- 0.5
dist_S5_R75_20b$eradication <- 0.75
dist_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_20 <- fread(file_name)
dist_S75_R5_20 <- data.frame(dist_S75_R5_20)[-1]

dist_S75_R5_20$location <- 'linear'
dist_S75_R5_20$detection <- 0.75
dist_S75_R5_20$eradication <- 0.5
dist_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_20b <- fread(file_name)
dist_S75_R5_20b <- data.frame(dist_S75_R5_20b)[-1]

dist_S75_R5_20b$location <- 'linear'
dist_S75_R5_20b$detection <- 0.75
dist_S75_R5_20b$eradication <- 0.5
dist_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_20 <- fread(file_name)
dist_S75_R75_20 <- data.frame(dist_S75_R75_20)[-1]

dist_S75_R75_20$location <- 'linear'
dist_S75_R75_20$detection <- 0.75
dist_S75_R75_20$eradication <- 0.75
dist_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_20b <- fread(file_name)
dist_S75_R75_20b <- data.frame(dist_S75_R75_20b)[-1]

dist_S75_R75_20b$location <- 'linear'
dist_S75_R75_20b$detection <- 0.75
dist_S75_R75_20b$eradication <- 0.75
dist_S75_R75_20b$budget <- 20

#--- Combine dists ---#
dist_20 <- rbind(dist_S25_R5_20,dist_S25_R5_20b,
                 dist_S25_R75_20,dist_S25_R75_20b,
                 dist_S5_R5_20,dist_S5_R5_20b,
                     dist_S5_R75_20,dist_S5_R75_20b,
                     dist_S75_R5_20,dist_S75_R5_20b,
                     dist_S75_R75_20,dist_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_40 <- fread(file_name)
dist_S25_R5_40 <- data.frame(dist_S25_R5_40)[-1]

dist_S25_R5_40$location <- 'linear'
dist_S25_R5_40$detection <- 0.25
dist_S25_R5_40$eradication <- 0.5
dist_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_40b <- fread(file_name)
dist_S25_R5_40b <- data.frame(dist_S25_R5_40b)[-1]

dist_S25_R5_40b$location <- 'linear'
dist_S25_R5_40b$detection <- 0.25
dist_S25_R5_40b$eradication <- 0.5
dist_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_40 <- fread(file_name)
dist_S25_R75_40 <- data.frame(dist_S25_R75_40)[-1]

dist_S25_R75_40$location <- 'linear'
dist_S25_R75_40$detection <- 0.25
dist_S25_R75_40$eradication <- 0.75
dist_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_40b <- fread(file_name)
dist_S25_R75_40b <- data.frame(dist_S25_R75_40b)[-1]

dist_S25_R75_40b$location <- 'linear'
dist_S25_R75_40b$detection <- 0.25
dist_S25_R75_40b$eradication <- 0.75
dist_S25_R75_40b$budget <- 40


#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_40 <- fread(file_name)
dist_S5_R5_40 <- data.frame(dist_S5_R5_40)[-1]

dist_S5_R5_40$location <- 'linear'
dist_S5_R5_40$detection <- 0.5
dist_S5_R5_40$eradication <- 0.5
dist_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_40b <- fread(file_name)
dist_S5_R5_40b <- data.frame(dist_S5_R5_40b)[-1]

dist_S5_R5_40b$location <- 'linear'
dist_S5_R5_40b$detection <- 0.5
dist_S5_R5_40b$eradication <- 0.5
dist_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_40 <- fread(file_name)
dist_S5_R75_40 <- data.frame(dist_S5_R75_40)[-1]

dist_S5_R75_40$location <- 'linear'
dist_S5_R75_40$detection <- 0.5
dist_S5_R75_40$eradication <- 0.75
dist_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_40b <- fread(file_name)
dist_S5_R75_40b <- data.frame(dist_S5_R75_40b)[-1]

dist_S5_R75_40b$location <- 'linear'
dist_S5_R75_40b$detection <- 0.5
dist_S5_R75_40b$eradication <- 0.75
dist_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_40 <- fread(file_name)
dist_S75_R5_40 <- data.frame(dist_S75_R5_40)[-1]

dist_S75_R5_40$location <- 'linear'
dist_S75_R5_40$detection <- 0.75
dist_S75_R5_40$eradication <- 0.5
dist_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_40b <- fread(file_name)
dist_S75_R5_40b <- data.frame(dist_S75_R5_40b)[-1]

dist_S75_R5_40b$location <- 'linear'
dist_S75_R5_40b$detection <- 0.75
dist_S75_R5_40b$eradication <- 0.5
dist_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_40 <- fread(file_name)
dist_S75_R75_40 <- data.frame(dist_S75_R75_40)[-1]

dist_S75_R75_40$location <- 'linear'
dist_S75_R75_40$detection <- 0.75
dist_S75_R75_40$eradication <- 0.75
dist_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_40b <- fread(file_name)
dist_S75_R75_40b <- data.frame(dist_S75_R75_40b)[-1]

dist_S75_R75_40b$location <- 'linear'
dist_S75_R75_40b$detection <- 0.75
dist_S75_R75_40b$eradication <- 0.75
dist_S75_R75_40b$budget <- 40

#--- Combine dists ---#
dist_40 <- rbind(dist_S25_R5_40,dist_S25_R5_40b,
                 dist_S25_R75_40,dist_S25_R75_40b,
                 dist_S5_R5_40,dist_S5_R5_40b,
                 dist_S5_R75_40,dist_S5_R75_40b,
                 dist_S75_R5_40,dist_S75_R5_40b,
                 dist_S75_R75_40,dist_S5_R75_40b)

#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_60 <- fread(file_name)
dist_S25_R5_60 <- data.frame(dist_S25_R5_60)[-1]

dist_S25_R5_60$location <- 'linear'
dist_S25_R5_60$detection <- 0.25
dist_S25_R5_60$eradication <- 0.5
dist_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_60b <- fread(file_name)
dist_S25_R5_60b <- data.frame(dist_S25_R5_60b)[-1]

dist_S25_R5_60b$location <- 'linear'
dist_S25_R5_60b$detection <- 0.25
dist_S25_R5_60b$eradication <- 0.5
dist_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_60 <- fread(file_name)
dist_S25_R75_60 <- data.frame(dist_S25_R75_60)[-1]

dist_S25_R75_60$location <- 'linear'
dist_S25_R75_60$detection <- 0.25
dist_S25_R75_60$eradication <- 0.75
dist_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_60b <- fread(file_name)
dist_S25_R75_60b <- data.frame(dist_S25_R75_60b)[-1]

dist_S25_R75_60b$location <- 'linear'
dist_S25_R75_60b$detection <- 0.25
dist_S25_R75_60b$eradication <- 0.75
dist_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_60 <- fread(file_name)
dist_S5_R5_60 <- data.frame(dist_S5_R5_60)[-1]

dist_S5_R5_60$location <- 'linear'
dist_S5_R5_60$detection <- 0.5
dist_S5_R5_60$eradication <- 0.5
dist_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_60b <- fread(file_name)
dist_S5_R5_60b <- data.frame(dist_S5_R5_60b)[-1]

dist_S5_R5_60b$location <- 'linear'
dist_S5_R5_60b$detection <- 0.5
dist_S5_R5_60b$eradication <- 0.5
dist_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_60 <- fread(file_name)
dist_S5_R75_60 <- data.frame(dist_S5_R75_60)[-1]

dist_S5_R75_60$location <- 'linear'
dist_S5_R75_60$detection <- 0.5
dist_S5_R75_60$eradication <- 0.75
dist_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_60b <- fread(file_name)
dist_S5_R75_60b <- data.frame(dist_S5_R75_60b)[-1]

dist_S5_R75_60b$location <- 'linear'
dist_S5_R75_60b$detection <- 0.5
dist_S5_R75_60b$eradication <- 0.75
dist_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_60 <- fread(file_name)
dist_S75_R5_60 <- data.frame(dist_S75_R5_60)[-1]

dist_S75_R5_60$location <- 'linear'
dist_S75_R5_60$detection <- 0.75
dist_S75_R5_60$eradication <- 0.5
dist_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_60b <- fread(file_name)
dist_S75_R5_60b <- data.frame(dist_S75_R5_60b)[-1]

dist_S75_R5_60b$location <- 'linear'
dist_S75_R5_60b$detection <- 0.75
dist_S75_R5_60b$eradication <- 0.5
dist_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_60 <- fread(file_name)
dist_S75_R75_60 <- data.frame(dist_S75_R75_60)[-1]

dist_S75_R75_60$location <- 'linear'
dist_S75_R75_60$detection <- 0.75
dist_S75_R75_60$eradication <- 0.75
dist_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_60b <- fread(file_name)
dist_S75_R75_60b <- data.frame(dist_S75_R75_60b)[-1]

dist_S75_R75_60b$location <- 'linear'
dist_S75_R75_60b$detection <- 0.75
dist_S75_R75_60b$eradication <- 0.75
dist_S75_R75_60b$budget <- 60

#--- Combine dists ---#
dist_60 <- rbind(dist_S25_R5_60,dist_S25_R5_60b,
                 dist_S25_R75_60,dist_S25_R75_60b,
                 dist_S5_R5_60,dist_S5_R5_60b,
                 dist_S5_R75_60,dist_S5_R75_60b,
                 dist_S75_R5_60,dist_S75_R5_60b,
                 dist_S75_R75_60,dist_S5_R75_60b)

dist <- rbind(dist_20, dist_40, dist_60)

#### Sites Visit ####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_20 <- fread(file_name)
sites_S25_R5_20 <- data.frame(sites_S25_R5_20)[-1]

sites_S25_R5_20$location <- 'linear'
sites_S25_R5_20$detection <- 0.25
sites_S25_R5_20$eradication <- 0.5
sites_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_20b <- fread(file_name)
sites_S25_R5_20b <- data.frame(sites_S25_R5_20b)[-1]

sites_S25_R5_20b$location <- 'linear'
sites_S25_R5_20b$detection <- 0.25
sites_S25_R5_20b$eradication <- 0.5
sites_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_20 <- fread(file_name)
sites_S25_R75_20 <- data.frame(sites_S25_R75_20)[-1]

sites_S25_R75_20$location <- 'linear'
sites_S25_R75_20$detection <- 0.25
sites_S25_R75_20$eradication <- 0.75
sites_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_20b <- fread(file_name)
sites_S25_R75_20b <- data.frame(sites_S25_R75_20b)[-1]

sites_S25_R75_20b$location <- 'linear'
sites_S25_R75_20b$detection <- 0.25
sites_S25_R75_20b$eradication <- 0.75
sites_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_20 <- fread(file_name)
sites_S5_R5_20 <- data.frame(sites_S5_R5_20)[-1]

sites_S5_R5_20$location <- 'linear'
sites_S5_R5_20$detection <- 0.5
sites_S5_R5_20$eradication <- 0.5
sites_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_20b <- fread(file_name)
sites_S5_R5_20b <- data.frame(sites_S5_R5_20b)[-1]

sites_S5_R5_20b$location <- 'linear'
sites_S5_R5_20b$detection <- 0.5
sites_S5_R5_20b$eradication <- 0.5
sites_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_20 <- fread(file_name)
sites_S5_R75_20 <- data.frame(sites_S5_R75_20)[-1]

sites_S5_R75_20$location <- 'linear'
sites_S5_R75_20$detection <- 0.5
sites_S5_R75_20$eradication <- 0.75
sites_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_20b <- fread(file_name)
sites_S5_R75_20b <- data.frame(sites_S5_R75_20b)[-1]

sites_S5_R75_20b$location <- 'linear'
sites_S5_R75_20b$detection <- 0.5
sites_S5_R75_20b$eradication <- 0.75
sites_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_20 <- fread(file_name)
sites_S75_R5_20 <- data.frame(sites_S75_R5_20)[-1]

sites_S75_R5_20$location <- 'linear'
sites_S75_R5_20$detection <- 0.75
sites_S75_R5_20$eradication <- 0.5
sites_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_20b <- fread(file_name)
sites_S75_R5_20b <- data.frame(sites_S75_R5_20b)[-1]

sites_S75_R5_20b$location <- 'linear'
sites_S75_R5_20b$detection <- 0.75
sites_S75_R5_20b$eradication <- 0.5
sites_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_20 <- fread(file_name)
sites_S75_R75_20 <- data.frame(sites_S75_R75_20)[-1]

sites_S75_R75_20$location <- 'linear'
sites_S75_R75_20$detection <- 0.75
sites_S75_R75_20$eradication <- 0.75
sites_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_20b <- fread(file_name)
sites_S75_R75_20b <- data.frame(sites_S75_R75_20b)[-1]

sites_S75_R75_20b$location <- 'linear'
sites_S75_R75_20b$detection <- 0.75
sites_S75_R75_20b$eradication <- 0.75
sites_S75_R75_20b$budget <- 20

#--- Combine dists ---#
sites_20 <- rbind(sites_S25_R5_20,sites_S25_R5_20b,
                  sites_S25_R75_20,sites_S25_R75_20b,
                  sites_S5_R5_20,sites_S5_R5_20b,
                  sites_S5_R75_20,sites_S5_R75_20b,
                  sites_S75_R5_20,sites_S75_R5_20b,
                  sites_S75_R75_20,sites_S5_R75_20b)

#-- Budget = 40 --#
#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40 <- fread(file_name)
sites_S25_R5_40 <- data.frame(sites_S25_R5_40)[-1]

sites_S25_R5_40$location <- 'linear'
sites_S25_R5_40$detection <- 0.25
sites_S25_R5_40$eradication <- 0.5
sites_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40b <- fread(file_name)
sites_S25_R5_40b <- data.frame(sites_S25_R5_40b)[-1]

sites_S25_R5_40b$location <- 'linear'
sites_S25_R5_40b$detection <- 0.25
sites_S25_R5_40b$eradication <- 0.5
sites_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40 <- fread(file_name)
sites_S25_R75_40 <- data.frame(sites_S25_R75_40)[-1]

sites_S25_R75_40$location <- 'linear'
sites_S25_R75_40$detection <- 0.25
sites_S25_R75_40$eradication <- 0.75
sites_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40b <- fread(file_name)
sites_S25_R75_40b <- data.frame(sites_S25_R75_40b)[-1]

sites_S25_R75_40b$location <- 'linear'
sites_S25_R75_40b$detection <- 0.25
sites_S25_R75_40b$eradication <- 0.75
sites_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40 <- fread(file_name)
sites_S5_R5_40 <- data.frame(sites_S5_R5_40)[-1]

sites_S5_R5_40$location <- 'linear'
sites_S5_R5_40$detection <- 0.5
sites_S5_R5_40$eradication <- 0.5
sites_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40b <- fread(file_name)
sites_S5_R5_40b <- data.frame(sites_S5_R5_40b)[-1]

sites_S5_R5_40b$location <- 'linear'
sites_S5_R5_40b$detection <- 0.5
sites_S5_R5_40b$eradication <- 0.5
sites_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40 <- fread(file_name)
sites_S5_R75_40 <- data.frame(sites_S5_R75_40)[-1]

sites_S5_R75_40$location <- 'linear'
sites_S5_R75_40$detection <- 0.5
sites_S5_R75_40$eradication <- 0.75
sites_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40b <- fread(file_name)
sites_S5_R75_40b <- data.frame(sites_S5_R75_40b)[-1]

sites_S5_R75_40b$location <- 'linear'
sites_S5_R75_40b$detection <- 0.5
sites_S5_R75_40b$eradication <- 0.75
sites_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40 <- fread(file_name)
sites_S75_R5_40 <- data.frame(sites_S75_R5_40)[-1]

sites_S75_R5_40$location <- 'linear'
sites_S75_R5_40$detection <- 0.75
sites_S75_R5_40$eradication <- 0.5
sites_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40b <- fread(file_name)
sites_S75_R5_40b <- data.frame(sites_S75_R5_40b)[-1]

sites_S75_R5_40b$location <- 'linear'
sites_S75_R5_40b$detection <- 0.75
sites_S75_R5_40b$eradication <- 0.5
sites_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40 <- fread(file_name)
sites_S75_R75_40 <- data.frame(sites_S75_R75_40)[-1]

sites_S75_R75_40$location <- 'linear'
sites_S75_R75_40$detection <- 0.75
sites_S75_R75_40$eradication <- 0.75
sites_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40b <- fread(file_name)
sites_S75_R75_40b <- data.frame(sites_S75_R75_40b)[-1]

sites_S75_R75_40b$location <- 'linear'
sites_S75_R75_40b$detection <- 0.75
sites_S75_R75_40b$eradication <- 0.75
sites_S75_R75_40b$budget <- 40

#--- Combine dists ---#
sites_40 <- rbind(sites_S25_R5_40,sites_S25_R5_40b,
                  sites_S25_R75_40,sites_S25_R75_40b,
                  sites_S5_R5_40,sites_S5_R5_40b,
                  sites_S5_R75_40,sites_S5_R75_40b,
                  sites_S75_R5_40,sites_S75_R5_40b,
                  sites_S75_R75_40,sites_S5_R75_40b)

#-- Budget = 60 --#
#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_60 <- fread(file_name)
sites_S25_R5_60 <- data.frame(sites_S25_R5_60)[-1]

sites_S25_R5_60$location <- 'linear'
sites_S25_R5_60$detection <- 0.25
sites_S25_R5_60$eradication <- 0.5
sites_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_60b <- fread(file_name)
sites_S25_R5_60b <- data.frame(sites_S25_R5_60b)[-1]

sites_S25_R5_60b$location <- 'linear'
sites_S25_R5_60b$detection <- 0.25
sites_S25_R5_60b$eradication <- 0.5
sites_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_60 <- fread(file_name)
sites_S25_R75_60 <- data.frame(sites_S25_R75_60)[-1]

sites_S25_R75_60$location <- 'linear'
sites_S25_R75_60$detection <- 0.25
sites_S25_R75_60$eradication <- 0.75
sites_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_60b <- fread(file_name)
sites_S25_R75_60b <- data.frame(sites_S25_R75_60b)[-1]

sites_S25_R75_60b$location <- 'linear'
sites_S25_R75_60b$detection <- 0.25
sites_S25_R75_60b$eradication <- 0.75
sites_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_60 <- fread(file_name)
sites_S5_R5_60 <- data.frame(sites_S5_R5_60)[-1]

sites_S5_R5_60$location <- 'linear'
sites_S5_R5_60$detection <- 0.5
sites_S5_R5_60$eradication <- 0.5
sites_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_60b <- fread(file_name)
sites_S5_R5_60b <- data.frame(sites_S5_R5_60b)[-1]

sites_S5_R5_60b$location <- 'linear'
sites_S5_R5_60b$detection <- 0.5
sites_S5_R5_60b$eradication <- 0.5
sites_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_60 <- fread(file_name)
sites_S5_R75_60 <- data.frame(sites_S5_R75_60)[-1]

sites_S5_R75_60$location <- 'linear'
sites_S5_R75_60$detection <- 0.5
sites_S5_R75_60$eradication <- 0.75
sites_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_60b <- fread(file_name)
sites_S5_R75_60b <- data.frame(sites_S5_R75_60b)[-1]

sites_S5_R75_60b$location <- 'linear'
sites_S5_R75_60b$detection <- 0.5
sites_S5_R75_60b$eradication <- 0.75
sites_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_60 <- fread(file_name)
sites_S75_R5_60 <- data.frame(sites_S75_R5_60)[-1]

sites_S75_R5_60$location <- 'linear'
sites_S75_R5_60$detection <- 0.75
sites_S75_R5_60$eradication <- 0.5
sites_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_60b <- fread(file_name)
sites_S75_R5_60b <- data.frame(sites_S75_R5_60b)[-1]

sites_S75_R5_60b$location <- 'linear'
sites_S75_R5_60b$detection <- 0.75
sites_S75_R5_60b$eradication <- 0.5
sites_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_60 <- fread(file_name)
sites_S75_R75_60 <- data.frame(sites_S75_R75_60)[-1]

sites_S75_R75_60$location <- 'linear'
sites_S75_R75_60$detection <- 0.75
sites_S75_R75_60$eradication <- 0.75
sites_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_60b <- fread(file_name)
sites_S75_R75_60b <- data.frame(sites_S75_R75_60b)[-1]

sites_S75_R75_60b$location <- 'linear'
sites_S75_R75_60b$detection <- 0.75
sites_S75_R75_60b$eradication <- 0.75
sites_S75_R75_60b$budget <- 60

#--- Combine dists ---#
sites_60 <- rbind(sites_S25_R5_60,sites_S25_R5_60b,
                  sites_S25_R75_60,sites_S25_R75_60b,
                  sites_S5_R5_60,sites_S5_R5_60b,
                  sites_S5_R75_60,sites_S5_R75_60b,
                  sites_S75_R5_60,sites_S75_R5_60b,
                  sites_S75_R75_60,sites_S5_R75_60b)

sites <- rbind(sites_20, sites_40, sites_60)

#### TRULY GENERATING ####
##### States truth ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results\\linear_gen\\20_datM'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_gen_20 <- fread(file_name)
state_truth_gen_20 <- data.frame(state_truth_gen_20)[-1]

state_truth_gen_20$location <- 'linear'
state_truth_gen_20$detection <- 1
state_truth_gen_20$alt[state_truth_gen_20$alt == 1] <- 0.5
state_truth_gen_20$alt[state_truth_gen_20$alt == 2] <- 0.75
state_truth_gen_20$budget <- 20
colnames(state_truth_gen_20)[5] <- 'eradication'


path <- 'E:\\Chapter3\\results\\linear_gen\\20_datM_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_gen_20b <- fread(file_name)
state_truth_gen_20b <- data.frame(state_truth_gen_20b)[-1]
state_truth_gen_20b$sim <- state_truth_gen_20b$sim + 100

state_truth_gen_20b$location <- 'linear'
state_truth_gen_20b$detection <- 1
state_truth_gen_20b$alt[state_truth_gen_20b$alt == 1] <- 0.5
state_truth_gen_20b$alt[state_truth_gen_20b$alt == 2] <- 0.75
state_truth_gen_20b$budget <- 20
colnames(state_truth_gen_20b)[5] <- 'eradication'

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results\\linear_gen\\40_datM'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_gen_40 <- fread(file_name)
state_truth_gen_40 <- data.frame(state_truth_gen_40)[-1]

state_truth_gen_40$location <- 'linear'
state_truth_gen_40$detection <- 1
state_truth_gen_40$alt[state_truth_gen_40$alt == 1] <- 0.5
state_truth_gen_40$alt[state_truth_gen_40$alt == 2] <- 0.75
state_truth_gen_40$budget <- 40
colnames(state_truth_gen_40)[5] <- 'eradication'


path <- 'E:\\Chapter3\\results\\linear_gen\\40_datM_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_gen_40b <- fread(file_name)
state_truth_gen_40b <- data.frame(state_truth_gen_40b)[-1]
state_truth_gen_40b$sim <- state_truth_gen_40b$sim + 100

state_truth_gen_40b$location <- 'linear'
state_truth_gen_40b$detection <- 1
state_truth_gen_40b$alt[state_truth_gen_40b$alt == 1] <- 0.5
state_truth_gen_40b$alt[state_truth_gen_40b$alt == 2] <- 0.75
state_truth_gen_40b$budget <- 40
colnames(state_truth_gen_40b)[5] <- 'eradication'

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results\\linear_gen\\60_datM'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_gen_60 <- fread(file_name)
state_truth_gen_60 <- data.frame(state_truth_gen_60)[-1]

state_truth_gen_60$location <- 'linear'
state_truth_gen_60$detection <- 1
state_truth_gen_60$alt[state_truth_gen_60$alt == 1] <- 0.5
state_truth_gen_60$alt[state_truth_gen_60$alt == 2] <- 0.75
state_truth_gen_60$budget <- 60
colnames(state_truth_gen_60)[5] <- 'eradication'


path <- 'E:\\Chapter3\\results\\linear_gen\\60_datM_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_gen_60b <- fread(file_name)
state_truth_gen_60b <- data.frame(state_truth_gen_60b)[-1]
state_truth_gen_60b$sim <- state_truth_gen_60b$sim + 100

state_truth_gen_60b$location <- 'linear'
state_truth_gen_60b$detection <- 1
state_truth_gen_60b$alt[state_truth_gen_60b$alt == 1] <- 0.5
state_truth_gen_60b$alt[state_truth_gen_60b$alt == 2] <- 0.75
state_truth_gen_60b$budget <- 60
colnames(state_truth_gen_60b)[5] <- 'eradication'

state_truth_all <- rbind(state_truth, 
                     state_truth_gen_20,state_truth_gen_20b,
                     state_truth_gen_40,state_truth_gen_40b,
                     state_truth_gen_60,state_truth_gen_60b)

##### Dist travel ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results\\linear_gen\\20_datM'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_gen_20 <- fread(file_name)
dist_gen_20 <- data.frame(dist_gen_20)[-1]

dist_gen_20$location <- 'linear'
dist_gen_20$detection <- 1
dist_gen_20$alt[dist_gen_20$alt == 1] <- 0.5
dist_gen_20$alt[dist_gen_20$alt == 2] <- 0.75
dist_gen_20$budget <- 20
colnames(dist_gen_20)[4] <- 'eradication'

path <- 'E:\\Chapter3\\results\\linear_gen\\20_datM_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_gen_20b <- fread(file_name)
dist_gen_20b <- data.frame(dist_gen_20b)[-1]

dist_gen_20b$sim <- dist_gen_20b$sim + 100
dist_gen_20b$location <- 'linear'
dist_gen_20b$detection <- 1
dist_gen_20b$alt[dist_gen_20b$alt == 1] <- 0.5
dist_gen_20b$alt[dist_gen_20b$alt == 2] <- 0.75
dist_gen_20b$budget <- 20
colnames(dist_gen_20b)[4] <- 'eradication'

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results\\linear_gen\\40_datM'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_gen_40 <- fread(file_name)
dist_gen_40 <- data.frame(dist_gen_40)[-1]

dist_gen_40$location <- 'linear'
dist_gen_40$detection <- 1
dist_gen_40$alt[dist_gen_40$alt == 1] <- 0.5
dist_gen_40$alt[dist_gen_40$alt == 2] <- 0.75
dist_gen_40$budget <- 40
colnames(dist_gen_40)[4] <- 'eradication'

path <- 'E:\\Chapter3\\results\\linear_gen\\40_datM_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_gen_40b <- fread(file_name)
dist_gen_40b <- data.frame(dist_gen_40b)[-1]
dist_gen_40b$sim <- dist_gen_40b$sim + 100

dist_gen_40b$location <- 'linear'
dist_gen_40b$detection <- 1
dist_gen_40b$alt[dist_gen_40b$alt == 1] <- 0.5
dist_gen_40b$alt[dist_gen_40b$alt == 2] <- 0.75
dist_gen_40b$budget <- 40
colnames(dist_gen_40b)[4] <- 'eradication'

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results\\linear_gen\\60_datM'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_gen_60 <- fread(file_name)
dist_gen_60 <- data.frame(dist_gen_60)[-1]

dist_gen_60$location <- 'linear'
dist_gen_60$detection <- 1
dist_gen_60$alt[dist_gen_60$alt == 1] <- 0.5
dist_gen_60$alt[dist_gen_60$alt == 2] <- 0.75
dist_gen_60$budget <- 60
colnames(dist_gen_60)[4] <- 'eradication'

path <- 'E:\\Chapter3\\results\\linear_gen\\60_datM_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_gen_60b <- fread(file_name)
dist_gen_60b <- data.frame(dist_gen_60b)[-1]

dist_gen_60b$sim <- dist_gen_60$sim + 100
dist_gen_60b$location <- 'linear'
dist_gen_60b$detection <- 1
dist_gen_60b$alt[dist_gen_60b$alt == 1] <- 0.5
dist_gen_60b$alt[dist_gen_60b$alt == 2] <- 0.75
dist_gen_60b$budget <- 60
colnames(dist_gen_60b)[4] <- 'eradication'

dist_all <- rbind(dist,
              dist_gen_20, dist_gen_20b,
              dist_gen_40, dist_gen_40b,
              dist_gen_60, dist_gen_60b)

dist_all <- dist_all %>% filter(week < 5)

##### Sites visit ####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results\\linear_gen\\20_datM'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_gen_20 <- fread(file_name)
sites_gen_20 <- data.frame(sites_gen_20)[-1]

sites_gen_20$location <- 'linear'
sites_gen_20$detection <- 1
sites_gen_20$alt[sites_gen_20$alt == 1] <- 0.5
sites_gen_20$alt[sites_gen_20$alt == 2] <- 0.75
sites_gen_20$budget <- 20
colnames(sites_gen_20)[5] <- 'eradication'

path <- 'E:\\Chapter3\\results\\linear_gen\\20_datM_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_gen_20b <- fread(file_name)
sites_gen_20b <- data.frame(sites_gen_20b)[-1]
sites_gen_20b$sim <- sites_gen_20b$sim + 100

sites_gen_20b$location <- 'linear'
sites_gen_20b$detection <- 1
sites_gen_20b$alt[sites_gen_20b$alt == 1] <- 0.5
sites_gen_20b$alt[sites_gen_20b$alt == 2] <- 0.75
sites_gen_20b$budget <- 20
colnames(sites_gen_20b)[5] <- 'eradication'

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results\\linear_gen\\40_datM'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_gen_40 <- fread(file_name)
sites_gen_40 <- data.frame(sites_gen_40)[-1]

sites_gen_40$location <- 'linear'
sites_gen_40$detection <- 1
sites_gen_40$alt[sites_gen_40$alt == 1] <- 0.5
sites_gen_40$alt[sites_gen_40$alt == 2] <- 0.75
sites_gen_40$budget <- 40
colnames(sites_gen_40)[5] <- 'eradication'

path <- 'E:\\Chapter3\\results\\linear_gen\\40_datM_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_gen_40b <- fread(file_name)
sites_gen_40b <- data.frame(sites_gen_40b)[-1]
sites_gen_40b$sim <- sites_gen_40b$sim + 100

sites_gen_40b$location <- 'linear'
sites_gen_40b$detection <- 1
sites_gen_40b$alt[sites_gen_40b$alt == 1] <- 0.5
sites_gen_40b$alt[sites_gen_40b$alt == 2] <- 0.75
sites_gen_40b$budget <- 40
colnames(sites_gen_40b)[5] <- 'eradication'

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results\\linear_gen\\60_datM'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_gen_60 <- fread(file_name)
sites_gen_60 <- data.frame(sites_gen_60)[-1]

sites_gen_60$location <- 'linear'
sites_gen_60$detection <- 1
sites_gen_60$alt[sites_gen_60$alt == 1] <- 0.5
sites_gen_60$alt[sites_gen_60$alt == 2] <- 0.75
sites_gen_60$budget <- 60
colnames(sites_gen_60)[5] <- 'eradication'

path <- 'E:\\Chapter3\\results\\linear_gen\\60_datM_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_gen_60b <- fread(file_name)
sites_gen_60b <- data.frame(sites_gen_60b)[-1]
sites_gen_60b$sim <- sites_gen_60b$sim + 100

sites_gen_60b$location <- 'linear'
sites_gen_60b$detection <- 1
sites_gen_60b$alt[sites_gen_60b$alt == 1] <- 0.5
sites_gen_60b$alt[sites_gen_60b$alt == 2] <- 0.75
sites_gen_60b$budget <- 60
colnames(sites_gen_60b)[5] <- 'eradication'

sites_all <- rbind(sites,
              sites_gen_20, sites_gen_20b, 
              sites_gen_40, sites_gen_40b, 
              sites_gen_60, sites_gen_60b)

#### VOI ####
##### Suppress ####
#-- 20 budget --#
gen_20all <- rbind(state_truth_gen_20, state_truth_gen_20b)
gen_20all <- gen_20all %>% filter(week == 5 & year == 10)

#--- S25_R5_20---#
gen_20all_R5 <- gen_20all %>% filter(eradication == 0.5)
est_20all_S25_R5 <- rbind(state_truth_S25_R5_20,state_truth_S25_R5_20b)
est_20all_S25_R5 <- est_20all_S25_R5 %>% filter(week == 5 & year == 10)

est_20all_S25_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_20all_S25_R5), 
                                 FUN = mean)

colnames(est_20all_S25_R5_avg)[6] <- 'uncertainty_res'


gen_20all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_20all_R5), 
                              FUN = mean)

VOI_suppress_20_S25_R5 <- cbind(est_20all_S25_R5_avg, 
                               certainty_res = gen_20all_R5_avg$state)

VOI_suppress_20_S25_R5$VOI <- VOI_suppress_20_S25_R5$certainty_res - VOI_suppress_20_S25_R5$uncertainty_res

#--- S5_R5_20---#
gen_20all_R5 <- gen_20all %>% filter(eradication == 0.5)
est_20all_S5_R5 <- rbind(state_truth_S5_R5_20,state_truth_S5_R5_20b)
est_20all_S5_R5 <- est_20all_S5_R5 %>% filter(week == 5 & year == 10)

est_20all_S5_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                                      data = as.data.frame(est_20all_S5_R5), 
                                                      FUN = mean)

colnames(est_20all_S5_R5_avg)[6] <- 'uncertainty_res'


gen_20all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                             data = as.data.frame(gen_20all_R5), 
                                             FUN = mean)

VOI_suppress_20_S5_R5 <- cbind(est_20all_S5_R5_avg, 
                               certainty_res = gen_20all_R5_avg$state)

VOI_suppress_20_S5_R5$VOI <- VOI_suppress_20_S5_R5$certainty_res - VOI_suppress_20_S5_R5$uncertainty_res

#--- S75_R5_20---#
est_20all_S75_R5 <- rbind(state_truth_S75_R5_20,state_truth_S75_R5_20b)
est_20all_S75_R5 <- est_20all_S75_R5 %>% filter(week == 5 & year == 10)

est_20all_S75_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_20all_S75_R5), 
                                 FUN = mean)

colnames(est_20all_S75_R5_avg)[6] <- 'uncertainty_res'


VOI_suppress_20_S75_R5 <- cbind(est_20all_S75_R5_avg, 
                               certainty_res = gen_20all_R5_avg$state)

VOI_suppress_20_S75_R5$VOI <- VOI_suppress_20_S75_R5$certainty_res - VOI_suppress_20_S75_R5$uncertainty_res

#--- S25_R75_20---#
gen_20all_R75 <- gen_20all %>% filter(eradication == 0.75)
est_20all_S25_R75 <- rbind(state_truth_S25_R75_20,state_truth_S25_R75_20b)
est_20all_S25_R75 <- est_20all_S25_R75 %>% filter(week == 5 & year == 10)

est_20all_S25_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_20all_S25_R75), 
                                  FUN = mean)

colnames(est_20all_S25_R75_avg)[6] <- 'uncertainty_res'


gen_20all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_20all_R75), 
                               FUN = mean)

VOI_suppress_20_S25_R75 <- cbind(est_20all_S25_R75_avg, 
                                certainty_res = gen_20all_R75_avg$state)

VOI_suppress_20_S25_R75$VOI <- VOI_suppress_20_S25_R75$certainty_res - VOI_suppress_20_S25_R75$uncertainty_res

#--- S5_R75_20---#
gen_20all_R75 <- gen_20all %>% filter(eradication == 0.75)
est_20all_S5_R75 <- rbind(state_truth_S5_R75_20,state_truth_S5_R75_20b)
est_20all_S5_R75 <- est_20all_S5_R75 %>% filter(week == 5 & year == 10)

est_20all_S5_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_20all_S5_R75), 
                                 FUN = mean)

colnames(est_20all_S5_R75_avg)[6] <- 'uncertainty_res'


gen_20all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_20all_R75), 
                              FUN = mean)

VOI_suppress_20_S5_R75 <- cbind(est_20all_S5_R75_avg, 
                               certainty_res = gen_20all_R75_avg$state)

VOI_suppress_20_S5_R75$VOI <- VOI_suppress_20_S5_R75$certainty_res - VOI_suppress_20_S5_R75$uncertainty_res

#--- S75_R75_20---#
est_20all_S75_R75 <- rbind(state_truth_S75_R75_20,state_truth_S75_R75_20b)
est_20all_S75_R75 <- est_20all_S75_R75 %>% filter(week == 5 & year == 10)

est_20all_S75_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_20all_S75_R75), 
                                  FUN = mean)

colnames(est_20all_S75_R75_avg)[6] <- 'uncertainty_res'


VOI_suppress_20_S75_R75 <- cbind(est_20all_S75_R75_avg, 
                                certainty_res = gen_20all_R75_avg$state)

VOI_suppress_20_S75_R75$VOI <- VOI_suppress_20_S75_R75$certainty_res - VOI_suppress_20_S75_R75$uncertainty_res


VOI_suppress_20 <- rbind(VOI_suppress_20_S25_R5,VOI_suppress_20_S25_R75,
                         VOI_suppress_20_S5_R5, VOI_suppress_20_S75_R5,
                      VOI_suppress_20_S5_R75, VOI_suppress_20_S75_R75)

#-- 40 budget --#
gen_40all <- rbind(state_truth_gen_40, state_truth_gen_40b)
gen_40all <- gen_40all %>% filter(week == 5 & year == 10)

#--- S25_R5_40---#
gen_40all_R5 <- gen_40all %>% filter(eradication == 0.5)
est_40all_S25_R5 <- rbind(state_truth_S25_R5_40,state_truth_S25_R5_40b)
est_40all_S25_R5 <- est_40all_S25_R5 %>% filter(week == 5 & year == 10)

est_40all_S25_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_40all_S25_R5), 
                                 FUN = mean)

colnames(est_40all_S25_R5_avg)[6] <- 'uncertainty_res'


gen_40all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_40all_R5), 
                              FUN = mean)

VOI_suppress_40_S25_R5 <- cbind(est_40all_S25_R5_avg, 
                               certainty_res = gen_40all_R5_avg$state)

VOI_suppress_40_S25_R5$VOI <- VOI_suppress_40_S25_R5$certainty_res - VOI_suppress_40_S25_R5$uncertainty_res

#--- S5_R5_40---#
gen_40all_R5 <- gen_40all %>% filter(eradication == 0.5)
est_40all_S5_R5 <- rbind(state_truth_S5_R5_40,state_truth_S5_R5_40b)
est_40all_S5_R5 <- est_40all_S5_R5 %>% filter(week == 5 & year == 10)

est_40all_S5_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_40all_S5_R5), 
                                 FUN = mean)

colnames(est_40all_S5_R5_avg)[6] <- 'uncertainty_res'


gen_40all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_40all_R5), 
                              FUN = mean)

VOI_suppress_40_S5_R5 <- cbind(est_40all_S5_R5_avg, 
                               certainty_res = gen_40all_R5_avg$state)

VOI_suppress_40_S5_R5$VOI <- VOI_suppress_40_S5_R5$certainty_res - VOI_suppress_40_S5_R5$uncertainty_res

#--- S75_R5_40---#
est_40all_S75_R5 <- rbind(state_truth_S75_R5_40,state_truth_S75_R5_40b)
est_40all_S75_R5 <- est_40all_S75_R5 %>% filter(week == 5 & year == 10)

est_40all_S75_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_40all_S75_R5), 
                                  FUN = mean)

colnames(est_40all_S75_R5_avg)[6] <- 'uncertainty_res'


VOI_suppress_40_S75_R5 <- cbind(est_40all_S75_R5_avg, 
                                certainty_res = gen_40all_R5_avg$state)

VOI_suppress_40_S75_R5$VOI <- VOI_suppress_40_S75_R5$certainty_res - VOI_suppress_40_S75_R5$uncertainty_res

#--- S25_R75_40---#
gen_40all_R75 <- gen_40all %>% filter(eradication == 0.75)
est_40all_S25_R75 <- rbind(state_truth_S25_R75_40,state_truth_S25_R75_40b)
est_40all_S25_R75 <- est_40all_S25_R75 %>% filter(week == 5 & year == 10)

est_40all_S25_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_40all_S25_R75), 
                                  FUN = mean)

colnames(est_40all_S25_R75_avg)[6] <- 'uncertainty_res'


gen_40all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_40all_R75), 
                               FUN = mean)

VOI_suppress_40_S25_R75 <- cbind(est_40all_S25_R75_avg, 
                                certainty_res = gen_40all_R75_avg$state)

VOI_suppress_40_S25_R75$VOI <- VOI_suppress_40_S25_R75$certainty_res - VOI_suppress_40_S25_R75$uncertainty_res

#--- S5_R75_40---#
gen_40all_R75 <- gen_40all %>% filter(eradication == 0.75)
est_40all_S5_R75 <- rbind(state_truth_S5_R75_40,state_truth_S5_R75_40b)
est_40all_S5_R75 <- est_40all_S5_R75 %>% filter(week == 5 & year == 10)

est_40all_S5_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_40all_S5_R75), 
                                  FUN = mean)

colnames(est_40all_S5_R75_avg)[6] <- 'uncertainty_res'


gen_40all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_40all_R75), 
                               FUN = mean)

VOI_suppress_40_S5_R75 <- cbind(est_40all_S5_R75_avg, 
                                certainty_res = gen_40all_R75_avg$state)

VOI_suppress_40_S5_R75$VOI <- VOI_suppress_40_S5_R75$certainty_res - VOI_suppress_40_S5_R75$uncertainty_res

#--- S75_R75_40---#
est_40all_S75_R75 <- rbind(state_truth_S75_R75_40,state_truth_S75_R75_40b)
est_40all_S75_R75 <- est_40all_S75_R75 %>% filter(week == 5 & year == 10)

est_40all_S75_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                   data = as.data.frame(est_40all_S75_R75), 
                                   FUN = mean)

colnames(est_40all_S75_R75_avg)[6] <- 'uncertainty_res'


VOI_suppress_40_S75_R75 <- cbind(est_40all_S75_R75_avg, 
                                 certainty_res = gen_40all_R75_avg$state)

VOI_suppress_40_S75_R75$VOI <- VOI_suppress_40_S75_R75$certainty_res - VOI_suppress_40_S75_R75$uncertainty_res


VOI_suppress_40 <- rbind(VOI_suppress_40_S25_R5,VOI_suppress_40_S25_R75,
                         VOI_suppress_40_S5_R5, VOI_suppress_40_S75_R5,
                         VOI_suppress_40_S5_R75, VOI_suppress_40_S75_R75)


#-- 60 budget --#
gen_60all <- rbind(state_truth_gen_60, state_truth_gen_60b)
gen_60all <- gen_60all %>% filter(week == 5 & year == 10)

#--- S25_R5_60---#
gen_60all_R5 <- gen_60all %>% filter(eradication == 0.5)
est_60all_S25_R5 <- rbind(state_truth_S25_R5_60,state_truth_S25_R5_60b)
est_60all_S25_R5 <- est_60all_S25_R5 %>% filter(week == 5 & year == 10)

est_60all_S25_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_60all_S25_R5), 
                                 FUN = mean)

colnames(est_60all_S25_R5_avg)[6] <- 'uncertainty_res'


gen_60all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_60all_R5), 
                              FUN = mean)

VOI_suppress_60_S25_R5 <- cbind(est_60all_S25_R5_avg, 
                               certainty_res = gen_60all_R5_avg$state)

VOI_suppress_60_S25_R5$VOI <- VOI_suppress_60_S25_R5$certainty_res - VOI_suppress_60_S25_R5$uncertainty_res

#--- S5_R5_60---#
gen_60all_R5 <- gen_60all %>% filter(eradication == 0.5)
est_60all_S5_R5 <- rbind(state_truth_S5_R5_60,state_truth_S5_R5_60b)
est_60all_S5_R5 <- est_60all_S5_R5 %>% filter(week == 5 & year == 10)

est_60all_S5_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_60all_S5_R5), 
                                 FUN = mean)

colnames(est_60all_S5_R5_avg)[6] <- 'uncertainty_res'


gen_60all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_60all_R5), 
                              FUN = mean)

VOI_suppress_60_S5_R5 <- cbind(est_60all_S5_R5_avg, 
                               certainty_res = gen_60all_R5_avg$state)

VOI_suppress_60_S5_R5$VOI <- VOI_suppress_60_S5_R5$certainty_res - VOI_suppress_60_S5_R5$uncertainty_res

#--- S75_R5_60---#
est_60all_S75_R5 <- rbind(state_truth_S75_R5_60,state_truth_S75_R5_60b)
est_60all_S75_R5 <- est_60all_S75_R5 %>% filter(week == 5 & year == 10)

est_60all_S75_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_60all_S75_R5), 
                                  FUN = mean)

colnames(est_60all_S75_R5_avg)[6] <- 'uncertainty_res'


VOI_suppress_60_S75_R5 <- cbind(est_60all_S75_R5_avg, 
                                certainty_res = gen_60all_R5_avg$state)

VOI_suppress_60_S75_R5$VOI <- VOI_suppress_60_S75_R5$certainty_res - VOI_suppress_60_S75_R5$uncertainty_res

#--- S25_R75_60---#
gen_60all_R75 <- gen_60all %>% filter(eradication == 0.75)
est_60all_S25_R75 <- rbind(state_truth_S25_R75_60,state_truth_S25_R75_60b)
est_60all_S25_R75 <- est_60all_S25_R75 %>% filter(week == 5 & year == 10)

est_60all_S25_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_60all_S25_R75), 
                                  FUN = mean)

colnames(est_60all_S25_R75_avg)[6] <- 'uncertainty_res'


gen_60all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_60all_R75), 
                               FUN = mean)

VOI_suppress_60_S25_R75 <- cbind(est_60all_S25_R75_avg, 
                                certainty_res = gen_60all_R75_avg$state)

VOI_suppress_60_S25_R75$VOI <- VOI_suppress_60_S25_R75$certainty_res - VOI_suppress_60_S25_R75$uncertainty_res

#--- S5_R75_60---#
gen_60all_R75 <- gen_60all %>% filter(eradication == 0.75)
est_60all_S5_R75 <- rbind(state_truth_S5_R75_60,state_truth_S5_R75_60b)
est_60all_S5_R75 <- est_60all_S5_R75 %>% filter(week == 5 & year == 10)

est_60all_S5_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_60all_S5_R75), 
                                  FUN = mean)

colnames(est_60all_S5_R75_avg)[6] <- 'uncertainty_res'


gen_60all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_60all_R75), 
                               FUN = mean)

VOI_suppress_60_S5_R75 <- cbind(est_60all_S5_R75_avg, 
                                certainty_res = gen_60all_R75_avg$state)

VOI_suppress_60_S5_R75$VOI <- VOI_suppress_60_S5_R75$certainty_res - VOI_suppress_60_S5_R75$uncertainty_res

#--- S75_R75_60---#
est_60all_S75_R75 <- rbind(state_truth_S75_R75_60,state_truth_S75_R75_60b)
est_60all_S75_R75 <- est_60all_S75_R75 %>% filter(week == 5 & year == 10)

est_60all_S75_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                   data = as.data.frame(est_60all_S75_R75), 
                                   FUN = mean)

colnames(est_60all_S75_R75_avg)[6] <- 'uncertainty_res'


VOI_suppress_60_S75_R75 <- cbind(est_60all_S75_R75_avg, 
                                 certainty_res = gen_60all_R75_avg$state)

VOI_suppress_60_S75_R75$VOI <- VOI_suppress_60_S75_R75$certainty_res - VOI_suppress_60_S75_R75$uncertainty_res


VOI_suppress_60 <- rbind(VOI_suppress_60_S25_R5,VOI_suppress_60_S25_R75,
                         VOI_suppress_60_S5_R5, VOI_suppress_60_S75_R5,
                         VOI_suppress_60_S5_R75, VOI_suppress_60_S75_R75)

VOI_suppress <- rbind(VOI_suppress_20, VOI_suppress_40, VOI_suppress_60)

##### Contain ####
#-- 20 budget --#
gen_20all <- rbind(state_truth_gen_20, state_truth_gen_20b)
gen_20all <- gen_20all %>% filter(week == 5 & year == 10)

#--- S25_R5_20---#
gen_20all_R5 <- gen_20all %>% filter(eradication == 0.5)
est_20all_S25_R5 <- rbind(state_truth_S25_R5_20,state_truth_S25_R5_20b)
est_20all_S25_R5 <- est_20all_S25_R5 %>% filter(week == 5 & year == 10)

est_20all_S25_R5$state[est_20all_S25_R5$state <= 2] <- 0
est_20all_S25_R5$state[est_20all_S25_R5$state == 3 ] <- 1

est_20all_S25_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_20all_S25_R5), 
                                 FUN = sum)

est_20all_S25_R5_avg$state <- est_20all_S25_R5_avg$state/40

colnames(est_20all_S25_R5_avg)[6] <- 'uncertainty_res'


gen_20all_R5$state[gen_20all_R5$state <= 2] <- 0
gen_20all_R5$state[gen_20all_R5$state == 3 ] <- 1

gen_20all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_20all_R5), 
                              FUN = sum)

gen_20all_R5_avg$state <- gen_20all_R5_avg$state/ 40

VOI_contain_20_S25_R5 <- cbind(est_20all_S25_R5_avg, 
                              certainty_res = gen_20all_R5_avg$state)

VOI_contain_20_S25_R5$VOI <- VOI_contain_20_S25_R5$certainty_res - VOI_contain_20_S25_R5$uncertainty_res

#--- S5_R5_20---#
gen_20all_R5 <- gen_20all %>% filter(eradication == 0.5)
est_20all_S5_R5 <- rbind(state_truth_S5_R5_20,state_truth_S5_R5_20b)
est_20all_S5_R5 <- est_20all_S5_R5 %>% filter(week == 5 & year == 10)

est_20all_S5_R5$state[est_20all_S5_R5$state <= 2] <- 0
est_20all_S5_R5$state[est_20all_S5_R5$state == 3 ] <- 1

est_20all_S5_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_20all_S5_R5), 
                                 FUN = sum)

est_20all_S5_R5_avg$state <- est_20all_S5_R5_avg$state/40

colnames(est_20all_S5_R5_avg)[6] <- 'uncertainty_res'


gen_20all_R5$state[gen_20all_R5$state <= 2] <- 0
gen_20all_R5$state[gen_20all_R5$state == 3 ] <- 1

gen_20all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_20all_R5), 
                              FUN = sum)

gen_20all_R5_avg$state <- gen_20all_R5_avg$state/ 40

VOI_contain_20_S5_R5 <- cbind(est_20all_S5_R5_avg, 
                               certainty_res = gen_20all_R5_avg$state)

VOI_contain_20_S5_R5$VOI <- VOI_contain_20_S5_R5$certainty_res - VOI_contain_20_S5_R5$uncertainty_res

#--- S75_R5_20---#
gen_20all_R5 <- gen_20all %>% filter(eradication == 0.5)
est_20all_S75_R5 <- rbind(state_truth_S75_R5_20,state_truth_S75_R5_20b)
est_20all_S75_R5 <- est_20all_S75_R5 %>% filter(week == 5 & year == 10)

est_20all_S75_R5$state[est_20all_S75_R5$state <= 2] <- 0
est_20all_S75_R5$state[est_20all_S75_R5$state == 3 ] <- 1

est_20all_S75_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_20all_S75_R5), 
                                 FUN = sum)

est_20all_S75_R5_avg$state <- est_20all_S75_R5_avg$state/40

colnames(est_20all_S75_R5_avg)[6] <- 'uncertainty_res'


gen_20all_R5$state[gen_20all_R5$state <= 2] <- 0
gen_20all_R5$state[gen_20all_R5$state == 3 ] <- 1

gen_20all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_20all_R5), 
                              FUN = sum)

gen_20all_R5_avg$state <- gen_20all_R5_avg$state/ 40

VOI_contain_20_S75_R5 <- cbind(est_20all_S75_R5_avg, 
                              certainty_res = gen_20all_R5_avg$state)

VOI_contain_20_S75_R5$VOI <- VOI_contain_20_S75_R5$certainty_res - VOI_contain_20_S75_R5$uncertainty_res

#--- S25_R75_20---#
gen_20all_R75 <- gen_20all %>% filter(eradication == 0.75)
est_20all_S25_R75 <- rbind(state_truth_S25_R75_20,state_truth_S25_R75_20b)
est_20all_S25_R75 <- est_20all_S25_R75 %>% filter(week == 5 & year == 10)

est_20all_S25_R75$state[est_20all_S25_R75$state <= 2] <- 0
est_20all_S25_R75$state[est_20all_S25_R75$state == 3 ] <- 1

est_20all_S25_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_20all_S25_R75), 
                                  FUN = sum)

est_20all_S25_R75_avg$state <- est_20all_S25_R75_avg$state/40

colnames(est_20all_S25_R75_avg)[6] <- 'uncertainty_res'


gen_20all_R75$state[gen_20all_R75$state <= 2] <- 0
gen_20all_R75$state[gen_20all_R75$state == 3 ] <- 1

gen_20all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_20all_R75), 
                               FUN = sum)

gen_20all_R75_avg$state <- gen_20all_R75_avg$state/ 40

VOI_contain_20_S25_R75 <- cbind(est_20all_S25_R75_avg, 
                               certainty_res = gen_20all_R75_avg$state)

VOI_contain_20_S25_R75$VOI <- VOI_contain_20_S25_R75$certainty_res - VOI_contain_20_S25_R75$uncertainty_res

#--- S5_R75_20---#
gen_20all_R75 <- gen_20all %>% filter(eradication == 0.75)
est_20all_S5_R75 <- rbind(state_truth_S5_R75_20,state_truth_S5_R75_20b)
est_20all_S5_R75 <- est_20all_S5_R75 %>% filter(week == 5 & year == 10)

est_20all_S5_R75$state[est_20all_S5_R75$state <= 2] <- 0
est_20all_S5_R75$state[est_20all_S5_R75$state == 3 ] <- 1

est_20all_S5_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_20all_S5_R75), 
                                 FUN = sum)

est_20all_S5_R75_avg$state <- est_20all_S5_R75_avg$state/40

colnames(est_20all_S5_R75_avg)[6] <- 'uncertainty_res'


gen_20all_R75$state[gen_20all_R75$state <= 2] <- 0
gen_20all_R75$state[gen_20all_R75$state == 3 ] <- 1

gen_20all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_20all_R75), 
                              FUN = sum)

gen_20all_R75_avg$state <- gen_20all_R75_avg$state/ 40

VOI_contain_20_S5_R75 <- cbind(est_20all_S5_R75_avg, 
                              certainty_res = gen_20all_R75_avg$state)

VOI_contain_20_S5_R75$VOI <- VOI_contain_20_S5_R75$certainty_res - VOI_contain_20_S5_R75$uncertainty_res

#--- S75_R75_20---#
gen_20all_R75 <- gen_20all %>% filter(eradication == 0.5)
est_20all_S75_R75 <- rbind(state_truth_S75_R75_20,state_truth_S75_R75_20b)
est_20all_S75_R75 <- est_20all_S75_R75 %>% filter(week == 5 & year == 10)

est_20all_S75_R75$state[est_20all_S75_R75$state <= 2] <- 0
est_20all_S75_R75$state[est_20all_S75_R75$state == 3 ] <- 1

est_20all_S75_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_20all_S75_R75), 
                                  FUN = sum)

est_20all_S75_R75_avg$state <- est_20all_S75_R75_avg$state/40

colnames(est_20all_S75_R75_avg)[6] <- 'uncertainty_res'


gen_20all_R75$state[gen_20all_R75$state <= 2] <- 0
gen_20all_R75$state[gen_20all_R75$state == 3 ] <- 1

gen_20all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_20all_R75), 
                              FUN = sum)

gen_20all_R75_avg$state <- gen_20all_R75_avg$state/ 40

VOI_contain_20_S75_R75 <- cbind(est_20all_S75_R75_avg, 
                               certainty_res = gen_20all_R75_avg$state)

VOI_contain_20_S75_R75$VOI <- VOI_contain_20_S75_R75$certainty_res - VOI_contain_20_S75_R75$uncertainty_res

VOI_contain_20 <- rbind(VOI_contain_20_S25_R5,VOI_contain_20_S25_R75,
                        VOI_contain_20_S5_R5, VOI_contain_20_S75_R5,
                         VOI_contain_20_S5_R75, VOI_contain_20_S75_R75)

#-- 40 budget --#
gen_40all <- rbind(state_truth_gen_40, state_truth_gen_40b)
gen_40all <- gen_40all %>% filter(week == 5 & year == 10)

#--- S25_R5_40---#
gen_40all_R5 <- gen_40all %>% filter(eradication == 0.5)
est_40all_S25_R5 <- rbind(state_truth_S25_R5_40,state_truth_S25_R5_40b)
est_40all_S25_R5 <- est_40all_S25_R5 %>% filter(week == 5 & year == 10)

est_40all_S25_R5$state[est_40all_S25_R5$state <= 2] <- 0
est_40all_S25_R5$state[est_40all_S25_R5$state == 3 ] <- 1

est_40all_S25_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_40all_S25_R5), 
                                 FUN = sum)

est_40all_S25_R5_avg$state <- est_40all_S25_R5_avg$state/40

colnames(est_40all_S25_R5_avg)[6] <- 'uncertainty_res'


gen_40all_R5$state[gen_40all_R5$state <= 2] <- 0
gen_40all_R5$state[gen_40all_R5$state == 3 ] <- 1

gen_40all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_40all_R5), 
                              FUN = sum)

gen_40all_R5_avg$state <- gen_40all_R5_avg$state/ 40

VOI_contain_40_S25_R5 <- cbind(est_40all_S25_R5_avg, 
                              certainty_res = gen_40all_R5_avg$state)

VOI_contain_40_S25_R5$VOI <- VOI_contain_40_S25_R5$certainty_res - VOI_contain_40_S25_R5$uncertainty_res

#--- S5_R5_40---#
gen_40all_R5 <- gen_40all %>% filter(eradication == 0.5)
est_40all_S5_R5 <- rbind(state_truth_S5_R5_40,state_truth_S5_R5_40b)
est_40all_S5_R5 <- est_40all_S5_R5 %>% filter(week == 5 & year == 10)

est_40all_S5_R5$state[est_40all_S5_R5$state <= 2] <- 0
est_40all_S5_R5$state[est_40all_S5_R5$state == 3 ] <- 1

est_40all_S5_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_40all_S5_R5), 
                                 FUN = sum)

est_40all_S5_R5_avg$state <- est_40all_S5_R5_avg$state/40

colnames(est_40all_S5_R5_avg)[6] <- 'uncertainty_res'


gen_40all_R5$state[gen_40all_R5$state <= 2] <- 0
gen_40all_R5$state[gen_40all_R5$state == 3 ] <- 1

gen_40all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_40all_R5), 
                              FUN = sum)

gen_40all_R5_avg$state <- gen_40all_R5_avg$state/ 40

VOI_contain_40_S5_R5 <- cbind(est_40all_S5_R5_avg, 
                              certainty_res = gen_40all_R5_avg$state)

VOI_contain_40_S5_R5$VOI <- VOI_contain_40_S5_R5$certainty_res - VOI_contain_40_S5_R5$uncertainty_res

#--- S75_R5_40---#
gen_40all_R5 <- gen_40all %>% filter(eradication == 0.5)
est_40all_S75_R5 <- rbind(state_truth_S75_R5_40,state_truth_S75_R5_40b)
est_40all_S75_R5 <- est_40all_S75_R5 %>% filter(week == 5 & year == 10)

est_40all_S75_R5$state[est_40all_S75_R5$state <= 2] <- 0
est_40all_S75_R5$state[est_40all_S75_R5$state == 3 ] <- 1

est_40all_S75_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_40all_S75_R5), 
                                  FUN = sum)

est_40all_S75_R5_avg$state <- est_40all_S75_R5_avg$state/40

colnames(est_40all_S75_R5_avg)[6] <- 'uncertainty_res'


gen_40all_R5$state[gen_40all_R5$state <= 2] <- 0
gen_40all_R5$state[gen_40all_R5$state == 3 ] <- 1

gen_40all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_40all_R5), 
                              FUN = sum)

gen_40all_R5_avg$state <- gen_40all_R5_avg$state/ 40

VOI_contain_40_S75_R5 <- cbind(est_40all_S75_R5_avg, 
                               certainty_res = gen_40all_R5_avg$state)

VOI_contain_40_S75_R5$VOI <- VOI_contain_40_S75_R5$certainty_res - VOI_contain_40_S75_R5$uncertainty_res

#--- S25_R75_40---#
gen_40all_R75 <- gen_40all %>% filter(eradication == 0.75)
est_40all_S25_R75 <- rbind(state_truth_S25_R75_40,state_truth_S25_R75_40b)
est_40all_S25_R75 <- est_40all_S25_R75 %>% filter(week == 5 & year == 10)

est_40all_S25_R75$state[est_40all_S25_R75$state <= 2] <- 0
est_40all_S25_R75$state[est_40all_S25_R75$state == 3 ] <- 1

est_40all_S25_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_40all_S25_R75), 
                                  FUN = sum)

est_40all_S25_R75_avg$state <- est_40all_S25_R75_avg$state/40

colnames(est_40all_S25_R75_avg)[6] <- 'uncertainty_res'


gen_40all_R75$state[gen_40all_R75$state <= 2] <- 0
gen_40all_R75$state[gen_40all_R75$state == 3 ] <- 1

gen_40all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_40all_R75), 
                               FUN = sum)

gen_40all_R75_avg$state <- gen_40all_R75_avg$state/ 40

VOI_contain_40_S25_R75 <- cbind(est_40all_S25_R75_avg, 
                               certainty_res = gen_40all_R75_avg$state)

VOI_contain_40_S25_R75$VOI <- VOI_contain_40_S25_R75$certainty_res - VOI_contain_40_S25_R75$uncertainty_res

#--- S5_R75_40---#
gen_40all_R75 <- gen_40all %>% filter(eradication == 0.75)
est_40all_S5_R75 <- rbind(state_truth_S5_R75_40,state_truth_S5_R75_40b)
est_40all_S5_R75 <- est_40all_S5_R75 %>% filter(week == 5 & year == 10)

est_40all_S5_R75$state[est_40all_S5_R75$state <= 2] <- 0
est_40all_S5_R75$state[est_40all_S5_R75$state == 3 ] <- 1

est_40all_S5_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_40all_S5_R75), 
                                  FUN = sum)

est_40all_S5_R75_avg$state <- est_40all_S5_R75_avg$state/40

colnames(est_40all_S5_R75_avg)[6] <- 'uncertainty_res'


gen_40all_R75$state[gen_40all_R75$state <= 2] <- 0
gen_40all_R75$state[gen_40all_R75$state == 3 ] <- 1

gen_40all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_40all_R75), 
                               FUN = sum)

gen_40all_R75_avg$state <- gen_40all_R75_avg$state/ 40

VOI_contain_40_S5_R75 <- cbind(est_40all_S5_R75_avg, 
                               certainty_res = gen_40all_R75_avg$state)

VOI_contain_40_S5_R75$VOI <- VOI_contain_40_S5_R75$certainty_res - VOI_contain_40_S5_R75$uncertainty_res

#--- S75_R75_40---#
gen_40all_R75 <- gen_40all %>% filter(eradication == 0.5)
est_40all_S75_R75 <- rbind(state_truth_S75_R75_40,state_truth_S75_R75_40b)
est_40all_S75_R75 <- est_40all_S75_R75 %>% filter(week == 5 & year == 10)

est_40all_S75_R75$state[est_40all_S75_R75$state <= 2] <- 0
est_40all_S75_R75$state[est_40all_S75_R75$state == 3 ] <- 1

est_40all_S75_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                   data = as.data.frame(est_40all_S75_R75), 
                                   FUN = sum)

est_40all_S75_R75_avg$state <- est_40all_S75_R75_avg$state/40

colnames(est_40all_S75_R75_avg)[6] <- 'uncertainty_res'


gen_40all_R75$state[gen_40all_R75$state <= 2] <- 0
gen_40all_R75$state[gen_40all_R75$state == 3 ] <- 1

gen_40all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_40all_R75), 
                               FUN = sum)

gen_40all_R75_avg$state <- gen_40all_R75_avg$state/ 40

VOI_contain_40_S75_R75 <- cbind(est_40all_S75_R75_avg, 
                                certainty_res = gen_40all_R75_avg$state)

VOI_contain_40_S75_R75$VOI <- VOI_contain_40_S75_R75$certainty_res - VOI_contain_40_S75_R75$uncertainty_res

VOI_contain_40<- rbind(VOI_contain_40_S25_R5,VOI_contain_40_S25_R75,
                       VOI_contain_40_S5_R5, VOI_contain_40_S75_R5,
                        VOI_contain_40_S5_R75, VOI_contain_40_S75_R75)

#-- 60 budget --#
gen_60all <- rbind(state_truth_gen_60, state_truth_gen_60b)
gen_60all <- gen_60all %>% filter(week == 5 & year == 10)

#--- S25_R5_60---#
gen_60all_R5 <- gen_60all %>% filter(eradication == 0.5)
est_60all_S25_R5 <- rbind(state_truth_S25_R5_60,state_truth_S25_R5_60b)
est_60all_S25_R5 <- est_60all_S25_R5 %>% filter(week == 5 & year == 10)

est_60all_S25_R5$state[est_60all_S25_R5$state <= 2] <- 0
est_60all_S25_R5$state[est_60all_S25_R5$state == 3 ] <- 1

est_60all_S25_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_60all_S25_R5), 
                                 FUN = sum)

est_60all_S25_R5_avg$state <- est_60all_S25_R5_avg$state/40

colnames(est_60all_S25_R5_avg)[6] <- 'uncertainty_res'


gen_60all_R5$state[gen_60all_R5$state <= 2] <- 0
gen_60all_R5$state[gen_60all_R5$state == 3 ] <- 1

gen_60all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_60all_R5), 
                              FUN = sum)

gen_60all_R5_avg$state <- gen_60all_R5_avg$state/ 40

VOI_contain_60_S25_R5 <- cbind(est_60all_S25_R5_avg, 
                              certainty_res = gen_60all_R5_avg$state)

VOI_contain_60_S25_R5$VOI <- VOI_contain_60_S25_R5$certainty_res - VOI_contain_60_S25_R5$uncertainty_res

#--- S5_R5_60---#
gen_60all_R5 <- gen_60all %>% filter(eradication == 0.5)
est_60all_S5_R5 <- rbind(state_truth_S5_R5_60,state_truth_S5_R5_60b)
est_60all_S5_R5 <- est_60all_S5_R5 %>% filter(week == 5 & year == 10)

est_60all_S5_R5$state[est_60all_S5_R5$state <= 2] <- 0
est_60all_S5_R5$state[est_60all_S5_R5$state == 3 ] <- 1

est_60all_S5_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                 data = as.data.frame(est_60all_S5_R5), 
                                 FUN = sum)

est_60all_S5_R5_avg$state <- est_60all_S5_R5_avg$state/40

colnames(est_60all_S5_R5_avg)[6] <- 'uncertainty_res'


gen_60all_R5$state[gen_60all_R5$state <= 2] <- 0
gen_60all_R5$state[gen_60all_R5$state == 3 ] <- 1

gen_60all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_60all_R5), 
                              FUN = sum)

gen_60all_R5_avg$state <- gen_60all_R5_avg$state/ 40

VOI_contain_60_S5_R5 <- cbind(est_60all_S5_R5_avg, 
                              certainty_res = gen_60all_R5_avg$state)

VOI_contain_60_S5_R5$VOI <- VOI_contain_60_S5_R5$certainty_res - VOI_contain_60_S5_R5$uncertainty_res

#--- S75_R5_60---#
gen_60all_R5 <- gen_60all %>% filter(eradication == 0.5)
est_60all_S75_R5 <- rbind(state_truth_S75_R5_60,state_truth_S75_R5_60b)
est_60all_S75_R5 <- est_60all_S75_R5 %>% filter(week == 5 & year == 10)

est_60all_S75_R5$state[est_60all_S75_R5$state <= 2] <- 0
est_60all_S75_R5$state[est_60all_S75_R5$state == 3 ] <- 1

est_60all_S75_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_60all_S75_R5), 
                                  FUN = sum)

est_60all_S75_R5_avg$state <- est_60all_S75_R5_avg$state/40

colnames(est_60all_S75_R5_avg)[6] <- 'uncertainty_res'


gen_60all_R5$state[gen_60all_R5$state <= 2] <- 0
gen_60all_R5$state[gen_60all_R5$state == 3 ] <- 1

gen_60all_R5_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                              data = as.data.frame(gen_60all_R5), 
                              FUN = sum)

gen_60all_R5_avg$state <- gen_60all_R5_avg$state/ 40

VOI_contain_60_S75_R5 <- cbind(est_60all_S75_R5_avg, 
                               certainty_res = gen_60all_R5_avg$state)

VOI_contain_60_S75_R5$VOI <- VOI_contain_60_S75_R5$certainty_res - VOI_contain_60_S75_R5$uncertainty_res

#--- S25_R75_60---#
gen_60all_R75 <- gen_60all %>% filter(eradication == 0.75)
est_60all_S25_R75 <- rbind(state_truth_S25_R75_60,state_truth_S25_R75_60b)
est_60all_S25_R75 <- est_60all_S25_R75 %>% filter(week == 5 & year == 10)

est_60all_S25_R75$state[est_60all_S25_R75$state <= 2] <- 0
est_60all_S25_R75$state[est_60all_S25_R75$state == 3 ] <- 1

est_60all_S25_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_60all_S25_R75), 
                                  FUN = sum)

est_60all_S25_R75_avg$state <- est_60all_S25_R75_avg$state/40

colnames(est_60all_S25_R75_avg)[6] <- 'uncertainty_res'


gen_60all_R75$state[gen_60all_R75$state <= 2] <- 0
gen_60all_R75$state[gen_60all_R75$state == 3 ] <- 1

gen_60all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_60all_R75), 
                               FUN = sum)

gen_60all_R75_avg$state <- gen_60all_R75_avg$state/ 40

VOI_contain_60_S25_R75 <- cbind(est_60all_S25_R75_avg, 
                               certainty_res = gen_60all_R75_avg$state)

VOI_contain_60_S25_R75$VOI <- VOI_contain_60_S25_R75$certainty_res - VOI_contain_60_S25_R75$uncertainty_res

#--- S5_R75_60---#
gen_60all_R75 <- gen_60all %>% filter(eradication == 0.75)
est_60all_S5_R75 <- rbind(state_truth_S5_R75_60,state_truth_S5_R75_60b)
est_60all_S5_R75 <- est_60all_S5_R75 %>% filter(week == 5 & year == 10)

est_60all_S5_R75$state[est_60all_S5_R75$state <= 2] <- 0
est_60all_S5_R75$state[est_60all_S5_R75$state == 3 ] <- 1

est_60all_S5_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                  data = as.data.frame(est_60all_S5_R75), 
                                  FUN = sum)

est_60all_S5_R75_avg$state <- est_60all_S5_R75_avg$state/40

colnames(est_60all_S5_R75_avg)[6] <- 'uncertainty_res'


gen_60all_R75$state[gen_60all_R75$state <= 2] <- 0
gen_60all_R75$state[gen_60all_R75$state == 3 ] <- 1

gen_60all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_60all_R75), 
                               FUN = sum)

gen_60all_R75_avg$state <- gen_60all_R75_avg$state/ 40

VOI_contain_60_S5_R75 <- cbind(est_60all_S5_R75_avg, 
                               certainty_res = gen_60all_R75_avg$state)

VOI_contain_60_S5_R75$VOI <- VOI_contain_60_S5_R75$certainty_res - VOI_contain_60_S5_R75$uncertainty_res

#--- S75_R75_60---#
gen_60all_R75 <- gen_60all %>% filter(eradication == 0.5)
est_60all_S75_R75 <- rbind(state_truth_S75_R75_60,state_truth_S75_R75_60b)
est_60all_S75_R75 <- est_60all_S75_R75 %>% filter(week == 5 & year == 10)

est_60all_S75_R75$state[est_60all_S75_R75$state <= 2] <- 0
est_60all_S75_R75$state[est_60all_S75_R75$state == 3 ] <- 1

est_60all_S75_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                                   data = as.data.frame(est_60all_S75_R75), 
                                   FUN = sum)

est_60all_S75_R75_avg$state <- est_60all_S75_R75_avg$state/40

colnames(est_60all_S75_R75_avg)[6] <- 'uncertainty_res'


gen_60all_R75$state[gen_60all_R75$state <= 2] <- 0
gen_60all_R75$state[gen_60all_R75$state == 3 ] <- 1

gen_60all_R75_avg <- aggregate(state ~ sim + location + detection + eradication + budget, 
                               data = as.data.frame(gen_60all_R75), 
                               FUN = sum)

gen_60all_R75_avg$state <- gen_60all_R75_avg$state/ 40

VOI_contain_60_S75_R75 <- cbind(est_60all_S75_R75_avg, 
                                certainty_res = gen_60all_R75_avg$state)

VOI_contain_60_S75_R75$VOI <- VOI_contain_60_S75_R75$certainty_res - VOI_contain_60_S75_R75$uncertainty_res


VOI_contain_60<- rbind(VOI_contain_60_S25_R5,VOI_contain_60_S25_R75,
                       VOI_contain_60_S5_R5, VOI_contain_60_S75_R5,
                       VOI_contain_60_S5_R75, VOI_contain_60_S75_R75)

VOI_contain <- rbind(VOI_contain_20, VOI_contain_40, VOI_contain_60)

#### Save CSVs ####
path <- 'E:\\Chapter3\\results\\linear'
file_name = paste(path, 'VOI_suppress.csv',sep = '/')
fwrite(VOI_suppress,file_name)

file_name = paste(path, 'VOI_contain.csv',sep = '/')
fwrite(VOI_contain,file_name)

file_name = paste(path, 'states.csv',sep = '/')
fwrite(states,file_name)

states_fin <- states %>% filter(year == 10)
file_name = paste(path, 'states_fin.csv',sep = '/')
fwrite(states_fin,file_name)

file_name = paste(path, 'states_truth.csv',sep = '/')
fwrite(state_truth_all,file_name)

state_truth_all_fin <- state_truth_all %>% filter(week == 5 & year == 10)
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
                          data = as.data.frame(dist_all), 
                          FUN = sum)

file_name = paste(path, 'dist.csv',sep = '/')
fwrite(dist_traveled,file_name)

file_name = paste(path, 'sites.csv',sep = '/')
fwrite(sites,file_name)
