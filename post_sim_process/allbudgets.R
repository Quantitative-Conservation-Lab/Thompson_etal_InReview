library(tidyverse)
library(here)
library(plyr)
library(data.table)
library(RColorBrewer) 

#### States truth ####
##### hstatebins #####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20 <- fread(file_name)
state_truth_S25_R5_20 <- data.frame(state_truth_S25_R5_20)[-1]

state_truth_S25_R5_20$location <- 'hstatebins'
state_truth_S25_R5_20$detection <- 0.25
state_truth_S25_R5_20$eradication <- 0.5
state_truth_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20b <- fread(file_name)
state_truth_S25_R5_20b <- data.frame(state_truth_S25_R5_20b)[-1]

state_truth_S25_R5_20b$location <- 'hstatebins'
state_truth_S25_R5_20b$detection <- 0.25
state_truth_S25_R5_20b$eradication <- 0.5
state_truth_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20 <- fread(file_name)
state_truth_S25_R75_20 <- data.frame(state_truth_S25_R75_20)[-1]

state_truth_S25_R75_20$location <- 'hstatebins'
state_truth_S25_R75_20$detection <- 0.25
state_truth_S25_R75_20$eradication <- 0.75
state_truth_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20b <- fread(file_name)
state_truth_S25_R75_20b <- data.frame(state_truth_S25_R75_20b)[-1]

state_truth_S25_R75_20b$location <- 'hstatebins'
state_truth_S25_R75_20b$detection <- 0.25
state_truth_S25_R75_20b$eradication <- 0.75
state_truth_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20 <- fread(file_name)
state_truth_S5_R5_20 <- data.frame(state_truth_S5_R5_20)[-1]

state_truth_S5_R5_20$location <- 'hstatebins'
state_truth_S5_R5_20$detection <- 0.5
state_truth_S5_R5_20$eradication <- 0.5
state_truth_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20b <- fread(file_name)
state_truth_S5_R5_20b <- data.frame(state_truth_S5_R5_20b)[-1]

state_truth_S5_R5_20b$location <- 'hstatebins'
state_truth_S5_R5_20b$detection <- 0.5
state_truth_S5_R5_20b$eradication <- 0.5
state_truth_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20 <- fread(file_name)
state_truth_S5_R75_20 <- data.frame(state_truth_S5_R75_20)[-1]

state_truth_S5_R75_20$location <- 'hstatebins'
state_truth_S5_R75_20$detection <- 0.5
state_truth_S5_R75_20$eradication <- 0.75
state_truth_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20b <- fread(file_name)
state_truth_S5_R75_20b <- data.frame(state_truth_S5_R75_20b)[-1]

state_truth_S5_R75_20b$location <- 'hstatebins'
state_truth_S5_R75_20b$detection <- 0.5
state_truth_S5_R75_20b$eradication <- 0.75
state_truth_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20 <- fread(file_name)
state_truth_S75_R5_20 <- data.frame(state_truth_S75_R5_20)[-1]

state_truth_S75_R5_20$location <- 'hstatebins'
state_truth_S75_R5_20$detection <- 0.75
state_truth_S75_R5_20$eradication <- 0.5
state_truth_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20b <- fread(file_name)
state_truth_S75_R5_20b <- data.frame(state_truth_S75_R5_20b)[-1]

state_truth_S75_R5_20b$location <- 'hstatebins'
state_truth_S75_R5_20b$detection <- 0.75
state_truth_S75_R5_20b$eradication <- 0.5
state_truth_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20 <- fread(file_name)
state_truth_S75_R75_20 <- data.frame(state_truth_S75_R75_20)[-1]

state_truth_S75_R75_20$location <- 'hstatebins'
state_truth_S75_R75_20$detection <- 0.75
state_truth_S75_R75_20$eradication <- 0.75
state_truth_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20b <- fread(file_name)
state_truth_S75_R75_20b <- data.frame(state_truth_S75_R75_20b)[-1]

state_truth_S75_R75_20b$location <- 'hstatebins'
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
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40 <- fread(file_name)
state_truth_S25_R5_40 <- data.frame(state_truth_S25_R5_40)[-1]

state_truth_S25_R5_40$location <- 'hstatebins'
state_truth_S25_R5_40$detection <- 0.25
state_truth_S25_R5_40$eradication <- 0.5
state_truth_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40b <- fread(file_name)
state_truth_S25_R5_40b <- data.frame(state_truth_S25_R5_40b)[-1]

state_truth_S25_R5_40b$location <- 'hstatebins'
state_truth_S25_R5_40b$detection <- 0.25
state_truth_S25_R5_40b$eradication <- 0.5
state_truth_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40 <- fread(file_name)
state_truth_S25_R75_40 <- data.frame(state_truth_S25_R75_40)[-1]

state_truth_S25_R75_40$location <- 'hstatebins'
state_truth_S25_R75_40$detection <- 0.25
state_truth_S25_R75_40$eradication <- 0.75
state_truth_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40b <- fread(file_name)
state_truth_S25_R75_40b <- data.frame(state_truth_S25_R75_40b)[-1]

state_truth_S25_R75_40b$location <- 'hstatebins'
state_truth_S25_R75_40b$detection <- 0.25
state_truth_S25_R75_40b$eradication <- 0.75
state_truth_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40 <- fread(file_name)
state_truth_S5_R5_40 <- data.frame(state_truth_S5_R5_40)[-1]

state_truth_S5_R5_40$location <- 'hstatebins'
state_truth_S5_R5_40$detection <- 0.5
state_truth_S5_R5_40$eradication <- 0.5
state_truth_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40b <- fread(file_name)
state_truth_S5_R5_40b <- data.frame(state_truth_S5_R5_40b)[-1]

state_truth_S5_R5_40b$location <- 'hstatebins'
state_truth_S5_R5_40b$detection <- 0.5
state_truth_S5_R5_40b$eradication <- 0.5
state_truth_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'hstatebins'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'hstatebins'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40 <- fread(file_name)
state_truth_S75_R5_40 <- data.frame(state_truth_S75_R5_40)[-1]

state_truth_S75_R5_40$location <- 'hstatebins'
state_truth_S75_R5_40$detection <- 0.75
state_truth_S75_R5_40$eradication <- 0.5
state_truth_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40b <- fread(file_name)
state_truth_S75_R5_40b <- data.frame(state_truth_S75_R5_40b)[-1]

state_truth_S75_R5_40b$location <- 'hstatebins'
state_truth_S75_R5_40b$detection <- 0.75
state_truth_S75_R5_40b$eradication <- 0.5
state_truth_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40 <- fread(file_name)
state_truth_S75_R75_40 <- data.frame(state_truth_S75_R75_40)[-1]

state_truth_S75_R75_40$location <- 'hstatebins'
state_truth_S75_R75_40$detection <- 0.75
state_truth_S75_R75_40$eradication <- 0.75
state_truth_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40b <- fread(file_name)
state_truth_S75_R75_40b <- data.frame(state_truth_S75_R75_40b)[-1]

state_truth_S75_R75_40b$location <- 'hstatebins'
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
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_60 <- fread(file_name)
state_truth_S25_R5_60 <- data.frame(state_truth_S25_R5_60)[-1]

state_truth_S25_R5_60$location <- 'hstatebins'
state_truth_S25_R5_60$detection <- 0.25
state_truth_S25_R5_60$eradication <- 0.5
state_truth_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_60b <- fread(file_name)
state_truth_S25_R5_60b <- data.frame(state_truth_S25_R5_60b)[-1]

state_truth_S25_R5_60b$location <- 'hstatebins'
state_truth_S25_R5_60b$detection <- 0.25
state_truth_S25_R5_60b$eradication <- 0.5
state_truth_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_60 <- fread(file_name)
state_truth_S25_R75_60 <- data.frame(state_truth_S25_R75_60)[-1]

state_truth_S25_R75_60$location <- 'hstatebins'
state_truth_S25_R75_60$detection <- 0.25
state_truth_S25_R75_60$eradication <- 0.75
state_truth_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_60b <- fread(file_name)
state_truth_S25_R75_60b <- data.frame(state_truth_S25_R75_60b)[-1]

state_truth_S25_R75_60b$location <- 'hstatebins'
state_truth_S25_R75_60b$detection <- 0.25
state_truth_S25_R75_60b$eradication <- 0.75
state_truth_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_60 <- fread(file_name)
state_truth_S5_R5_60 <- data.frame(state_truth_S5_R5_60)[-1]

state_truth_S5_R5_60$location <- 'hstatebins'
state_truth_S5_R5_60$detection <- 0.5
state_truth_S5_R5_60$eradication <- 0.5
state_truth_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_60b <- fread(file_name)
state_truth_S5_R5_60b <- data.frame(state_truth_S5_R5_60b)[-1]

state_truth_S5_R5_60b$location <- 'hstatebins'
state_truth_S5_R5_60b$detection <- 0.5
state_truth_S5_R5_60b$eradication <- 0.5
state_truth_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_60 <- fread(file_name)
state_truth_S5_R75_60 <- data.frame(state_truth_S5_R75_60)[-1]

state_truth_S5_R75_60$location <- 'hstatebins'
state_truth_S5_R75_60$detection <- 0.5
state_truth_S5_R75_60$eradication <- 0.75
state_truth_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_60b <- fread(file_name)
state_truth_S5_R75_60b <- data.frame(state_truth_S5_R75_60b)[-1]

state_truth_S5_R75_60b$location <- 'hstatebins'
state_truth_S5_R75_60b$detection <- 0.5
state_truth_S5_R75_60b$eradication <- 0.75
state_truth_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_60 <- fread(file_name)
state_truth_S75_R5_60 <- data.frame(state_truth_S75_R5_60)[-1]

state_truth_S75_R5_60$location <- 'hstatebins'
state_truth_S75_R5_60$detection <- 0.75
state_truth_S75_R5_60$eradication <- 0.5
state_truth_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_60b <- fread(file_name)
state_truth_S75_R5_60b <- data.frame(state_truth_S75_R5_60b)[-1]

state_truth_S75_R5_60b$location <- 'hstatebins'
state_truth_S75_R5_60b$detection <- 0.75
state_truth_S75_R5_60b$eradication <- 0.5
state_truth_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_60 <- fread(file_name)
state_truth_S75_R75_60 <- data.frame(state_truth_S75_R75_60)[-1]

state_truth_S75_R75_60$location <- 'hstatebins'
state_truth_S75_R75_60$detection <- 0.75
state_truth_S75_R75_60$eradication <- 0.75
state_truth_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_60b <- fread(file_name)
state_truth_S75_R75_60b <- data.frame(state_truth_S75_R75_60b)[-1]

state_truth_S75_R75_60b$location <- 'hstatebins'
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


state_truth_hstatebins <- rbind(state_truth_20, state_truth_40, state_truth_60)

##### linear #####
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


state_truth_linear <- rbind(state_truth_20, state_truth_40, state_truth_60)

##### epicenter #####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20 <- fread(file_name)
state_truth_S25_R5_20 <- data.frame(state_truth_S25_R5_20)[-1]

state_truth_S25_R5_20$location <- 'epicenter'
state_truth_S25_R5_20$detection <- 0.25
state_truth_S25_R5_20$eradication <- 0.5
state_truth_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20b <- fread(file_name)
state_truth_S25_R5_20b <- data.frame(state_truth_S25_R5_20b)[-1]

state_truth_S25_R5_20b$location <- 'epicenter'
state_truth_S25_R5_20b$detection <- 0.25
state_truth_S25_R5_20b$eradication <- 0.5
state_truth_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20 <- fread(file_name)
state_truth_S25_R75_20 <- data.frame(state_truth_S25_R75_20)[-1]

state_truth_S25_R75_20$location <- 'epicenter'
state_truth_S25_R75_20$detection <- 0.25
state_truth_S25_R75_20$eradication <- 0.75
state_truth_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20b <- fread(file_name)
state_truth_S25_R75_20b <- data.frame(state_truth_S25_R75_20b)[-1]

state_truth_S25_R75_20b$location <- 'epicenter'
state_truth_S25_R75_20b$detection <- 0.25
state_truth_S25_R75_20b$eradication <- 0.75
state_truth_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20 <- fread(file_name)
state_truth_S5_R5_20 <- data.frame(state_truth_S5_R5_20)[-1]

state_truth_S5_R5_20$location <- 'epicenter'
state_truth_S5_R5_20$detection <- 0.5
state_truth_S5_R5_20$eradication <- 0.5
state_truth_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20b <- fread(file_name)
state_truth_S5_R5_20b <- data.frame(state_truth_S5_R5_20b)[-1]

state_truth_S5_R5_20b$location <- 'epicenter'
state_truth_S5_R5_20b$detection <- 0.5
state_truth_S5_R5_20b$eradication <- 0.5
state_truth_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20 <- fread(file_name)
state_truth_S5_R75_20 <- data.frame(state_truth_S5_R75_20)[-1]

state_truth_S5_R75_20$location <- 'epicenter'
state_truth_S5_R75_20$detection <- 0.5
state_truth_S5_R75_20$eradication <- 0.75
state_truth_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20b <- fread(file_name)
state_truth_S5_R75_20b <- data.frame(state_truth_S5_R75_20b)[-1]

state_truth_S5_R75_20b$location <- 'epicenter'
state_truth_S5_R75_20b$detection <- 0.5
state_truth_S5_R75_20b$eradication <- 0.75
state_truth_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20 <- fread(file_name)
state_truth_S75_R5_20 <- data.frame(state_truth_S75_R5_20)[-1]

state_truth_S75_R5_20$location <- 'epicenter'
state_truth_S75_R5_20$detection <- 0.75
state_truth_S75_R5_20$eradication <- 0.5
state_truth_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20b <- fread(file_name)
state_truth_S75_R5_20b <- data.frame(state_truth_S75_R5_20b)[-1]

state_truth_S75_R5_20b$location <- 'epicenter'
state_truth_S75_R5_20b$detection <- 0.75
state_truth_S75_R5_20b$eradication <- 0.5
state_truth_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20 <- fread(file_name)
state_truth_S75_R75_20 <- data.frame(state_truth_S75_R75_20)[-1]

state_truth_S75_R75_20$location <- 'epicenter'
state_truth_S75_R75_20$detection <- 0.75
state_truth_S75_R75_20$eradication <- 0.75
state_truth_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20b <- fread(file_name)
state_truth_S75_R75_20b <- data.frame(state_truth_S75_R75_20b)[-1]

state_truth_S75_R75_20b$location <- 'epicenter'
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
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40 <- fread(file_name)
state_truth_S25_R5_40 <- data.frame(state_truth_S25_R5_40)[-1]

state_truth_S25_R5_40$location <- 'epicenter'
state_truth_S25_R5_40$detection <- 0.25
state_truth_S25_R5_40$eradication <- 0.5
state_truth_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_40b <- fread(file_name)
state_truth_S25_R5_40b <- data.frame(state_truth_S25_R5_40b)[-1]

state_truth_S25_R5_40b$location <- 'epicenter'
state_truth_S25_R5_40b$detection <- 0.25
state_truth_S25_R5_40b$eradication <- 0.5
state_truth_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40 <- fread(file_name)
state_truth_S25_R75_40 <- data.frame(state_truth_S25_R75_40)[-1]

state_truth_S25_R75_40$location <- 'epicenter'
state_truth_S25_R75_40$detection <- 0.25
state_truth_S25_R75_40$eradication <- 0.75
state_truth_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_40b <- fread(file_name)
state_truth_S25_R75_40b <- data.frame(state_truth_S25_R75_40b)[-1]

state_truth_S25_R75_40b$location <- 'epicenter'
state_truth_S25_R75_40b$detection <- 0.25
state_truth_S25_R75_40b$eradication <- 0.75
state_truth_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40 <- fread(file_name)
state_truth_S5_R5_40 <- data.frame(state_truth_S5_R5_40)[-1]

state_truth_S5_R5_40$location <- 'epicenter'
state_truth_S5_R5_40$detection <- 0.5
state_truth_S5_R5_40$eradication <- 0.5
state_truth_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_40b <- fread(file_name)
state_truth_S5_R5_40b <- data.frame(state_truth_S5_R5_40b)[-1]

state_truth_S5_R5_40b$location <- 'epicenter'
state_truth_S5_R5_40b$detection <- 0.5
state_truth_S5_R5_40b$eradication <- 0.5
state_truth_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'epicenter'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'epicenter'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40 <- fread(file_name)
state_truth_S75_R5_40 <- data.frame(state_truth_S75_R5_40)[-1]

state_truth_S75_R5_40$location <- 'epicenter'
state_truth_S75_R5_40$detection <- 0.75
state_truth_S75_R5_40$eradication <- 0.5
state_truth_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_40b <- fread(file_name)
state_truth_S75_R5_40b <- data.frame(state_truth_S75_R5_40b)[-1]

state_truth_S75_R5_40b$location <- 'epicenter'
state_truth_S75_R5_40b$detection <- 0.75
state_truth_S75_R5_40b$eradication <- 0.5
state_truth_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40 <- fread(file_name)
state_truth_S75_R75_40 <- data.frame(state_truth_S75_R75_40)[-1]

state_truth_S75_R75_40$location <- 'epicenter'
state_truth_S75_R75_40$detection <- 0.75
state_truth_S75_R75_40$eradication <- 0.75
state_truth_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_40b <- fread(file_name)
state_truth_S75_R75_40b <- data.frame(state_truth_S75_R75_40b)[-1]

state_truth_S75_R75_40b$location <- 'epicenter'
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
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_60 <- fread(file_name)
state_truth_S25_R5_60 <- data.frame(state_truth_S25_R5_60)[-1]

state_truth_S25_R5_60$location <- 'epicenter'
state_truth_S25_R5_60$detection <- 0.25
state_truth_S25_R5_60$eradication <- 0.5
state_truth_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_60b <- fread(file_name)
state_truth_S25_R5_60b <- data.frame(state_truth_S25_R5_60b)[-1]

state_truth_S25_R5_60b$location <- 'epicenter'
state_truth_S25_R5_60b$detection <- 0.25
state_truth_S25_R5_60b$eradication <- 0.5
state_truth_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_60 <- fread(file_name)
state_truth_S25_R75_60 <- data.frame(state_truth_S25_R75_60)[-1]

state_truth_S25_R75_60$location <- 'epicenter'
state_truth_S25_R75_60$detection <- 0.25
state_truth_S25_R75_60$eradication <- 0.75
state_truth_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_60b <- fread(file_name)
state_truth_S25_R75_60b <- data.frame(state_truth_S25_R75_60b)[-1]

state_truth_S25_R75_60b$location <- 'epicenter'
state_truth_S25_R75_60b$detection <- 0.25
state_truth_S25_R75_60b$eradication <- 0.75
state_truth_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_60 <- fread(file_name)
state_truth_S5_R5_60 <- data.frame(state_truth_S5_R5_60)[-1]

state_truth_S5_R5_60$location <- 'epicenter'
state_truth_S5_R5_60$detection <- 0.5
state_truth_S5_R5_60$eradication <- 0.5
state_truth_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_60b <- fread(file_name)
state_truth_S5_R5_60b <- data.frame(state_truth_S5_R5_60b)[-1]

state_truth_S5_R5_60b$location <- 'epicenter'
state_truth_S5_R5_60b$detection <- 0.5
state_truth_S5_R5_60b$eradication <- 0.5
state_truth_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_60 <- fread(file_name)
state_truth_S5_R75_60 <- data.frame(state_truth_S5_R75_60)[-1]

state_truth_S5_R75_60$location <- 'epicenter'
state_truth_S5_R75_60$detection <- 0.5
state_truth_S5_R75_60$eradication <- 0.75
state_truth_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_60b <- fread(file_name)
state_truth_S5_R75_60b <- data.frame(state_truth_S5_R75_60b)[-1]

state_truth_S5_R75_60b$location <- 'epicenter'
state_truth_S5_R75_60b$detection <- 0.5
state_truth_S5_R75_60b$eradication <- 0.75
state_truth_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_60 <- fread(file_name)
state_truth_S75_R5_60 <- data.frame(state_truth_S75_R5_60)[-1]

state_truth_S75_R5_60$location <- 'epicenter'
state_truth_S75_R5_60$detection <- 0.75
state_truth_S75_R5_60$eradication <- 0.5
state_truth_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_60b <- fread(file_name)
state_truth_S75_R5_60b <- data.frame(state_truth_S75_R5_60b)[-1]

state_truth_S75_R5_60b$location <- 'epicenter'
state_truth_S75_R5_60b$detection <- 0.75
state_truth_S75_R5_60b$eradication <- 0.5
state_truth_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_60 <- fread(file_name)
state_truth_S75_R75_60 <- data.frame(state_truth_S75_R75_60)[-1]

state_truth_S75_R75_60$location <- 'epicenter'
state_truth_S75_R75_60$detection <- 0.75
state_truth_S75_R75_60$eradication <- 0.75
state_truth_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_60b <- fread(file_name)
state_truth_S75_R75_60b <- data.frame(state_truth_S75_R75_60b)[-1]

