library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States Fin ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'states_fin.csv',sep = '/')
hstatebins_finstate <- fread(file_name)
hstatebins_finstate <- data.frame(hstatebins_finstate)

path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'states_fin.csv',sep = '/')
smartepicenter_finstate <- fread(file_name)
smartepicenter_finstate <- data.frame(smartepicenter_finstate)

path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'states_fin.csv',sep = '/')
linear_finstate <- fread(file_name)
linear_finstate <- data.frame(linear_finstate)

finstate <- rbind(hstatebins_finstate,smartepicenter_finstate,linear_finstate)

path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'finstates.csv',sep = '/')
fwrite(finstate,file_name)

#### States Fin truth ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
hstatebins_finstate_truth <- fread(file_name)
hstatebins_finstate_truth <- data.frame(hstatebins_finstate_truth)

path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
smartepicenter_finstate_truth <- fread(file_name)
smartepicenter_finstate_truth <- data.frame(smartepicenter_finstate_truth)

path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
linear_finstate_truth <- fread(file_name)
linear_finstate_truth <- data.frame(linear_finstate_truth)

path <- 'D:\\Chapter3\\results\\noremoval'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
noremoval_finstate_truth <- fread(file_name)
noremoval_finstate_truth <- data.frame(noremoval_finstate_truth)

true_finstate <- rbind(hstatebins_finstate_truth,
                       smartepicenter_finstate_truth,
                       linear_finstate_truth,
                       noremoval_finstate_truth)

path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'true_finstates.csv',sep = '/')
fwrite(true_finstate,file_name)

#### Bias state ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'bias_state.csv',sep = '/')
hstatebins_bias_state <- fread(file_name)
hstatebins_bias_state <- data.frame(hstatebins_bias_state)

path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'bias_state.csv',sep = '/')
smartepicenter_bias_state <- fread(file_name)
smartepicenter_bias_state <- data.frame(smartepicenter_bias_state)

path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'bias_state.csv',sep = '/')
linear_bias_state <- fread(file_name)
linear_bias_state <- data.frame(linear_bias_state)

bias_state <- rbind(hstatebins_bias_state, smartepicenter_bias_state, linear_bias_state)

path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'bais_states.csv',sep = '/')
fwrite(bias_state,file_name)

#### CI state ####

#### Params ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'params.csv',sep = '/')
hstatebins_params <- fread(file_name)
hstatebins_params <- data.frame(hstatebins_params)

path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'params.csv',sep = '/')
smartepicenter_params <- fread(file_name)
smartepicenter_params <- data.frame(smartepicenter_params)

path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'params.csv',sep = '/')
linear_params <- fread(file_name)
linear_params <- data.frame(linear_params)

params <- rbind(hstatebins_params, smartepicenter_params, linear_params)
path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'params.csv',sep = '/')
fwrite(params,file_name)

#### Bias params ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'bias_params.csv',sep = '/')
hstatebins_bias_param <- fread(file_name)
hstatebins_bias_param <- data.frame(hstatebins_bias_param)

path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'bias_params.csv',sep = '/')
smartepicenter_bias_param <- fread(file_name)
smartepicenter_bias_param <- data.frame(smartepicenter_bias_param)

path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_bias_param <- fread(file_name)
linear_bias_param <- data.frame(linear_bias_param)

bias_param <- rbind(hstatebins_bias_param, smartepicenter_bias_param, linear_bias_param)
path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'bias_params.csv',sep = '/')
fwrite(bias_param,file_name)

#### CI params ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'CI_param.csv',sep = '/')
hstatebins_CI_param <- fread(file_name)
hstatebins_CI_param <- data.frame(hstatebins_CI_param)

path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'CI_param.csv',sep = '/')
smartepicenter_CI_param <- fread(file_name)
smartepicenter_CI_param <- data.frame(smartepicenter_CI_param)

path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'CI_param.csv',sep = '/')
linear_CI_param <- fread(file_name)
linear_CI_param <- data.frame(linear_CI_param)

CI_param <- rbind(hstatebins_CI_param, smartepicenter_CI_param, linear_CI_param)
path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'CI_params.csv',sep = '/')
fwrite(CI_param,file_name)

#### Param summary ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'param_summary.csv',sep = '/')
hstatebins_paramsum <- fread(file_name)
hstatebins_paramsum <- data.frame(hstatebins_paramsum)

path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'param_summary.csv',sep = '/')
smartepicenter_paramsum <- fread(file_name)
smartepicenter_paramsum <- data.frame(smartepicenter_paramsum)

path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'param_summary.csv',sep = '/')
linear_paramsum <- fread(file_name)
linear_paramsum <- data.frame(linear_paramsum)

paramsum <- rbind(hstatebins_paramsum, smartepicenter_paramsum, linear_paramsum)
path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'param_summary.csv',sep = '/')
fwrite(paramsum,file_name)

#### Dist travel ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'dist.csv',sep = '/')
hstatebins_dist <- fread(file_name)
hstatebins_dist <- data.frame(hstatebins_dist)

path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'dist.csv',sep = '/')
smartepicenter_dist <- fread(file_name)
smartepicenter_dist <- data.frame(smartepicenter_dist)

