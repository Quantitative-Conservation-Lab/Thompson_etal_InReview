library(plyr)
library(tidyverse)
library(here)
library(data.table)
library(scales)
library(RColorBrewer) 
library("cowplot")
library(rPref)
library(ggrepel)


#### NO REMOVAL ####
ncpath <- 'E:\\Chapter3\\results\\noremoval'
file_name = paste(ncpath, 'states_fin_truth.csv',sep = '/')
noremoval <- fread(file_name)
noremoval <- data.frame(noremoval)

nc.val <- mean(noremoval$state) -1 

noremoval$inv <- noremoval$state
noremoval$inv[noremoval$inv <= 2 ] <- 0
noremoval$inv[noremoval$inv > 2 ] <- 1
nc.inv <- mean(noremoval$inv)

#### States Fin truth ####
path <- 'E:\\Chapter3\\results'
file_name = paste(path, 'true_finstates.csv',sep = '/')
finstate_truth <- fread(file_name)
finstate_truth <- data.frame(finstate_truth)

finstate_truth$rates <- paste0('(p = )', finstate_truth$detection, ',  \u03F5 = ', finstate_truth$eradication)
finstate_truth$rates2 <- paste0('(', finstate_truth$detection, ', ', finstate_truth$eradication, ")")

finstate_truth$state <- finstate_truth$state - 1

finstate_truth <- aggregate(state ~ sim + location + detection + eradication + budget + rates + rates2, 
                            data = as.data.frame(finstate_truth), 
                            FUN = mean)

finstate_truth <- finstate_truth %>% filter(detection < 1 & detection > 0)

cols <- brewer.pal(12, "Paired") 
colors <- c(cols[1:4], cols[9:10])

colors2 <- c('darkorange', 'deeppink3', 'grey50')

finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication)

colnames(finstate_truth)[5] <- 'Budget'

finstate_truth %>% 
  ggplot(aes(x = loc2, y = state, fill = rates2, color = location,
             group = interaction(location, rates2)))+
  geom_boxplot() +
  geom_hline(yintercept = nc.val, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates2)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c("epicenter0.50.75",
                              "hstate0.750.5",
                              "linear0.750.5"),
                   labels=c(
                    "epicenter0.50.75" = "Epicenter",
                     "hstate0.750.5" = "High invasion",
                     "linear0.750.5" = "Linear"))+

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
        #strip.text.x = element_blank(),
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
            lower = quantile(state, 0.1),
            upper = quantile(state, 0.9))

budget40_suppress <- finstate_truth %>% 
  filter(Budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            lower = quantile(state, 0.1),
            upper = quantile(state, 0.9))

budget60_suppress <- finstate_truth %>% 
  filter(Budget == 60) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            lower = quantile(state, 0.1),
            upper = quantile(state, 0.9))

#### States inv truth ####
file_name = paste(path, 'true_finstates.csv',sep = '/')
fininv_truth <- fread(file_name)
fininv_truth <- data.frame(fininv_truth)

fininv_truth$rates <- paste0('p = ', fininv_truth$detection, ', e = ', fininv_truth$eradication)
fininv_truth$rates2 <- paste0('(', fininv_truth$detection, ', ', fininv_truth$eradication, ")")

fininv_truth$inv <- fininv_truth$state
fininv_truth$inv[fininv_truth$inv <= 2 ] <- 0
fininv_truth$inv[fininv_truth$inv > 2 ] <- 1

fininv_truth <- aggregate(inv ~ sim + location + detection + eradication + budget + rates + rates2, 
                            data = as.data.frame(fininv_truth), 
                            FUN = mean)

fininv_truth <- fininv_truth %>% filter(detection < 1 & detection > 0)

fininv_truth$loc2 <- paste0(fininv_truth$location, fininv_truth$detection, fininv_truth$eradication)

colnames(fininv_truth)[c(2,5)] <- c('Location', 'Budget')

fininv_truth %>% 
  ggplot(aes(x = loc2, y = inv, fill = rates2, color =Location,
             group = interaction(Location, rates2)))+
  geom_boxplot() +
  geom_hline(yintercept = nc.inv, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(Location, rates)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c("epicenter0.50.75",
                              "hstate0.750.5",
                              "linear0.750.5"),
                   labels=c(
                     "epicenter0.50.75" = "Epicenter",
                     "hstate0.750.5" = "High invasion",
                     "linear0.750.5" = "Linear"))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Prioritization",
                     values = colors2, 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  
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

budget20_contain <- fininv_truth %>% 
  filter(budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv),
            lower = quantile(inv, 0.1),
            upper = quantile(inv, 0.9))

budget40_contain  <- fininv_truth %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv),
            lower = quantile(inv, 0.1),
            upper = quantile(inv, 0.9))