state_truth_S75_R75_60b$location <- 'epicenter'
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

state_truth_epicenter <- rbind(state_truth_20, state_truth_40, state_truth_60)

#### Combine ####
state_truth <- rbind(state_truth_hstatebins, state_truth_linear, state_truth_epicenter)
finstate_truth <- state_truth %>% filter(week == 5 & year == 7)

##### Suppression ####
finstate_truth$rates <- paste0('(p = )', finstate_truth$detection, ',  \u03F5 = ', finstate_truth$eradication)
finstate_truth$rates2 <- paste0('(', finstate_truth$detection, ', ', finstate_truth$eradication, ")")
finstate_truth$state <- finstate_truth$state - 1
finstate_truth <- aggregate(state ~ sim + location + detection + eradication + budget + rates + rates2, 
                            data = as.data.frame(finstate_truth), 
                            FUN = mean)

colnames(finstate_truth)[5] <- 'Budget'
finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication)



##### Containment ####
fininv_truth <-  state_truth %>% filter(week == 5 & year == 7)

fininv_truth$rates <- paste0('p = ', fininv_truth$detection, ', e = ', fininv_truth$eradication)
fininv_truth$rates2 <- paste0('(', fininv_truth$detection, ', ', fininv_truth$eradication, ")")

fininv_truth$inv <- fininv_truth$state
fininv_truth$inv[fininv_truth$inv <= 2 ] <- 0
fininv_truth$inv[fininv_truth$inv > 2 ] <- 1

fininv_truth <- aggregate(inv ~ sim + location + detection + eradication + budget + rates + rates2, 
                          data = as.data.frame(fininv_truth), 
                          FUN = mean)

fininv_truth$loc2 <- paste0(fininv_truth$location, fininv_truth$detection, fininv_truth$eradication)

colnames(fininv_truth)[c(2,5)] <- c('Location', 'Budget')

#### Correlation ####
cor(fininv_truth$inv, finstate_truth$state)

#### Bias state ####
##### hstatebins ######
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_20 <- fread(file_name)
hsb_biasstate_S25_R5_20 <- data.frame(hsb_biasstate_S25_R5_20)[-1]

hsb_biasstate_S25_R5_20$location <- 'hstatebins'
hsb_biasstate_S25_R5_20$detection <- 0.25
hsb_biasstate_S25_R5_20$eradication <- 0.5
hsb_biasstate_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_20b <- fread(file_name)
hsb_biasstate_S25_R5_20b <- data.frame(hsb_biasstate_S25_R5_20b)[-1]

hsb_biasstate_S25_R5_20b$location <- 'hstatebins'
hsb_biasstate_S25_R5_20b$detection <- 0.25
hsb_biasstate_S25_R5_20b$eradication <- 0.5
hsb_biasstate_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_20 <- fread(file_name)
hsb_biasstate_S25_R75_20 <- data.frame(hsb_biasstate_S25_R75_20)[-1]

hsb_biasstate_S25_R75_20$location <- 'hstatebins'
hsb_biasstate_S25_R75_20$detection <- 0.25
hsb_biasstate_S25_R75_20$eradication <- 0.75
hsb_biasstate_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_20b <- fread(file_name)
hsb_biasstate_S25_R75_20b <- data.frame(hsb_biasstate_S25_R75_20b)[-1]

hsb_biasstate_S25_R75_20b$location <- 'hstatebins'
hsb_biasstate_S25_R75_20b$detection <- 0.25
hsb_biasstate_S25_R75_20b$eradication <- 0.75
hsb_biasstate_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_20 <- fread(file_name)
hsb_biasstate_S5_R5_20 <- data.frame(hsb_biasstate_S5_R5_20)[-1]

hsb_biasstate_S5_R5_20$location <- 'hstatebins'
hsb_biasstate_S5_R5_20$detection <- 0.5
hsb_biasstate_S5_R5_20$eradication <- 0.5
hsb_biasstate_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_20b <- fread(file_name)
hsb_biasstate_S5_R5_20b <- data.frame(hsb_biasstate_S5_R5_20b)[-1]

hsb_biasstate_S5_R5_20b$location <- 'hstatebins'
hsb_biasstate_S5_R5_20b$detection <- 0.5
hsb_biasstate_S5_R5_20b$eradication <- 0.5
hsb_biasstate_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_20 <- fread(file_name)
hsb_biasstate_S5_R75_20 <- data.frame(hsb_biasstate_S5_R75_20)[-1]

hsb_biasstate_S5_R75_20$location <- 'hstatebins'
hsb_biasstate_S5_R75_20$detection <- 0.5
hsb_biasstate_S5_R75_20$eradication <- 0.75
hsb_biasstate_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_20b <- fread(file_name)
hsb_biasstate_S5_R75_20b <- data.frame(hsb_biasstate_S5_R75_20b)[-1]

hsb_biasstate_S5_R75_20b$location <- 'hstatebins'
hsb_biasstate_S5_R75_20b$detection <- 0.5
hsb_biasstate_S5_R75_20b$eradication <- 0.75
hsb_biasstate_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_20 <- fread(file_name)
hsb_biasstate_S75_R5_20 <- data.frame(hsb_biasstate_S75_R5_20)[-1]

hsb_biasstate_S75_R5_20$location <- 'hstatebins'
hsb_biasstate_S75_R5_20$detection <- 0.75
hsb_biasstate_S75_R5_20$eradication <- 0.5
hsb_biasstate_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_20b <- fread(file_name)
hsb_biasstate_S75_R5_20b <- data.frame(hsb_biasstate_S75_R5_20b)[-1]

hsb_biasstate_S75_R5_20b$location <- 'hstatebins'
hsb_biasstate_S75_R5_20b$detection <- 0.75
hsb_biasstate_S75_R5_20b$eradication <- 0.5
hsb_biasstate_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_20 <- fread(file_name)
hsb_biasstate_S75_R75_20 <- data.frame(hsb_biasstate_S75_R75_20)[-1]

hsb_biasstate_S75_R75_20$location <- 'hstatebins'
hsb_biasstate_S75_R75_20$detection <- 0.75
hsb_biasstate_S75_R75_20$eradication <- 0.75
hsb_biasstate_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_20b <- fread(file_name)
hsb_biasstate_S75_R75_20b <- data.frame(hsb_biasstate_S75_R75_20b)[-1]

hsb_biasstate_S75_R75_20b$location <- 'hstatebins'
hsb_biasstate_S75_R75_20b$detection <- 0.75
hsb_biasstate_S75_R75_20b$eradication <- 0.75
hsb_biasstate_S75_R75_20b$budget <- 20

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_40 <- fread(file_name)
hsb_biasstate_S25_R5_40 <- data.frame(hsb_biasstate_S25_R5_40)[-1]

hsb_biasstate_S25_R5_40$location <- 'hstatebins'
hsb_biasstate_S25_R5_40$detection <- 0.25
hsb_biasstate_S25_R5_40$eradication <- 0.5
hsb_biasstate_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_40b <- fread(file_name)
hsb_biasstate_S25_R5_40b <- data.frame(hsb_biasstate_S25_R5_40b)[-1]

hsb_biasstate_S25_R5_40b$location <- 'hstatebins'
hsb_biasstate_S25_R5_40b$detection <- 0.25
hsb_biasstate_S25_R5_40b$eradication <- 0.5
hsb_biasstate_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_40 <- fread(file_name)
hsb_biasstate_S25_R75_40 <- data.frame(hsb_biasstate_S25_R75_40)[-1]

hsb_biasstate_S25_R75_40$location <- 'hstatebins'
hsb_biasstate_S25_R75_40$detection <- 0.25
hsb_biasstate_S25_R75_40$eradication <- 0.75
hsb_biasstate_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_40b <- fread(file_name)
hsb_biasstate_S25_R75_40b <- data.frame(hsb_biasstate_S25_R75_40b)[-1]

hsb_biasstate_S25_R75_40b$location <- 'hstatebins'
hsb_biasstate_S25_R75_40b$detection <- 0.25
hsb_biasstate_S25_R75_40b$eradication <- 0.75
hsb_biasstate_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_40 <- fread(file_name)
hsb_biasstate_S5_R5_40 <- data.frame(hsb_biasstate_S5_R5_40)[-1]

hsb_biasstate_S5_R5_40$location <- 'hstatebins'
hsb_biasstate_S5_R5_40$detection <- 0.5
hsb_biasstate_S5_R5_40$eradication <- 0.5
hsb_biasstate_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_40b <- fread(file_name)
hsb_biasstate_S5_R5_40b <- data.frame(hsb_biasstate_S5_R5_40b)[-1]

hsb_biasstate_S5_R5_40b$location <- 'hstatebins'
hsb_biasstate_S5_R5_40b$detection <- 0.5
hsb_biasstate_S5_R5_40b$eradication <- 0.5
hsb_biasstate_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_40 <- fread(file_name)
hsb_biasstate_S5_R75_40 <- data.frame(hsb_biasstate_S5_R75_40)[-1]

hsb_biasstate_S5_R75_40$location <- 'hstatebins'
hsb_biasstate_S5_R75_40$detection <- 0.5
hsb_biasstate_S5_R75_40$eradication <- 0.75
hsb_biasstate_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_40b <- fread(file_name)
hsb_biasstate_S5_R75_40b <- data.frame(hsb_biasstate_S5_R75_40b)[-1]

hsb_biasstate_S5_R75_40b$location <- 'hstatebins'
hsb_biasstate_S5_R75_40b$detection <- 0.5
hsb_biasstate_S5_R75_40b$eradication <- 0.75
hsb_biasstate_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_40 <- fread(file_name)
hsb_biasstate_S75_R5_40 <- data.frame(hsb_biasstate_S75_R5_40)[-1]

hsb_biasstate_S75_R5_40$location <- 'hstatebins'
hsb_biasstate_S75_R5_40$detection <- 0.75
hsb_biasstate_S75_R5_40$eradication <- 0.5
hsb_biasstate_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_40b <- fread(file_name)
hsb_biasstate_S75_R5_40b <- data.frame(hsb_biasstate_S75_R5_40b)[-1]

hsb_biasstate_S75_R5_40b$location <- 'hstatebins'
hsb_biasstate_S75_R5_40b$detection <- 0.75
hsb_biasstate_S75_R5_40b$eradication <- 0.5
hsb_biasstate_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_40 <- fread(file_name)
hsb_biasstate_S75_R75_40 <- data.frame(hsb_biasstate_S75_R75_40)[-1]

hsb_biasstate_S75_R75_40$location <- 'hstatebins'
hsb_biasstate_S75_R75_40$detection <- 0.75
hsb_biasstate_S75_R75_40$eradication <- 0.75
hsb_biasstate_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_40b <- fread(file_name)
hsb_biasstate_S75_R75_40b <- data.frame(hsb_biasstate_S75_R75_40b)[-1]

hsb_biasstate_S75_R75_40b$location <- 'hstatebins'
hsb_biasstate_S75_R75_40b$detection <- 0.75
hsb_biasstate_S75_R75_40b$eradication <- 0.75
hsb_biasstate_S75_R75_40b$budget <- 40

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_60 <- fread(file_name)
hsb_biasstate_S25_R5_60 <- data.frame(hsb_biasstate_S25_R5_60)[-1]

hsb_biasstate_S25_R5_60$location <- 'hstatebins'
hsb_biasstate_S25_R5_60$detection <- 0.25
hsb_biasstate_S25_R5_60$eradication <- 0.5
hsb_biasstate_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R5_60b <- fread(file_name)
hsb_biasstate_S25_R5_60b <- data.frame(hsb_biasstate_S25_R5_60b)[-1]

hsb_biasstate_S25_R5_60b$location <- 'hstatebins'
hsb_biasstate_S25_R5_60b$detection <- 0.25
hsb_biasstate_S25_R5_60b$eradication <- 0.5
hsb_biasstate_S25_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_60 <- fread(file_name)
hsb_biasstate_S25_R75_60 <- data.frame(hsb_biasstate_S25_R75_60)[-1]

hsb_biasstate_S25_R75_60$location <- 'hstatebins'
hsb_biasstate_S25_R75_60$detection <- 0.25
hsb_biasstate_S25_R75_60$eradication <- 0.75
hsb_biasstate_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S25_R75_60b <- fread(file_name)
hsb_biasstate_S25_R75_60b <- data.frame(hsb_biasstate_S25_R75_60b)[-1]

hsb_biasstate_S25_R75_60b$location <- 'hstatebins'
hsb_biasstate_S25_R75_60b$detection <- 0.25
hsb_biasstate_S25_R75_60b$eradication <- 0.75
hsb_biasstate_S25_R75_60b$budget <- 60

##
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_60 <- fread(file_name)
hsb_biasstate_S5_R5_60 <- data.frame(hsb_biasstate_S5_R5_60)[-1]

hsb_biasstate_S5_R5_60$location <- 'hstatebins'
hsb_biasstate_S5_R5_60$detection <- 0.5
hsb_biasstate_S5_R5_60$eradication <- 0.5
hsb_biasstate_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R5_60b <- fread(file_name)
hsb_biasstate_S5_R5_60b <- data.frame(hsb_biasstate_S5_R5_60b)[-1]

hsb_biasstate_S5_R5_60b$location <- 'hstatebins'
hsb_biasstate_S5_R5_60b$detection <- 0.5
hsb_biasstate_S5_R5_60b$eradication <- 0.5
hsb_biasstate_S5_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_60 <- fread(file_name)
hsb_biasstate_S5_R75_60 <- data.frame(hsb_biasstate_S5_R75_60)[-1]

hsb_biasstate_S5_R75_60$location <- 'hstatebins'
hsb_biasstate_S5_R75_60$detection <- 0.5
hsb_biasstate_S5_R75_60$eradication <- 0.75
hsb_biasstate_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S5_R75_60b <- fread(file_name)
hsb_biasstate_S5_R75_60b <- data.frame(hsb_biasstate_S5_R75_60b)[-1]

hsb_biasstate_S5_R75_60b$location <- 'hstatebins'
hsb_biasstate_S5_R75_60b$detection <- 0.5
hsb_biasstate_S5_R75_60b$eradication <- 0.75
hsb_biasstate_S5_R75_60b$budget <- 60
##
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_60 <- fread(file_name)
hsb_biasstate_S75_R5_60 <- data.frame(hsb_biasstate_S75_R5_60)[-1]

hsb_biasstate_S75_R5_60$location <- 'hstatebins'
hsb_biasstate_S75_R5_60$detection <- 0.75
hsb_biasstate_S75_R5_60$eradication <- 0.5
hsb_biasstate_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R5_60b <- fread(file_name)
hsb_biasstate_S75_R5_60b <- data.frame(hsb_biasstate_S75_R5_60b)[-1]

hsb_biasstate_S75_R5_60b$location <- 'hstatebins'
hsb_biasstate_S75_R5_60b$detection <- 0.75
hsb_biasstate_S75_R5_60b$eradication <- 0.5
hsb_biasstate_S75_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_60 <- fread(file_name)
hsb_biasstate_S75_R75_60 <- data.frame(hsb_biasstate_S75_R75_60)[-1]

hsb_biasstate_S75_R75_60$location <- 'hstatebins'
hsb_biasstate_S75_R75_60$detection <- 0.75
hsb_biasstate_S75_R75_60$eradication <- 0.75
hsb_biasstate_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
hsb_biasstate_S75_R75_60b <- fread(file_name)
hsb_biasstate_S75_R75_60b <- data.frame(hsb_biasstate_S75_R75_60b)[-1]

hsb_biasstate_S75_R75_60b$location <- 'hstatebins'
hsb_biasstate_S75_R75_60b$detection <- 0.75
hsb_biasstate_S75_R75_60b$eradication <- 0.75
hsb_biasstate_S75_R75_60b$budget <- 60

##### linear #####
#----- linear -----#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_20 <- fread(file_name)
linear_biasstate_S25_R5_20 <- data.frame(linear_biasstate_S25_R5_20)[-1]

linear_biasstate_S25_R5_20$location <- 'linear'
linear_biasstate_S25_R5_20$detection <- 0.25
linear_biasstate_S25_R5_20$eradication <- 0.5
linear_biasstate_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_20b <- fread(file_name)
linear_biasstate_S25_R5_20b <- data.frame(linear_biasstate_S25_R5_20b)[-1]

linear_biasstate_S25_R5_20b$location <- 'linear'
linear_biasstate_S25_R5_20b$detection <- 0.25
linear_biasstate_S25_R5_20b$eradication <- 0.5
linear_biasstate_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_20 <- fread(file_name)
linear_biasstate_S25_R75_20 <- data.frame(linear_biasstate_S25_R75_20)[-1]

linear_biasstate_S25_R75_20$location <- 'linear'
linear_biasstate_S25_R75_20$detection <- 0.25
linear_biasstate_S25_R75_20$eradication <- 0.75
linear_biasstate_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_20b <- fread(file_name)
linear_biasstate_S25_R75_20b <- data.frame(linear_biasstate_S25_R75_20b)[-1]

linear_biasstate_S25_R75_20b$location <- 'linear'
linear_biasstate_S25_R75_20b$detection <- 0.25
linear_biasstate_S25_R75_20b$eradication <- 0.75
linear_biasstate_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_20 <- fread(file_name)
linear_biasstate_S5_R5_20 <- data.frame(linear_biasstate_S5_R5_20)[-1]

linear_biasstate_S5_R5_20$location <- 'linear'
linear_biasstate_S5_R5_20$detection <- 0.5
linear_biasstate_S5_R5_20$eradication <- 0.5
linear_biasstate_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_20b <- fread(file_name)
linear_biasstate_S5_R5_20b <- data.frame(linear_biasstate_S5_R5_20b)[-1]

linear_biasstate_S5_R5_20b$location <- 'linear'
linear_biasstate_S5_R5_20b$detection <- 0.5
linear_biasstate_S5_R5_20b$eradication <- 0.5
linear_biasstate_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_20 <- fread(file_name)
linear_biasstate_S5_R75_20 <- data.frame(linear_biasstate_S5_R75_20)[-1]

linear_biasstate_S5_R75_20$location <- 'linear'
linear_biasstate_S5_R75_20$detection <- 0.5
linear_biasstate_S5_R75_20$eradication <- 0.75
linear_biasstate_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_20b <- fread(file_name)
linear_biasstate_S5_R75_20b <- data.frame(linear_biasstate_S5_R75_20b)[-1]

linear_biasstate_S5_R75_20b$location <- 'linear'
linear_biasstate_S5_R75_20b$detection <- 0.5
linear_biasstate_S5_R75_20b$eradication <- 0.75
linear_biasstate_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_20 <- fread(file_name)
linear_biasstate_S75_R5_20 <- data.frame(linear_biasstate_S75_R5_20)[-1]

linear_biasstate_S75_R5_20$location <- 'linear'
linear_biasstate_S75_R5_20$detection <- 0.75
linear_biasstate_S75_R5_20$eradication <- 0.5
linear_biasstate_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_20b <- fread(file_name)
linear_biasstate_S75_R5_20b <- data.frame(linear_biasstate_S75_R5_20b)[-1]

linear_biasstate_S75_R5_20b$location <- 'linear'
linear_biasstate_S75_R5_20b$detection <- 0.75
linear_biasstate_S75_R5_20b$eradication <- 0.5
linear_biasstate_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_20 <- fread(file_name)
linear_biasstate_S75_R75_20 <- data.frame(linear_biasstate_S75_R75_20)[-1]

linear_biasstate_S75_R75_20$location <- 'linear'
linear_biasstate_S75_R75_20$detection <- 0.75
linear_biasstate_S75_R75_20$eradication <- 0.75
linear_biasstate_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_20b <- fread(file_name)
linear_biasstate_S75_R75_20b <- data.frame(linear_biasstate_S75_R75_20b)[-1]

linear_biasstate_S75_R75_20b$location <- 'linear'
linear_biasstate_S75_R75_20b$detection <- 0.75
linear_biasstate_S75_R75_20b$eradication <- 0.75
linear_biasstate_S75_R75_20b$budget <- 20

#----- linear -----#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_40 <- fread(file_name)
linear_biasstate_S25_R5_40 <- data.frame(linear_biasstate_S25_R5_40)[-1]

linear_biasstate_S25_R5_40$location <- 'linear'
linear_biasstate_S25_R5_40$detection <- 0.25
linear_biasstate_S25_R5_40$eradication <- 0.5
linear_biasstate_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_40b <- fread(file_name)
linear_biasstate_S25_R5_40b <- data.frame(linear_biasstate_S25_R5_40b)[-1]

linear_biasstate_S25_R5_40b$location <- 'linear'
linear_biasstate_S25_R5_40b$detection <- 0.25
linear_biasstate_S25_R5_40b$eradication <- 0.5
linear_biasstate_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_40 <- fread(file_name)
linear_biasstate_S25_R75_40 <- data.frame(linear_biasstate_S25_R75_40)[-1]

