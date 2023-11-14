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
fin_res2 <- results_df %>% filter(hours == 40, dr == "hocc" | dr == "linear")

fin_res2$state <- fin_res2$state - 1
means <- aggregate(state ~  effort + hours + param + dr, fin_res2, mean)
means$state <- round(means$state, 4)

arrange(filter(means, param == 1), state)
arrange(filter(means, param == 2), state)
arrange(filter(means, param == 3), state)
arrange(filter(means, param == 4), state)

# ggplot(means)+
#   geom_point(mapping = aes(x = effort, y = state, color = param, shape = hours), size = 4)+
#   scale_colour_brewer(palette = 'Paired')+ 
#   facet_wrap(~dr)

ggplot(means)+
  geom_point(mapping = aes(x = param, y = state, fill = dr, shape = effort),
             size = 5, alpha = 0.7)+
  scale_shape_manual(values = c(21 ,22,24)) +
  xlab("Parameter") +
  ylab("Final average invasion state")+
  scale_fill_brewer(palette = 'Paired')+
  guides(fill = guide_legend(title = "Parameter", override.aes = list(shape=21)),
         shape = guide_legend(title = "Search effort (hours)"),
         size = guide_legend(title = "Budget (max hours/ week)"))+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.title.x = element_text(size = 16),
                     axis.text.x = element_text(size = 14),
                     axis.title.y = element_text(size = 16),
                     axis.line = element_line(colour = "black"))

means_1 <- means %>% filter(param == 1) 

ggplot(means_1)+
  geom_point(mapping = aes(x = param, y = state, fill = dr, shape = effort, size = hours),alpha = 0.7)+
  scale_shape_manual(values = c(21 ,22,24)) +
  xlab("") +
  ylab("")+
  scale_fill_brewer(palette = 'Dark2', labels = c("Highest state", "Linear", "Random"))+
  guides(fill = guide_legend(title = "Search location", override.aes = list(shape=21)),
         shape = guide_legend(title = "Search effort (hours)"),
         size = guide_legend(title = "Budget (max hours/ week)"))+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.title.x = element_text(size = 16),
                     axis.text.x = element_text(size = 14),
                     axis.title.y = element_text(size = 16),
                     axis.line = element_line(colour = "black"))

means_12 <- means %>% filter(param == 2 | param == 1) 

ggplot(means_12)+
  geom_point(mapping = aes(x = param, y = state, fill = dr, shape = effort, size = hours),alpha = 0.7)+
  scale_shape_manual(values = c(21 ,22,24)) +
  xlab("") +
  ylab("")+
  scale_fill_brewer(palette = 'Dark2', labels = c("Highest state", "Linear", "Random"))+
  guides(fill = guide_legend(title = "Search location", override.aes = list(shape=21)),
         shape = guide_legend(title = "Search effort (hours)"),
         size = guide_legend(title = "Budget (max hours/ week)"))+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.title.x = element_text(size = 16),
                     axis.text.x = element_text(size = 14),
                     axis.title.y = element_text(size = 16),
                     axis.line = element_line(colour = "black"))


means_34 <- means %>% filter(param == 3 | param == 4) 

ggplot(means_34)+
  geom_point(mapping = aes(x = param, y = state, fill = dr, shape = effort, size = hours),alpha = 0.7)+
  scale_shape_manual(values = c(21 ,22,24)) +
  xlab("") +
  ylab("")+
  scale_fill_brewer(palette = 'Dark2', labels = c("Highest state", "Linear", "Random"))+
  guides(fill = guide_legend(title = "Search location", override.aes = list(shape=21)),
         shape = guide_legend(title = "Search effort (hours)"),
         size = guide_legend(title = "Budget (max hours/ week)"))+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.title.x = element_text(size = 16),
                     axis.text.x = element_text(size = 14),
                     axis.title.y = element_text(size = 16),
                     axis.line = element_line(colour = "black"))

means_4 <- means %>% filter(param == 4) 

ggplot(means_4)+
  geom_point(mapping = aes(x = param, y = state, fill = dr, shape = effort, size = hours),alpha = 0.7)+
  scale_shape_manual(values = c(21 ,22,24)) +
  xlab("Parameter") +
  ylab("Final average invasion state")+
  scale_fill_brewer(palette = 'Dark2', labels = c("Highest state", "Linear", "Random"))+
  guides(fill = guide_legend(title = "Search location", override.aes = list(shape=21)),
         shape = guide_legend(title = "Search effort (hours)"),
         size = guide_legend(title = "Budget (max hours/ week)"))+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.title.x = element_text(size = 16),
                     axis.text.x = element_text(size = 14),
                     axis.title.y = element_text(size = 16),
                     axis.line = element_line(colour = "black"))

#### site invasion ####
invasion <- array(NA, c(3, 3, 2, 4, 20))

drs <- c("hocc", "linear", "random")
effort <- c('0.5', '1', '2')
hour <- c('40', '80')

for(d in 1:3){
  for(e in 1:3){
    for(h in 1:2){
      for(p in 1:4){
        for(s in 1:20){
          df <- filter(fin_res, effort == effort[e], hours == hour[h], sim == s,
                       param == as.factor(p), dr == drs[d])
          invasion[d,e,h,p,s] <- 1- sum(df$state == 0)/40
        }
      }
    }
  }
}

library(plyr)    

