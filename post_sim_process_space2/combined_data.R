library(tidyverse)
library(here)
library(plyr)
library(data.table)

#### States Fin ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'states_fin.csv',sep = '/')
hstate_finstate <- fread(file_name)
hstate_finstate <- data.frame(hstate_finstate)

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'states_fin.csv',sep = '/')
epicenter_finstate <- fread(file_name)
epicenter_finstate <- data.frame(epicenter_finstate)

path <- 'E:\\Chapter3\\results_space2\\linear'
file_name = paste(path, 'states_fin.csv',sep = '/')
linear_finstate <- fread(file_name)
linear_finstate <- data.frame(linear_finstate)

finstate <- rbind(hstate_finstate,epicenter_finstate,linear_finstate)

path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'finstates.csv',sep = '/')
fwrite(finstate,file_name)

#### States Fin truth ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
hstate_finstate_truth <- fread(file_name)
hstate_finstate_truth <- data.frame(hstate_finstate_truth)

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
epicenter_finstate_truth <- fread(file_name)
epicenter_finstate_truth <- data.frame(epicenter_finstate_truth)

path <- 'E:\\Chapter3\\results_space2\\linear'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
linear_finstate_truth <- fread(file_name)
linear_finstate_truth <- data.frame(linear_finstate_truth)

path <- 'E:\\Chapter3\\results_space2\\noremoval'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
noremoval_finstate_truth <- fread(file_name)
noremoval_finstate_truth <- data.frame(noremoval_finstate_truth)

true_finstate <- rbind(hstate_finstate_truth,
                       epicenter_finstate_truth,
                       linear_finstate_truth,
                       noremoval_finstate_truth)

path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'true_finstates.csv',sep = '/')
fwrite(true_finstate,file_name)

#### Bias state ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'bias_state.csv',sep = '/')
hstate_bias_state <- fread(file_name)
hstate_bias_state <- data.frame(hstate_bias_state)

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'bias_state.csv',sep = '/')
epicenter_bias_state <- fread(file_name)
epicenter_bias_state <- data.frame(epicenter_bias_state)

path <- 'E:\\Chapter3\\results_space2\\linear'
file_name = paste(path, 'bias_state.csv',sep = '/')
linear_bias_state <- fread(file_name)
linear_bias_state <- data.frame(linear_bias_state)

bias_state <- rbind(hstate_bias_state, epicenter_bias_state, linear_bias_state)

path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'bais_states.csv',sep = '/')
fwrite(bias_state,file_name)

#### CI state ####

#### Params ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'params.csv',sep = '/')
hstate_params <- fread(file_name)
hstate_params <- data.frame(hstate_params)

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'params.csv',sep = '/')
epicenter_params <- fread(file_name)
epicenter_params <- data.frame(epicenter_params)

path <- 'E:\\Chapter3\\results_space2\\linear'
file_name = paste(path, 'params.csv',sep = '/')
linear_params <- fread(file_name)
linear_params <- data.frame(linear_params)

params <- rbind(hstate_params, epicenter_params, linear_params)
path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'params.csv',sep = '/')
fwrite(params,file_name)

#### Bias params ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'bias_params.csv',sep = '/')
hstate_bias_param <- fread(file_name)
hstate_bias_param <- data.frame(hstate_bias_param)

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'bias_params.csv',sep = '/')
epicenter_bias_param <- fread(file_name)
epicenter_bias_param <- data.frame(epicenter_bias_param)

path <- 'E:\\Chapter3\\results_space2\\linear'
file_name = paste(path, 'bias_params.csv',sep = '/')
linear_bias_param <- fread(file_name)
linear_bias_param <- data.frame(linear_bias_param)

bias_param <- rbind(hstate_bias_param, epicenter_bias_param, linear_bias_param)
path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'bias_params.csv',sep = '/')
fwrite(bias_param,file_name)

#### CI params ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'CI_param.csv',sep = '/')
hstate_CI_param <- fread(file_name)
hstate_CI_param <- data.frame(hstate_CI_param)

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'CI_param.csv',sep = '/')
epicenter_CI_param <- fread(file_name)
epicenter_CI_param <- data.frame(epicenter_CI_param)

path <- 'E:\\Chapter3\\results_space2\\linear'
file_name = paste(path, 'CI_param.csv',sep = '/')
linear_CI_param <- fread(file_name)
linear_CI_param <- data.frame(linear_CI_param)

CI_param <- rbind(hstate_CI_param, epicenter_CI_param, linear_CI_param)
path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'CI_params.csv',sep = '/')
fwrite(CI_param,file_name)

#### Param summary ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'param_summary.csv',sep = '/')
hstate_paramsum <- fread(file_name)
hstate_paramsum <- data.frame(hstate_paramsum)

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'param_summary.csv',sep = '/')
epicenter_paramsum <- fread(file_name)
epicenter_paramsum <- data.frame(epicenter_paramsum)

path <- 'E:\\Chapter3\\results_space2\\linear'
file_name = paste(path, 'param_summary.csv',sep = '/')
linear_paramsum <- fread(file_name)
linear_paramsum <- data.frame(linear_paramsum)

paramsum <- rbind(hstate_paramsum, epicenter_paramsum, linear_paramsum)
path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'param_summary.csv',sep = '/')
fwrite(paramsum,file_name)