linear_biasstate_S25_R75_40$location <- 'linear'
linear_biasstate_S25_R75_40$detection <- 0.25
linear_biasstate_S25_R75_40$eradication <- 0.75
linear_biasstate_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_40b <- fread(file_name)
linear_biasstate_S25_R75_40b <- data.frame(linear_biasstate_S25_R75_40b)[-1]

linear_biasstate_S25_R75_40b$location <- 'linear'
linear_biasstate_S25_R75_40b$detection <- 0.25
linear_biasstate_S25_R75_40b$eradication <- 0.75
linear_biasstate_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_40 <- fread(file_name)
linear_biasstate_S5_R5_40 <- data.frame(linear_biasstate_S5_R5_40)[-1]

linear_biasstate_S5_R5_40$location <- 'linear'
linear_biasstate_S5_R5_40$detection <- 0.5
linear_biasstate_S5_R5_40$eradication <- 0.5
linear_biasstate_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_40b <- fread(file_name)
linear_biasstate_S5_R5_40b <- data.frame(linear_biasstate_S5_R5_40b)[-1]

linear_biasstate_S5_R5_40b$location <- 'linear'
linear_biasstate_S5_R5_40b$detection <- 0.5
linear_biasstate_S5_R5_40b$eradication <- 0.5
linear_biasstate_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_40 <- fread(file_name)
linear_biasstate_S5_R75_40 <- data.frame(linear_biasstate_S5_R75_40)[-1]

linear_biasstate_S5_R75_40$location <- 'linear'
linear_biasstate_S5_R75_40$detection <- 0.5
linear_biasstate_S5_R75_40$eradication <- 0.75
linear_biasstate_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_40b <- fread(file_name)
linear_biasstate_S5_R75_40b <- data.frame(linear_biasstate_S5_R75_40b)[-1]

linear_biasstate_S5_R75_40b$location <- 'linear'
linear_biasstate_S5_R75_40b$detection <- 0.5
linear_biasstate_S5_R75_40b$eradication <- 0.75
linear_biasstate_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_40 <- fread(file_name)
linear_biasstate_S75_R5_40 <- data.frame(linear_biasstate_S75_R5_40)[-1]

linear_biasstate_S75_R5_40$location <- 'linear'
linear_biasstate_S75_R5_40$detection <- 0.75
linear_biasstate_S75_R5_40$eradication <- 0.5
linear_biasstate_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_40b <- fread(file_name)
linear_biasstate_S75_R5_40b <- data.frame(linear_biasstate_S75_R5_40b)[-1]

linear_biasstate_S75_R5_40b$location <- 'linear'
linear_biasstate_S75_R5_40b$detection <- 0.75
linear_biasstate_S75_R5_40b$eradication <- 0.5
linear_biasstate_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_40 <- fread(file_name)
linear_biasstate_S75_R75_40 <- data.frame(linear_biasstate_S75_R75_40)[-1]

linear_biasstate_S75_R75_40$location <- 'linear'
linear_biasstate_S75_R75_40$detection <- 0.75
linear_biasstate_S75_R75_40$eradication <- 0.75
linear_biasstate_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_40b <- fread(file_name)
linear_biasstate_S75_R75_40b <- data.frame(linear_biasstate_S75_R75_40b)[-1]

linear_biasstate_S75_R75_40b$location <- 'linear'
linear_biasstate_S75_R75_40b$detection <- 0.75
linear_biasstate_S75_R75_40b$eradication <- 0.75
linear_biasstate_S75_R75_40b$budget <- 40

#----- linear -----#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_60 <- fread(file_name)
linear_biasstate_S25_R5_60 <- data.frame(linear_biasstate_S25_R5_60)[-1]

linear_biasstate_S25_R5_60$location <- 'linear'
linear_biasstate_S25_R5_60$detection <- 0.25
linear_biasstate_S25_R5_60$eradication <- 0.5
linear_biasstate_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R5_60b <- fread(file_name)
linear_biasstate_S25_R5_60b <- data.frame(linear_biasstate_S25_R5_60b)[-1]

linear_biasstate_S25_R5_60b$location <- 'linear'
linear_biasstate_S25_R5_60b$detection <- 0.25
linear_biasstate_S25_R5_60b$eradication <- 0.5
linear_biasstate_S25_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_60 <- fread(file_name)
linear_biasstate_S25_R75_60 <- data.frame(linear_biasstate_S25_R75_60)[-1]

linear_biasstate_S25_R75_60$location <- 'linear'
linear_biasstate_S25_R75_60$detection <- 0.25
linear_biasstate_S25_R75_60$eradication <- 0.75
linear_biasstate_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S25_R75_60b <- fread(file_name)
linear_biasstate_S25_R75_60b <- data.frame(linear_biasstate_S25_R75_60b)[-1]

linear_biasstate_S25_R75_60b$location <- 'linear'
linear_biasstate_S25_R75_60b$detection <- 0.25
linear_biasstate_S25_R75_60b$eradication <- 0.75
linear_biasstate_S25_R75_60b$budget <- 60

##
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_60 <- fread(file_name)
linear_biasstate_S5_R5_60 <- data.frame(linear_biasstate_S5_R5_60)[-1]

linear_biasstate_S5_R5_60$location <- 'linear'
linear_biasstate_S5_R5_60$detection <- 0.5
linear_biasstate_S5_R5_60$eradication <- 0.5
linear_biasstate_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R5_60b <- fread(file_name)
linear_biasstate_S5_R5_60b <- data.frame(linear_biasstate_S5_R5_60b)[-1]

linear_biasstate_S5_R5_60b$location <- 'linear'
linear_biasstate_S5_R5_60b$detection <- 0.5
linear_biasstate_S5_R5_60b$eradication <- 0.5
linear_biasstate_S5_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_60 <- fread(file_name)
linear_biasstate_S5_R75_60 <- data.frame(linear_biasstate_S5_R75_60)[-1]

linear_biasstate_S5_R75_60$location <- 'linear'
linear_biasstate_S5_R75_60$detection <- 0.5
linear_biasstate_S5_R75_60$eradication <- 0.75
linear_biasstate_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S5_R75_60b <- fread(file_name)
linear_biasstate_S5_R75_60b <- data.frame(linear_biasstate_S5_R75_60b)[-1]

linear_biasstate_S5_R75_60b$location <- 'linear'
linear_biasstate_S5_R75_60b$detection <- 0.5
linear_biasstate_S5_R75_60b$eradication <- 0.75
linear_biasstate_S5_R75_60b$budget <- 60
##
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_60 <- fread(file_name)
linear_biasstate_S75_R5_60 <- data.frame(linear_biasstate_S75_R5_60)[-1]

linear_biasstate_S75_R5_60$location <- 'linear'
linear_biasstate_S75_R5_60$detection <- 0.75
linear_biasstate_S75_R5_60$eradication <- 0.5
linear_biasstate_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R5_60b <- fread(file_name)
linear_biasstate_S75_R5_60b <- data.frame(linear_biasstate_S75_R5_60b)[-1]

linear_biasstate_S75_R5_60b$location <- 'linear'
linear_biasstate_S75_R5_60b$detection <- 0.75
linear_biasstate_S75_R5_60b$eradication <- 0.5
linear_biasstate_S75_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_60 <- fread(file_name)
linear_biasstate_S75_R75_60 <- data.frame(linear_biasstate_S75_R75_60)[-1]

linear_biasstate_S75_R75_60$location <- 'linear'
linear_biasstate_S75_R75_60$detection <- 0.75
linear_biasstate_S75_R75_60$eradication <- 0.75
linear_biasstate_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
linear_biasstate_S75_R75_60b <- fread(file_name)
linear_biasstate_S75_R75_60b <- data.frame(linear_biasstate_S75_R75_60b)[-1]

linear_biasstate_S75_R75_60b$location <- 'linear'
linear_biasstate_S75_R75_60b$detection <- 0.75
linear_biasstate_S75_R75_60b$eradication <- 0.75
linear_biasstate_S75_R75_60b$budget <- 60


##### epicenter #####
#----- epicenter -----#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R5_20 <- fread(file_name)
epicenter_biasstate_S25_R5_20 <- data.frame(epicenter_biasstate_S25_R5_20)[-1]

epicenter_biasstate_S25_R5_20$location <- 'epicenter'
epicenter_biasstate_S25_R5_20$detection <- 0.25
epicenter_biasstate_S25_R5_20$eradication <- 0.5
epicenter_biasstate_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R5_20b <- fread(file_name)
epicenter_biasstate_S25_R5_20b <- data.frame(epicenter_biasstate_S25_R5_20b)[-1]

epicenter_biasstate_S25_R5_20b$location <- 'epicenter'
epicenter_biasstate_S25_R5_20b$detection <- 0.25
epicenter_biasstate_S25_R5_20b$eradication <- 0.5
epicenter_biasstate_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R75_20 <- fread(file_name)
epicenter_biasstate_S25_R75_20 <- data.frame(epicenter_biasstate_S25_R75_20)[-1]

epicenter_biasstate_S25_R75_20$location <- 'epicenter'
epicenter_biasstate_S25_R75_20$detection <- 0.25
epicenter_biasstate_S25_R75_20$eradication <- 0.75
epicenter_biasstate_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R75_20b <- fread(file_name)
epicenter_biasstate_S25_R75_20b <- data.frame(epicenter_biasstate_S25_R75_20b)[-1]

epicenter_biasstate_S25_R75_20b$location <- 'epicenter'
epicenter_biasstate_S25_R75_20b$detection <- 0.25
epicenter_biasstate_S25_R75_20b$eradication <- 0.75
epicenter_biasstate_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R5_20 <- fread(file_name)
epicenter_biasstate_S5_R5_20 <- data.frame(epicenter_biasstate_S5_R5_20)[-1]

epicenter_biasstate_S5_R5_20$location <- 'epicenter'
epicenter_biasstate_S5_R5_20$detection <- 0.5
epicenter_biasstate_S5_R5_20$eradication <- 0.5
epicenter_biasstate_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R5_20b <- fread(file_name)
epicenter_biasstate_S5_R5_20b <- data.frame(epicenter_biasstate_S5_R5_20b)[-1]

epicenter_biasstate_S5_R5_20b$location <- 'epicenter'
epicenter_biasstate_S5_R5_20b$detection <- 0.5
epicenter_biasstate_S5_R5_20b$eradication <- 0.5
epicenter_biasstate_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R75_20 <- fread(file_name)
epicenter_biasstate_S5_R75_20 <- data.frame(epicenter_biasstate_S5_R75_20)[-1]

epicenter_biasstate_S5_R75_20$location <- 'epicenter'
epicenter_biasstate_S5_R75_20$detection <- 0.5
epicenter_biasstate_S5_R75_20$eradication <- 0.75
epicenter_biasstate_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R75_20b <- fread(file_name)
epicenter_biasstate_S5_R75_20b <- data.frame(epicenter_biasstate_S5_R75_20b)[-1]

epicenter_biasstate_S5_R75_20b$location <- 'epicenter'
epicenter_biasstate_S5_R75_20b$detection <- 0.5
epicenter_biasstate_S5_R75_20b$eradication <- 0.75
epicenter_biasstate_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R5_20 <- fread(file_name)
epicenter_biasstate_S75_R5_20 <- data.frame(epicenter_biasstate_S75_R5_20)[-1]

epicenter_biasstate_S75_R5_20$location <- 'epicenter'
epicenter_biasstate_S75_R5_20$detection <- 0.75
epicenter_biasstate_S75_R5_20$eradication <- 0.5
epicenter_biasstate_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R5_20b <- fread(file_name)
epicenter_biasstate_S75_R5_20b <- data.frame(epicenter_biasstate_S75_R5_20b)[-1]

epicenter_biasstate_S75_R5_20b$location <- 'epicenter'
epicenter_biasstate_S75_R5_20b$detection <- 0.75
epicenter_biasstate_S75_R5_20b$eradication <- 0.5
epicenter_biasstate_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R75_20 <- fread(file_name)
epicenter_biasstate_S75_R75_20 <- data.frame(epicenter_biasstate_S75_R75_20)[-1]

epicenter_biasstate_S75_R75_20$location <- 'epicenter'
epicenter_biasstate_S75_R75_20$detection <- 0.75
epicenter_biasstate_S75_R75_20$eradication <- 0.75
epicenter_biasstate_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R75_20b <- fread(file_name)
epicenter_biasstate_S75_R75_20b <- data.frame(epicenter_biasstate_S75_R75_20b)[-1]

epicenter_biasstate_S75_R75_20b$location <- 'epicenter'
epicenter_biasstate_S75_R75_20b$detection <- 0.75
epicenter_biasstate_S75_R75_20b$eradication <- 0.75
epicenter_biasstate_S75_R75_20b$budget <- 20

#----- epicenter -----#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R5_40 <- fread(file_name)
epicenter_biasstate_S25_R5_40 <- data.frame(epicenter_biasstate_S25_R5_40)[-1]

epicenter_biasstate_S25_R5_40$location <- 'epicenter'
epicenter_biasstate_S25_R5_40$detection <- 0.25
epicenter_biasstate_S25_R5_40$eradication <- 0.5
epicenter_biasstate_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R5_40b <- fread(file_name)
epicenter_biasstate_S25_R5_40b <- data.frame(epicenter_biasstate_S25_R5_40b)[-1]

epicenter_biasstate_S25_R5_40b$location <- 'epicenter'
epicenter_biasstate_S25_R5_40b$detection <- 0.25
epicenter_biasstate_S25_R5_40b$eradication <- 0.5
epicenter_biasstate_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R75_40 <- fread(file_name)
epicenter_biasstate_S25_R75_40 <- data.frame(epicenter_biasstate_S25_R75_40)[-1]

epicenter_biasstate_S25_R75_40$location <- 'epicenter'
epicenter_biasstate_S25_R75_40$detection <- 0.25
epicenter_biasstate_S25_R75_40$eradication <- 0.75
epicenter_biasstate_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R75_40b <- fread(file_name)
epicenter_biasstate_S25_R75_40b <- data.frame(epicenter_biasstate_S25_R75_40b)[-1]

epicenter_biasstate_S25_R75_40b$location <- 'epicenter'
epicenter_biasstate_S25_R75_40b$detection <- 0.25
epicenter_biasstate_S25_R75_40b$eradication <- 0.75
epicenter_biasstate_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R5_40 <- fread(file_name)
epicenter_biasstate_S5_R5_40 <- data.frame(epicenter_biasstate_S5_R5_40)[-1]

epicenter_biasstate_S5_R5_40$location <- 'epicenter'
epicenter_biasstate_S5_R5_40$detection <- 0.5
epicenter_biasstate_S5_R5_40$eradication <- 0.5
epicenter_biasstate_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R5_40b <- fread(file_name)
epicenter_biasstate_S5_R5_40b <- data.frame(epicenter_biasstate_S5_R5_40b)[-1]

epicenter_biasstate_S5_R5_40b$location <- 'epicenter'
epicenter_biasstate_S5_R5_40b$detection <- 0.5
epicenter_biasstate_S5_R5_40b$eradication <- 0.5
epicenter_biasstate_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R75_40 <- fread(file_name)
epicenter_biasstate_S5_R75_40 <- data.frame(epicenter_biasstate_S5_R75_40)[-1]

epicenter_biasstate_S5_R75_40$location <- 'epicenter'
epicenter_biasstate_S5_R75_40$detection <- 0.5
epicenter_biasstate_S5_R75_40$eradication <- 0.75
epicenter_biasstate_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R75_40b <- fread(file_name)
epicenter_biasstate_S5_R75_40b <- data.frame(epicenter_biasstate_S5_R75_40b)[-1]

epicenter_biasstate_S5_R75_40b$location <- 'epicenter'
epicenter_biasstate_S5_R75_40b$detection <- 0.5
epicenter_biasstate_S5_R75_40b$eradication <- 0.75
epicenter_biasstate_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R5_40 <- fread(file_name)
epicenter_biasstate_S75_R5_40 <- data.frame(epicenter_biasstate_S75_R5_40)[-1]

epicenter_biasstate_S75_R5_40$location <- 'epicenter'
epicenter_biasstate_S75_R5_40$detection <- 0.75
epicenter_biasstate_S75_R5_40$eradication <- 0.5
epicenter_biasstate_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R5_40b <- fread(file_name)
epicenter_biasstate_S75_R5_40b <- data.frame(epicenter_biasstate_S75_R5_40b)[-1]

epicenter_biasstate_S75_R5_40b$location <- 'epicenter'
epicenter_biasstate_S75_R5_40b$detection <- 0.75
epicenter_biasstate_S75_R5_40b$eradication <- 0.5
epicenter_biasstate_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R75_40 <- fread(file_name)
epicenter_biasstate_S75_R75_40 <- data.frame(epicenter_biasstate_S75_R75_40)[-1]

epicenter_biasstate_S75_R75_40$location <- 'epicenter'
epicenter_biasstate_S75_R75_40$detection <- 0.75
epicenter_biasstate_S75_R75_40$eradication <- 0.75
epicenter_biasstate_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R75_40b <- fread(file_name)
epicenter_biasstate_S75_R75_40b <- data.frame(epicenter_biasstate_S75_R75_40b)[-1]

epicenter_biasstate_S75_R75_40b$location <- 'epicenter'
epicenter_biasstate_S75_R75_40b$detection <- 0.75
epicenter_biasstate_S75_R75_40b$eradication <- 0.75
epicenter_biasstate_S75_R75_40b$budget <- 40


#----- epicenter -----#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R5_60 <- fread(file_name)
epicenter_biasstate_S25_R5_60 <- data.frame(epicenter_biasstate_S25_R5_60)[-1]

epicenter_biasstate_S25_R5_60$location <- 'epicenter'
epicenter_biasstate_S25_R5_60$detection <- 0.25
epicenter_biasstate_S25_R5_60$eradication <- 0.5
epicenter_biasstate_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R5_60b <- fread(file_name)
epicenter_biasstate_S25_R5_60b <- data.frame(epicenter_biasstate_S25_R5_60b)[-1]

epicenter_biasstate_S25_R5_60b$location <- 'epicenter'
epicenter_biasstate_S25_R5_60b$detection <- 0.25
epicenter_biasstate_S25_R5_60b$eradication <- 0.5
epicenter_biasstate_S25_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R75_60 <- fread(file_name)
epicenter_biasstate_S25_R75_60 <- data.frame(epicenter_biasstate_S25_R75_60)[-1]

epicenter_biasstate_S25_R75_60$location <- 'epicenter'
epicenter_biasstate_S25_R75_60$detection <- 0.25
epicenter_biasstate_S25_R75_60$eradication <- 0.75
epicenter_biasstate_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S25_R75_60b <- fread(file_name)
epicenter_biasstate_S25_R75_60b <- data.frame(epicenter_biasstate_S25_R75_60b)[-1]

epicenter_biasstate_S25_R75_60b$location <- 'epicenter'
epicenter_biasstate_S25_R75_60b$detection <- 0.25
epicenter_biasstate_S25_R75_60b$eradication <- 0.75
epicenter_biasstate_S25_R75_60b$budget <- 60

##
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R5_60 <- fread(file_name)
epicenter_biasstate_S5_R5_60 <- data.frame(epicenter_biasstate_S5_R5_60)[-1]

epicenter_biasstate_S5_R5_60$location <- 'epicenter'
epicenter_biasstate_S5_R5_60$detection <- 0.5
epicenter_biasstate_S5_R5_60$eradication <- 0.5
epicenter_biasstate_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R5_60b <- fread(file_name)
epicenter_biasstate_S5_R5_60b <- data.frame(epicenter_biasstate_S5_R5_60b)[-1]

epicenter_biasstate_S5_R5_60b$location <- 'epicenter'
epicenter_biasstate_S5_R5_60b$detection <- 0.5
epicenter_biasstate_S5_R5_60b$eradication <- 0.5
epicenter_biasstate_S5_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R75_60 <- fread(file_name)
epicenter_biasstate_S5_R75_60 <- data.frame(epicenter_biasstate_S5_R75_60)[-1]

epicenter_biasstate_S5_R75_60$location <- 'epicenter'
epicenter_biasstate_S5_R75_60$detection <- 0.5
epicenter_biasstate_S5_R75_60$eradication <- 0.75
epicenter_biasstate_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S5_R75_60b <- fread(file_name)
epicenter_biasstate_S5_R75_60b <- data.frame(epicenter_biasstate_S5_R75_60b)[-1]

epicenter_biasstate_S5_R75_60b$location <- 'epicenter'
epicenter_biasstate_S5_R75_60b$detection <- 0.5
epicenter_biasstate_S5_R75_60b$eradication <- 0.75
epicenter_biasstate_S5_R75_60b$budget <- 60
##
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R5_60 <- fread(file_name)
epicenter_biasstate_S75_R5_60 <- data.frame(epicenter_biasstate_S75_R5_60)[-1]

