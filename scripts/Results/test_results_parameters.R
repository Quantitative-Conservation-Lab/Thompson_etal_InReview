library(tidyverse)
library(here)
library(plyr)
library(data.table)
library(RColorBrewer) 

path <- here::here("results", "test_parameters")

#### 30 hour budget ####
path2 <- "SrL_RrL_30"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SrL_RrL_30_state <- fread(file_name)
SrL_RrL_30_state <- data.frame(SrL_RrL_30_state)[-1]
SrL_RrL_30_state$run <- 'a'

path2 <- "SrL_RrL_30b"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SrL_RrL_30_stateb <- fread(file_name)
SrL_RrL_30_stateb <- data.frame(SrL_RrL_30_stateb)[-1]
SrL_RrL_30_stateb$run <- 'b'

SrL_RrL_30_states <- rbind(SrL_RrL_30_state, SrL_RrL_30_stateb)

SrL_RrL_30_sfin <- SrL_RrL_30_states %>% filter(week == 5 & year == 10)

SrL_RrL_30_sfin_avg <-  aggregate(state ~  run +sim,
                                    data = as.data.frame(SrL_RrL_30_sfin),
                                  FUN = mean)

SrL_RrL_30_sfin_avg$alt <- 'SL_RL'

path2 <- "SL_RL_30"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SL_RL_30_state <- fread(file_name)
SL_RL_30_state <- data.frame(SL_RL_30_state)[-1]
SL_RL_30_state$run <- 'a'

path2 <- "SL_RL_30b"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SL_RL_30_stateb <- fread(file_name)
SL_RL_30_stateb <- data.frame(SL_RL_30_stateb)[-1]
SL_RL_30_stateb$run <- 'b'

SL_RL_30_states <- rbind(SL_RL_30_state, SL_RL_30_stateb)

SL_RL_30_sfin <- SL_RL_30_states %>% filter(week == 5 & year == 10)

SL_RL_30_sfin_avg <-  aggregate(state ~  run +sim,
                                  data = as.data.frame(SL_RL_30_sfin),
                                  FUN = mean)

SL_RL_30_sfin_avg$alt <- 'SM_RM'

path2 <- "SH_RH_30"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SH_RH_30_state <- fread(file_name)
SH_RH_30_state <- data.frame(SH_RH_30_state)[-1]
SH_RH_30_state$run <- 'a'

path2 <- "SH_RH_30b"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SH_RH_30_stateb <- fread(file_name)
SH_RH_30_stateb <- data.frame(SH_RH_30_stateb)[-1]
SH_RH_30_stateb$run <- 'b'

SH_RH_30_states <- rbind(SH_RH_30_state, SH_RH_30_stateb)

SH_RH_30_sfin <- SH_RH_30_states %>% filter(week == 5 & year == 10)

SH_RH_30_sfin_avg <-  aggregate(state ~  run +sim,
                                data = as.data.frame(SH_RH_30_sfin),
                                FUN = mean)
SH_RH_30_sfin_avg$alt <- 'SH_RH'

SrL_RrL_30_sfin_avg$means <- mean(SrL_RrL_30_sfin_avg$state)
SL_RL_30_sfin_avg$means <- mean(SL_RL_30_sfin_avg$state)
SH_RH_30_sfin_avg$means <- mean(SH_RH_30_sfin_avg$state)

combine_tests <- rbind(SrL_RrL_30_sfin_avg,
                       SL_RL_30_sfin_avg,
                       SH_RH_30_sfin_avg )

level_order <- c("SL_RL", "SM_RM", "SH_RH")

ggplot(combine_tests)+
  geom_jitter(aes(x = sim, y = state, color = run))+
  geom_hline(aes(yintercept = means, color = 'mean'))+
  facet_grid(~factor(alt, levels = level_order)) +
  ylab("Average true state after 10 yrs")+
  xlab("Parameter Set")

combine_tests$bestalt <- 'NA'

for(i in 1:length(combine_tests$run)){
  df <- combine_tests %>% filter(run == combine_tests$run[i],
                                 sim == combine_tests$sim[i]
                                 )
  
  combine_tests$bestalt[i] <- which.min(df$state)
  
}

ggplot(combine_tests)+
  geom_point(aes(x = sim, y = bestalt, shape = run), size = 2)+
  scale_shape_manual(values = c(5, 20)) +
  ylab("Best Alternative")+
  xlab("Parameter Set")


