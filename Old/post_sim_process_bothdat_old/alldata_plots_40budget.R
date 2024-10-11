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

#### States fin truth ####
##### States Fin truth dat A ####
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

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40 <- fread(file_name)
epistate_truth_S5_R75_40 <- data.frame(epistate_truth_S5_R75_40)[-1]

epistate_truth_S5_R75_40$location <- 'epicenter'
epistate_truth_S5_R75_40$detection <- 0.5
epistate_truth_S5_R75_40$eradication <- 0.75
epistate_truth_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40b <- fread(file_name)
epistate_truth_S5_R75_40b <- data.frame(epistate_truth_S5_R75_40b)[-1]

epistate_truth_S5_R75_40b$location <- 'epicenter'
epistate_truth_S5_R75_40b$detection <- 0.5
epistate_truth_S5_R75_40b$eradication <- 0.75
epistate_truth_S5_R75_40b$budget <- 40

finstate_truth <- rbind(state_truth_S5_R75_40, state_truth_S5_R75_40b,
                        epistate_truth_S5_R75_40, epistate_truth_S5_R75_40b)
finstate_truth$rates <- paste0('(p = )', finstate_truth$detection, ',  \u03F5 = ', finstate_truth$eradication)
finstate_truth$rates2 <- paste0('(', finstate_truth$detection, ', ', finstate_truth$eradication, ")")

finstate_truth$state <- finstate_truth$state - 1
finstate_truth <- finstate_truth %>% filter(week == 5 & year == 7)

finstate_truth <- aggregate(state ~ sim + location + detection + eradication + budget + rates + rates2, 
                            data = as.data.frame(finstate_truth), 
                            FUN = mean)


colnames(finstate_truth)[5] <- 'Budget'
finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication, finstate_truth$data )



#detach(package:plyr)

finstate_truthA <- finstate_truth
finstate_truthA$data <- 'A'

##### States Fin truth A+C ####
path <- 'E:\\Chapter3\\results-datboth'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
finstate_truth <- fread(file_name)
finstate_truth <- data.frame(finstate_truth)

finstate_truth$rates <- paste0('(p = )', finstate_truth$detection, ',  \u03F5 = ', finstate_truth$eradication)
finstate_truth$rates2 <- paste0('(', finstate_truth$detection, ', ', finstate_truth$eradication, ")")

finstate_truth$state <- finstate_truth$state - 1

finstate_truth <- aggregate(state ~ sim + location + detection + eradication + budget + rates + rates2, 
                            data = as.data.frame(finstate_truth), 
                            FUN = mean)

colnames(finstate_truth)[5] <- 'Budget'
finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication)

finstate_truthAC <- finstate_truth 
finstate_truthAC$data <- 'AC' 

finstate_truth <- rbind(finstate_truthA, finstate_truthAC)

finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication, finstate_truth$data )

detach(package:plyr)

budget40_suppress <- finstate_truth %>% 
  filter(Budget == 40) %>% 
  group_by(loc2, data) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            lower = quantile(state, 0.1),
            upper = quantile(state, 0.95))

budget40_suppress

cols <- brewer.pal(12, "Paired") 
colors <- c(cols[1:4], cols[9:10])
colors <- c(colors[c(2,4)],'white')

colors2 <- c('palevioletred', 'darkmagenta', 'purple')

finstate_truth <- finstate_truth %>% filter(Budget == 40)

finstate_truth %>% 
  ggplot(aes(x = loc2, y = state, fill = rates2, color =data,
             group = interaction(location, rates2, data)))+
  geom_boxplot(size = 1) +
  geom_hline(yintercept = nc.val, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c("hstatebins0.50.75A" ),
                   labels=c(
                     "hstatebins0.50.75A" = "High Invasion"))+
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Data",
                     values = colors2, 
                     labels = c('A', 'A + C'))+
  
  xlab("Site prioritization")+
  ylab("Average final invasion")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank()
        )+
  facet_wrap(~Budget, nrow = 3, labeller = label_both)