epicenter_biasstate_S75_R5_60$location <- 'epicenter'
epicenter_biasstate_S75_R5_60$detection <- 0.75
epicenter_biasstate_S75_R5_60$eradication <- 0.5
epicenter_biasstate_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R5_60b <- fread(file_name)
epicenter_biasstate_S75_R5_60b <- data.frame(epicenter_biasstate_S75_R5_60b)[-1]

epicenter_biasstate_S75_R5_60b$location <- 'epicenter'
epicenter_biasstate_S75_R5_60b$detection <- 0.75
epicenter_biasstate_S75_R5_60b$eradication <- 0.5
epicenter_biasstate_S75_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R75_60 <- fread(file_name)
epicenter_biasstate_S75_R75_60 <- data.frame(epicenter_biasstate_S75_R75_60)[-1]

epicenter_biasstate_S75_R75_60$location <- 'epicenter'
epicenter_biasstate_S75_R75_60$detection <- 0.75
epicenter_biasstate_S75_R75_60$eradication <- 0.75
epicenter_biasstate_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epicenter_biasstate_S75_R75_60b <- fread(file_name)
epicenter_biasstate_S75_R75_60b <- data.frame(epicenter_biasstate_S75_R75_60b)[-1]

epicenter_biasstate_S75_R75_60b$location <- 'epicenter'
epicenter_biasstate_S75_R75_60b$detection <- 0.75
epicenter_biasstate_S75_R75_60b$eradication <- 0.75
epicenter_biasstate_S75_R75_60b$budget <- 60

#--- Combine bias_states ---#
bias_state_20 <- rbind(hsb_biasstate_S25_R5_20,hsb_biasstate_S25_R5_20b,
                       hsb_biasstate_S25_R75_20,hsb_biasstate_S25_R75_20b,
                       hsb_biasstate_S5_R5_20,hsb_biasstate_S5_R5_20b,
                       hsb_biasstate_S5_R75_20,hsb_biasstate_S5_R75_20b,
                       hsb_biasstate_S75_R5_20,hsb_biasstate_S75_R5_20b,
                       hsb_biasstate_S75_R75_20,hsb_biasstate_S75_R75_20b,
                       linear_biasstate_S25_R5_20,linear_biasstate_S25_R5_20b,
                       linear_biasstate_S25_R75_20,linear_biasstate_S25_R75_20b,
                       linear_biasstate_S5_R5_20,linear_biasstate_S5_R5_20b,
                       linear_biasstate_S5_R75_20,linear_biasstate_S5_R75_20b,
                       linear_biasstate_S75_R5_20,linear_biasstate_S75_R5_20b,
                       linear_biasstate_S75_R75_20,linear_biasstate_S75_R75_20b,
                       epicenter_biasstate_S25_R5_20,epicenter_biasstate_S25_R5_20b,
                       epicenter_biasstate_S25_R75_20,epicenter_biasstate_S25_R75_20b,
                       epicenter_biasstate_S5_R5_20,epicenter_biasstate_S5_R5_20b,
                       epicenter_biasstate_S5_R75_20,epicenter_biasstate_S5_R75_20b,
                       epicenter_biasstate_S75_R5_20,epicenter_biasstate_S75_R5_20b,
                       epicenter_biasstate_S75_R75_20,epicenter_biasstate_S75_R75_20b)

bias_state_40 <- rbind(hsb_biasstate_S25_R5_40,hsb_biasstate_S25_R5_40b,
                       hsb_biasstate_S25_R75_40,hsb_biasstate_S25_R75_40b,
                       hsb_biasstate_S5_R5_40,hsb_biasstate_S5_R5_40b,
                       hsb_biasstate_S5_R75_40,hsb_biasstate_S5_R75_40b,
                       hsb_biasstate_S75_R5_40,hsb_biasstate_S75_R5_40b,
                       hsb_biasstate_S75_R75_40,hsb_biasstate_S75_R75_40b,
                       linear_biasstate_S25_R5_40,linear_biasstate_S25_R5_40b,
                       linear_biasstate_S25_R75_40,linear_biasstate_S25_R75_40b,
                       linear_biasstate_S5_R5_40,linear_biasstate_S5_R5_40b,
                       linear_biasstate_S5_R75_40,linear_biasstate_S5_R75_40b,
                       linear_biasstate_S75_R5_40,linear_biasstate_S75_R5_40b,
                       linear_biasstate_S75_R75_40,linear_biasstate_S75_R75_40b,
                       epicenter_biasstate_S25_R5_40,epicenter_biasstate_S25_R5_40b,
                       epicenter_biasstate_S25_R75_40,epicenter_biasstate_S25_R75_40b,
                       epicenter_biasstate_S5_R5_40,epicenter_biasstate_S5_R5_40b,
                       epicenter_biasstate_S5_R75_40,epicenter_biasstate_S5_R75_40b,
                       epicenter_biasstate_S75_R5_40,epicenter_biasstate_S75_R5_40b,
                       epicenter_biasstate_S75_R75_40,epicenter_biasstate_S75_R75_40b)

bias_state_60 <- rbind(hsb_biasstate_S25_R5_60,hsb_biasstate_S25_R5_60b,
                       hsb_biasstate_S25_R75_60,hsb_biasstate_S25_R75_60b,
                       hsb_biasstate_S5_R5_60,hsb_biasstate_S5_R5_60b,
                       hsb_biasstate_S5_R75_60,hsb_biasstate_S5_R75_60b,
                       hsb_biasstate_S75_R5_60,hsb_biasstate_S75_R5_60b,
                       hsb_biasstate_S75_R75_60,hsb_biasstate_S75_R75_60b,
                       linear_biasstate_S25_R5_60,linear_biasstate_S25_R5_60b,
                       linear_biasstate_S25_R75_60,linear_biasstate_S25_R75_60b,
                       linear_biasstate_S5_R5_60,linear_biasstate_S5_R5_60b,
                       linear_biasstate_S5_R75_60,linear_biasstate_S5_R75_60b,
                       linear_biasstate_S75_R5_60,linear_biasstate_S75_R5_60b,
                       linear_biasstate_S75_R75_60,linear_biasstate_S75_R75_60b,
                       epicenter_biasstate_S25_R5_60,epicenter_biasstate_S25_R5_60b,
                       epicenter_biasstate_S25_R75_60,epicenter_biasstate_S25_R75_60b,
                       epicenter_biasstate_S5_R5_60,epicenter_biasstate_S5_R5_60b,
                       epicenter_biasstate_S5_R75_60,epicenter_biasstate_S5_R75_60b,
                       epicenter_biasstate_S75_R5_60,epicenter_biasstate_S75_R5_60b,
                       epicenter_biasstate_S75_R75_60,epicenter_biasstate_S75_R75_60b)

#-- Combine Bias --#
bias_state <- rbind(bias_state_20, bias_state_40, bias_state_60)

bias_state$rates <- paste0('(p = )', bias_state$detection, ',  \u03F5 = ', bias_state$eradication)
bias_state$rates2 <- paste0('(', bias_state$detection, ', ', bias_state$eradication, ")")
bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication)

#### Bias params ####
##### hstatebins #####
#-- Budget = 20 --#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_20 <- fread(file_name)
hsb_biasparam_S25_R5_20 <- data.frame(hsb_biasparam_S25_R5_20)[-1]

hsb_biasparam_S25_R5_20$location <- 'hstatebins'
hsb_biasparam_S25_R5_20$detection <- 0.25
hsb_biasparam_S25_R5_20$eradication <- 0.5
hsb_biasparam_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_20b <- fread(file_name)
hsb_biasparam_S25_R5_20b <- data.frame(hsb_biasparam_S25_R5_20b)[-1]

hsb_biasparam_S25_R5_20b$location <- 'hstatebins'
hsb_biasparam_S25_R5_20b$detection <- 0.25
hsb_biasparam_S25_R5_20b$eradication <- 0.5
hsb_biasparam_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_20 <- fread(file_name)
hsb_biasparam_S25_R75_20 <- data.frame(hsb_biasparam_S25_R75_20)[-1]

hsb_biasparam_S25_R75_20$location <- 'hstatebins'
hsb_biasparam_S25_R75_20$detection <- 0.25
hsb_biasparam_S25_R75_20$eradication <- 0.75
hsb_biasparam_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_20b <- fread(file_name)
hsb_biasparam_S25_R75_20b <- data.frame(hsb_biasparam_S25_R75_20b)[-1]

hsb_biasparam_S25_R75_20b$location <- 'hstatebins'
hsb_biasparam_S25_R75_20b$detection <- 0.25
hsb_biasparam_S25_R75_20b$eradication <- 0.75
hsb_biasparam_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_20 <- fread(file_name)
hsb_biasparam_S5_R5_20 <- data.frame(hsb_biasparam_S5_R5_20)[-1]

hsb_biasparam_S5_R5_20$location <- 'hstatebins'
hsb_biasparam_S5_R5_20$detection <- 0.5
hsb_biasparam_S5_R5_20$eradication <- 0.5
hsb_biasparam_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_20b <- fread(file_name)
hsb_biasparam_S5_R5_20b <- data.frame(hsb_biasparam_S5_R5_20b)[-1]

hsb_biasparam_S5_R5_20b$location <- 'hstatebins'
hsb_biasparam_S5_R5_20b$detection <- 0.5
hsb_biasparam_S5_R5_20b$eradication <- 0.5
hsb_biasparam_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_20 <- fread(file_name)
hsb_biasparam_S5_R75_20 <- data.frame(hsb_biasparam_S5_R75_20)[-1]

hsb_biasparam_S5_R75_20$location <- 'hstatebins'
hsb_biasparam_S5_R75_20$detection <- 0.5
hsb_biasparam_S5_R75_20$eradication <- 0.75
hsb_biasparam_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_20b <- fread(file_name)
hsb_biasparam_S5_R75_20b <- data.frame(hsb_biasparam_S5_R75_20b)[-1]

hsb_biasparam_S5_R75_20b$location <- 'hstatebins'
hsb_biasparam_S5_R75_20b$detection <- 0.5
hsb_biasparam_S5_R75_20b$eradication <- 0.75
hsb_biasparam_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_20 <- fread(file_name)
hsb_biasparam_S75_R5_20 <- data.frame(hsb_biasparam_S75_R5_20)[-1]

hsb_biasparam_S75_R5_20$location <- 'hstatebins'
hsb_biasparam_S75_R5_20$detection <- 0.75
hsb_biasparam_S75_R5_20$eradication <- 0.5
hsb_biasparam_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_20b <- fread(file_name)
hsb_biasparam_S75_R5_20b <- data.frame(hsb_biasparam_S75_R5_20b)[-1]

hsb_biasparam_S75_R5_20b$location <- 'hstatebins'
hsb_biasparam_S75_R5_20b$detection <- 0.75
hsb_biasparam_S75_R5_20b$eradication <- 0.5
hsb_biasparam_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_20 <- fread(file_name)
hsb_biasparam_S75_R75_20 <- data.frame(hsb_biasparam_S75_R75_20)[-1]

hsb_biasparam_S75_R75_20$location <- 'hstatebins'
hsb_biasparam_S75_R75_20$detection <- 0.75
hsb_biasparam_S75_R75_20$eradication <- 0.75
hsb_biasparam_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_20b <- fread(file_name)
hsb_biasparam_S75_R75_20b <- data.frame(hsb_biasparam_S75_R75_20b)[-1]

hsb_biasparam_S75_R75_20b$location <- 'hstatebins'
hsb_biasparam_S75_R75_20b$detection <- 0.75
hsb_biasparam_S75_R75_20b$eradication <- 0.75
hsb_biasparam_S75_R75_20b$budget <- 20

#-- Budget = 40 --#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_40 <- fread(file_name)
hsb_biasparam_S25_R5_40 <- data.frame(hsb_biasparam_S25_R5_40)[-1]

hsb_biasparam_S25_R5_40$location <- 'hstatebins'
hsb_biasparam_S25_R5_40$detection <- 0.25
hsb_biasparam_S25_R5_40$eradication <- 0.5
hsb_biasparam_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_40b <- fread(file_name)
hsb_biasparam_S25_R5_40b <- data.frame(hsb_biasparam_S25_R5_40b)[-1]

hsb_biasparam_S25_R5_40b$location <- 'hstatebins'
hsb_biasparam_S25_R5_40b$detection <- 0.25
hsb_biasparam_S25_R5_40b$eradication <- 0.5
hsb_biasparam_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_40 <- fread(file_name)
hsb_biasparam_S25_R75_40 <- data.frame(hsb_biasparam_S25_R75_40)[-1]

hsb_biasparam_S25_R75_40$location <- 'hstatebins'
hsb_biasparam_S25_R75_40$detection <- 0.25
hsb_biasparam_S25_R75_40$eradication <- 0.75
hsb_biasparam_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_40b <- fread(file_name)
hsb_biasparam_S25_R75_40b <- data.frame(hsb_biasparam_S25_R75_40b)[-1]

hsb_biasparam_S25_R75_40b$location <- 'hstatebins'
hsb_biasparam_S25_R75_40b$detection <- 0.25
hsb_biasparam_S25_R75_40b$eradication <- 0.75
hsb_biasparam_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_40 <- fread(file_name)
hsb_biasparam_S5_R5_40 <- data.frame(hsb_biasparam_S5_R5_40)[-1]

hsb_biasparam_S5_R5_40$location <- 'hstatebins'
hsb_biasparam_S5_R5_40$detection <- 0.5
hsb_biasparam_S5_R5_40$eradication <- 0.5
hsb_biasparam_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_40b <- fread(file_name)
hsb_biasparam_S5_R5_40b <- data.frame(hsb_biasparam_S5_R5_40b)[-1]

hsb_biasparam_S5_R5_40b$location <- 'hstatebins'
hsb_biasparam_S5_R5_40b$detection <- 0.5
hsb_biasparam_S5_R5_40b$eradication <- 0.5
hsb_biasparam_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_40 <- fread(file_name)
hsb_biasparam_S5_R75_40 <- data.frame(hsb_biasparam_S5_R75_40)[-1]

hsb_biasparam_S5_R75_40$location <- 'hstatebins'
hsb_biasparam_S5_R75_40$detection <- 0.5
hsb_biasparam_S5_R75_40$eradication <- 0.75
hsb_biasparam_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_40b <- fread(file_name)
hsb_biasparam_S5_R75_40b <- data.frame(hsb_biasparam_S5_R75_40b)[-1]

hsb_biasparam_S5_R75_40b$location <- 'hstatebins'
hsb_biasparam_S5_R75_40b$detection <- 0.5
hsb_biasparam_S5_R75_40b$eradication <- 0.75
hsb_biasparam_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_40 <- fread(file_name)
hsb_biasparam_S75_R5_40 <- data.frame(hsb_biasparam_S75_R5_40)[-1]

hsb_biasparam_S75_R5_40$location <- 'hstatebins'
hsb_biasparam_S75_R5_40$detection <- 0.75
hsb_biasparam_S75_R5_40$eradication <- 0.5
hsb_biasparam_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_40b <- fread(file_name)
hsb_biasparam_S75_R5_40b <- data.frame(hsb_biasparam_S75_R5_40b)[-1]

hsb_biasparam_S75_R5_40b$location <- 'hstatebins'
hsb_biasparam_S75_R5_40b$detection <- 0.75
hsb_biasparam_S75_R5_40b$eradication <- 0.5
hsb_biasparam_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_40 <- fread(file_name)
hsb_biasparam_S75_R75_40 <- data.frame(hsb_biasparam_S75_R75_40)[-1]

hsb_biasparam_S75_R75_40$location <- 'hstatebins'
hsb_biasparam_S75_R75_40$detection <- 0.75
hsb_biasparam_S75_R75_40$eradication <- 0.75
hsb_biasparam_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_40b <- fread(file_name)
hsb_biasparam_S75_R75_40b <- data.frame(hsb_biasparam_S75_R75_40b)[-1]

hsb_biasparam_S75_R75_40b$location <- 'hstatebins'
hsb_biasparam_S75_R75_40b$detection <- 0.75
hsb_biasparam_S75_R75_40b$eradication <- 0.75
hsb_biasparam_S75_R75_40b$budget <- 40

#-- Budget = 60 --#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_60 <- fread(file_name)
hsb_biasparam_S25_R5_60 <- data.frame(hsb_biasparam_S25_R5_60)[-1]

hsb_biasparam_S25_R5_60$location <- 'hstatebins'
hsb_biasparam_S25_R5_60$detection <- 0.25
hsb_biasparam_S25_R5_60$eradication <- 0.5
hsb_biasparam_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R5_60b <- fread(file_name)
hsb_biasparam_S25_R5_60b <- data.frame(hsb_biasparam_S25_R5_60b)[-1]

hsb_biasparam_S25_R5_60b$location <- 'hstatebins'
hsb_biasparam_S25_R5_60b$detection <- 0.25
hsb_biasparam_S25_R5_60b$eradication <- 0.5
hsb_biasparam_S25_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_60 <- fread(file_name)
hsb_biasparam_S25_R75_60 <- data.frame(hsb_biasparam_S25_R75_60)[-1]

hsb_biasparam_S25_R75_60$location <- 'hstatebins'
hsb_biasparam_S25_R75_60$detection <- 0.25
hsb_biasparam_S25_R75_60$eradication <- 0.75
hsb_biasparam_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S25_R75_60b <- fread(file_name)
hsb_biasparam_S25_R75_60b <- data.frame(hsb_biasparam_S25_R75_60b)[-1]

hsb_biasparam_S25_R75_60b$location <- 'hstatebins'
hsb_biasparam_S25_R75_60b$detection <- 0.25
hsb_biasparam_S25_R75_60b$eradication <- 0.75
hsb_biasparam_S25_R75_60b$budget <- 60

##
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_60 <- fread(file_name)
hsb_biasparam_S5_R5_60 <- data.frame(hsb_biasparam_S5_R5_60)[-1]

hsb_biasparam_S5_R5_60$location <- 'hstatebins'
hsb_biasparam_S5_R5_60$detection <- 0.5
hsb_biasparam_S5_R5_60$eradication <- 0.5
hsb_biasparam_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R5_60b <- fread(file_name)
hsb_biasparam_S5_R5_60b <- data.frame(hsb_biasparam_S5_R5_60b)[-1]

hsb_biasparam_S5_R5_60b$location <- 'hstatebins'
hsb_biasparam_S5_R5_60b$detection <- 0.5
hsb_biasparam_S5_R5_60b$eradication <- 0.5
hsb_biasparam_S5_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_60 <- fread(file_name)
hsb_biasparam_S5_R75_60 <- data.frame(hsb_biasparam_S5_R75_60)[-1]

hsb_biasparam_S5_R75_60$location <- 'hstatebins'
hsb_biasparam_S5_R75_60$detection <- 0.5
hsb_biasparam_S5_R75_60$eradication <- 0.75
hsb_biasparam_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S5_R75_60b <- fread(file_name)
hsb_biasparam_S5_R75_60b <- data.frame(hsb_biasparam_S5_R75_60b)[-1]

hsb_biasparam_S5_R75_60b$location <- 'hstatebins'
hsb_biasparam_S5_R75_60b$detection <- 0.5
hsb_biasparam_S5_R75_60b$eradication <- 0.75
hsb_biasparam_S5_R75_60b$budget <- 60
##
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_60 <- fread(file_name)
hsb_biasparam_S75_R5_60 <- data.frame(hsb_biasparam_S75_R5_60)[-1]

hsb_biasparam_S75_R5_60$location <- 'hstatebins'
hsb_biasparam_S75_R5_60$detection <- 0.75
hsb_biasparam_S75_R5_60$eradication <- 0.5
hsb_biasparam_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R5_60b <- fread(file_name)
hsb_biasparam_S75_R5_60b <- data.frame(hsb_biasparam_S75_R5_60b)[-1]

hsb_biasparam_S75_R5_60b$location <- 'hstatebins'
hsb_biasparam_S75_R5_60b$detection <- 0.75
hsb_biasparam_S75_R5_60b$eradication <- 0.5
hsb_biasparam_S75_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_60 <- fread(file_name)
hsb_biasparam_S75_R75_60 <- data.frame(hsb_biasparam_S75_R75_60)[-1]

hsb_biasparam_S75_R75_60$location <- 'hstatebins'
hsb_biasparam_S75_R75_60$detection <- 0.75
hsb_biasparam_S75_R75_60$eradication <- 0.75
hsb_biasparam_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
hsb_biasparam_S75_R75_60b <- fread(file_name)
hsb_biasparam_S75_R75_60b <- data.frame(hsb_biasparam_S75_R75_60b)[-1]

hsb_biasparam_S75_R75_60b$location <- 'hstatebins'
hsb_biasparam_S75_R75_60b$detection <- 0.75
hsb_biasparam_S75_R75_60b$eradication <- 0.75
hsb_biasparam_S75_R75_60b$budget <- 60

##### linear #####
#----- linear -----#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_20 <- fread(file_name)
linear_biasparam_S25_R5_20 <- data.frame(linear_biasparam_S25_R5_20)[-1]