#### 60 hour budget ####
path2 <- "SrL_RrL_60"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SrL_RrL_60_state <- fread(file_name)
SrL_RrL_60_state <- data.frame(SrL_RrL_60_state)[-1]
SrL_RrL_60_state$run <- 'a'

path2 <- "SrL_RrL_60b"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SrL_RrL_60_stateb <- fread(file_name)
SrL_RrL_60_stateb <- data.frame(SrL_RrL_60_stateb)[-1]
SrL_RrL_60_stateb$run <- 'b'

SrL_RrL_60_states <- rbind(SrL_RrL_60_state, SrL_RrL_60_stateb)

SrL_RrL_60_sfin <- SrL_RrL_60_states %>% filter(week == 5 & year == 10)

SrL_RrL_60_sfin_avg <-  aggregate(state ~  run +sim,
                                  data = as.data.frame(SrL_RrL_60_sfin),
                                  FUN = mean)

SrL_RrL_60_sfin_avg$alt <- 'SL_RL'

path2 <- "SL_RL_60"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SL_RL_60_state <- fread(file_name)
SL_RL_60_state <- data.frame(SL_RL_60_state)[-1]
SL_RL_60_state$run <- 'a'

path2 <- "SL_RL_60b"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SL_RL_60_stateb <- fread(file_name)
SL_RL_60_stateb <- data.frame(SL_RL_60_stateb)[-1]
SL_RL_60_stateb$run <- 'b'

SL_RL_60_states <- rbind(SL_RL_60_state, SL_RL_60_stateb)

SL_RL_60_sfin <- SL_RL_60_states %>% filter(week == 5 & year == 10)

SL_RL_60_sfin_avg <-  aggregate(state ~  run +sim,
                                data = as.data.frame(SL_RL_60_sfin),
                                FUN = mean)

SL_RL_60_sfin_avg$alt <- 'SM_RM'

path2 <- "SH_RH_60"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SH_RH_60_state <- fread(file_name)
SH_RH_60_state <- data.frame(SH_RH_60_state)[-1]
SH_RH_60_state$run <- 'a'

path2 <- "SH_RH_60b"
file_name = paste(path, path2,'states_truth.csv',sep = '/')
SH_RH_60_stateb <- fread(file_name)
SH_RH_60_stateb <- data.frame(SH_RH_60_stateb)[-1]
SH_RH_60_stateb$run <- 'b'

SH_RH_60_states <- rbind(SH_RH_60_state, SH_RH_60_stateb)

SH_RH_60_sfin <- SH_RH_60_states %>% filter(week == 5 & year == 10)

SH_RH_60_sfin_avg <-  aggregate(state ~  run +sim,
                                data = as.data.frame(SH_RH_60_sfin),
                                FUN = mean)
SH_RH_60_sfin_avg$alt <- 'SH_RH'

SrL_RrL_60_sfin_avg$means <- mean(SrL_RrL_60_sfin_avg$state)
SL_RL_60_sfin_avg$means <- mean(SL_RL_60_sfin_avg$state)
SH_RH_60_sfin_avg$means <- mean(SH_RH_60_sfin_avg$state)

combine_tests <- rbind(SrL_RrL_60_sfin_avg,
                       SL_RL_60_sfin_avg,
                       SH_RH_60_sfin_avg )

level_order <- c("SL_RL", "SM_RM", "SH_RH")

ggplot(combine_tests)+
  geom_jitter(aes(x = sim, y = state, color = run))+
  geom_hline(aes(yintercept = means, color = 'mean'))+
  facet_grid(~factor(alt, levels = level_order)) +
  ylab("Average true state after 10 yrs")+
  xlab("Parameter Set")

combine_tests$bestalt <- 'NA'

for(i in 1:length(combine_tests$run)){
  df <- combine_tests %>% filter(run == combine_tests$run[i],
                                 sim == combine_tests$sim[i]
  )
  
  combine_tests$bestalt[i] <- which.min(df$state)
  
}

ggplot(combine_tests)+
  geom_point(aes(x = sim, y = bestalt, shape = run), size = 2)+
  scale_shape_manual(values = c(5, 20)) +
  ylab("Best Alternative")+
  xlab("Parameter Set")