budget60_contain <- fininv_truth %>% 
  filter(budget == 60) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv),
            lower = quantile(inv, 0.1),
            upper = quantile(inv, 0.9))


#### Dist travel ####
file_name = paste(path, 'dist.csv',sep = '/')
dist <- fread(file_name)
dist <- data.frame(dist)

dist$rates <- paste0('p = ', dist$detection, ', e = ', dist$eradication)

dist <- dist %>% filter(detection < 1 & detection > 0)

cols <- brewer.pal(6, "Paired") 
colors <- cols

dist$loc2 <- paste0(dist$location, dist$detection, dist$eradication)

dist %>% 
  ggplot(aes(x = loc2, y = distance, fill = rates, color = location,
             group = interaction(location, rates)))+
  geom_boxplot() +
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates)),
               width = .75, color = "red", linewidth = 1)+ 
  scale_x_discrete(breaks = c(#"epicenter0.50.75",
    "hstate0.750.5",
    "linear0.750.5"),
    labels=c(
      # "epicenter0.50.75" = "Epicenter",
      "hstate0.750.5" = "High state",
      "linear0.750.5" = "Linear"))+
  
  scale_fill_manual(name = "Management rates",
                    values = colors) +
  scale_color_manual(name = "Location",
                     values = colors2) +
  xlab("Site prioritization")+
  ylab("Distance traveled")+
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

#### Bias state ####
file_name = paste(path, 'bais_states.csv',sep = '/')
bias_state <- fread(file_name)
bias_state <- data.frame(bias_state)

bias_state$rates <- paste0('p = ', bias_state$detection, ', e = ', bias_state$eradication)

cols <- brewer.pal(6, "Paired") 
colors <- cols

bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication)

bias_state %>% 
  ggplot(aes(x = loc2, y = rel.bias, fill = rates,color = location, 
             group = interaction(location, rates)))+
  geom_boxplot() +
  geom_hline(yintercept = 0, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates)),
               width = .75, color = "red", linewidth = 1)+ 
  scale_x_discrete(breaks = c(#"epicenter0.50.75",
    "hstate0.750.5",
    "linear0.750.5"),
    labels=c(
      # "epicenter0.50.75" = "Epicenter",
      "hstate0.750.5" = "High state",
      "linear0.750.5" = "Linear"))+
  
  scale_fill_manual(name = "Management rates",
                    values = colors) +
  scale_color_manual(name = "Location",
                     values = colors2) +
  xlab("Site prioritization")+
  ylab("State RMSE")+
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
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))

budget40_biasstate <- bias_state %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))

budget60_biasstate <- bias_state %>% 
  filter(budget == 60) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))

##### Bias state- time ####
file_name = paste(path, 'bais_states.csv',sep = '/')
bias_state <- fread(file_name)
bias_state <- data.frame(bias_state)

bias_state$rates <- paste0('p = ', bias_state$detection, ', e = ', bias_state$eradication)

cols <- brewer.pal(6, "Paired") 
colors <- cols

bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication)

bias_state_years <- bias_state %>%
  group_by(location, year, rates, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

bias_state_years <- bias_state_years %>% filter(rates == "p = 0.75, e = 0.5" | rates == "p = 0.75, e = 0.75")

colnames(bias_state_years)[c(1,4)] <- c("Location", "Budget")

ggplot(bias_state_years, aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  facet_wrap(~location + budget)+
  scale_x_continuous(breaks = c(2,4,6,8, 10)) +
  scale_color_manual(name = "Management rates",
                    values = colors) +
  ylab("State RMSE")+
  xlab("Year")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget + Location, nrow = 3, labeller = label_both)


#### Bias params ####
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param <- fread(file_name)
bias_param <- data.frame(bias_param)

bias_param$rates <- paste0('p = ', bias_param$detection, ', e = ', bias_param$eradication)

cols <- brewer.pal(6, "Paired") 
colors <- cols

bias_param$loc2 <- paste0(bias_param$location, bias_param$detection, bias_param$eradication)

###### Detection bias ####
bias_param_detect  <- bias_param %>% filter(param %in% c("B0.p.h", "B0.p.h", "B1.p.l", "B1.p.h"))

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


###### Time #######
bias_param_detect_years <- bias_param_detect %>%
  group_by(location, year, rates, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))


bias_param_detect_years <- bias_param_detect_years %>% filter(rates == "p = 0.5, e = 0.75")

ggplot(bias_param_detect_years, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8, 10)) +
  scale_color_manual(name = "Management rates",
                     values = "black") +
  ylab("Parameter RMSE")+
  xlab("Year")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget + location, nrow = 3, labeller = label_both, scales = "free")