linear_biasparam_S25_R5_20$location <- 'linear'
linear_biasparam_S25_R5_20$detection <- 0.25
linear_biasparam_S25_R5_20$eradication <- 0.5
linear_biasparam_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_20b <- fread(file_name)
linear_biasparam_S25_R5_20b <- data.frame(linear_biasparam_S25_R5_20b)[-1]

linear_biasparam_S25_R5_20b$location <- 'linear'
linear_biasparam_S25_R5_20b$detection <- 0.25
linear_biasparam_S25_R5_20b$eradication <- 0.5
linear_biasparam_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_20 <- fread(file_name)
linear_biasparam_S25_R75_20 <- data.frame(linear_biasparam_S25_R75_20)[-1]

linear_biasparam_S25_R75_20$location <- 'linear'
linear_biasparam_S25_R75_20$detection <- 0.25
linear_biasparam_S25_R75_20$eradication <- 0.75
linear_biasparam_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_20b <- fread(file_name)
linear_biasparam_S25_R75_20b <- data.frame(linear_biasparam_S25_R75_20b)[-1]

linear_biasparam_S25_R75_20b$location <- 'linear'
linear_biasparam_S25_R75_20b$detection <- 0.25
linear_biasparam_S25_R75_20b$eradication <- 0.75
linear_biasparam_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_20 <- fread(file_name)
linear_biasparam_S5_R5_20 <- data.frame(linear_biasparam_S5_R5_20)[-1]

linear_biasparam_S5_R5_20$location <- 'linear'
linear_biasparam_S5_R5_20$detection <- 0.5
linear_biasparam_S5_R5_20$eradication <- 0.5
linear_biasparam_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_20b <- fread(file_name)
linear_biasparam_S5_R5_20b <- data.frame(linear_biasparam_S5_R5_20b)[-1]

linear_biasparam_S5_R5_20b$location <- 'linear'
linear_biasparam_S5_R5_20b$detection <- 0.5
linear_biasparam_S5_R5_20b$eradication <- 0.5
linear_biasparam_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_20 <- fread(file_name)
linear_biasparam_S5_R75_20 <- data.frame(linear_biasparam_S5_R75_20)[-1]

linear_biasparam_S5_R75_20$location <- 'linear'
linear_biasparam_S5_R75_20$detection <- 0.5
linear_biasparam_S5_R75_20$eradication <- 0.75
linear_biasparam_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_20b <- fread(file_name)
linear_biasparam_S5_R75_20b <- data.frame(linear_biasparam_S5_R75_20b)[-1]

linear_biasparam_S5_R75_20b$location <- 'linear'
linear_biasparam_S5_R75_20b$detection <- 0.5
linear_biasparam_S5_R75_20b$eradication <- 0.75
linear_biasparam_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_20 <- fread(file_name)
linear_biasparam_S75_R5_20 <- data.frame(linear_biasparam_S75_R5_20)[-1]

linear_biasparam_S75_R5_20$location <- 'linear'
linear_biasparam_S75_R5_20$detection <- 0.75
linear_biasparam_S75_R5_20$eradication <- 0.5
linear_biasparam_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_20b <- fread(file_name)
linear_biasparam_S75_R5_20b <- data.frame(linear_biasparam_S75_R5_20b)[-1]

linear_biasparam_S75_R5_20b$location <- 'linear'
linear_biasparam_S75_R5_20b$detection <- 0.75
linear_biasparam_S75_R5_20b$eradication <- 0.5
linear_biasparam_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_20 <- fread(file_name)
linear_biasparam_S75_R75_20 <- data.frame(linear_biasparam_S75_R75_20)[-1]

linear_biasparam_S75_R75_20$location <- 'linear'
linear_biasparam_S75_R75_20$detection <- 0.75
linear_biasparam_S75_R75_20$eradication <- 0.75
linear_biasparam_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_20b <- fread(file_name)
linear_biasparam_S75_R75_20b <- data.frame(linear_biasparam_S75_R75_20b)[-1]

linear_biasparam_S75_R75_20b$location <- 'linear'
linear_biasparam_S75_R75_20b$detection <- 0.75
linear_biasparam_S75_R75_20b$eradication <- 0.75
linear_biasparam_S75_R75_20b$budget <- 20

#----- linear -----#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_40 <- fread(file_name)
linear_biasparam_S25_R5_40 <- data.frame(linear_biasparam_S25_R5_40)[-1]

linear_biasparam_S25_R5_40$location <- 'linear'
linear_biasparam_S25_R5_40$detection <- 0.25
linear_biasparam_S25_R5_40$eradication <- 0.5
linear_biasparam_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_40b <- fread(file_name)
linear_biasparam_S25_R5_40b <- data.frame(linear_biasparam_S25_R5_40b)[-1]

linear_biasparam_S25_R5_40b$location <- 'linear'
linear_biasparam_S25_R5_40b$detection <- 0.25
linear_biasparam_S25_R5_40b$eradication <- 0.5
linear_biasparam_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_40 <- fread(file_name)
linear_biasparam_S25_R75_40 <- data.frame(linear_biasparam_S25_R75_40)[-1]

linear_biasparam_S25_R75_40$location <- 'linear'
linear_biasparam_S25_R75_40$detection <- 0.25
linear_biasparam_S25_R75_40$eradication <- 0.75
linear_biasparam_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_40b <- fread(file_name)
linear_biasparam_S25_R75_40b <- data.frame(linear_biasparam_S25_R75_40b)[-1]

linear_biasparam_S25_R75_40b$location <- 'linear'
linear_biasparam_S25_R75_40b$detection <- 0.25
linear_biasparam_S25_R75_40b$eradication <- 0.75
linear_biasparam_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_40 <- fread(file_name)
linear_biasparam_S5_R5_40 <- data.frame(linear_biasparam_S5_R5_40)[-1]

linear_biasparam_S5_R5_40$location <- 'linear'
linear_biasparam_S5_R5_40$detection <- 0.5
linear_biasparam_S5_R5_40$eradication <- 0.5
linear_biasparam_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_40b <- fread(file_name)
linear_biasparam_S5_R5_40b <- data.frame(linear_biasparam_S5_R5_40b)[-1]

linear_biasparam_S5_R5_40b$location <- 'linear'
linear_biasparam_S5_R5_40b$detection <- 0.5
linear_biasparam_S5_R5_40b$eradication <- 0.5
linear_biasparam_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_40 <- fread(file_name)
linear_biasparam_S5_R75_40 <- data.frame(linear_biasparam_S5_R75_40)[-1]

linear_biasparam_S5_R75_40$location <- 'linear'
linear_biasparam_S5_R75_40$detection <- 0.5
linear_biasparam_S5_R75_40$eradication <- 0.75
linear_biasparam_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_40b <- fread(file_name)
linear_biasparam_S5_R75_40b <- data.frame(linear_biasparam_S5_R75_40b)[-1]

linear_biasparam_S5_R75_40b$location <- 'linear'
linear_biasparam_S5_R75_40b$detection <- 0.5
linear_biasparam_S5_R75_40b$eradication <- 0.75
linear_biasparam_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_40 <- fread(file_name)
linear_biasparam_S75_R5_40 <- data.frame(linear_biasparam_S75_R5_40)[-1]

linear_biasparam_S75_R5_40$location <- 'linear'
linear_biasparam_S75_R5_40$detection <- 0.75
linear_biasparam_S75_R5_40$eradication <- 0.5
linear_biasparam_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_40b <- fread(file_name)
linear_biasparam_S75_R5_40b <- data.frame(linear_biasparam_S75_R5_40b)[-1]

linear_biasparam_S75_R5_40b$location <- 'linear'
linear_biasparam_S75_R5_40b$detection <- 0.75
linear_biasparam_S75_R5_40b$eradication <- 0.5
linear_biasparam_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_40 <- fread(file_name)
linear_biasparam_S75_R75_40 <- data.frame(linear_biasparam_S75_R75_40)[-1]

linear_biasparam_S75_R75_40$location <- 'linear'
linear_biasparam_S75_R75_40$detection <- 0.75
linear_biasparam_S75_R75_40$eradication <- 0.75
linear_biasparam_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_40b <- fread(file_name)
linear_biasparam_S75_R75_40b <- data.frame(linear_biasparam_S75_R75_40b)[-1]

linear_biasparam_S75_R75_40b$location <- 'linear'
linear_biasparam_S75_R75_40b$detection <- 0.75
linear_biasparam_S75_R75_40b$eradication <- 0.75
linear_biasparam_S75_R75_40b$budget <- 40

#----- linear -----#
path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_60 <- fread(file_name)
linear_biasparam_S25_R5_60 <- data.frame(linear_biasparam_S25_R5_60)[-1]

linear_biasparam_S25_R5_60$location <- 'linear'
linear_biasparam_S25_R5_60$detection <- 0.25
linear_biasparam_S25_R5_60$eradication <- 0.5
linear_biasparam_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R5_60b <- fread(file_name)
linear_biasparam_S25_R5_60b <- data.frame(linear_biasparam_S25_R5_60b)[-1]

linear_biasparam_S25_R5_60b$location <- 'linear'
linear_biasparam_S25_R5_60b$detection <- 0.25
linear_biasparam_S25_R5_60b$eradication <- 0.5
linear_biasparam_S25_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_60 <- fread(file_name)
linear_biasparam_S25_R75_60 <- data.frame(linear_biasparam_S25_R75_60)[-1]

linear_biasparam_S25_R75_60$location <- 'linear'
linear_biasparam_S25_R75_60$detection <- 0.25
linear_biasparam_S25_R75_60$eradication <- 0.75
linear_biasparam_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S25_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S25_R75_60b <- fread(file_name)
linear_biasparam_S25_R75_60b <- data.frame(linear_biasparam_S25_R75_60b)[-1]

linear_biasparam_S25_R75_60b$location <- 'linear'
linear_biasparam_S25_R75_60b$detection <- 0.25
linear_biasparam_S25_R75_60b$eradication <- 0.75
linear_biasparam_S25_R75_60b$budget <- 60

##
path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_60 <- fread(file_name)
linear_biasparam_S5_R5_60 <- data.frame(linear_biasparam_S5_R5_60)[-1]

linear_biasparam_S5_R5_60$location <- 'linear'
linear_biasparam_S5_R5_60$detection <- 0.5
linear_biasparam_S5_R5_60$eradication <- 0.5
linear_biasparam_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R5_60b <- fread(file_name)
linear_biasparam_S5_R5_60b <- data.frame(linear_biasparam_S5_R5_60b)[-1]

linear_biasparam_S5_R5_60b$location <- 'linear'
linear_biasparam_S5_R5_60b$detection <- 0.5
linear_biasparam_S5_R5_60b$eradication <- 0.5
linear_biasparam_S5_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_60 <- fread(file_name)
linear_biasparam_S5_R75_60 <- data.frame(linear_biasparam_S5_R75_60)[-1]

linear_biasparam_S5_R75_60$location <- 'linear'
linear_biasparam_S5_R75_60$detection <- 0.5
linear_biasparam_S5_R75_60$eradication <- 0.75
linear_biasparam_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S5_R75_60b <- fread(file_name)
linear_biasparam_S5_R75_60b <- data.frame(linear_biasparam_S5_R75_60b)[-1]

linear_biasparam_S5_R75_60b$location <- 'linear'
linear_biasparam_S5_R75_60b$detection <- 0.5
linear_biasparam_S5_R75_60b$eradication <- 0.75
linear_biasparam_S5_R75_60b$budget <- 60
##
path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_60 <- fread(file_name)
linear_biasparam_S75_R5_60 <- data.frame(linear_biasparam_S75_R5_60)[-1]

linear_biasparam_S75_R5_60$location <- 'linear'
linear_biasparam_S75_R5_60$detection <- 0.75
linear_biasparam_S75_R5_60$eradication <- 0.5
linear_biasparam_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R5_60b <- fread(file_name)
linear_biasparam_S75_R5_60b <- data.frame(linear_biasparam_S75_R5_60b)[-1]

linear_biasparam_S75_R5_60b$location <- 'linear'
linear_biasparam_S75_R5_60b$detection <- 0.75
linear_biasparam_S75_R5_60b$eradication <- 0.5
linear_biasparam_S75_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_60 <- fread(file_name)
linear_biasparam_S75_R75_60 <- data.frame(linear_biasparam_S75_R75_60)[-1]

linear_biasparam_S75_R75_60$location <- 'linear'
linear_biasparam_S75_R75_60$detection <- 0.75
linear_biasparam_S75_R75_60$eradication <- 0.75
linear_biasparam_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\linear\\S75_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_biasparam_S75_R75_60b <- fread(file_name)
linear_biasparam_S75_R75_60b <- data.frame(linear_biasparam_S75_R75_60b)[-1]

linear_biasparam_S75_R75_60b$location <- 'linear'
linear_biasparam_S75_R75_60b$detection <- 0.75
linear_biasparam_S75_R75_60b$eradication <- 0.75
linear_biasparam_S75_R75_60b$budget <- 60

##### epicenter #####
#----- epicenter -----#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R5_20 <- fread(file_name)
epicenter_biasparam_S25_R5_20 <- data.frame(epicenter_biasparam_S25_R5_20)[-1]

epicenter_biasparam_S25_R5_20$location <- 'epicenter'
epicenter_biasparam_S25_R5_20$detection <- 0.25
epicenter_biasparam_S25_R5_20$eradication <- 0.5
epicenter_biasparam_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R5_20b <- fread(file_name)
epicenter_biasparam_S25_R5_20b <- data.frame(epicenter_biasparam_S25_R5_20b)[-1]

epicenter_biasparam_S25_R5_20b$location <- 'epicenter'
epicenter_biasparam_S25_R5_20b$detection <- 0.25
epicenter_biasparam_S25_R5_20b$eradication <- 0.5
epicenter_biasparam_S25_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R75_20 <- fread(file_name)
epicenter_biasparam_S25_R75_20 <- data.frame(epicenter_biasparam_S25_R75_20)[-1]

epicenter_biasparam_S25_R75_20$location <- 'epicenter'
epicenter_biasparam_S25_R75_20$detection <- 0.25
epicenter_biasparam_S25_R75_20$eradication <- 0.75
epicenter_biasparam_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R75_20b <- fread(file_name)
epicenter_biasparam_S25_R75_20b <- data.frame(epicenter_biasparam_S25_R75_20b)[-1]

epicenter_biasparam_S25_R75_20b$location <- 'epicenter'
epicenter_biasparam_S25_R75_20b$detection <- 0.25
epicenter_biasparam_S25_R75_20b$eradication <- 0.75
epicenter_biasparam_S25_R75_20b$budget <- 20

##
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R5_20 <- fread(file_name)
epicenter_biasparam_S5_R5_20 <- data.frame(epicenter_biasparam_S5_R5_20)[-1]

epicenter_biasparam_S5_R5_20$location <- 'epicenter'
epicenter_biasparam_S5_R5_20$detection <- 0.5
epicenter_biasparam_S5_R5_20$eradication <- 0.5
epicenter_biasparam_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R5_20b <- fread(file_name)
epicenter_biasparam_S5_R5_20b <- data.frame(epicenter_biasparam_S5_R5_20b)[-1]

epicenter_biasparam_S5_R5_20b$location <- 'epicenter'
epicenter_biasparam_S5_R5_20b$detection <- 0.5
epicenter_biasparam_S5_R5_20b$eradication <- 0.5
epicenter_biasparam_S5_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R75_20 <- fread(file_name)
epicenter_biasparam_S5_R75_20 <- data.frame(epicenter_biasparam_S5_R75_20)[-1]

epicenter_biasparam_S5_R75_20$location <- 'epicenter'
epicenter_biasparam_S5_R75_20$detection <- 0.5
epicenter_biasparam_S5_R75_20$eradication <- 0.75
epicenter_biasparam_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R75_20b <- fread(file_name)
epicenter_biasparam_S5_R75_20b <- data.frame(epicenter_biasparam_S5_R75_20b)[-1]

epicenter_biasparam_S5_R75_20b$location <- 'epicenter'
epicenter_biasparam_S5_R75_20b$detection <- 0.5
epicenter_biasparam_S5_R75_20b$eradication <- 0.75
epicenter_biasparam_S5_R75_20b$budget <- 20
##
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R5_20 <- fread(file_name)
epicenter_biasparam_S75_R5_20 <- data.frame(epicenter_biasparam_S75_R5_20)[-1]

epicenter_biasparam_S75_R5_20$location <- 'epicenter'
epicenter_biasparam_S75_R5_20$detection <- 0.75
epicenter_biasparam_S75_R5_20$eradication <- 0.5
epicenter_biasparam_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R5_20b <- fread(file_name)
epicenter_biasparam_S75_R5_20b <- data.frame(epicenter_biasparam_S75_R5_20b)[-1]

epicenter_biasparam_S75_R5_20b$location <- 'epicenter'
epicenter_biasparam_S75_R5_20b$detection <- 0.75
epicenter_biasparam_S75_R5_20b$eradication <- 0.5
epicenter_biasparam_S75_R5_20b$budget <- 20
#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R75_20 <- fread(file_name)
epicenter_biasparam_S75_R75_20 <- data.frame(epicenter_biasparam_S75_R75_20)[-1]

epicenter_biasparam_S75_R75_20$location <- 'epicenter'
epicenter_biasparam_S75_R75_20$detection <- 0.75
epicenter_biasparam_S75_R75_20$eradication <- 0.75
epicenter_biasparam_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R75_20b <- fread(file_name)
epicenter_biasparam_S75_R75_20b <- data.frame(epicenter_biasparam_S75_R75_20b)[-1]

epicenter_biasparam_S75_R75_20b$location <- 'epicenter'
epicenter_biasparam_S75_R75_20b$detection <- 0.75
epicenter_biasparam_S75_R75_20b$eradication <- 0.75
epicenter_biasparam_S75_R75_20b$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R5_40 <- fread(file_name)
epicenter_biasparam_S25_R5_40 <- data.frame(epicenter_biasparam_S25_R5_40)[-1]

epicenter_biasparam_S25_R5_40$location <- 'epicenter'
epicenter_biasparam_S25_R5_40$detection <- 0.25
epicenter_biasparam_S25_R5_40$eradication <- 0.5
epicenter_biasparam_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R5_40b <- fread(file_name)
epicenter_biasparam_S25_R5_40b <- data.frame(epicenter_biasparam_S25_R5_40b)[-1]

epicenter_biasparam_S25_R5_40b$location <- 'epicenter'
epicenter_biasparam_S25_R5_40b$detection <- 0.25
epicenter_biasparam_S25_R5_40b$eradication <- 0.5
epicenter_biasparam_S25_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R75_40 <- fread(file_name)
epicenter_biasparam_S25_R75_40 <- data.frame(epicenter_biasparam_S25_R75_40)[-1]

epicenter_biasparam_S25_R75_40$location <- 'epicenter'
epicenter_biasparam_S25_R75_40$detection <- 0.25
epicenter_biasparam_S25_R75_40$eradication <- 0.75
epicenter_biasparam_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R75_40b <- fread(file_name)
epicenter_biasparam_S25_R75_40b <- data.frame(epicenter_biasparam_S25_R75_40b)[-1]

epicenter_biasparam_S25_R75_40b$location <- 'epicenter'
epicenter_biasparam_S25_R75_40b$detection <- 0.25
epicenter_biasparam_S25_R75_40b$eradication <- 0.75
epicenter_biasparam_S25_R75_40b$budget <- 40

##
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R5_40 <- fread(file_name)
epicenter_biasparam_S5_R5_40 <- data.frame(epicenter_biasparam_S5_R5_40)[-1]

epicenter_biasparam_S5_R5_40$location <- 'epicenter'
epicenter_biasparam_S5_R5_40$detection <- 0.5
epicenter_biasparam_S5_R5_40$eradication <- 0.5
epicenter_biasparam_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R5_40b <- fread(file_name)
epicenter_biasparam_S5_R5_40b <- data.frame(epicenter_biasparam_S5_R5_40b)[-1]

epicenter_biasparam_S5_R5_40b$location <- 'epicenter'
epicenter_biasparam_S5_R5_40b$detection <- 0.5
epicenter_biasparam_S5_R5_40b$eradication <- 0.5
epicenter_biasparam_S5_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R75_40 <- fread(file_name)
epicenter_biasparam_S5_R75_40 <- data.frame(epicenter_biasparam_S5_R75_40)[-1]

epicenter_biasparam_S5_R75_40$location <- 'epicenter'
epicenter_biasparam_S5_R75_40$detection <- 0.5
epicenter_biasparam_S5_R75_40$eradication <- 0.75
epicenter_biasparam_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R75_40b <- fread(file_name)
epicenter_biasparam_S5_R75_40b <- data.frame(epicenter_biasparam_S5_R75_40b)[-1]