#### States inv truth ####
##### States inv truth A ####
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

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40 <- fread(file_name)
epistate_truth_S5_R75_40 <- data.frame(epistate_truth_S5_R75_40)[-1]

epistate_truth_S5_R75_40$location <- 'epicenter'
epistate_truth_S5_R75_40$detection <- 0.5
epistate_truth_S5_R75_40$eradication <- 0.75
epistate_truth_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
epistate_truth_S5_R75_40b <- fread(file_name)
epistate_truth_S5_R75_40b <- data.frame(epistate_truth_S5_R75_40b)[-1]

epistate_truth_S5_R75_40b$location <- 'epicenter'
epistate_truth_S5_R75_40b$detection <- 0.5
epistate_truth_S5_R75_40b$eradication <- 0.75
epistate_truth_S5_R75_40b$budget <- 40

fininv_truth <- rbind(state_truth_S5_R75_40, state_truth_S5_R75_40b,
                      epistate_truth_S5_R75_40, epistate_truth_S5_R75_40b)

fininv_truth$rates <- paste0('p = ', fininv_truth$detection, ', e = ', fininv_truth$eradication)
fininv_truth$rates2 <- paste0('(', fininv_truth$detection, ', ', fininv_truth$eradication, ")")

fininv_truth$inv <- fininv_truth$state
fininv_truth$inv[fininv_truth$inv <= 2 ] <- 0
fininv_truth$inv[fininv_truth$inv > 2 ] <- 1

fininv_truth <- fininv_truth %>% filter(week == 5 & year == 7)

fininv_truth <- aggregate(inv ~ sim + location + detection + eradication + budget + rates + rates2, 
                          data = as.data.frame(fininv_truth), 
                          FUN = mean)


fininv_truth$loc2 <- paste0(fininv_truth$location, fininv_truth$detection, fininv_truth$eradication)
colnames(fininv_truth)[c(2,5)] <- c('Location', 'Budget')

fininv_truth$data <- 'A'
fininv_truthA <- fininv_truth

##### States inv truth A+ C ####
path <- 'E:\\Chapter3\\results-datboth'
file_name = paste(path, 'states_fin_truth.csv',sep = '/')
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


fininv_truth$loc2 <- paste0(fininv_truth$location, fininv_truth$detection, fininv_truth$eradication)

colnames(fininv_truth)[c(2,5)] <- c('Location', 'Budget')

fininv_truthAC <- fininv_truth 
fininv_truthAC$data <- 'AC' 
fininv_truthAC$loc2 <- paste0(fininv_truthAC$Location, fininv_truthAC$detection, fininv_truthAC$eradication, fininv_truthAC$data )

fininv_truth <- rbind(fininv_truthA, fininv_truthAC)

budget40_contain <- fininv_truth %>% 
  filter(Budget == 40) %>% 
  group_by(loc2, data) %>%
  summarise(mean_c = mean(inv),
            max_c = max(inv),
            lower = quantile(inv, 0.1),
            upper = quantile(inv, 0.9))

budget40_contain

fininv_truth %>% 
  ggplot(aes(x = loc2, y = inv, fill = rates2, color =data,
             group = interaction(Location, rates2, data)))+
  geom_boxplot(size = 1) +
  geom_hline(yintercept = nc.inv, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(Location, rates)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c("epicenter0.50.75A",
                              "linear0.50.75A"),
                   labels=c(
                     "epicenter0.50.75A" = "Epicenter",
                     "linear0.50.75A" = "Linear"))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Data",
                     values = colors2, 
                     labels = c('A', 'A + C'))+
  
  xlab("Site prioritization")+
  ylab("Average final % invaded")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget, nrow = 3, labeller = label_both)

#### Bias state ####
##### Bias state A ####
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

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40 <- fread(file_name)
epi_biasstate_S5_R75_40 <- data.frame(epi_biasstate_S5_R75_40)[-1]

