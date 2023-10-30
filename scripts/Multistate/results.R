library(tidyverse)
library(here)
library(RColorBrewer)

#### search effort 0.5 ####
path <- here::here("results", "Multistate", "DatM", "searcheffort05")

##### hocc #####
#----- search effort = 0.5, hours = 40, dr = hocc, param = 1 -----#
path2 <- paste(path,"/hocc40_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ05_40_p1_df <- read.csv(file_name)[-1]
occ05_40_p1_df$effort <- '0.5'
occ05_40_p1_df$hours <- '40'
occ05_40_p1_df$dr <- 'hocc'
occ05_40_p1_df$param <- '1'

#----- search effort = 0.5, hours = 40, dr = hocc, param = 2 -----#
path2 <- paste(path,"/hocc40_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ05_40_p2_df <- read.csv(file_name)[-1]
occ05_40_p2_df$effort <- '0.5'
occ05_40_p2_df$hours <- '40'
occ05_40_p2_df$dr <- 'hocc'
occ05_40_p2_df$param <- '2'

#----- search effort = 0.5, hours = 40, dr = hocc, param = 3 -----#
path2 <- paste(path,"/hocc40_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ05_40_p3_df <- read.csv(file_name)[-1]
occ05_40_p3_df$effort <- '0.5'
occ05_40_p3_df$hours <- '40'
occ05_40_p3_df$dr <- 'hocc'
occ05_40_p3_df$param <- '3'

#----- search effort = 0.5, hours = 40, dr = hocc, param = 4 -----#
path2 <- paste(path,"/hocc40_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ05_40_p4_df <- read.csv(file_name)[-1]
occ05_40_p4_df$effort <- '0.5'
occ05_40_p4_df$hours <- '40'
occ05_40_p4_df$dr <- 'hocc'
occ05_40_p4_df$param <- '4'

#----- search effort = 0.5, hours = 80, dr = hocc, param = 1 -----#
path2 <- paste(path,"/hocc80_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ05_80_p1_df <- read.csv(file_name)[-1]
occ05_80_p1_df$effort <- '0.5'
occ05_80_p1_df$hours <- '80'
occ05_80_p1_df$dr <- 'hocc'
occ05_80_p1_df$param <- '1'

#----- search effort = 0.5, hours = 80, dr = hocc, param = 2 -----#
path2 <- paste(path,"/hocc80_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ05_80_p2_df <- read.csv(file_name)[-1]
occ05_80_p2_df$effort <- '0.5'
occ05_80_p2_df$hours <- '80'
occ05_80_p2_df$dr <- 'hocc'
occ05_80_p2_df$param <- '2'

#----- search effort = 0.5, hours = 80, dr = hocc, param = 3 -----#
path2 <- paste(path,"/hocc80_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ05_80_p3_df <- read.csv(file_name)[-1]
occ05_80_p3_df$effort <- '0.5'
occ05_80_p3_df$hours <- '80'
occ05_80_p3_df$dr <- 'hocc'
occ05_80_p3_df$param <- '3'

#----- search effort = 0.5, hours = 80, dr = hocc, param = 4 -----#
path2 <- paste(path,"/hocc80_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ05_80_p4_df <- read.csv(file_name)[-1]
occ05_80_p4_df$effort <- '0.5'
occ05_80_p4_df$hours <- '80'
occ05_80_p4_df$dr <- 'hocc'
occ05_80_p4_df$param <- '4'

##### linear #####
#----- search effort = 0.5, hours = 40, dr = linear, param = 1 -----#
path2 <- paste(path,"/linear40_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear05_40_p1_df <- read.csv(file_name)[-1]
linear05_40_p1_df$effort <- '0.5'
linear05_40_p1_df$hours <- '40'
linear05_40_p1_df$dr <- 'linear'
linear05_40_p1_df$param <- '1'

#----- search effort = 0.5, hours = 40, dr = linear, param = 2 -----#
path2 <- paste(path,"/linear40_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear05_40_p2_df <- read.csv(file_name)[-1]
linear05_40_p2_df$effort <- '0.5'
linear05_40_p2_df$hours <- '40'
linear05_40_p2_df$dr <- 'linear'
linear05_40_p2_df$param <- '2'

#----- search effort = 0.5, hours = 40, dr = linear, param = 3 -----#
path2 <- paste(path,"/linear40_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear05_40_p3_df <- read.csv(file_name)[-1]
linear05_40_p3_df$effort <- '0.5'
linear05_40_p3_df$hours <- '40'
linear05_40_p3_df$dr <- 'linear'
linear05_40_p3_df$param <- '3'

#----- search effort = 0.5, hours = 40, dr = linear, param = 4 -----#
path2 <- paste(path,"/linear40_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear05_40_p4_df <- read.csv(file_name)[-1]
linear05_40_p4_df$effort <- '0.5'
linear05_40_p4_df$hours <- '40'
linear05_40_p4_df$dr <- 'linear'
linear05_40_p4_df$param <- '4'

#----- search effort = 0.5, hours = 80, dr = linear, param = 1 -----#
path2 <- paste(path,"/linear80_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear05_80_p1_df <- read.csv(file_name)[-1]
linear05_80_p1_df$effort <- '0.5'
linear05_80_p1_df$hours <- '80'
linear05_80_p1_df$dr <- 'linear'
linear05_80_p1_df$param <- '1'

#----- search effort = 0.5, hours = 80, dr = linear, param = 2 -----#
path2 <- paste(path,"/linear80_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear05_80_p2_df <- read.csv(file_name)[-1]
linear05_80_p2_df$effort <- '0.5'
linear05_80_p2_df$hours <- '80'
linear05_80_p2_df$dr <- 'linear'
linear05_80_p2_df$param <- '2'

#----- search effort = 0.5, hours = 80, dr = linear, param = 3 -----#
path2 <- paste(path,"/linear80_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear05_80_p3_df <- read.csv(file_name)[-1]
linear05_80_p3_df$effort <- '0.5'
linear05_80_p3_df$hours <- '80'
linear05_80_p3_df$dr <- 'linear'
linear05_80_p3_df$param <- '3'

#----- search effort = 0.5, hours = 80, dr = linear, param = 4 -----#
path2 <- paste(path,"/linear80_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear05_80_p4_df <- read.csv(file_name)[-1]
linear05_80_p4_df$effort <- '0.5'
linear05_80_p4_df$hours <- '80'
linear05_80_p4_df$dr <- 'linear'
linear05_80_p4_df$param <- '4'

##### Random #####
#----- search effort = 0.5, hours = 40, dr = random, params -----#
path2 <- paste(path,"/random40_datM",sep = "")
file_name = paste(path2, 'States_random.csv',sep = '/')
random05_40_df <- read.csv(file_name)[-1]
random05_40_df$effort <- '0.5'
random05_40_df$hours <- '40'
random05_40_df$dr <- 'random'
random05_40_df <- random05_40_df %>% select(site,week,year,sim,state,effort,hours,dr,param)

#----- search effort = 0.5, hours = 80, dr = random, params -----#
path2 <- paste(path,"/random80_datM",sep = "")
file_name = paste(path2, 'States_random.csv',sep = '/')
random05_80_df <- read.csv(file_name)[-1]
random05_80_df$effort <- '0.5'
random05_80_df$hours <- '80'
random05_80_df$dr <- 'random'
random05_80_df <- random05_80_df %>% select(site,week,year,sim,state,effort,hours,dr,param)

#### search effort 1 ####
path <- here::here("results", "Multistate", "DatM", "searcheffort1")

##### hocc #####
#----- search effort = 1, hours = 40, dr = hocc, param = 1 -----#
path2 <- paste(path,"/hocc40_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ1_40_p1_df <- read.csv(file_name)[-1]
occ1_40_p1_df$effort <- '1'
occ1_40_p1_df$hours <- '40'
occ1_40_p1_df$dr <- 'hocc'
occ1_40_p1_df$param <- '1'

#----- search effort = 1, hours = 40, dr = hocc, param = 2 -----#
path2 <- paste(path,"/hocc40_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ1_40_p2_df <- read.csv(file_name)[-1]
occ1_40_p2_df$effort <- '1'
occ1_40_p2_df$hours <- '40'
occ1_40_p2_df$dr <- 'hocc'
occ1_40_p2_df$param <- '2'

#----- search effort = 1, hours = 40, dr = hocc, param = 3 -----#
path2 <- paste(path,"/hocc40_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ1_40_p3_df <- read.csv(file_name)[-1]
occ1_40_p3_df$effort <- '1'
occ1_40_p3_df$hours <- '40'
occ1_40_p3_df$dr <- 'hocc'
occ1_40_p3_df$param <- '3'

#----- search effort = 1, hours = 40, dr = hocc, param = 4 -----#
path2 <- paste(path,"/hocc40_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ1_40_p4_df <- read.csv(file_name)[-1]
occ1_40_p4_df$effort <- '1'
occ1_40_p4_df$hours <- '40'
occ1_40_p4_df$dr <- 'hocc'
occ1_40_p4_df$param <- '4'

#----- search effort = 1, hours = 80, dr = hocc, param = 1 -----#
path2 <- paste(path,"/hocc80_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ1_80_p1_df <- read.csv(file_name)[-1]
occ1_80_p1_df$effort <- '1'
occ1_80_p1_df$hours <- '80'
occ1_80_p1_df$dr <- 'hocc'
occ1_80_p1_df$param <- '1'

#----- search effort = 1, hours = 80, dr = hocc, param = 2 -----#
path2 <- paste(path,"/hocc80_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ1_80_p2_df <- read.csv(file_name)[-1]
occ1_80_p2_df$effort <- '1'
occ1_80_p2_df$hours <- '80'
occ1_80_p2_df$dr <- 'hocc'
occ1_80_p2_df$param <- '2'

#----- search effort = 1, hours = 80, dr = hocc, param = 3 -----#
path2 <- paste(path,"/hocc80_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ1_80_p3_df <- read.csv(file_name)[-1]
occ1_80_p3_df$effort <- '1'
occ1_80_p3_df$hours <- '80'
occ1_80_p3_df$dr <- 'hocc'
occ1_80_p3_df$param <- '3'

#----- search effort = 1, hours = 80, dr = hocc, param = 4 -----#
path2 <- paste(path,"/hocc80_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ1_80_p4_df <- read.csv(file_name)[-1]
occ1_80_p4_df$effort <- '1'
occ1_80_p4_df$hours <- '80'
occ1_80_p4_df$dr <- 'hocc'
occ1_80_p4_df$param <- '4'

##### linear #####
#----- search effort = 1, hours = 40, dr = linear, param = 1 -----#
path2 <- paste(path,"/linear40_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear1_40_p1_df <- read.csv(file_name)[-1]
linear1_40_p1_df$effort <- '1'
linear1_40_p1_df$hours <- '40'
linear1_40_p1_df$dr <- 'linear'
linear1_40_p1_df$param <- '1'

#----- search effort = 1, hours = 40, dr = linear, param = 2 -----#
path2 <- paste(path,"/linear40_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear1_40_p2_df <- read.csv(file_name)[-1]
linear1_40_p2_df$effort <- '1'
linear1_40_p2_df$hours <- '40'
linear1_40_p2_df$dr <- 'linear'
linear1_40_p2_df$param <- '2'

#----- search effort = 1, hours = 40, dr = linear, param = 3 -----#
path2 <- paste(path,"/linear40_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear1_40_p3_df <- read.csv(file_name)[-1]
linear1_40_p3_df$effort <- '1'
linear1_40_p3_df$hours <- '40'
linear1_40_p3_df$dr <- 'linear'
linear1_40_p3_df$param <- '3'

#----- search effort = 1, hours = 40, dr = linear, param = 4 -----#
path2 <- paste(path,"/linear40_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear1_40_p4_df <- read.csv(file_name)[-1]
linear1_40_p4_df$effort <- '1'
linear1_40_p4_df$hours <- '40'
linear1_40_p4_df$dr <- 'linear'
linear1_40_p4_df$param <- '4'

#----- search effort = 1, hours = 80, dr = linear, param = 1 -----#
path2 <- paste(path,"/linear80_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear1_80_p1_df <- read.csv(file_name)[-1]
linear1_80_p1_df$effort <- '1'
linear1_80_p1_df$hours <- '80'
linear1_80_p1_df$dr <- 'linear'
linear1_80_p1_df$param <- '1'

#----- search effort = 1, hours = 80, dr = linear, param = 2 -----#
path2 <- paste(path,"/linear80_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear1_80_p2_df <- read.csv(file_name)[-1]
linear1_80_p2_df$effort <- '1'
linear1_80_p2_df$hours <- '80'
linear1_80_p2_df$dr <- 'linear'
linear1_80_p2_df$param <- '2'

#----- search effort = 1, hours = 80, dr = linear, param = 3 -----#
path2 <- paste(path,"/linear80_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear1_80_p3_df <- read.csv(file_name)[-1]
linear1_80_p3_df$effort <- '1'
linear1_80_p3_df$hours <- '80'
linear1_80_p3_df$dr <- 'linear'
linear1_80_p3_df$param <- '3'

#----- search effort = 1, hours = 80, dr = linear, param = 4 -----#
path2 <- paste(path,"/linear80_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear1_80_p4_df <- read.csv(file_name)[-1]
linear1_80_p4_df$effort <- '1'
linear1_80_p4_df$hours <- '80'
linear1_80_p4_df$dr <- 'linear'
linear1_80_p4_df$param <- '4'

##### Random #####
#----- search effort = 1, hours = 40, dr = random, params -----#
path2 <- paste(path,"/random40_datM",sep = "")
file_name = paste(path2, 'States_random.csv',sep = '/')
random1_40_df <- read.csv(file_name)[-1]
random1_40_df$effort <- '1'
random1_40_df$hours <- '40'
random1_40_df$dr <- 'random'
random1_40_df <- random1_40_df %>% select(site,week,year,sim,state,effort,hours,dr,param)

#----- search effort = 1, hours = 80, dr = random, params -----#
path2 <- paste(path,"/random80_datM",sep = "")
file_name = paste(path2, 'States_random.csv',sep = '/')
random1_80_df <- read.csv(file_name)[-1]
random1_80_df$effort <- '1'
random1_80_df$hours <- '80'
random1_80_df$dr <- 'random'
random1_80_df <- random1_80_df %>% select(site,week,year,sim,state,effort,hours,dr,param)

#### search effort 2 ####
path <- here::here("results", "Multistate", "DatM", "searcheffort2")

##### hocc #####
#----- search effort = 2, hours = 40, dr = hocc, param = 1 -----#
path2 <- paste(path,"/hocc40_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ2_40_p1_df <- read.csv(file_name)[-1]
occ2_40_p1_df$effort <- '2'
occ2_40_p1_df$hours <- '40'
occ2_40_p1_df$dr <- 'hocc'
occ2_40_p1_df$param <- '1'

#----- search effort = 2, hours = 40, dr = hocc, param = 2 -----#
path2 <- paste(path,"/hocc40_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ2_40_p2_df <- read.csv(file_name)[-1]
occ2_40_p2_df$effort <- '2'
occ2_40_p2_df$hours <- '40'
occ2_40_p2_df$dr <- 'hocc'
occ2_40_p2_df$param <- '2'

#----- search effort = 2, hours = 40, dr = hocc, param = 3 -----#
path2 <- paste(path,"/hocc40_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ2_40_p3_df <- read.csv(file_name)[-1]
occ2_40_p3_df$effort <- '2'
occ2_40_p3_df$hours <- '40'
occ2_40_p3_df$dr <- 'hocc'
occ2_40_p3_df$param <- '3'

#----- search effort = 2, hours = 40, dr = hocc, param = 4 -----#
path2 <- paste(path,"/hocc40_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ2_40_p4_df <- read.csv(file_name)[-1]
occ2_40_p4_df$effort <- '2'
occ2_40_p4_df$hours <- '40'
occ2_40_p4_df$dr <- 'hocc'
occ2_40_p4_df$param <- '4'

#----- search effort = 2, hours = 80, dr = hocc, param = 1 -----#
path2 <- paste(path,"/hocc80_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ2_80_p1_df <- read.csv(file_name)[-1]
occ2_80_p1_df$effort <- '2'
occ2_80_p1_df$hours <- '80'
occ2_80_p1_df$dr <- 'hocc'
occ2_80_p1_df$param <- '1'

#----- search effort = 2, hours = 80, dr = hocc, param = 2 -----#
path2 <- paste(path,"/hocc80_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ2_80_p2_df <- read.csv(file_name)[-1]
occ2_80_p2_df$effort <- '2'
occ2_80_p2_df$hours <- '80'
occ2_80_p2_df$dr <- 'hocc'
occ2_80_p2_df$param <- '2'

#----- search effort = 2, hours = 80, dr = hocc, param = 3 -----#
path2 <- paste(path,"/hocc80_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ2_80_p3_df <- read.csv(file_name)[-1]
occ2_80_p3_df$effort <- '2'
occ2_80_p3_df$hours <- '80'
occ2_80_p3_df$dr <- 'hocc'
occ2_80_p3_df$param <- '3'

#----- search effort = 2, hours = 80, dr = hocc, param = 4 -----#
path2 <- paste(path,"/hocc80_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_hocc.csv',sep = '/')
occ2_80_p4_df <- read.csv(file_name)[-1]
occ2_80_p4_df$effort <- '2'
occ2_80_p4_df$hours <- '80'
occ2_80_p4_df$dr <- 'hocc'
occ2_80_p4_df$param <- '4'

##### linear #####
#----- search effort = 2, hours = 40, dr = linear, param = 1 -----#
path2 <- paste(path,"/linear40_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear2_40_p1_df <- read.csv(file_name)[-1]
linear2_40_p1_df$effort <- '2'
linear2_40_p1_df$hours <- '40'
linear2_40_p1_df$dr <- 'linear'
linear2_40_p1_df$param <- '1'

#----- search effort = 2, hours = 40, dr = linear, param = 2 -----#
path2 <- paste(path,"/linear40_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear2_40_p2_df <- read.csv(file_name)[-1]
linear2_40_p2_df$effort <- '2'
linear2_40_p2_df$hours <- '40'
linear2_40_p2_df$dr <- 'linear'
linear2_40_p2_df$param <- '2'

#----- search effort = 2, hours = 40, dr = linear, param = 3 -----#
path2 <- paste(path,"/linear40_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear2_40_p3_df <- read.csv(file_name)[-1]
linear2_40_p3_df$effort <- '2'
linear2_40_p3_df$hours <- '40'
linear2_40_p3_df$dr <- 'linear'
linear2_40_p3_df$param <- '3'

#----- search effort = 2, hours = 40, dr = linear, param = 4 -----#
path2 <- paste(path,"/linear40_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear2_40_p4_df <- read.csv(file_name)[-1]
linear2_40_p4_df$effort <- '2'
linear2_40_p4_df$hours <- '40'
linear2_40_p4_df$dr <- 'linear'
linear2_40_p4_df$param <- '4'

#----- search effort = 2, hours = 80, dr = linear, param = 1 -----#
path2 <- paste(path,"/linear80_datM_p1",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear2_80_p1_df <- read.csv(file_name)[-1]
linear2_80_p1_df$effort <- '2'
linear2_80_p1_df$hours <- '80'
linear2_80_p1_df$dr <- 'linear'
linear2_80_p1_df$param <- '1'

#----- search effort = 2, hours = 80, dr = linear, param = 2 -----#
path2 <- paste(path,"/linear80_datM_p2",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear2_80_p2_df <- read.csv(file_name)[-1]
linear2_80_p2_df$effort <- '2'
linear2_80_p2_df$hours <- '80'
linear2_80_p2_df$dr <- 'linear'
linear2_80_p2_df$param <- '2'

#----- search effort = 2, hours = 80, dr = linear, param = 3 -----#
path2 <- paste(path,"/linear80_datM_p3",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear2_80_p3_df <- read.csv(file_name)[-1]
linear2_80_p3_df$effort <- '2'
linear2_80_p3_df$hours <- '80'
linear2_80_p3_df$dr <- 'linear'
linear2_80_p3_df$param <- '3'

#----- search effort = 2, hours = 80, dr = linear, param = 4 -----#
path2 <- paste(path,"/linear80_datM_p4",sep = "")
file_name = paste(path2, 'States_e1_linear.csv',sep = '/')
linear2_80_p4_df <- read.csv(file_name)[-1]
linear2_80_p4_df$effort <- '2'
linear2_80_p4_df$hours <- '80'
linear2_80_p4_df$dr <- 'linear'
linear2_80_p4_df$param <- '4'

##### Random #####
#----- search effort = 2, hours = 40, dr = random, params -----#
path2 <- paste(path,"/random40_datM",sep = "")
file_name = paste(path2, 'States_random.csv',sep = '/')
random2_40_df <- read.csv(file_name)[-1]
random2_40_df$effort <- '2'
random2_40_df$hours <- '40'
random2_40_df$dr <- 'random'
random2_40_df <- random2_40_df %>% select(site,week,year,sim,state,effort,hours,dr,param)

#----- search effort = 2, hours = 80, dr = random, params -----#
path2 <- paste(path,"/random80_datM",sep = "")
file_name = paste(path2, 'States_random.csv',sep = '/')
random2_80_df <- read.csv(file_name)[-1]
random2_80_df$effort <- '2'
random2_80_df$hours <- '80'
random2_80_df$dr <- 'random'
random2_80_df <- random2_80_df %>% select(site,week,year,sim,state,effort,hours,dr,param)

#### COMBINE DATA ####
results_df <- rbind(occ05_40_p1_df, occ05_40_p2_df, occ05_40_p3_df, occ05_40_p4_df,
                    occ05_80_p1_df, occ05_80_p2_df, occ05_80_p3_df, occ05_80_p4_df,
                    linear05_40_p1_df, linear05_40_p2_df, linear05_40_p3_df, linear05_40_p4_df,
                    linear05_80_p1_df, linear05_80_p2_df, linear05_80_p3_df, linear05_80_p4_df,
                    random05_40_df,random05_80_df,
                    occ1_40_p1_df, occ1_40_p2_df, occ1_40_p3_df, occ1_40_p4_df,
                    occ1_80_p1_df, occ1_80_p2_df, occ1_80_p3_df, occ1_80_p4_df,
                    linear1_40_p1_df, linear1_40_p2_df, linear1_40_p3_df, linear1_40_p4_df,
                    linear1_80_p1_df, linear1_80_p2_df, linear1_80_p3_df, linear1_80_p4_df,
                    random1_40_df,random1_80_df,
                    occ2_40_p1_df, occ2_40_p2_df, occ2_40_p3_df, occ2_40_p4_df,
                    occ2_80_p1_df, occ2_80_p2_df, occ2_80_p3_df, occ2_80_p4_df,
                    linear2_40_p1_df, linear2_40_p2_df, linear2_40_p3_df, linear2_40_p4_df,
                    linear2_80_p1_df, linear2_80_p2_df, linear2_80_p3_df, linear2_80_p4_df,
                    random2_40_df,random2_80_df)

#### FINAL RESULTS ####
fin_res <- results_df %>% filter(week == 4, year == 10)
means <- aggregate(state ~  effort + hours + param + dr, fin_res, mean)
means$state <- round(means$state, 2)

ggplot(means)+
  geom_point(mapping = aes(x = effort, y = state, color = param, shape = hours), size = 3)+
  scale_colour_brewer(palette = 'Paired')+ 
  facet_wrap(~dr)


means_hocc <- means %>% filter(dr == 'hocc')


fin_res40 <- fin_res %>% filter(hours == '40')

means40 <- aggregate(state ~  effort + param + dr, fin_res40, mean)
means40$state <- round(means40$state, 2)

ggplot(fin_res40)+
  geom_violin(mapping = aes(x = dr, y = state))+
  scale_fill_brewer(palette = 'Paired')+ 
  stat_summary(aes(x = param, y = state),
               fun=mean, colour="black", geom="point",
               shape=18, size=4, show.legend=FALSE) + 
  geom_text(data = means40, aes(x = param, label = state, y = state + 0.08), size = 3)+
  facet_wrap(~dr)



#### site invasion ####
invasion <- array(NA, c(3, 3, 2, 4, 20))

drs <- c("linear", "hocc", "random")
effort <- c('0.5', '1', '2')
hour <- c('40', '80')

for(d in 1:3){
  for(e in 1:3){
    for(h in 1:2){
      for(p in 1:4){
        for(s in 1:20){
          df <- filter(fin_res, effort == effort[e], hours == hour[h], sim == s,
                       param == as.factor(p), dr == drs[d])
          invasion[d,e,h,p,s] <- 1- sum(df$state == 1)/40
        }
      }
    }
  }
}

library(plyr)    

invasion_df <- adply(invasion, c(1,2,3,4,5))
colnames(invasion_df) <- c("dr", "effort","hours", "param", "sim", "val")
invasion_df$dr <- as.factor(invasion_df$dr)
invasion_df$param <- as.factor(invasion_df$param)

means <- aggregate(val~  param + dr + effort + hours, invasion_df, mean)
means$val <- round(means$val, 3)


ggplot(means)+
  geom_point(mapping = aes(x = effort, y = val, color = param, shape = hours), size = 3)+
  scale_colour_brewer(palette = 'Paired')+ 
  facet_wrap(~dr)


#### FINAL RESULTS across parms ####
fin_res <- results_df %>% filter(week == 4, year == 10)
means <- aggregate(state ~  effort + hours + dr, fin_res, mean)
means$state <- round(means$state, 2)

ggplot(means)+
  geom_point(mapping = aes(x = effort, y = state, color = dr, shape = hours), size = 3)+
  scale_colour_brewer(palette = 'Dark2')+
  facet_wrap(~hours)