###### Eradication bias ####
bias_param_eps  <- bias_param %>% filter(param %in% c("B0.eps.h", "B0.eps.h", "B1.eps.l", "B1.eps.h"))

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

###### Time #######
bias_param_eps_years <- bias_param_eps %>%
  group_by(location, year, rates, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))


bias_param_eps_years <- bias_param_eps_years %>% filter(rates == "p = 0.5, e = 0.75")

ggplot(bias_param_eps_years, 
       aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = rates))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8, 10)) +
  scale_color_manual(name = "Management rates",
                     values = "black") +
  ylab("Parameter RMSE")+
  xlab("Year")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~budget + location, nrow = 3, labeller = label_both, scales = "free")

#### Sites Visit ####
##### total visit ####
file_name = paste(path, 'total_visit.csv',sep = '/')
total_visit <- fread(file_name)
total_visit <- data.frame(total_visit)

total_visit$rates <- paste0('p = ', total_visit$detection, ', e = ', total_visit$eradication)

total_visit <- total_visit %>% filter(detection < 1 & detection > 0)

cols <- brewer.pal(6, "Paired") 
colors <- cols

total_visit$loc2 <- paste0(total_visit$location, total_visit$detection, total_visit$eradication)


total_visit %>% 
  ggplot(aes(x = loc2, y = visit, fill = rates, 
             group = interaction(location, rates)))+
  geom_boxplot() +
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates)),
               width = .75, color = "red", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
                              "hstate0.750.5",
                              "linear0.750.5"), 
                   labels=c(
                     
                     "hstate0.750.5" = "High invasion",
                     "linear0.750.5" = "Linear"))+
  
  scale_fill_manual(name = "Management rates",
                    values = colors) +
  scale_color_manual(name = "Site prioritization",
                     values = colors2) +
  xlab("Site prioritization")+
  ylab("% of sites visited each week")+
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

budget20_total_visit <- total_visit %>% 
  filter(budget == 20) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(visit))

budget40_total_visit <- total_visit %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(visit))

budget60_total_visit <- total_visit %>% 
  filter(budget == 60) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(visit))


##### total remove ####
file_name = paste(path, 'total_rem.csv',sep = '/')
total_rem <- fread(file_name)
total_rem <- data.frame(total_rem)

total_rem$rates <- paste0('p = ', total_rem$detection, ', e = ', total_rem$eradication)

total_rem <- total_rem %>% filter(detection < 1 & detection > 0)

cols <- brewer.pal(6, "Paired") 
colors <- c(cols[1:2], "grey90", "grey30")

total_rem$loc2 <- paste0(total_rem$location, total_rem$detection, total_rem$eradication)

total_rem %>% 
  ggplot(aes(x = loc2, y = visit, fill = rates, 
             group = interaction(location, rates)))+
  geom_boxplot() +
  # geom_hline(yintercept = nc.inv, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates)),
               width = .75, color = "red", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
                              "hstate0.750.5",
                              "linear0.750.5"), 
                   labels=c(
                     
                     "hstate0.750.5" = "High invasion",
                     "linear0.750.5" = "Linear"))+
  
  scale_fill_manual(name = "Management rates",
                    values = colors) +
  scale_color_manual(name = "Site prioritization",
                     values = colors2) +
  xlab("Site prioritization")+
  ylab("% of sites visited each week")+
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

