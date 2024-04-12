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

#### Save CSVs ####
path <- 'E:\\Chapter3\\results\\linear'

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