epicenter_biasparam_S5_R75_40b$location <- 'epicenter'
epicenter_biasparam_S5_R75_40b$detection <- 0.5
epicenter_biasparam_S5_R75_40b$eradication <- 0.75
epicenter_biasparam_S5_R75_40b$budget <- 40
##
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R5_40 <- fread(file_name)
epicenter_biasparam_S75_R5_40 <- data.frame(epicenter_biasparam_S75_R5_40)[-1]

epicenter_biasparam_S75_R5_40$location <- 'epicenter'
epicenter_biasparam_S75_R5_40$detection <- 0.75
epicenter_biasparam_S75_R5_40$eradication <- 0.5
epicenter_biasparam_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R5_40b <- fread(file_name)
epicenter_biasparam_S75_R5_40b <- data.frame(epicenter_biasparam_S75_R5_40b)[-1]

epicenter_biasparam_S75_R5_40b$location <- 'epicenter'
epicenter_biasparam_S75_R5_40b$detection <- 0.75
epicenter_biasparam_S75_R5_40b$eradication <- 0.5
epicenter_biasparam_S75_R5_40b$budget <- 40
#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R75_40 <- fread(file_name)
epicenter_biasparam_S75_R75_40 <- data.frame(epicenter_biasparam_S75_R75_40)[-1]

epicenter_biasparam_S75_R75_40$location <- 'epicenter'
epicenter_biasparam_S75_R75_40$detection <- 0.75
epicenter_biasparam_S75_R75_40$eradication <- 0.75
epicenter_biasparam_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R75_40b <- fread(file_name)
epicenter_biasparam_S75_R75_40b <- data.frame(epicenter_biasparam_S75_R75_40b)[-1]

epicenter_biasparam_S75_R75_40b$location <- 'epicenter'
epicenter_biasparam_S75_R75_40b$detection <- 0.75
epicenter_biasparam_S75_R75_40b$eradication <- 0.75
epicenter_biasparam_S75_R75_40b$budget <- 40

#----- epicenter -----#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R5_60 <- fread(file_name)
epicenter_biasparam_S25_R5_60 <- data.frame(epicenter_biasparam_S25_R5_60)[-1]

epicenter_biasparam_S25_R5_60$location <- 'epicenter'
epicenter_biasparam_S25_R5_60$detection <- 0.25
epicenter_biasparam_S25_R5_60$eradication <- 0.5
epicenter_biasparam_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R5_60b <- fread(file_name)
epicenter_biasparam_S25_R5_60b <- data.frame(epicenter_biasparam_S25_R5_60b)[-1]

epicenter_biasparam_S25_R5_60b$location <- 'epicenter'
epicenter_biasparam_S25_R5_60b$detection <- 0.25
epicenter_biasparam_S25_R5_60b$eradication <- 0.5
epicenter_biasparam_S25_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R75_60 <- fread(file_name)
epicenter_biasparam_S25_R75_60 <- data.frame(epicenter_biasparam_S25_R75_60)[-1]

epicenter_biasparam_S25_R75_60$location <- 'epicenter'
epicenter_biasparam_S25_R75_60$detection <- 0.25
epicenter_biasparam_S25_R75_60$eradication <- 0.75
epicenter_biasparam_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S25_R75_60b <- fread(file_name)
epicenter_biasparam_S25_R75_60b <- data.frame(epicenter_biasparam_S25_R75_60b)[-1]

epicenter_biasparam_S25_R75_60b$location <- 'epicenter'
epicenter_biasparam_S25_R75_60b$detection <- 0.25
epicenter_biasparam_S25_R75_60b$eradication <- 0.75
epicenter_biasparam_S25_R75_60b$budget <- 60

##
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R5_60 <- fread(file_name)
epicenter_biasparam_S5_R5_60 <- data.frame(epicenter_biasparam_S5_R5_60)[-1]

epicenter_biasparam_S5_R5_60$location <- 'epicenter'
epicenter_biasparam_S5_R5_60$detection <- 0.5
epicenter_biasparam_S5_R5_60$eradication <- 0.5
epicenter_biasparam_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R5_60b <- fread(file_name)
epicenter_biasparam_S5_R5_60b <- data.frame(epicenter_biasparam_S5_R5_60b)[-1]

epicenter_biasparam_S5_R5_60b$location <- 'epicenter'
epicenter_biasparam_S5_R5_60b$detection <- 0.5
epicenter_biasparam_S5_R5_60b$eradication <- 0.5
epicenter_biasparam_S5_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R75_60 <- fread(file_name)
epicenter_biasparam_S5_R75_60 <- data.frame(epicenter_biasparam_S5_R75_60)[-1]

epicenter_biasparam_S5_R75_60$location <- 'epicenter'
epicenter_biasparam_S5_R75_60$detection <- 0.5
epicenter_biasparam_S5_R75_60$eradication <- 0.75
epicenter_biasparam_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S5_R75_60b <- fread(file_name)
epicenter_biasparam_S5_R75_60b <- data.frame(epicenter_biasparam_S5_R75_60b)[-1]

epicenter_biasparam_S5_R75_60b$location <- 'epicenter'
epicenter_biasparam_S5_R75_60b$detection <- 0.5
epicenter_biasparam_S5_R75_60b$eradication <- 0.75
epicenter_biasparam_S5_R75_60b$budget <- 60
##
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R5_60 <- fread(file_name)
epicenter_biasparam_S75_R5_60 <- data.frame(epicenter_biasparam_S75_R5_60)[-1]

epicenter_biasparam_S75_R5_60$location <- 'epicenter'
epicenter_biasparam_S75_R5_60$detection <- 0.75
epicenter_biasparam_S75_R5_60$eradication <- 0.5
epicenter_biasparam_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R5_60b <- fread(file_name)
epicenter_biasparam_S75_R5_60b <- data.frame(epicenter_biasparam_S75_R5_60b)[-1]

epicenter_biasparam_S75_R5_60b$location <- 'epicenter'
epicenter_biasparam_S75_R5_60b$detection <- 0.75
epicenter_biasparam_S75_R5_60b$eradication <- 0.5
epicenter_biasparam_S75_R5_60b$budget <- 60
#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R75_60 <- fread(file_name)
epicenter_biasparam_S75_R75_60 <- data.frame(epicenter_biasparam_S75_R75_60)[-1]

epicenter_biasparam_S75_R75_60$location <- 'epicenter'
epicenter_biasparam_S75_R75_60$detection <- 0.75
epicenter_biasparam_S75_R75_60$eradication <- 0.75
epicenter_biasparam_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_biasparam_S75_R75_60b <- fread(file_name)
epicenter_biasparam_S75_R75_60b <- data.frame(epicenter_biasparam_S75_R75_60b)[-1]

epicenter_biasparam_S75_R75_60b$location <- 'epicenter'
epicenter_biasparam_S75_R75_60b$detection <- 0.75
epicenter_biasparam_S75_R75_60b$eradication <- 0.75
epicenter_biasparam_S75_R75_60b$budget <- 60

#--- Combine bias_params ---#
bias_param_20 <- rbind(hsb_biasparam_S25_R5_20,hsb_biasparam_S25_R5_20b,
                       hsb_biasparam_S25_R75_20,hsb_biasparam_S25_R75_20b,
                       hsb_biasparam_S5_R5_20,hsb_biasparam_S5_R5_20b,
                       hsb_biasparam_S5_R75_20,hsb_biasparam_S5_R75_20b,
                       hsb_biasparam_S75_R5_20,hsb_biasparam_S75_R5_20b,
                       hsb_biasparam_S75_R75_20,hsb_biasparam_S75_R75_20b,
                       linear_biasparam_S25_R5_20,linear_biasparam_S25_R5_20b,
                       linear_biasparam_S25_R75_20,linear_biasparam_S25_R75_20b,
                       linear_biasparam_S5_R5_20,linear_biasparam_S5_R5_20b,
                       linear_biasparam_S5_R75_20,linear_biasparam_S5_R75_20b,
                       linear_biasparam_S75_R5_20,linear_biasparam_S75_R5_20b,
                       linear_biasparam_S75_R75_20,linear_biasparam_S75_R75_20b,
                       epicenter_biasparam_S25_R5_20,epicenter_biasparam_S25_R5_20b,
                       epicenter_biasparam_S25_R75_20,epicenter_biasparam_S25_R75_20b,
                       epicenter_biasparam_S5_R5_20,epicenter_biasparam_S5_R5_20b,
                       epicenter_biasparam_S5_R75_20,epicenter_biasparam_S5_R75_20b,
                       epicenter_biasparam_S75_R5_20,epicenter_biasparam_S75_R5_20b,
                       epicenter_biasparam_S75_R75_20,epicenter_biasparam_S75_R75_20b)

bias_param_40 <- rbind(hsb_biasparam_S25_R5_40,hsb_biasparam_S25_R5_40b,
                       hsb_biasparam_S25_R75_40,hsb_biasparam_S25_R75_40b,
                       hsb_biasparam_S5_R5_40,hsb_biasparam_S5_R5_40b,
                       hsb_biasparam_S5_R75_40,hsb_biasparam_S5_R75_40b,
                       hsb_biasparam_S75_R5_40,hsb_biasparam_S75_R5_40b,
                       hsb_biasparam_S75_R75_40,hsb_biasparam_S75_R75_40b,
                       linear_biasparam_S25_R5_40,linear_biasparam_S25_R5_40b,
                       linear_biasparam_S25_R75_40,linear_biasparam_S25_R75_40b,
                       linear_biasparam_S5_R5_40,linear_biasparam_S5_R5_40b,
                       linear_biasparam_S5_R75_40,linear_biasparam_S5_R75_40b,
                       linear_biasparam_S75_R5_40,linear_biasparam_S75_R5_40b,
                       linear_biasparam_S75_R75_40,linear_biasparam_S75_R75_40b,
                       epicenter_biasparam_S25_R5_40,epicenter_biasparam_S25_R5_40b,
                       epicenter_biasparam_S25_R75_40,epicenter_biasparam_S25_R75_40b,
                       epicenter_biasparam_S5_R5_40,epicenter_biasparam_S5_R5_40b,
                       epicenter_biasparam_S5_R75_40,epicenter_biasparam_S5_R75_40b,
                       epicenter_biasparam_S75_R5_40,epicenter_biasparam_S75_R5_40b,
                       epicenter_biasparam_S75_R75_40,epicenter_biasparam_S75_R75_40b)

bias_param_60 <- rbind(hsb_biasparam_S25_R5_60,hsb_biasparam_S25_R5_60b,
                       hsb_biasparam_S25_R75_60,hsb_biasparam_S25_R75_60b,
                       hsb_biasparam_S5_R5_60,hsb_biasparam_S5_R5_60b,
                       hsb_biasparam_S5_R75_60,hsb_biasparam_S5_R75_60b,
                       hsb_biasparam_S75_R5_60,hsb_biasparam_S75_R5_60b,
                       hsb_biasparam_S75_R75_60,hsb_biasparam_S75_R75_60b,
                       linear_biasparam_S25_R5_60,linear_biasparam_S25_R5_60b,
                       linear_biasparam_S25_R75_60,linear_biasparam_S25_R75_60b,
                       linear_biasparam_S5_R5_60,linear_biasparam_S5_R5_60b,
                       linear_biasparam_S5_R75_60,linear_biasparam_S5_R75_60b,
                       linear_biasparam_S75_R5_60,linear_biasparam_S75_R5_60b,
                       linear_biasparam_S75_R75_60,linear_biasparam_S75_R75_60b,
                       epicenter_biasparam_S25_R5_60,epicenter_biasparam_S25_R5_60b,
                       epicenter_biasparam_S25_R75_60,epicenter_biasparam_S25_R75_60b,
                       epicenter_biasparam_S5_R5_60,epicenter_biasparam_S5_R5_60b,
                       epicenter_biasparam_S5_R75_60,epicenter_biasparam_S5_R75_60b,
                       epicenter_biasparam_S75_R5_60,epicenter_biasparam_S75_R5_60b,
                       epicenter_biasparam_S75_R75_60,epicenter_biasparam_S75_R75_60b)


#-- Combine bias --#
bias_params <- rbind(bias_param_20, bias_param_40, bias_param_60)

##### results -p ####
bias_params$rates <- paste0('(p = )', bias_params$detection, ',  \u03F5 = ', bias_params$eradication)
bias_params$rates2 <- paste0('(', bias_params$detection, ', ', bias_params$eradication, ")")
bias_params$loc2 <- paste0(bias_params$location, bias_params$detection, bias_params$eradication)

bias_param_detect  <- bias_params %>% filter(param %in% c("B0.p.h", "B0.p.h", "B1.p.l", "B1.p.h"))

##### results -eps ####
bias_param_eps  <- bias_params %>% filter(param %in% c("B0.eps.h", "B0.eps.h", "B1.eps.l", "B1.eps.h"))


#### Sites visit ####
#-- Budget = 20 --#
##### hstatebins #####
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_20 <- fread(file_name)
sites_S25_R5_20 <- data.frame(sites_S25_R5_20)[-1]

sites_S25_R5_20$location <- 'hstatebins'
sites_S25_R5_20$detection <- 0.25
sites_S25_R5_20$eradication <- 0.5
sites_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_20b <- fread(file_name)
sites_S25_R5_20b <- data.frame(sites_S25_R5_20b)[-1]

sites_S25_R5_20b$location <- 'hstatebins'
sites_S25_R5_20b$detection <- 0.25
sites_S25_R5_20b$eradication <- 0.5
sites_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_20 <- fread(file_name)
sites_S25_R75_20 <- data.frame(sites_S25_R75_20)[-1]

sites_S25_R75_20$location <- 'hstatebins'
sites_S25_R75_20$detection <- 0.25
sites_S25_R75_20$eradication <- 0.75
sites_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_20b <- fread(file_name)
sites_S25_R75_20b <- data.frame(sites_S25_R75_20b)[-1]

sites_S25_R75_20b$location <- 'hstatebins'
sites_S25_R75_20b$detection <- 0.25
sites_S25_R75_20b$eradication <- 0.75
sites_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_20 <- fread(file_name)
sites_S5_R5_20 <- data.frame(sites_S5_R5_20)[-1]

sites_S5_R5_20$location <- 'hstatebins'
sites_S5_R5_20$detection <- 0.5
sites_S5_R5_20$eradication <- 0.5
sites_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_20b <- fread(file_name)
sites_S5_R5_20b <- data.frame(sites_S5_R5_20b)[-1]

sites_S5_R5_20b$location <- 'hstatebins'
sites_S5_R5_20b$detection <- 0.5
sites_S5_R5_20b$eradication <- 0.5
sites_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_20 <- fread(file_name)
sites_S5_R75_20 <- data.frame(sites_S5_R75_20)[-1]

sites_S5_R75_20$location <- 'hstatebins'
sites_S5_R75_20$detection <- 0.5
sites_S5_R75_20$eradication <- 0.75
sites_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_20b <- fread(file_name)
sites_S5_R75_20b <- data.frame(sites_S5_R75_20b)[-1]

sites_S5_R75_20b$location <- 'hstatebins'
sites_S5_R75_20b$detection <- 0.5
sites_S5_R75_20b$eradication <- 0.75
sites_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_20 <- fread(file_name)
sites_S75_R5_20 <- data.frame(sites_S75_R5_20)[-1]

sites_S75_R5_20$location <- 'hstatebins'
sites_S75_R5_20$detection <- 0.75
sites_S75_R5_20$eradication <- 0.5
sites_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_20b <- fread(file_name)
sites_S75_R5_20b <- data.frame(sites_S75_R5_20b)[-1]

sites_S75_R5_20b$location <- 'hstatebins'
sites_S75_R5_20b$detection <- 0.75
sites_S75_R5_20b$eradication <- 0.5
sites_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_20 <- fread(file_name)
sites_S75_R75_20 <- data.frame(sites_S75_R75_20)[-1]

sites_S75_R75_20$location <- 'hstatebins'
sites_S75_R75_20$detection <- 0.75
sites_S75_R75_20$eradication <- 0.75
sites_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_20b <- fread(file_name)
sites_S75_R75_20b <- data.frame(sites_S75_R75_20b)[-1]

sites_S75_R75_20b$location <- 'hstatebins'
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

#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40 <- fread(file_name)
sites_S25_R5_40 <- data.frame(sites_S25_R5_40)[-1]

sites_S25_R5_40$location <- 'hstatebins'
sites_S25_R5_40$detection <- 0.25
sites_S25_R5_40$eradication <- 0.5
sites_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40b <- fread(file_name)
sites_S25_R5_40b <- data.frame(sites_S25_R5_40b)[-1]

sites_S25_R5_40b$location <- 'hstatebins'
sites_S25_R5_40b$detection <- 0.25
sites_S25_R5_40b$eradication <- 0.5
sites_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40 <- fread(file_name)
sites_S25_R75_40 <- data.frame(sites_S25_R75_40)[-1]

sites_S25_R75_40$location <- 'hstatebins'
sites_S25_R75_40$detection <- 0.25
sites_S25_R75_40$eradication <- 0.75
sites_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40b <- fread(file_name)
sites_S25_R75_40b <- data.frame(sites_S25_R75_40b)[-1]

sites_S25_R75_40b$location <- 'hstatebins'
sites_S25_R75_40b$detection <- 0.25
sites_S25_R75_40b$eradication <- 0.75
sites_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40 <- fread(file_name)
sites_S5_R5_40 <- data.frame(sites_S5_R5_40)[-1]

sites_S5_R5_40$location <- 'hstatebins'
sites_S5_R5_40$detection <- 0.5
sites_S5_R5_40$eradication <- 0.5
sites_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40b <- fread(file_name)
sites_S5_R5_40b <- data.frame(sites_S5_R5_40b)[-1]

sites_S5_R5_40b$location <- 'hstatebins'
sites_S5_R5_40b$detection <- 0.5
sites_S5_R5_40b$eradication <- 0.5
sites_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40 <- fread(file_name)
sites_S5_R75_40 <- data.frame(sites_S5_R75_40)[-1]

sites_S5_R75_40$location <- 'hstatebins'
sites_S5_R75_40$detection <- 0.5
sites_S5_R75_40$eradication <- 0.75
sites_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40b <- fread(file_name)
sites_S5_R75_40b <- data.frame(sites_S5_R75_40b)[-1]

sites_S5_R75_40b$location <- 'hstatebins'
sites_S5_R75_40b$detection <- 0.5
sites_S5_R75_40b$eradication <- 0.75
sites_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40 <- fread(file_name)
sites_S75_R5_40 <- data.frame(sites_S75_R5_40)[-1]

sites_S75_R5_40$location <- 'hstatebins'
sites_S75_R5_40$detection <- 0.75
sites_S75_R5_40$eradication <- 0.5
sites_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40b <- fread(file_name)
sites_S75_R5_40b <- data.frame(sites_S75_R5_40b)[-1]

sites_S75_R5_40b$location <- 'hstatebins'
sites_S75_R5_40b$detection <- 0.75
sites_S75_R5_40b$eradication <- 0.5
sites_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40 <- fread(file_name)
sites_S75_R75_40 <- data.frame(sites_S75_R75_40)[-1]

sites_S75_R75_40$location <- 'hstatebins'
sites_S75_R75_40$detection <- 0.75
sites_S75_R75_40$eradication <- 0.75
sites_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40b <- fread(file_name)
sites_S75_R75_40b <- data.frame(sites_S75_R75_40b)[-1]

sites_S75_R75_40b$location <- 'hstatebins'
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

#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_60 <- fread(file_name)
sites_S25_R5_60 <- data.frame(sites_S25_R5_60)[-1]

sites_S25_R5_60$location <- 'hstatebins'
sites_S25_R5_60$detection <- 0.25
sites_S25_R5_60$eradication <- 0.5
sites_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_60b <- fread(file_name)
sites_S25_R5_60b <- data.frame(sites_S25_R5_60b)[-1]

sites_S25_R5_60b$location <- 'hstatebins'
sites_S25_R5_60b$detection <- 0.25
sites_S25_R5_60b$eradication <- 0.5
sites_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_60 <- fread(file_name)
sites_S25_R75_60 <- data.frame(sites_S25_R75_60)[-1]

sites_S25_R75_60$location <- 'hstatebins'
sites_S25_R75_60$detection <- 0.25
sites_S25_R75_60$eradication <- 0.75
sites_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_60b <- fread(file_name)
sites_S25_R75_60b <- data.frame(sites_S25_R75_60b)[-1]

sites_S25_R75_60b$location <- 'hstatebins'
sites_S25_R75_60b$detection <- 0.25
sites_S25_R75_60b$eradication <- 0.75
sites_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_60 <- fread(file_name)
sites_S5_R5_60 <- data.frame(sites_S5_R5_60)[-1]

sites_S5_R5_60$location <- 'hstatebins'
sites_S5_R5_60$detection <- 0.5
sites_S5_R5_60$eradication <- 0.5
sites_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_60b <- fread(file_name)
sites_S5_R5_60b <- data.frame(sites_S5_R5_60b)[-1]

