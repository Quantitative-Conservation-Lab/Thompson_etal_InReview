library(tidyverse)
library(here)
library(plyr)
library(data.table)
library(RColorBrewer) 

#### States truth ####
##### hstate #####
#-- Budget = 20 --#
#--- S25_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstate\\S25_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20 <- fread(file_name)
state_truth_S25_R5_20 <- data.frame(state_truth_S25_R5_20)[-1]

state_truth_S25_R5_20$location <- 'hstate'
state_truth_S25_R5_20$detection <- 0.25
state_truth_S25_R5_20$eradication <- 0.5
state_truth_S25_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstate\\S25_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R5_20b <- fread(file_name)
state_truth_S25_R5_20b <- data.frame(state_truth_S25_R5_20b)[-1]

state_truth_S25_R5_20b$location <- 'hstate'
state_truth_S25_R5_20b$detection <- 0.25
state_truth_S25_R5_20b$eradication <- 0.5
state_truth_S25_R5_20b$budget <- 20

#--- S25_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstate\\S25_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20 <- fread(file_name)
state_truth_S25_R75_20 <- data.frame(state_truth_S25_R75_20)[-1]

state_truth_S25_R75_20$location <- 'hstate'
state_truth_S25_R75_20$detection <- 0.25
state_truth_S25_R75_20$eradication <- 0.75
state_truth_S25_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstate\\S25_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S25_R75_20b <- fread(file_name)
state_truth_S25_R75_20b <- data.frame(state_truth_S25_R75_20b)[-1]

state_truth_S25_R75_20b$location <- 'hstate'
state_truth_S25_R75_20b$detection <- 0.25
state_truth_S25_R75_20b$eradication <- 0.75
state_truth_S25_R75_20b$budget <- 20

#--- S5_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstate\\S5_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20 <- fread(file_name)
state_truth_S5_R5_20 <- data.frame(state_truth_S5_R5_20)[-1]

state_truth_S5_R5_20$location <- 'hstate'
state_truth_S5_R5_20$detection <- 0.5
state_truth_S5_R5_20$eradication <- 0.5
state_truth_S5_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstate\\S5_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R5_20b <- fread(file_name)
state_truth_S5_R5_20b <- data.frame(state_truth_S5_R5_20b)[-1]

state_truth_S5_R5_20b$location <- 'hstate'
state_truth_S5_R5_20b$detection <- 0.5
state_truth_S5_R5_20b$eradication <- 0.5
state_truth_S5_R5_20b$budget <- 20

#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstate\\S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20 <- fread(file_name)
state_truth_S5_R75_20 <- data.frame(state_truth_S5_R75_20)[-1]

state_truth_S5_R75_20$location <- 'hstate'
state_truth_S5_R75_20$detection <- 0.5
state_truth_S5_R75_20$eradication <- 0.75
state_truth_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstate\\S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20b <- fread(file_name)
state_truth_S5_R75_20b <- data.frame(state_truth_S5_R75_20b)[-1]

state_truth_S5_R75_20b$location <- 'hstate'
state_truth_S5_R75_20b$detection <- 0.5
state_truth_S5_R75_20b$eradication <- 0.75
state_truth_S5_R75_20b$budget <- 20

#--- S75_R5_20 ---#
path <- 'E:\\Chapter3\\results\\hstate\\S75_R5_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20 <- fread(file_name)
state_truth_S75_R5_20 <- data.frame(state_truth_S75_R5_20)[-1]

state_truth_S75_R5_20$location <- 'hstate'
state_truth_S75_R5_20$detection <- 0.75
state_truth_S75_R5_20$eradication <- 0.5
state_truth_S75_R5_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstate\\S75_R5_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R5_20b <- fread(file_name)
state_truth_S75_R5_20b <- data.frame(state_truth_S75_R5_20b)[-1]

state_truth_S75_R5_20b$location <- 'hstate'
state_truth_S75_R5_20b$detection <- 0.75
state_truth_S75_R5_20b$eradication <- 0.5
state_truth_S75_R5_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\hstate\\S75_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20 <- fread(file_name)
state_truth_S75_R75_20 <- data.frame(state_truth_S75_R75_20)[-1]

state_truth_S75_R75_20$location <- 'hstate'
state_truth_S75_R75_20$detection <- 0.75
state_truth_S75_R75_20$eradication <- 0.75
state_truth_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\hstate\\S75_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20b <- fread(file_name)
state_truth_S75_R75_20b <- data.frame(state_truth_S75_R75_20b)[-1]

state_truth_S75_R75_20b$location <- 'hstate'
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

state_truth_hstate <- rbind(state_truth_20)

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