epi_biasstate_S5_R75_40$location <- 'epicenter'
epi_biasstate_S5_R75_40$detection <- 0.5
epi_biasstate_S5_R75_40$eradication <- 0.75
epi_biasstate_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
epi_biasstate_S5_R75_40b <- fread(file_name)
epi_biasstate_S5_R75_40b <- data.frame(epi_biasstate_S5_R75_40b)[-1]

epi_biasstate_S5_R75_40b$location <- 'epicenter'
epi_biasstate_S5_R75_40b$detection <- 0.5
epi_biasstate_S5_R75_40b$eradication <- 0.75
epi_biasstate_S5_R75_40b$budget <- 40

bias_state <- rbind(hsb_biasstate_S5_R75_40, hsb_biasstate_S5_R75_40b,
                    epi_biasstate_S5_R75_40, epi_biasstate_S5_R75_40b)

bias_state$rates <- paste0('p = ', bias_state$detection, ', e = ', bias_state$eradication)


bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication)
bias_state$rates2 <- paste0('(', bias_state$detection, ', ', bias_state$eradication, ")")
colnames(bias_state)[8] <- 'Budget'

bias_state$data <- 'A'

bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication, bias_state$data)
bias_stateA <- bias_state

##### Bias state A+ C ####
path <- 'E:\\Chapter3\\results-datboth'
file_name = paste(path, 'bias_state.csv',sep = '/')
bias_state <- fread(file_name)
bias_state <- data.frame(bias_state)

bias_state$rates <- paste0('p = ', bias_state$detection, ', e = ', bias_state$eradication)


bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication)
bias_state$rates2 <- paste0('(', bias_state$detection, ', ', bias_state$eradication, ")")

colnames(bias_state)[8] <- 'Budget'

bias_state$data <- 'AC'
bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication, bias_state$data)
bias_stateAC <- bias_state

bias_state <- rbind(bias_stateAC, bias_stateA)

budget40_biasstate <- bias_state %>% 
  filter(Budget == 40) %>% 
  group_by(loc2, data) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))

budget40_biasstate

bias_state  <- bias_state  %>% filter(Budget == 40)

bias_state %>% 
  ggplot(aes(x = loc2, y = rel.bias, fill = rates2, color =data,
             group = interaction(location, rates2, data)))+
  geom_boxplot(size = 1) +
  geom_hline(yintercept = 0, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c("epicenter0.50.75A",
                              "linear0.50.75A"),
                   labels=c(
                     "epicenter0.50.75A" = "Epicenter",
                     "linear0.50.75A" = "Linear"))+
  
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Data",
                     values = colors2, 
                     labels = c('A', 'A + C'))+
  
  xlab("Site prioritization")+
  ylab("State relative bias")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_text(hjust = 1))+
  facet_wrap(~Budget, nrow = 3, labeller = label_both)

##### Bias state- time ####
bias_state_years <- bias_state %>%
  group_by(location, year, rates, rates2, Budget, data) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_state_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_state_years$Prioritization[bias_state_years$Prioritization == "hstatebins"] <- 'High invasion'

ggplot(bias_state_years, aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = data))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8,10)) +
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
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
  facet_wrap(~Budget + Prioritization, nrow = 3, labeller = label_both)

#### Bias params ####
##### Bias A ####
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

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40 <- fread(file_name)
epi_biasparam_S5_R75_40 <- data.frame(epi_biasparam_S5_R75_40)[-1]

epi_biasparam_S5_R75_40$location <- 'epicenter'
epi_biasparam_S5_R75_40$detection <- 0.5
epi_biasparam_S5_R75_40$eradication <- 0.75
epi_biasparam_S5_R75_40$budget <- 40

path <- 'E:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
epi_biasparam_S5_R75_40b <- fread(file_name)
epi_biasparam_S5_R75_40b <- data.frame(epi_biasparam_S5_R75_40b)[-1]

epi_biasparam_S5_R75_40b$location <- 'epicenter'
epi_biasparam_S5_R75_40b$detection <- 0.5
epi_biasparam_S5_R75_40b$eradication <- 0.75
epi_biasparam_S5_R75_40b$budget <- 40