#### Dist travel ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'dist.csv',sep = '/')
hstate_dist <- fread(file_name)
hstate_dist <- data.frame(hstate_dist)

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'dist.csv',sep = '/')
epicenter_dist <- fread(file_name)
epicenter_dist <- data.frame(epicenter_dist)

path <- 'E:\\Chapter3\\results_space2\\linear'
file_name = paste(path, 'dist.csv',sep = '/')
linear_dist <- fread(file_name)
linear_dist <- data.frame(linear_dist)

dist <- rbind(hstate_dist, epicenter_dist, linear_dist)
path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'dist.csv',sep = '/')
fwrite(dist,file_name)

#### Sites Visit ####
##### total visit ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'sites.csv',sep = '/')
hstate_sites <- fread(file_name)
hstate_sites <- data.frame(hstate_sites)

hstate_total_visit <- hstate_sites
hstate_total_visit$visit[hstate_total_visit$visit == 2] <- 1 

hstate_total_visit <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                           data = as.data.frame(hstate_total_visit), 
                           FUN = sum)

hstate_total_visit <- hstate_total_visit %>% filter(week < 5)
hstate_total_visit$visit <- hstate_total_visit$visit/40 #as a percentage

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'sites.csv',sep = '/')
epicenter_sites <- fread(file_name)
epicenter_sites <- data.frame(epicenter_sites)

epicenter_total_visit <- epicenter_sites
epicenter_total_visit$visit[epicenter_total_visit$visit == 2] <- 1 

epicenter_total_visit <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                                data = as.data.frame(epicenter_total_visit), 
                                FUN = sum)

epicenter_total_visit <- epicenter_total_visit %>% filter(week < 5)
epicenter_total_visit$visit <- epicenter_total_visit$visit/40 #as a percentage

path <- 'E:\\Chapter3\\results_space2\\linear'
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

total_visit <- rbind(hstate_total_visit, epicenter_total_visit, linear_total_visit)
path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'total_visit.csv',sep = '/')
fwrite(total_visit,file_name)

##### total remove ####
path <- 'E:\\Chapter3\\results_space2\\hstate'
file_name = paste(path, 'sites.csv',sep = '/')
hstate_sites <- fread(file_name)
hstate_sites <- data.frame(hstate_sites)

hstate_total_rem <- hstate_sites
hstate_total_rem$visit[hstate_total_rem$visit == 1] <- 0 
hstate_total_rem$visit[hstate_total_rem$visit == 2] <- 1 

hstate_total_rem <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                                data = as.data.frame(hstate_total_rem), 
                                FUN = sum)

hstate_total_rem <- hstate_total_rem %>% filter(week < 5)
hstate_total_rem$visit <- hstate_total_rem$visit/40 #as a percentage

path <- 'E:\\Chapter3\\results_space2\\epicenter'
file_name = paste(path, 'sites.csv',sep = '/')
epicenter_sites <- fread(file_name)
epicenter_sites <- data.frame(epicenter_sites)

epicenter_total_rem <- epicenter_sites
epicenter_total_rem$visit[epicenter_total_rem$visit == 1] <- 0 
epicenter_total_rem$visit[epicenter_total_rem$visit == 2] <- 1 

epicenter_total_rem <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                             data = as.data.frame(epicenter_total_rem), 
                             FUN = sum)

epicenter_total_rem <- epicenter_total_rem %>% filter(week < 5)
epicenter_total_rem$visit <- epicenter_total_rem$visit/40 #as a percentage

path <- 'E:\\Chapter3\\results_space2\\linear'
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

total_rem <- rbind(hstate_total_rem, epicenter_total_rem, linear_total_rem)
path <- 'E:\\Chapter3\\results_space2'
file_name = paste(path, 'total_rem.csv',sep = '/')
fwrite(total_rem,file_name)

# #### VOI ####
# ##### Suppress ####
# path <- 'E:\\Chapter3\\results_space2\\hstate'
# file_name = paste(path, 'VOI_suppress.csv',sep = '/')
# hstate_VOI_suppress <- fread(file_name)
# hstate_VOI_suppress <- data.frame(hstate_VOI_suppress)
# 
# path <- 'E:\\Chapter3\\results_space2\\linear'
# file_name = paste(path, 'VOI_suppress.csv',sep = '/')
# linear_VOI_suppress <- fread(file_name)
# linear_VOI_suppress <- data.frame(linear_VOI_suppress)
# 
# 
# VOI_suppress <- rbind(hstate_VOI_suppress, linear_VOI_suppress)
# path <- 'E:\\Chapter3\\results_space2'
# file_name = paste(path, 'VOI_suppress.csv',sep = '/')
# fwrite(VOI_suppress,file_name)
# 
# ##### Contain ####
# path <- 'E:\\Chapter3\\results_space2\\hstate'
# file_name = paste(path, 'VOI_contain.csv',sep = '/')
# hstate_VOI_contain <- fread(file_name)
# hstate_VOI_contain <- data.frame(hstate_VOI_contain)
# 
# path <- 'E:\\Chapter3\\results_space2\\linear'
# file_name = paste(path, 'VOI_contain.csv',sep = '/')
# linear_VOI_contain <- fread(file_name)
# linear_VOI_contain <- data.frame(linear_VOI_contain)
# 
# 
# VOI_contain <- rbind(hstate_VOI_contain, linear_VOI_contain)
# path <- 'E:\\Chapter3\\results_space2'
# file_name = paste(path, 'VOI_contain.csv',sep = '/')
# fwrite(VOI_contain,file_name)