sites_S5_R5_60b$location <- 'hstatebins'
sites_S5_R5_60b$detection <- 0.5
sites_S5_R5_60b$eradication <- 0.5
sites_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_60 <- fread(file_name)
sites_S5_R75_60 <- data.frame(sites_S5_R75_60)[-1]

sites_S5_R75_60$location <- 'hstatebins'
sites_S5_R75_60$detection <- 0.5
sites_S5_R75_60$eradication <- 0.75
sites_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_60b <- fread(file_name)
sites_S5_R75_60b <- data.frame(sites_S5_R75_60b)[-1]

sites_S5_R75_60b$location <- 'hstatebins'
sites_S5_R75_60b$detection <- 0.5
sites_S5_R75_60b$eradication <- 0.75
sites_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_60 <- fread(file_name)
sites_S75_R5_60 <- data.frame(sites_S75_R5_60)[-1]

sites_S75_R5_60$location <- 'hstatebins'
sites_S75_R5_60$detection <- 0.75
sites_S75_R5_60$eradication <- 0.5
sites_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_60b <- fread(file_name)
sites_S75_R5_60b <- data.frame(sites_S75_R5_60b)[-1]

sites_S75_R5_60b$location <- 'hstatebins'
sites_S75_R5_60b$detection <- 0.75
sites_S75_R5_60b$eradication <- 0.5
sites_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_60 <- fread(file_name)
sites_S75_R75_60 <- data.frame(sites_S75_R75_60)[-1]

sites_S75_R75_60$location <- 'hstatebins'
sites_S75_R75_60$detection <- 0.75
sites_S75_R75_60$eradication <- 0.75
sites_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_60b <- fread(file_name)
sites_S75_R75_60b <- data.frame(sites_S75_R75_60b)[-1]

sites_S75_R75_60b$location <- 'hstatebins'
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

sites_hsd <- rbind(sites_20, sites_40, sites_60 )


##### linear #####
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

sites_linear <- rbind(sites_20, sites_40, sites_60 )

##### epicenter #####
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_20 <- fread(file_name)
sites_S25_R5_20 <- data.frame(sites_S25_R5_20)[-1]

sites_S25_R5_20$location <- 'epicenter'
sites_S25_R5_20$detection <- 0.25
sites_S25_R5_20$eradication <- 0.5
sites_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_20b <- fread(file_name)
sites_S25_R5_20b <- data.frame(sites_S25_R5_20b)[-1]

sites_S25_R5_20b$location <- 'epicenter'
sites_S25_R5_20b$detection <- 0.25
sites_S25_R5_20b$eradication <- 0.5
sites_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_20 <- fread(file_name)
sites_S25_R75_20 <- data.frame(sites_S25_R75_20)[-1]

sites_S25_R75_20$location <- 'epicenter'
sites_S25_R75_20$detection <- 0.25
sites_S25_R75_20$eradication <- 0.75
sites_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_20b <- fread(file_name)
sites_S25_R75_20b <- data.frame(sites_S25_R75_20b)[-1]

sites_S25_R75_20b$location <- 'epicenter'
sites_S25_R75_20b$detection <- 0.25
sites_S25_R75_20b$eradication <- 0.75
sites_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_20 <- fread(file_name)
sites_S5_R5_20 <- data.frame(sites_S5_R5_20)[-1]

sites_S5_R5_20$location <- 'epicenter'
sites_S5_R5_20$detection <- 0.5
sites_S5_R5_20$eradication <- 0.5
sites_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_20b <- fread(file_name)
sites_S5_R5_20b <- data.frame(sites_S5_R5_20b)[-1]

sites_S5_R5_20b$location <- 'epicenter'
sites_S5_R5_20b$detection <- 0.5
sites_S5_R5_20b$eradication <- 0.5
sites_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_20 <- fread(file_name)
sites_S5_R75_20 <- data.frame(sites_S5_R75_20)[-1]

sites_S5_R75_20$location <- 'epicenter'
sites_S5_R75_20$detection <- 0.5
sites_S5_R75_20$eradication <- 0.75
sites_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_20b <- fread(file_name)
sites_S5_R75_20b <- data.frame(sites_S5_R75_20b)[-1]

sites_S5_R75_20b$location <- 'epicenter'
sites_S5_R75_20b$detection <- 0.5
sites_S5_R75_20b$eradication <- 0.75
sites_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_20 <- fread(file_name)
sites_S75_R5_20 <- data.frame(sites_S75_R5_20)[-1]

sites_S75_R5_20$location <- 'epicenter'
sites_S75_R5_20$detection <- 0.75
sites_S75_R5_20$eradication <- 0.5
sites_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_20b <- fread(file_name)
sites_S75_R5_20b <- data.frame(sites_S75_R5_20b)[-1]

sites_S75_R5_20b$location <- 'epicenter'
sites_S75_R5_20b$detection <- 0.75
sites_S75_R5_20b$eradication <- 0.5
sites_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_20 <- fread(file_name)
sites_S75_R75_20 <- data.frame(sites_S75_R75_20)[-1]

sites_S75_R75_20$location <- 'epicenter'
sites_S75_R75_20$detection <- 0.75
sites_S75_R75_20$eradication <- 0.75
sites_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_20b <- fread(file_name)
sites_S75_R75_20b <- data.frame(sites_S75_R75_20b)[-1]

sites_S75_R75_20b$location <- 'epicenter'
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

#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40 <- fread(file_name)
sites_S25_R5_40 <- data.frame(sites_S25_R5_40)[-1]

sites_S25_R5_40$location <- 'epicenter'
sites_S25_R5_40$detection <- 0.25
sites_S25_R5_40$eradication <- 0.5
sites_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_40b <- fread(file_name)
sites_S25_R5_40b <- data.frame(sites_S25_R5_40b)[-1]

sites_S25_R5_40b$location <- 'epicenter'
sites_S25_R5_40b$detection <- 0.25
sites_S25_R5_40b$eradication <- 0.5
sites_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40 <- fread(file_name)
sites_S25_R75_40 <- data.frame(sites_S25_R75_40)[-1]

sites_S25_R75_40$location <- 'epicenter'
sites_S25_R75_40$detection <- 0.25
sites_S25_R75_40$eradication <- 0.75
sites_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_40b <- fread(file_name)
sites_S25_R75_40b <- data.frame(sites_S25_R75_40b)[-1]

sites_S25_R75_40b$location <- 'epicenter'
sites_S25_R75_40b$detection <- 0.25
sites_S25_R75_40b$eradication <- 0.75
sites_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40 <- fread(file_name)
sites_S5_R5_40 <- data.frame(sites_S5_R5_40)[-1]

sites_S5_R5_40$location <- 'epicenter'
sites_S5_R5_40$detection <- 0.5
sites_S5_R5_40$eradication <- 0.5
sites_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_40b <- fread(file_name)
sites_S5_R5_40b <- data.frame(sites_S5_R5_40b)[-1]

sites_S5_R5_40b$location <- 'epicenter'
sites_S5_R5_40b$detection <- 0.5
sites_S5_R5_40b$eradication <- 0.5
sites_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40 <- fread(file_name)
sites_S5_R75_40 <- data.frame(sites_S5_R75_40)[-1]

sites_S5_R75_40$location <- 'epicenter'
sites_S5_R75_40$detection <- 0.5
sites_S5_R75_40$eradication <- 0.75
sites_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40b <- fread(file_name)
sites_S5_R75_40b <- data.frame(sites_S5_R75_40b)[-1]

sites_S5_R75_40b$location <- 'epicenter'
sites_S5_R75_40b$detection <- 0.5
sites_S5_R75_40b$eradication <- 0.75
sites_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40 <- fread(file_name)
sites_S75_R5_40 <- data.frame(sites_S75_R5_40)[-1]

sites_S75_R5_40$location <- 'epicenter'
sites_S75_R5_40$detection <- 0.75
sites_S75_R5_40$eradication <- 0.5
sites_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_40b <- fread(file_name)
sites_S75_R5_40b <- data.frame(sites_S75_R5_40b)[-1]

sites_S75_R5_40b$location <- 'epicenter'
sites_S75_R5_40b$detection <- 0.75
sites_S75_R5_40b$eradication <- 0.5
sites_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40 <- fread(file_name)
sites_S75_R75_40 <- data.frame(sites_S75_R75_40)[-1]

sites_S75_R75_40$location <- 'epicenter'
sites_S75_R75_40$detection <- 0.75
sites_S75_R75_40$eradication <- 0.75
sites_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_40b <- fread(file_name)
sites_S75_R75_40b <- data.frame(sites_S75_R75_40b)[-1]

sites_S75_R75_40b$location <- 'epicenter'
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


#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_60 <- fread(file_name)
sites_S25_R5_60 <- data.frame(sites_S25_R5_60)[-1]

sites_S25_R5_60$location <- 'epicenter'
sites_S25_R5_60$detection <- 0.25
sites_S25_R5_60$eradication <- 0.5
sites_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R5_60b <- fread(file_name)
sites_S25_R5_60b <- data.frame(sites_S25_R5_60b)[-1]

sites_S25_R5_60b$location <- 'epicenter'
sites_S25_R5_60b$detection <- 0.25
sites_S25_R5_60b$eradication <- 0.5
sites_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_60 <- fread(file_name)
sites_S25_R75_60 <- data.frame(sites_S25_R75_60)[-1]

sites_S25_R75_60$location <- 'epicenter'
sites_S25_R75_60$detection <- 0.25
sites_S25_R75_60$eradication <- 0.75
sites_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S25_R75_60b <- fread(file_name)
sites_S25_R75_60b <- data.frame(sites_S25_R75_60b)[-1]

sites_S25_R75_60b$location <- 'epicenter'
sites_S25_R75_60b$detection <- 0.25
sites_S25_R75_60b$eradication <- 0.75
sites_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_60 <- fread(file_name)
sites_S5_R5_60 <- data.frame(sites_S5_R5_60)[-1]

sites_S5_R5_60$location <- 'epicenter'
sites_S5_R5_60$detection <- 0.5
sites_S5_R5_60$eradication <- 0.5
sites_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R5_60b <- fread(file_name)
sites_S5_R5_60b <- data.frame(sites_S5_R5_60b)[-1]

sites_S5_R5_60b$location <- 'epicenter'
sites_S5_R5_60b$detection <- 0.5
sites_S5_R5_60b$eradication <- 0.5
sites_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_60 <- fread(file_name)
sites_S5_R75_60 <- data.frame(sites_S5_R75_60)[-1]

sites_S5_R75_60$location <- 'epicenter'
sites_S5_R75_60$detection <- 0.5
sites_S5_R75_60$eradication <- 0.75
sites_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_60b <- fread(file_name)
sites_S5_R75_60b <- data.frame(sites_S5_R75_60b)[-1]

sites_S5_R75_60b$location <- 'epicenter'
sites_S5_R75_60b$detection <- 0.5
sites_S5_R75_60b$eradication <- 0.75
sites_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_60 <- fread(file_name)
sites_S75_R5_60 <- data.frame(sites_S75_R5_60)[-1]

sites_S75_R5_60$location <- 'epicenter'
sites_S75_R5_60$detection <- 0.75
sites_S75_R5_60$eradication <- 0.5
sites_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R5_60b <- fread(file_name)
sites_S75_R5_60b <- data.frame(sites_S75_R5_60b)[-1]

sites_S75_R5_60b$location <- 'epicenter'
sites_S75_R5_60b$detection <- 0.75
sites_S75_R5_60b$eradication <- 0.5
sites_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_60 <- fread(file_name)
sites_S75_R75_60 <- data.frame(sites_S75_R75_60)[-1]

sites_S75_R75_60$location <- 'epicenter'
sites_S75_R75_60$detection <- 0.75
sites_S75_R75_60$eradication <- 0.75
sites_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S75_R75_60b <- fread(file_name)
sites_S75_R75_60b <- data.frame(sites_S75_R75_60b)[-1]

sites_S75_R75_60b$location <- 'epicenter'
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

sites_epicenter <- rbind(sites_20, sites_40, sites_60)

sites <- rbind(sites_hsd, sites_linear, sites_epicenter)

sites$visit[sites$visit > 1] <- 1

sites_visit <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                         data = as.data.frame(sites), 
                         FUN = sum)

sites_visit <- sites_visit %>% filter(week < 5)
sites_visit$visit <- sites_visit$visit/40


#### dist traveled ####
#-- Budget = 20 --#
##### hstatebins #####
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_20 <- fread(file_name)
dist_S25_R5_20 <- data.frame(dist_S25_R5_20)[-1]

dist_S25_R5_20$location <- 'hstatebins'
dist_S25_R5_20$detection <- 0.25
dist_S25_R5_20$eradication <- 0.5
dist_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_20b <- fread(file_name)
dist_S25_R5_20b <- data.frame(dist_S25_R5_20b)[-1]

dist_S25_R5_20b$location <- 'hstatebins'
dist_S25_R5_20b$detection <- 0.25
dist_S25_R5_20b$eradication <- 0.5
dist_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_20 <- fread(file_name)
dist_S25_R75_20 <- data.frame(dist_S25_R75_20)[-1]

dist_S25_R75_20$location <- 'hstatebins'
dist_S25_R75_20$detection <- 0.25
dist_S25_R75_20$eradication <- 0.75
dist_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_20b <- fread(file_name)
dist_S25_R75_20b <- data.frame(dist_S25_R75_20b)[-1]

dist_S25_R75_20b$location <- 'hstatebins'
dist_S25_R75_20b$detection <- 0.25
dist_S25_R75_20b$eradication <- 0.75
dist_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_20 <- fread(file_name)
dist_S5_R5_20 <- data.frame(dist_S5_R5_20)[-1]

dist_S5_R5_20$location <- 'hstatebins'
dist_S5_R5_20$detection <- 0.5
dist_S5_R5_20$eradication <- 0.5
dist_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_20b <- fread(file_name)
dist_S5_R5_20b <- data.frame(dist_S5_R5_20b)[-1]

dist_S5_R5_20b$location <- 'hstatebins'
dist_S5_R5_20b$detection <- 0.5
dist_S5_R5_20b$eradication <- 0.5
dist_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_20 <- fread(file_name)
dist_S5_R75_20 <- data.frame(dist_S5_R75_20)[-1]

dist_S5_R75_20$location <- 'hstatebins'
dist_S5_R75_20$detection <- 0.5
dist_S5_R75_20$eradication <- 0.75
dist_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_20b <- fread(file_name)
dist_S5_R75_20b <- data.frame(dist_S5_R75_20b)[-1]

dist_S5_R75_20b$location <- 'hstatebins'
dist_S5_R75_20b$detection <- 0.5
dist_S5_R75_20b$eradication <- 0.75
dist_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_20 <- fread(file_name)
dist_S75_R5_20 <- data.frame(dist_S75_R5_20)[-1]

dist_S75_R5_20$location <- 'hstatebins'
dist_S75_R5_20$detection <- 0.75
dist_S75_R5_20$eradication <- 0.5
dist_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_20b <- fread(file_name)
dist_S75_R5_20b <- data.frame(dist_S75_R5_20b)[-1]

dist_S75_R5_20b$location <- 'hstatebins'
dist_S75_R5_20b$detection <- 0.75
dist_S75_R5_20b$eradication <- 0.5
dist_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_20 <- fread(file_name)
dist_S75_R75_20 <- data.frame(dist_S75_R75_20)[-1]

dist_S75_R75_20$location <- 'hstatebins'
dist_S75_R75_20$detection <- 0.75
dist_S75_R75_20$eradication <- 0.75
dist_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_20b <- fread(file_name)
dist_S75_R75_20b <- data.frame(dist_S75_R75_20b)[-1]

dist_S75_R75_20b$location <- 'hstatebins'
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

#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_40 <- fread(file_name)
dist_S25_R5_40 <- data.frame(dist_S25_R5_40)[-1]

dist_S25_R5_40$location <- 'hstatebins'
dist_S25_R5_40$detection <- 0.25
dist_S25_R5_40$eradication <- 0.5
dist_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_40b <- fread(file_name)
dist_S25_R5_40b <- data.frame(dist_S25_R5_40b)[-1]

dist_S25_R5_40b$location <- 'hstatebins'
dist_S25_R5_40b$detection <- 0.25
dist_S25_R5_40b$eradication <- 0.5
dist_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_40 <- fread(file_name)
dist_S25_R75_40 <- data.frame(dist_S25_R75_40)[-1]

dist_S25_R75_40$location <- 'hstatebins'
dist_S25_R75_40$detection <- 0.25
dist_S25_R75_40$eradication <- 0.75
dist_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_40b <- fread(file_name)
dist_S25_R75_40b <- data.frame(dist_S25_R75_40b)[-1]

dist_S25_R75_40b$location <- 'hstatebins'
dist_S25_R75_40b$detection <- 0.25
dist_S25_R75_40b$eradication <- 0.75
dist_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_40 <- fread(file_name)
dist_S5_R5_40 <- data.frame(dist_S5_R5_40)[-1]

dist_S5_R5_40$location <- 'hstatebins'
dist_S5_R5_40$detection <- 0.5
dist_S5_R5_40$eradication <- 0.5
dist_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_40b <- fread(file_name)
dist_S5_R5_40b <- data.frame(dist_S5_R5_40b)[-1]

dist_S5_R5_40b$location <- 'hstatebins'
dist_S5_R5_40b$detection <- 0.5
dist_S5_R5_40b$eradication <- 0.5
dist_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_40 <- fread(file_name)
dist_S5_R75_40 <- data.frame(dist_S5_R75_40)[-1]

dist_S5_R75_40$location <- 'hstatebins'
dist_S5_R75_40$detection <- 0.5
dist_S5_R75_40$eradication <- 0.75
dist_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_40b <- fread(file_name)
dist_S5_R75_40b <- data.frame(dist_S5_R75_40b)[-1]

dist_S5_R75_40b$location <- 'hstatebins'
dist_S5_R75_40b$detection <- 0.5
dist_S5_R75_40b$eradication <- 0.75
dist_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_40 <- fread(file_name)
dist_S75_R5_40 <- data.frame(dist_S75_R5_40)[-1]

dist_S75_R5_40$location <- 'hstatebins'
dist_S75_R5_40$detection <- 0.75
dist_S75_R5_40$eradication <- 0.5
dist_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_40b <- fread(file_name)
dist_S75_R5_40b <- data.frame(dist_S75_R5_40b)[-1]

dist_S75_R5_40b$location <- 'hstatebins'
dist_S75_R5_40b$detection <- 0.75
dist_S75_R5_40b$eradication <- 0.5
dist_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_40 <- fread(file_name)
dist_S75_R75_40 <- data.frame(dist_S75_R75_40)[-1]

dist_S75_R75_40$location <- 'hstatebins'
dist_S75_R75_40$detection <- 0.75
dist_S75_R75_40$eradication <- 0.75
dist_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_40b <- fread(file_name)
dist_S75_R75_40b <- data.frame(dist_S75_R75_40b)[-1]

dist_S75_R75_40b$location <- 'hstatebins'
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

#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_60 <- fread(file_name)
dist_S25_R5_60 <- data.frame(dist_S25_R5_60)[-1]

dist_S25_R5_60$location <- 'hstatebins'
dist_S25_R5_60$detection <- 0.25
dist_S25_R5_60$eradication <- 0.5
dist_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R5_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_60b <- fread(file_name)
dist_S25_R5_60b <- data.frame(dist_S25_R5_60b)[-1]

dist_S25_R5_60b$location <- 'hstatebins'
dist_S25_R5_60b$detection <- 0.25
dist_S25_R5_60b$eradication <- 0.5
dist_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_60 <- fread(file_name)
dist_S25_R75_60 <- data.frame(dist_S25_R75_60)[-1]

dist_S25_R75_60$location <- 'hstatebins'
dist_S25_R75_60$detection <- 0.25
dist_S25_R75_60$eradication <- 0.75
dist_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S25_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_60b <- fread(file_name)
dist_S25_R75_60b <- data.frame(dist_S25_R75_60b)[-1]

dist_S25_R75_60b$location <- 'hstatebins'
dist_S25_R75_60b$detection <- 0.25
dist_S25_R75_60b$eradication <- 0.75
dist_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_60 <- fread(file_name)
dist_S5_R5_60 <- data.frame(dist_S5_R5_60)[-1]

dist_S5_R5_60$location <- 'hstatebins'
dist_S5_R5_60$detection <- 0.5
dist_S5_R5_60$eradication <- 0.5
dist_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R5_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_60b <- fread(file_name)
dist_S5_R5_60b <- data.frame(dist_S5_R5_60b)[-1]

dist_S5_R5_60b$location <- 'hstatebins'
dist_S5_R5_60b$detection <- 0.5
dist_S5_R5_60b$eradication <- 0.5
dist_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_60 <- fread(file_name)
dist_S5_R75_60 <- data.frame(dist_S5_R75_60)[-1]

dist_S5_R75_60$location <- 'hstatebins'
dist_S5_R75_60$detection <- 0.5
dist_S5_R75_60$eradication <- 0.75
dist_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S5_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_60b <- fread(file_name)
dist_S5_R75_60b <- data.frame(dist_S5_R75_60b)[-1]

