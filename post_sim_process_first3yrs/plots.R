library(plyr)
library(tidyverse)
library(here)
library(data.table)
library(scales)
library(RColorBrewer) 
library("cowplot")
library(rPref)
library(ggrepel)



#### States Fin truth ####
path <- 'E:\\Chapter3\\results_3yrs'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
finstate_truth <- fread(file_name)
finstate_truth <- data.frame(finstate_truth)


finstate_truth$state <- finstate_truth$state - 1

finstate_truth <- aggregate(state ~ sim + budget + space, 
                            data = as.data.frame(finstate_truth), 
                            FUN = mean)

cols <- brewer.pal(12, "Paired") 
colors <- c('lightgreen', 'green2', 'darkgreen')

colors2 <- c('deeppink3', 'grey50')

finstate_truth$budget <- as.factor(finstate_truth$budget)

finstate_truth %>% 
  ggplot(aes(x = space, y = state, fill = budget, color = space,
             group = interaction(space, budget)))+
  geom_boxplot() +
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(space, budget)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
                              "space1",
                              "space2"),
                   labels=c(
                    "space1" = "Space 1",
                     "space2" = "Space 2"))+

  scale_fill_manual(name = paste0('Budget'),
                    values = colors) +
scale_color_manual(name = "Space",
                  values = colors2, 
                  labels = c('Space 1', 'Space 2') )+
  
  xlab("Space")+
  ylab("Average final invasion state")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        #strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget, nrow = 3, labeller = label_both)

detach(package:plyr)

budget20_suppress <- finstate_truth %>% 
  filter(budget == 20) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            lower = quantile(state, 0.1),
            upper = quantile(state, 0.9))

budget40_suppress <- finstate_truth %>% 
  filter(budget == 40) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            lower = quantile(state, 0.1),
            upper = quantile(state, 0.9))

budget60_suppress <- finstate_truth %>% 
  filter(budget == 60) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            lower = quantile(state, 0.1),
            upper = quantile(state, 0.9))

#### States inv truth ####
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
fininv_truth <- fread(file_name)
fininv_truth <- data.frame(fininv_truth)

fininv_truth$inv <- fininv_truth$state
fininv_truth$inv[fininv_truth$inv <= 2 ] <- 0
fininv_truth$inv[fininv_truth$inv > 2 ] <- 1

fininv_truth <- aggregate(inv ~ sim + budget + space, 
                            data = as.data.frame(fininv_truth), 
                            FUN = mean)

fininv_truth$budget <- as.factor(fininv_truth$budget)

fininv_truth %>% 
  ggplot(aes(x = space, y = inv, fill = budget, color = space,
             group = interaction(space, budget)))+
  geom_boxplot() +
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(space, budget)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "space1",
    "space2"),
    labels=c(
      "space1" = "Space 1",
      "space2" = "Space 2"))+
  
  scale_fill_manual(name = paste0('Budget'),
                    values = colors) +
  scale_color_manual(name = "Space",
                     values = colors2, 
                     labels = c('Space 1', 'Space 2') )+
  
  xlab("Space")+
  ylab("Average final invasion state")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        #strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget, nrow = 3, labeller = label_both)

budget20_contain <- fininv_truth %>% 
  filter(budget == 20) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv),
            lower = quantile(inv, 0.1),
            upper = quantile(inv, 0.9))

budget40_contain  <- fininv_truth %>% 
  filter(budget == 40) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv),
            lower = quantile(inv, 0.1),
            upper = quantile(inv, 0.9))

budget60_contain <- fininv_truth %>% 
  filter(budget == 60) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv),
            lower = quantile(inv, 0.1),
            upper = quantile(inv, 0.9))

#### Bias state ####
file_name = paste(path, 'bias_state.csv',sep = '/')
bias_state <- fread(file_name)
bias_state <- data.frame(bias_state)

bias_state$budget <- as.factor(bias_state$budget)

bias_state %>% 
  ggplot(aes(x = space, y = rel.bias, fill = budget, color = space,
             group = interaction(space, budget)))+
  geom_boxplot() +
  geom_hline(yintercept = 0, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(space, budget)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "space1",
    "space2"),
    labels=c(
      "space1" = "Space 1",
      "space2" = "Space 2"))+
  
  scale_fill_manual(name = paste0('Budget'),
                    values = colors) +
  scale_color_manual(name = "Space",
                     values = colors2, 
                     labels = c('Space 1', 'Space 2') )+
  xlab("Space")+
  ylab("Average final invasion state")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        #strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget, nrow = 3, labeller = label_both)
 

budget20_biasstate <- bias_state %>% 
  filter(budget == 20) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))

budget40_biasstate <- bias_state %>% 
  filter(budget == 40) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))

budget60_biasstate <- bias_state %>% 
  filter(budget == 60) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))

##### Bias state- time ####
bias_state_years <- bias_state %>%
  group_by(space, year, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

ggplot(bias_state_years, aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = space))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8,10)) +
  scale_color_manual(name = paste0('Space'),
                     values = colors2) +
  ylab("State relative bias ")+
  xlab("Year")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget, nrow = 3, labeller = label_both)

#### Bias params ####
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param <- fread(file_name)
bias_param <- data.frame(bias_param)


###### Detection bias ####
bias_param_detect  <- bias_param %>% filter(param %in% c("B0.p.h", "B0.p.h", "B1.p.l", "B1.p.h"))

budget20_bias_param_detect <- bias_param_detect %>% 
  filter(budget == 20) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(rel.bias))

budget40_bias_param_detect <- bias_param_detect %>% 
  filter(budget == 40) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(rel.bias))

budget60_bias_param_detect <- bias_param_detect %>% 
  filter(budget == 60) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(rel.bias))

###### Time #######
bias_param_detect_years <- bias_param_detect %>%
  group_by(space, year, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

ggplot(bias_param_detect_years, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = space))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8, 10)) +
  scale_color_manual(name = paste0('Space'),
                     values = colors2) +
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
  facet_wrap(~budget, nrow = 3, labeller = label_both, scales = "free")

###### Eradication bias ####
bias_param_eps  <- bias_param %>% filter(param %in% c("B0.eps.h", "B0.eps.h", "B1.eps.l", "B1.eps.h"))

budget20_bias_param_eps <- bias_param_eps %>% 
  filter(budget == 20) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(rel.bias))

budget40_bias_param_eps <- bias_param_eps %>% 
  filter(budget == 40) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(rel.bias))

budget60_bias_param_eps <- bias_param_eps %>% 
  filter(budget == 60) %>% 
  group_by(space) %>%
  summarise(mean_c = mean(rel.bias))

###### Time #######
bias_param_eps_years <- bias_param_eps %>%
  group_by(space, year, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

ggplot(bias_param_eps_years, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = space))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8, 10)) +
  scale_color_manual(name = paste0('Space'),
                     values = colors2) +
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
  facet_wrap(~budget, nrow = 3, labeller = label_both, scales = "free")