path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'dist.csv',sep = '/')
linear_dist <- fread(file_name)
linear_dist <- data.frame(linear_dist)

dist <- rbind(hstatebins_dist, smartepicenter_dist, linear_dist)
path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'dist.csv',sep = '/')
fwrite(dist,file_name)

#### Sites Visit ####
##### total visit ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'sites.csv',sep = '/')
hstatebins_sites <- fread(file_name)
hstatebins_sites <- data.frame(hstatebins_sites)

hstatebins_total_visit <- hstatebins_sites
hstatebins_total_visit$visit[hstatebins_total_visit$visit == 2] <- 1 

hstatebins_total_visit <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                           data = as.data.frame(hstatebins_total_visit), 
                           FUN = sum)

#sometimes the max is > 1 if we visited at second observation 
hstatebins_total_visit <- hstatebins_total_visit %>% filter(week < 5)
hstatebins_total_visit$visit <- hstatebins_total_visit$visit/40

hstatebins_total_visit$visit[hstatebins_total_visit$visit > 1] <- 1


path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'sites.csv',sep = '/')
smartepicenter_sites <- fread(file_name)
smartepicenter_sites <- data.frame(smartepicenter_sites)

smartepicenter_total_visit <- smartepicenter_sites
smartepicenter_total_visit$visit[smartepicenter_total_visit$visit == 2] <- 1 

smartepicenter_total_visit <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                                data = as.data.frame(smartepicenter_total_visit), 
                                FUN = sum)

smartepicenter_total_visit <- smartepicenter_total_visit %>% filter(week < 5)
smartepicenter_total_visit$visit <- smartepicenter_total_visit$visit/40 #as a percentage
smartepicenter_total_visit$visit[smartepicenter_total_visit$visit > 1] <- 1

path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'sites.csv',sep = '/')
linear_sites <- fread(file_name)
linear_sites <- data.frame(linear_sites)

linear_total_visit <- linear_sites
linear_total_visit$visit[linear_total_visit$visit == 2] <- 1 

linear_total_visit <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                                data = as.data.frame(linear_total_visit), 
                                FUN = sum)

linear_total_visit <- linear_total_visit %>% filter(week < 5)
linear_total_visit$visit <- linear_total_visit$visit/40 #as a percentage
linear_total_visit$visit[linear_total_visit$visit > 1] <- 1


total_visit <- rbind(hstatebins_total_visit, smartepicenter_total_visit, linear_total_visit)
path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'total_visit.csv',sep = '/')
fwrite(total_visit,file_name)

##### total remove ####
path <- 'D:\\Chapter3\\results\\hstatebins'
file_name = paste(path, 'sites.csv',sep = '/')
hstatebins_sites <- fread(file_name)
hstatebins_sites <- data.frame(hstatebins_sites)

hstatebins_total_rem <- hstatebins_sites
hstatebins_total_rem$visit[hstatebins_total_rem$visit == 1] <- 0 
hstatebins_total_rem$visit[hstatebins_total_rem$visit == 2] <- 1 

hstatebins_total_rem <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                                data = as.data.frame(hstatebins_total_rem), 
                                FUN = sum)

hstatebins_total_rem <- hstatebins_total_rem %>% filter(week < 5)
hstatebins_total_rem$visit <- hstatebins_total_rem$visit/40 #as a percentage
hstatebins_total_rem$visit[hstatebins_total_rem$visit > 1] <- 1

path <- 'D:\\Chapter3\\results\\smartepicenter'
file_name = paste(path, 'sites.csv',sep = '/')
smartepicenter_sites <- fread(file_name)
smartepicenter_sites <- data.frame(smartepicenter_sites)

smartepicenter_total_rem <- smartepicenter_sites
smartepicenter_total_rem$visit[smartepicenter_total_rem$visit == 1] <- 0 
smartepicenter_total_rem$visit[smartepicenter_total_rem$visit == 2] <- 1 

smartepicenter_total_rem <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                             data = as.data.frame(smartepicenter_total_rem), 
                             FUN = sum)

smartepicenter_total_rem <- smartepicenter_total_rem %>% filter(week < 5)
smartepicenter_total_rem$visit <- smartepicenter_total_rem$visit/40 #as a percentage
smartepicenter_total_rem$visit[smartepicenter_total_rem$visit > 1] <- 1


path <- 'D:\\Chapter3\\results\\linear'
file_name = paste(path, 'sites.csv',sep = '/')
linear_sites <- fread(file_name)
linear_sites <- data.frame(linear_sites)

linear_total_rem <- linear_sites
linear_total_rem$visit[linear_total_rem$visit == 1] <- 0 
linear_total_rem$visit[linear_total_rem$visit == 2] <- 1 

linear_total_rem <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                                data = as.data.frame(linear_total_rem), 
                                FUN = sum)

linear_total_rem <- linear_total_rem %>% filter(week < 5)
linear_total_rem$visit <- linear_total_rem$visit/40 #as a percentage
linear_total_rem$visit[linear_total_rem$visit > 1] <- 1


total_rem <- rbind(hstatebins_total_rem, smartepicenter_total_rem, linear_total_rem)
path <- 'D:\\Chapter3\\results'
file_name = paste(path, 'total_rem.csv',sep = '/')
fwrite(total_rem,file_name)