bias_param <- rbind(hsb_biasparam_S5_R75_40, hsb_biasparam_S5_R75_40b,
                    epi_biasparam_S5_R75_40, epi_biasparam_S5_R75_40b)

bias_param$rates <- paste0('p = ', bias_param$detection, ', e = ', bias_param$eradication)


bias_param$loc2 <- paste0(bias_param$location, bias_param$detection, bias_param$eradication)
bias_param$rates2 <- paste0('(', bias_param$detection, ', ', bias_param$eradication, ")")
colnames(bias_param)[8] <- 'Budget'

bias_param$data <- 'A'

bias_param$loc2 <- paste0(bias_param$location, bias_param$detection, bias_param$eradication, bias_param$data)
bias_paramA <- bias_param

##### Bias A+ C ####
path <- 'E:\\Chapter3\\results-datboth'
file_name = paste(path, 'bias_params.csv',sep = '/')
bias_param <- fread(file_name)
bias_param <- data.frame(bias_param)

bias_param$rates <- paste0('p = ', bias_param$detection, ', e = ', bias_param$eradication)


bias_param$loc2 <- paste0(bias_param$location, bias_param$detection, bias_param$eradication)
bias_param$rates2 <- paste0('(', bias_param$detection, ', ', bias_param$eradication, ")")

colnames(bias_param)[8] <- 'Budget'

bias_param$data <- 'AC'
bias_param$loc2 <- paste0(bias_param$location, bias_param$detection, bias_param$eradication, bias_param$data)
bias_paramAC <- bias_param

###### p bias #####
bias_paramA_p <- bias_paramA %>% filter(param %in% c("B0.p.h", "B0.p.h", "B1.p.l", "B1.p.h"))

bias_paramAC_p <- bias_paramAC %>% filter(param %in% c("B0.p.h", "B0.p.h", "B1.p.l", "B1.p.h"))

bias_param_p <- rbind(bias_paramA_p, bias_paramAC_p)

budget40_bias_param_p <- bias_param_p %>% 
  filter(Budget == 40) %>% 
  group_by(loc2, data) %>%
  summarise(mean_c = mean(rel.bias))

budget40_bias_param_p

bias_paramAC_pyears <- bias_param_p %>%
  group_by(location, year, rates, rates2, Budget, data) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_paramAC_pyears)[c(1,5)] <- c("Prioritization", "Budget")

bias_paramAC_pyears$Prioritization[bias_paramAC_pyears$Prioritization == "hstatebins"] <- 'High invasion'

ggplot(bias_paramAC_pyears, aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = data))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8,10)) +
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
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
  facet_wrap(~Budget + Prioritization, nrow = 3, labeller = label_both)

###### eps bias #####
bias_paramA_eps <- bias_paramA %>% filter(param %in% c("B0.eps.h", "B0.eps.h", "B1.eps.l", "B1.eps.h"))
bias_paramAC_eps <- bias_paramAC %>% filter(param %in% c("B0.eps.h", "B0.eps.h", "B1.eps.l", "B1.eps.h"))

bias_param_eps <- rbind(bias_paramA_eps, bias_paramAC_eps)

budget40_bias_param_eps <- bias_param_eps %>% 
  filter(Budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget40_bias_param_eps

bias_param_epsyears <- bias_param_eps %>%
  group_by(location, year, rates, rates2, Budget, data) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_param_epsyears)[c(1,5)] <- c("Prioritization", "Budget")

bias_param_epsyears$Prioritization[bias_param_epsyears$Prioritization == "hstatebins"] <- 'High invasion'

ggplot(bias_param_epsyears, aes(x = year, y = mean_b, ymin = lower, ymax = upper, color = data))+
  geom_point()+
  geom_errorbar()+
  geom_hline(yintercept = 0, linetype = 2) + 
  scale_x_continuous(breaks = c(2,4,6,8,10)) +
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
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
  facet_wrap(~Budget + Prioritization, nrow = 3, labeller = label_both)