state_truth_epicenter <- rbind(state_truth_20)

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

state_truth_linear <- rbind(state_truth_20)

##### binned #####
#--- S5_R75_20 ---#
path <- 'E:\\Chapter3\\results\\binned\\S5_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20 <- fread(file_name)
state_truth_S5_R75_20 <- data.frame(state_truth_S5_R75_20)[-1]

state_truth_S5_R75_20$location <- 'binned'
state_truth_S5_R75_20$detection <- 0.5
state_truth_S5_R75_20$eradication <- 0.75
state_truth_S5_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\binned\\S5_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_20b <- fread(file_name)
state_truth_S5_R75_20b <- data.frame(state_truth_S5_R75_20b)[-1]

state_truth_S5_R75_20b$location <- 'binned'
state_truth_S5_R75_20b$detection <- 0.5
state_truth_S5_R75_20b$eradication <- 0.75
state_truth_S5_R75_20b$budget <- 20

#--- S75_R75_20 ---#
path <- 'E:\\Chapter3\\results\\binned\\S75_R75_20'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20 <- fread(file_name)
state_truth_S75_R75_20 <- data.frame(state_truth_S75_R75_20)[-1]

state_truth_S75_R75_20$location <- 'binned'
state_truth_S75_R75_20$detection <- 0.75
state_truth_S75_R75_20$eradication <- 0.75
state_truth_S75_R75_20$budget <- 20

path <- 'E:\\Chapter3\\results\\binned\\S75_R75_20_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S75_R75_20b <- fread(file_name)
state_truth_S75_R75_20b <- data.frame(state_truth_S75_R75_20b)[-1]

state_truth_S75_R75_20b$location <- 'binned'
state_truth_S75_R75_20b$detection <- 0.75
state_truth_S75_R75_20b$eradication <- 0.75
state_truth_S75_R75_20b$budget <- 20

#--- Combine state_truths ---#
state_truth_20 <- rbind(
                        state_truth_S5_R75_20,state_truth_S5_R75_20b,
                        
                        state_truth_S75_R75_20,state_truth_S5_R75_20b)

state_truth_binned <- rbind(state_truth_20)

#### Combine ####
state_truth <- rbind(state_truth_hstate, state_truth_linear, state_truth_epicenter,state_truth_binned )
finstate_truth <- state_truth %>% filter(week == 5 & year == 10)

##### Suppression ####
finstate_truth$rates <- paste0('(p = )', finstate_truth$detection, ',  \u03F5 = ', finstate_truth$eradication)
finstate_truth$rates2 <- paste0('(', finstate_truth$detection, ', ', finstate_truth$eradication, ")")
finstate_truth$state <- finstate_truth$state - 1
finstate_truth <- aggregate(state ~ sim + location + detection + eradication + budget + rates + rates2, 
                            data = as.data.frame(finstate_truth), 
                            FUN = mean)

colnames(finstate_truth)[5] <- 'Budget'
finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication)

detach(package:plyr)

budget20_suppress <- finstate_truth %>% 
  filter(Budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(state),
            max_c = max(state))

budget20_suppress

##### Containment ####
fininv_truth <-  state_truth %>% filter(week == 5 & year == 10)

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

budget20_contain <- fininv_truth %>% 
  filter(Budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv))

budget20_contain 

#### PLOTS ####
cols <- brewer.pal(12, "Paired") 
colors <- c(cols[1:4], cols[9:10])

colors2 <- c('darkorange', 'deeppink3', 'grey50', "brown")

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
  scale_x_discrete(breaks = c("epicenter0.50.75",
                              "hstate0.750.5",
                              "linear0.750.5"),
                   labels=c(
                     "epicenter0.50.75" = "",
                     "hstate0.750.5" = "",
                     "linear0.750.5" = ""))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c('Epicenter', 'High invasion', 'Linear', 'Binned') )+
  
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


fininv_truth %>% 
  ggplot(aes(x = loc2, y = inv, fill = rates2, color =Location,
             group = interaction(Location, rates2)))+
  geom_boxplot() +
  geom_hline(yintercept = 0.301625, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(Location, rates)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c("epicenter0.50.75",
                              "hstate0.750.5",
                              "linear0.750.5"),
                   labels=c(
                     "epicenter0.50.75" = "",
                     "hstate0.750.5" = "",
                     "linear0.750.5" = ""))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Prioritization",
                     values = colors2, 
                     labels = c('Epicenter', 'High invasion', 'Linear', 'Binned') )+
  
  xlab("Site prioritization")+
  ylab("Average final % invaded")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        #strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget, nrow = 3, labeller = label_both)