invasion_df <- adply(invasion, c(1,2,3,4,5))
colnames(invasion_df) <- c("dr", "effort","hours", "param", "sim", "val")
means2 <- aggregate(val~  param + dr + effort + hours, invasion_df, mean)
means2$val <- round(means2$val, 3)

means2$effort <- as.numeric(means2$effort)/2
means2$effort[means2$effort == 1.5] <- 2
means2$effort <- replace(means2$effort, means2$effort==1.5, 2)
means2$hours <- as.numeric(means2$hours)*40
means2$dr <- as.numeric(means2$dr)
means2$dr <- replace(means2$dr, means2$dr==1, 'hocc')
means2$dr <- replace(means2$dr, means2$dr==2, 'linear')
means2$dr <- replace(means2$dr, means2$dr==3, 'random')

means2$effort <- as.factor(means2$effort)
means2$hours <- as.factor(means2$hours)
means2$dr <- as.factor(means2$dr)

means2 <- filter(means2, dr == "hocc", hours == '40')

arrange(filter(means2, param == 1), val)
arrange(filter(means2, param == 2), val)
arrange(filter(means2, param == 3), val)
arrange(filter(means2, param == 4), val)


ggplot(means2)+
  geom_point(mapping = aes(x = param, y = val, fill = dr, shape = effort, size = hours),alpha = 0.7)+
  scale_shape_manual(values = c(21 ,22,24)) +
  xlab("Parameter") +
  ylab("Final average % invaded ")+
  scale_fill_brewer(palette = 'Dark2', labels = c("Highest state", "Linear", "Random"))+
  guides(fill = guide_legend(title = "Search location", override.aes = list(shape=21)),
         shape = guide_legend(title = "Search effort (hours)"),
         size = guide_legend(title = "Budget (max hours/ week)"))+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.title.x = element_text(size = 16),
                     axis.text.x = element_text(size = 14),
                     axis.title.y = element_text(size = 16),
                     axis.line = element_line(colour = "black"))


means2_12 <- means2 %>% filter(param == 1 | param == 2) 

ggplot(means2_12)+
  geom_point(mapping = aes(x = param, y = val, fill = dr, shape = effort, size = hours),alpha = 0.7)+
  scale_shape_manual(values = c(21 ,22,24)) +
  xlab("") +
  ylab("")+
  scale_fill_brewer(palette = 'Dark2', labels = c("Highest state", "Linear", "Random"))+
  guides(fill = guide_legend(title = "Search location", override.aes = list(shape=21)),
         shape = guide_legend(title = "Search effort (hours)"),
         size = guide_legend(title = "Budget (max hours/ week)"))+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.title.x = element_text(size = 16),
                     axis.text.x = element_text(size = 14),
                     axis.title.y = element_text(size = 16),
                     axis.line = element_line(colour = "black"))


means2_34 <- means2 %>% filter(param == 3 | param == 4) 

ggplot(means2_34)+
  geom_point(mapping = aes(x = param, y = val, fill = dr, shape = effort, size = hours),alpha = 0.7)+
  scale_shape_manual(values = c(21 ,22,24)) +
  xlab("") +
  ylab("")+
  scale_fill_brewer(palette = 'Dark2', labels = c("Highest state", "Linear", "Random"))+
  guides(fill = guide_legend(title = "Search location", override.aes = list(shape=21)),
         shape = guide_legend(title = "Search effort (hours)"),
         size = guide_legend(title = "Budget (max hours/ week)"))+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.title.x = element_text(size = 16),
                     axis.text.x = element_text(size = 14),
                     axis.title.y = element_text(size = 16),
                     axis.line = element_line(colour = "black"))



means_all <- aggregate(state ~  effort + hours + dr, fin_res, mean)
means_all2 <- aggregate(val~  dr + effort + hours, invasion_df, mean)

means_all2$effort <- as.numeric(means_all2$effort)/2
means_all2$effort[means_all2$effort == 1.5] <- 2
means_all2$effort <- replace(means_all2$effort, means_all2$effort==1.5, 2)
means_all2$hours <- as.numeric(means_all2$hours)*40
means_all2$dr <- as.numeric(means_all2$dr)
means_all2$dr <- replace(means_all2$dr, means_all2$dr==1, 'hocc')
means_all2$dr <- replace(means_all2$dr, means_all2$dr==2, 'linear')
means_all2$dr <- replace(means_all2$dr, means_all2$dr==3, 'random')

means_all2$effort <- as.factor(means_all2$effort)
means_all2$hours <- as.factor(means_all2$hours)
means_all2$dr <- as.factor(means_all2$dr)


head(arrange(means_all, state),5)
head(arrange(means_all2, val),5)

means_all40 <- means_all %>% filter(hours == 40)
means_all240 <- means_all2 %>% filter(hours == 40)

head(arrange(means_all40, state),5)
head(arrange(means_all240, val),5)


best_wo_budget_obj1 <- means_all %>% filter(hours == 80, effort == 0.5, dr == "hocc")
best_w_budget_obj1 <- means_all %>% filter(hours == 40, effort == 1, dr == "linear")

((best_wo_budget_obj1$state - best_w_budget_obj1$state)/best_wo_budget_obj1$state)*100


best_wo_budget_obj2 <- means_all2 %>% filter(hours == 80, effort == 0.5, dr == "hocc")
best_w_budget_obj2 <- means_all2 %>% filter(hours == 40, effort == 1, dr == "linear")

((best_wo_budget_obj2$val - best_w_budget_obj2$val)/best_wo_budget_obj2$val)*100