#### OTHERS ####
#  Suppress 
# file_name = paste(path, 'VOI_suppress.csv',sep = '/')
# VOI_suppress <- fread(file_name)
# VOI_suppress <- data.frame(VOI_suppress)
# 
# VOI_suppress$rates <- paste0('p = ', VOI_suppress$detection, ', e = ', VOI_suppress$eradication)
# 
# VOI_suppress <- VOI_suppress %>% filter(detection < 1 & detection > 0)
# 
# cols <- brewer.pal(6, "Paired") 
# colors <- c(cols[1:2], "grey90", "grey30")
# 
# VOI_suppress$loc2 <- paste0(VOI_suppress$location, VOI_suppress$detection, VOI_suppress$eradication)
# 
# VOI_suppress %>% 
#   ggplot(aes(x = loc2, y = VOI, fill = rates, 
#              group = interaction(location, rates)))+
#   geom_boxplot() +
#   geom_hline(yintercept = 0, linetype = 2) + 
#   stat_summary(fun.y = mean, geom = "errorbar",
#                aes(ymax = after_stat(y), ymin = after_stat(y),
#                    group = interaction(location, rates)),
#                width = .75, color = "red", linewidth = 1)+ 
#   scale_x_discrete(breaks = c(
#                               "hstate0.750.5",
#                               "linear0.750.5"), 
#                    labels=c(
#                      
#                      "hstate0.750.5" = "High invasion",
#                      "linear0.750.5" = "Linear"))+
#   
#   scale_fill_manual(name = "Management rates",
#                     values = colors) +
#   xlab("Site prioritization")+
#   ylab("VOI Suppression")+
#   theme_bw() +   
#   theme(strip.background=element_rect(colour="white",
#                                       fill="white"),
#         strip.text.x = element_blank(),
#         panel.border = element_rect(colour = "gray", size = 1.5), 
#         panel.grid.major = element_blank(),
#         panel.grid.minor = element_blank(),
#         axis.ticks = element_blank(),
#         axis.text.x = element_text(hjust = 1))+
#   facet_wrap(~budget, nrow = 3)
# 
# 
# 
# # Contain 
# file_name = paste(path, 'VOI_contain.csv',sep = '/')
# VOI_contain <- fread(file_name)
# VOI_contain <- data.frame(VOI_contain)
# 
# VOI_contain$rates <- paste0('p = ', VOI_contain$detection, ', e = ', VOI_contain$eradication)
# 
# VOI_contain <- VOI_contain %>% filter(detection < 1 & detection > 0)
# 
# cols <- brewer.pal(6, "Paired") 
# colors <- c(cols[1:2], "grey90", "grey30")
# 
# VOI_contain$loc2 <- paste0(VOI_contain$location, VOI_contain$detection, VOI_contain$eradication)
# 
# VOI_contain %>% 
#   ggplot(aes(x = loc2, y = VOI, fill = rates, 
#              group = interaction(location, rates)))+
#   geom_boxplot() +
#   geom_hline(yintercept = 0, linetype = 2) + 
#   stat_summary(fun.y = mean, geom = "errorbar",
#                aes(ymax = after_stat(y), ymin = after_stat(y),
#                    group = interaction(location, rates)),
#                width = .75, color = "red", linewidth = 1)+ 
#   scale_x_discrete(breaks = c(
#                               "hstate0.750.5",
#                               "linear0.750.5"), 
#                    labels=c(
#                      
#                      "hstate0.750.5" = "High invasion",
#                      "linear0.750.5" = "Linear"))+
#   
#   scale_fill_manual(name = "Management rates",
#                     values = colors) +
#   xlab("Site prioritization")+
#   ylab("VOI containment")+
#   theme_bw() +   
#   theme(strip.background=element_rect(colour="white",
#                                       fill="white"),
#         strip.text.x = element_blank(),
#         panel.border = element_rect(colour = "gray", size = 1.5), 
#         panel.grid.major = element_blank(),
#         panel.grid.minor = element_blank(),
#         axis.ticks = element_blank(),
#         axis.text.x = element_text(hjust = 1))+
#   facet_wrap(~budget, nrow = 3)
# 
# 
# #### ESTIMATED ####
# #### States Fin ####
# path <- 'E:\\Chapter3\\results'
# file_name = paste(path, 'finstates.csv',sep = '/')
# finstate <- fread(file_name)
# finstate <- data.frame(finstate)
# 
# finstate$rates <- paste0('p = ', finstate$detection, ', e = ', finstate$eradication)
# 
# finstate$mean <- finstate$mean - 1
# 
# cols <- brewer.pal(6, "Paired") 
# colors <- c(cols[1:2], "grey90", "grey30")
# 
# finstate$loc2 <- paste0(finstate$location, finstate$detection, finstate$eradication)
# 
# finstate %>% 
#   ggplot(aes(x = loc2, y = mean, fill = rates, 
#              group = interaction(location, rates)))+
#   geom_boxplot() +
#   geom_hline(yintercept = nc.val, linetype = 2) + 
#   stat_summary(fun.y = mean, geom = "errorbar",
#                aes(ymax = after_stat(y), ymin = after_stat(y),
#                    group = interaction(location, rates)),
#                width = .75, color = "red", linewidth = 1)+ 
#   scale_x_discrete(breaks = c(
#                               "hstate0.750.5",
#                               "linear0.750.5"), 
#                    labels=c(
#                     
#                      "hstate0.750.5" = "High invasion",
#                      "linear0.750.5" = "Linear"))+
#   
#   scale_fill_manual(name = "Management rates",
#                     values = colors) +
#   scale_color_manual(name = "Site prioritization",
#                      values = colors2) +
#   
#   xlab("Site prioritization")+
#   ylab("Average final estimated invasion state")+
#   theme_bw() +   
#   theme(strip.background=element_rect(colour="white",
#                                       fill="white"),
#         strip.text.x = element_blank(),
#         panel.border = element_rect(colour = "gray", size = 1.5), 
#         panel.grid.major = element_blank(),
#         panel.grid.minor = element_blank(),
#         axis.ticks = element_blank(),
#         axis.text.x = element_text(hjust = 1))+
#   facet_wrap(~budget, nrow = 3)
# 