dist_S5_R75_60b$location <- 'hstatebins'
dist_S5_R75_60b$detection <- 0.5
dist_S5_R75_60b$eradication <- 0.75
dist_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_60 <- fread(file_name)
dist_S75_R5_60 <- data.frame(dist_S75_R5_60)[-1]

dist_S75_R5_60$location <- 'hstatebins'
dist_S75_R5_60$detection <- 0.75
dist_S75_R5_60$eradication <- 0.5
dist_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R5_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_60b <- fread(file_name)
dist_S75_R5_60b <- data.frame(dist_S75_R5_60b)[-1]

dist_S75_R5_60b$location <- 'hstatebins'
dist_S75_R5_60b$detection <- 0.75
dist_S75_R5_60b$eradication <- 0.5
dist_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_60 <- fread(file_name)
dist_S75_R75_60 <- data.frame(dist_S75_R75_60)[-1]

dist_S75_R75_60$location <- 'hstatebins'
dist_S75_R75_60$detection <- 0.75
dist_S75_R75_60$eradication <- 0.75
dist_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\hstatebins\\S75_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_60b <- fread(file_name)
dist_S75_R75_60b <- data.frame(dist_S75_R75_60b)[-1]

dist_S75_R75_60b$location <- 'hstatebins'
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

dist_hsd <- rbind(dist_20, dist_40, dist_60)

##### linear #####
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


dist_linear <- rbind(dist_20, dist_40, dist_60)

##### epicenter #####
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_20 <- fread(file_name)
dist_S25_R5_20 <- data.frame(dist_S25_R5_20)[-1]

dist_S25_R5_20$location <- 'epicenter'
dist_S25_R5_20$detection <- 0.25
dist_S25_R5_20$eradication <- 0.5
dist_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_20b <- fread(file_name)
dist_S25_R5_20b <- data.frame(dist_S25_R5_20b)[-1]

dist_S25_R5_20b$location <- 'epicenter'
dist_S25_R5_20b$detection <- 0.25
dist_S25_R5_20b$eradication <- 0.5
dist_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_20 <- fread(file_name)
dist_S25_R75_20 <- data.frame(dist_S25_R75_20)[-1]

dist_S25_R75_20$location <- 'epicenter'
dist_S25_R75_20$detection <- 0.25
dist_S25_R75_20$eradication <- 0.75
dist_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_20b <- fread(file_name)
dist_S25_R75_20b <- data.frame(dist_S25_R75_20b)[-1]

dist_S25_R75_20b$location <- 'epicenter'
dist_S25_R75_20b$detection <- 0.25
dist_S25_R75_20b$eradication <- 0.75
dist_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_20 <- fread(file_name)
dist_S5_R5_20 <- data.frame(dist_S5_R5_20)[-1]

dist_S5_R5_20$location <- 'epicenter'
dist_S5_R5_20$detection <- 0.5
dist_S5_R5_20$eradication <- 0.5
dist_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_20b <- fread(file_name)
dist_S5_R5_20b <- data.frame(dist_S5_R5_20b)[-1]

dist_S5_R5_20b$location <- 'epicenter'
dist_S5_R5_20b$detection <- 0.5
dist_S5_R5_20b$eradication <- 0.5
dist_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_20 <- fread(file_name)
dist_S5_R75_20 <- data.frame(dist_S5_R75_20)[-1]

dist_S5_R75_20$location <- 'epicenter'
dist_S5_R75_20$detection <- 0.5
dist_S5_R75_20$eradication <- 0.75
dist_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_20b <- fread(file_name)
dist_S5_R75_20b <- data.frame(dist_S5_R75_20b)[-1]

dist_S5_R75_20b$location <- 'epicenter'
dist_S5_R75_20b$detection <- 0.5
dist_S5_R75_20b$eradication <- 0.75
dist_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_20 <- fread(file_name)
dist_S75_R5_20 <- data.frame(dist_S75_R5_20)[-1]

dist_S75_R5_20$location <- 'epicenter'
dist_S75_R5_20$detection <- 0.75
dist_S75_R5_20$eradication <- 0.5
dist_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_20b <- fread(file_name)
dist_S75_R5_20b <- data.frame(dist_S75_R5_20b)[-1]

dist_S75_R5_20b$location <- 'epicenter'
dist_S75_R5_20b$detection <- 0.75
dist_S75_R5_20b$eradication <- 0.5
dist_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_20 <- fread(file_name)
dist_S75_R75_20 <- data.frame(dist_S75_R75_20)[-1]

dist_S75_R75_20$location <- 'epicenter'
dist_S75_R75_20$detection <- 0.75
dist_S75_R75_20$eradication <- 0.75
dist_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_20_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_20b <- fread(file_name)
dist_S75_R75_20b <- data.frame(dist_S75_R75_20b)[-1]

dist_S75_R75_20b$location <- 'epicenter'
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

#--- S25_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_40 <- fread(file_name)
dist_S25_R5_40 <- data.frame(dist_S25_R5_40)[-1]

dist_S25_R5_40$location <- 'epicenter'
dist_S25_R5_40$detection <- 0.25
dist_S25_R5_40$eradication <- 0.5
dist_S25_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_40b <- fread(file_name)
dist_S25_R5_40b <- data.frame(dist_S25_R5_40b)[-1]

dist_S25_R5_40b$location <- 'epicenter'
dist_S25_R5_40b$detection <- 0.25
dist_S25_R5_40b$eradication <- 0.5
dist_S25_R5_40b$budget <- 40

#--- S25_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_40 <- fread(file_name)
dist_S25_R75_40 <- data.frame(dist_S25_R75_40)[-1]

dist_S25_R75_40$location <- 'epicenter'
dist_S25_R75_40$detection <- 0.25
dist_S25_R75_40$eradication <- 0.75
dist_S25_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_40b <- fread(file_name)
dist_S25_R75_40b <- data.frame(dist_S25_R75_40b)[-1]

dist_S25_R75_40b$location <- 'epicenter'
dist_S25_R75_40b$detection <- 0.25
dist_S25_R75_40b$eradication <- 0.75
dist_S25_R75_40b$budget <- 40

#--- S5_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_40 <- fread(file_name)
dist_S5_R5_40 <- data.frame(dist_S5_R5_40)[-1]

dist_S5_R5_40$location <- 'epicenter'
dist_S5_R5_40$detection <- 0.5
dist_S5_R5_40$eradication <- 0.5
dist_S5_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_40b <- fread(file_name)
dist_S5_R5_40b <- data.frame(dist_S5_R5_40b)[-1]

dist_S5_R5_40b$location <- 'epicenter'
dist_S5_R5_40b$detection <- 0.5
dist_S5_R5_40b$eradication <- 0.5
dist_S5_R5_40b$budget <- 40

#--- S5_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_40 <- fread(file_name)
dist_S5_R75_40 <- data.frame(dist_S5_R75_40)[-1]

dist_S5_R75_40$location <- 'epicenter'
dist_S5_R75_40$detection <- 0.5
dist_S5_R75_40$eradication <- 0.75
dist_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_40b <- fread(file_name)
dist_S5_R75_40b <- data.frame(dist_S5_R75_40b)[-1]

dist_S5_R75_40b$location <- 'epicenter'
dist_S5_R75_40b$detection <- 0.5
dist_S5_R75_40b$eradication <- 0.75
dist_S5_R75_40b$budget <- 40

#--- S75_R5_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_40 <- fread(file_name)
dist_S75_R5_40 <- data.frame(dist_S75_R5_40)[-1]

dist_S75_R5_40$location <- 'epicenter'
dist_S75_R5_40$detection <- 0.75
dist_S75_R5_40$eradication <- 0.5
dist_S75_R5_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_40b <- fread(file_name)
dist_S75_R5_40b <- data.frame(dist_S75_R5_40b)[-1]

dist_S75_R5_40b$location <- 'epicenter'
dist_S75_R5_40b$detection <- 0.75
dist_S75_R5_40b$eradication <- 0.5
dist_S75_R5_40b$budget <- 40

#--- S75_R75_40 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_40 <- fread(file_name)
dist_S75_R75_40 <- data.frame(dist_S75_R75_40)[-1]

dist_S75_R75_40$location <- 'epicenter'
dist_S75_R75_40$detection <- 0.75
dist_S75_R75_40$eradication <- 0.75
dist_S75_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_40b <- fread(file_name)
dist_S75_R75_40b <- data.frame(dist_S75_R75_40b)[-1]

dist_S75_R75_40b$location <- 'epicenter'
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

#--- S25_R5_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_60 <- fread(file_name)
dist_S25_R5_60 <- data.frame(dist_S25_R5_60)[-1]

dist_S25_R5_60$location <- 'epicenter'
dist_S25_R5_60$detection <- 0.25
dist_S25_R5_60$eradication <- 0.5
dist_S25_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R5_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R5_60b <- fread(file_name)
dist_S25_R5_60b <- data.frame(dist_S25_R5_60b)[-1]

dist_S25_R5_60b$location <- 'epicenter'
dist_S25_R5_60b$detection <- 0.25
dist_S25_R5_60b$eradication <- 0.5
dist_S25_R5_60b$budget <- 60

#--- S25_R75_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_60 <- fread(file_name)
dist_S25_R75_60 <- data.frame(dist_S25_R75_60)[-1]

dist_S25_R75_60$location <- 'epicenter'
dist_S25_R75_60$detection <- 0.25
dist_S25_R75_60$eradication <- 0.75
dist_S25_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S25_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S25_R75_60b <- fread(file_name)
dist_S25_R75_60b <- data.frame(dist_S25_R75_60b)[-1]

dist_S25_R75_60b$location <- 'epicenter'
dist_S25_R75_60b$detection <- 0.25
dist_S25_R75_60b$eradication <- 0.75
dist_S25_R75_60b$budget <- 60

#--- S5_R5_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_60 <- fread(file_name)
dist_S5_R5_60 <- data.frame(dist_S5_R5_60)[-1]

dist_S5_R5_60$location <- 'epicenter'
dist_S5_R5_60$detection <- 0.5
dist_S5_R5_60$eradication <- 0.5
dist_S5_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R5_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R5_60b <- fread(file_name)
dist_S5_R5_60b <- data.frame(dist_S5_R5_60b)[-1]

dist_S5_R5_60b$location <- 'epicenter'
dist_S5_R5_60b$detection <- 0.5
dist_S5_R5_60b$eradication <- 0.5
dist_S5_R5_60b$budget <- 60

#--- S5_R75_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_60 <- fread(file_name)
dist_S5_R75_60 <- data.frame(dist_S5_R75_60)[-1]

dist_S5_R75_60$location <- 'epicenter'
dist_S5_R75_60$detection <- 0.5
dist_S5_R75_60$eradication <- 0.75
dist_S5_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_60b <- fread(file_name)
dist_S5_R75_60b <- data.frame(dist_S5_R75_60b)[-1]

dist_S5_R75_60b$location <- 'epicenter'
dist_S5_R75_60b$detection <- 0.5
dist_S5_R75_60b$eradication <- 0.75
dist_S5_R75_60b$budget <- 60

#--- S75_R5_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_60 <- fread(file_name)
dist_S75_R5_60 <- data.frame(dist_S75_R5_60)[-1]

dist_S75_R5_60$location <- 'epicenter'
dist_S75_R5_60$detection <- 0.75
dist_S75_R5_60$eradication <- 0.5
dist_S75_R5_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R5_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R5_60b <- fread(file_name)
dist_S75_R5_60b <- data.frame(dist_S75_R5_60b)[-1]

dist_S75_R5_60b$location <- 'epicenter'
dist_S75_R5_60b$detection <- 0.75
dist_S75_R5_60b$eradication <- 0.5
dist_S75_R5_60b$budget <- 60

#--- S75_R75_60 ---#
path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_60 <- fread(file_name)
dist_S75_R75_60 <- data.frame(dist_S75_R75_60)[-1]

dist_S75_R75_60$location <- 'epicenter'
dist_S75_R75_60$detection <- 0.75
dist_S75_R75_60$eradication <- 0.75
dist_S75_R75_60$budget <- 60

path <- 'E:\\Chapter3\\results\\epicenter\\S75_R75_60_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S75_R75_60b <- fread(file_name)
dist_S75_R75_60b <- data.frame(dist_S75_R75_60b)[-1]

dist_S75_R75_60b$location <- 'epicenter'
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


dist_epicenter <- rbind(dist_20, dist_40, dist_60)

dist <- rbind(dist_hsd, dist_linear, dist_epicenter)

dist_travel <- aggregate(distance ~ sim + location + detection + eradication + budget, 
                         data = as.data.frame(dist), 
                         FUN = mean)

#### PLOTS ####
cols <- brewer.pal(12, "Paired") 
colors <- c(cols[1:4], cols[9:10])

colors2 <- c('deeppink3','orange2' ,'grey50')

#### NO REMOVAL ####
ncpath <- 'E:\\Chapter3\\results\\noremoval'
file_name = paste(ncpath, 'states_fin_truth.csv',sep = '/')
noremoval <- fread(file_name)
noremoval <- data.frame(noremoval)

nc.val2 <- aggregate(state ~ sim + location + detection + eradication + budget, 
                     data = as.data.frame(noremoval), 
                     FUN = mean)

nc.val <- mean(nc.val2$state) -1 
nc.max <- max(nc.val2$state) -1 
nc.max95 <- quantile(nc.val2$state, 0.95) -1

##### Suppression #####

finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication)

finstate_truth %>% 
  ggplot(aes(x = loc2, y = state, fill = rates2, color = location,
             group = interaction(location, rates2)))+
  geom_boxplot() +
  geom_hline(yintercept = 0.93425, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates2)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "hstatebins0.750.5",
    "linear0.750.5", 
    'epicenter0.750.5'),
    labels=c(
      
      "hstatebins0.750.5" = "High invasion",
      "linear0.750.5" = "Linear",
      "epicenter0.750.5" = "Epicenter"))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  
  xlab("Site prioritization")+
  ylab("Average final invasion state")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget, nrow = 3, labeller = label_both)


detach(package:plyr)

budget20_suppress <- finstate_truth %>% 
  filter(Budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            
            lower = quantile(state, 0.05),
            upper = quantile(state, 0.95)
  )

budget20_suppress

budget40_suppress <- finstate_truth %>% 
  filter(Budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            
            lower = quantile(state, 0.05),
            upper = quantile(state, 0.95)
  )

budget40_suppress

budget60_suppress <- finstate_truth %>% 
  filter(Budget == 60) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            
            lower = quantile(state, 0.05),
            upper = quantile(state, 0.95)
  )

budget60_suppress


##### Bias states ####
budget20_biasstate <- bias_state %>% 
  filter(budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))


budget20_biasstate

budget40_biasstate <- bias_state %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))


budget40_biasstate

budget60_biasstate <- bias_state %>% 
  filter(budget == 60) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))


budget60_biasstate

bias_param_detect$rates2 <- paste0('(', bias_param_detect$detection, ', ', bias_param_detect$eradication, ")")

bias_param_detect_years <- bias_param_detect %>%
  group_by(location, year, rates, rates2, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_param_detect_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'hstatebins'] <- 'High invasion'
bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'linear'] <- 'Linear'
bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'epicenter'] <- 'Epicenter'

ggplot(bias_param_detect_years, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates2))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8, 10)) +
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  ylab(paste0('p parameters relative bias'))+
  xlab("Year")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget + Prioritization, nrow = 3, labeller = label_both, scales = "free")



##### Bias param time -p #####
bias_param_detect$rates2 <- paste0('(', bias_param_detect$detection, ', ', bias_param_detect$eradication, ")")

bias_param_detect_years <- bias_param_detect %>%
  group_by(location, year, rates, rates2, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_param_detect_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'hstatebins'] <- 'High invasion'
bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'linear'] <- 'Linear'
bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'epicenter'] <- 'Epicenter'

bias_param_detect_years_sum <- bias_param_detect_years %>% filter(year == 2 | year == 7)
bias_param_detect_years_sum <- bias_param_detect_years_sum %>% filter(Prioritization == 'High invasion')


bias_param_detect_years_sum$year[bias_param_detect_years_sum$year == 2] <- 'First'
bias_param_detect_years_sum$year[bias_param_detect_years_sum$year == 7] <- 'Final'

ggplot(bias_param_detect_years, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates2))+
  geom_point()+
  geom_errorbar(width = 1)+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  ylab(paste0('p parameters relative bias'))+
  xlab("Estimation")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget + Prioritization, nrow = 3, labeller = label_both, scales = "free")

ggplot(bias_param_detect_years_sum, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates2))+
  geom_point()+
  geom_errorbar(width = 0.4)+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  ylab(paste0('p parameters relative bias'))+
  xlab("Estimation")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget, nrow = 1, labeller = label_both, scales = "free")


budget20_bias_param_detect <- bias_param_detect %>% 
  filter(budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget40_bias_param_detect <- bias_param_detect %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget60_bias_param_detect <- bias_param_detect %>% 
  filter(budget == 60) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget60_bias_param_detect

##### Bias param time -eps #####
bias_param_eps$rates2 <- paste0('(', bias_param_eps$detection, ', ', bias_param_eps$eradication, ")")

bias_param_eps_years <- bias_param_eps %>%
  group_by(location, year, rates, rates2, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_param_eps_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_param_eps_years$Prioritization[bias_param_eps_years$Prioritization == 'hstatebins'] <- 'High invasion'
bias_param_eps_years$Prioritization[bias_param_eps_years$Prioritization == 'linear'] <- 'Linear'
bias_param_eps_years$Prioritization[bias_param_eps_years$Prioritization == 'epicenter'] <- 'Epicenter'

ggplot(bias_param_eps_years, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates2))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8, 10)) +
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  ylab(paste0('\u03F5 parameters relative bias'))+
  xlab("Year")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget + Prioritization, nrow = 3, labeller = label_both, scales = "free")

budget20_bias_param_eps <- bias_param_eps %>% 
  filter(budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget40_bias_param_eps <- bias_param_eps %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget60_bias_param_eps <- bias_param_eps %>% 
  filter(budget == 60) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget60_bias_param_eps

##### Sites visited #####
total_visit <- sites_visit
total_visit$rates <- paste0('(p = ', total_visit$detection, ',  \u03F5 = ', total_visit$eradication)

total_visit$rates2 <- paste0('(', total_visit$detection, ', ', total_visit$eradication, ")")

total_visit <- total_visit %>% filter(detection < 1 & detection > 0)

total_visit$loc2 <- paste0(total_visit$location, total_visit$detection, total_visit$eradication)

p1 <- total_visit %>% 
  ggplot(aes(x = loc2, y = visit, fill = rates2, color = location,
             group = interaction(location, rates)))+
  geom_boxplot() +
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates2)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "hstatebins0.750.5",
    "linear0.750.5",
    "epicenter0.750.5"),
    labels=c(
      
      "hstatebins0.750.5" = "High invasion",
      "linear0.750.5" = "Linear",
      "epicenter0.750.5" = "Epicenter"))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  xlab("Prioritization")+
  ylab("% of segments visited each week")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        legend.position = "none",
        strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget, nrow = 3)

##### Distance #####
total_dist <- dist_travel
total_dist$rates <- paste0('(p = ', total_dist$detection, ',  \u03F5 = ', total_dist$eradication)

total_dist$rates2 <- paste0('(', total_dist$detection, ', ', total_dist$eradication, ")")

total_dist <- total_dist %>% filter(detection < 1 & detection > 0)

total_dist$loc2 <- paste0(total_dist$location, total_dist$detection, total_dist$eradication)

p2 <- total_dist %>% 
  ggplot(aes(x = loc2, y = distance, fill = rates2, color = location,
             group = interaction(location, rates)))+
  geom_boxplot() +
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates2)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "hstatebins0.750.5",
    "linear0.750.5",
    "epicenter0.750.5"),
    labels=c(
      
      "hstatebins0.750.5" = "High invasion",
      "linear0.750.5" = "Linear",
      "epicenter0.750.5" = "Epicenter"))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  xlab("Prioritization")+
  ylab("Average weekly distance traveled (segment units)")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        legend.position = "none",
        strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget, nrow = 3)




l1 <- total_visit %>% 
  ggplot(aes(x = loc2, y = visit, fill = rates2, color = location,
             group = interaction(location, rates)))+
  geom_boxplot() +
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates2)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "hstatebins0.750.5",
    "linear0.750.5",
    "epicenter0.750.5"),
    labels=c(
      
      "hstatebins0.750.5" = "High invasion",
      "linear0.750.5" = "Linear",
      "epicenter0.750.5" = "Epicenter"))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  xlab("Site prioritization")+
  ylab("% of segments visited each week")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget, nrow = 3)


##### COMBINED PLOTS ####
legend <- cowplot::get_legend(l1)

cowplot::plot_grid(p1, p2, legend, nrow = 1,labels = c('A', 'B', ''))
