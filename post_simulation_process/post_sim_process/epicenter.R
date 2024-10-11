library(plyr)
library(tidyverse)
library(here)
library(rPref)

library(data.table)
library(RColorBrewer) 
library(ggrepel)

#### States truth ####
##### High invasion#####
#-- Budget = 40 --#
#--- S5_R75_40 ---#
path <- 'D:\\Chapter3\\results\\hstatebins\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'hstatebins'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'D:\\Chapter3\\results\\hstatebins\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'hstatebins'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40

state_truth_40 <- rbind(state_truth_S5_R75_40,state_truth_S5_R75_40b)


state_truth_hstatebins <- rbind(state_truth_40)

##### Linear#####
#-- Budget = 40 --#
#--- S5_R75_40 ---#
path <- 'D:\\Chapter3\\results\\linear\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'linear'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'D:\\Chapter3\\results\\linear\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'linear'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40

state_truth_40 <- rbind(state_truth_S5_R75_40,state_truth_S5_R75_40b)


state_truth_linear <- rbind(state_truth_40)

##### Epicenter #####
#-- Budget = 40 --#
#--- S5_R75_40 ---#
path <- 'D:\\Chapter3\\results\\epicenter\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'epicenter'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'D:\\Chapter3\\results\\epicenter\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'epicenter'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40

state_truth_40 <- rbind(state_truth_S5_R75_40,state_truth_S5_R75_40b)


state_truth_epicenter <- rbind(state_truth_40)

##### smartepicenter#####
#-- Budget = 40 --#
#--- S5_R75_40 ---#
path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40 <- fread(file_name)
state_truth_S5_R75_40 <- data.frame(state_truth_S5_R75_40)[-1]

state_truth_S5_R75_40$location <- 'smartepicenter'
state_truth_S5_R75_40$detection <- 0.5
state_truth_S5_R75_40$eradication <- 0.75
state_truth_S5_R75_40$budget <- 40

path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40_b'
file_name = paste(path, 'states_truth.csv',sep = '/')
state_truth_S5_R75_40b <- fread(file_name)
state_truth_S5_R75_40b <- data.frame(state_truth_S5_R75_40b)[-1]

state_truth_S5_R75_40b$location <- 'smartepicenter'
state_truth_S5_R75_40b$detection <- 0.5
state_truth_S5_R75_40b$eradication <- 0.75
state_truth_S5_R75_40b$budget <- 40



#--- Combine state_truths ---#
state_truth_40 <- rbind(state_truth_S5_R75_40,state_truth_S5_R75_40b)


state_truth_smartepicenter <- rbind(state_truth_40)

#### Combine ####
state_truth <- rbind(state_truth_hstatebins,
                     state_truth_linear,
                     state_truth_epicenter,
                     state_truth_smartepicenter)
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
##### smartepicenter #####
#-- Budget = 40 --#
path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40'
file_name = paste(path, 'bias_states.csv',sep = '/')
smartepicenter_biasstate_S5_R75_40 <- fread(file_name)
smartepicenter_biasstate_S5_R75_40 <- data.frame(smartepicenter_biasstate_S5_R75_40)[-1]

smartepicenter_biasstate_S5_R75_40$location <- 'smartepicenter'
smartepicenter_biasstate_S5_R75_40$detection <- 0.5
smartepicenter_biasstate_S5_R75_40$eradication <- 0.75
smartepicenter_biasstate_S5_R75_40$budget <- 40

path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40_b'
file_name = paste(path, 'bias_states.csv',sep = '/')
smartepicenter_biasstate_S5_R75_40b <- fread(file_name)
smartepicenter_biasstate_S5_R75_40b <- data.frame(smartepicenter_biasstate_S5_R75_40b)[-1]

smartepicenter_biasstate_S5_R75_40b$location <- 'smartepicenter'
smartepicenter_biasstate_S5_R75_40b$detection <- 0.5
smartepicenter_biasstate_S5_R75_40b$eradication <- 0.75
smartepicenter_biasstate_S5_R75_40b$budget <- 40


#--- Combine bias_states ---#

bias_state_40 <- rbind(smartepicenter_biasstate_S5_R75_40,smartepicenter_biasstate_S5_R75_40b)

#-- Combine Bias --#
bias_state <- rbind(bias_state_40)

bias_state$rates <- paste0('(p = )', bias_state$detection, ',  \u03F5 = ', bias_state$eradication)
bias_state$rates2 <- paste0('(', bias_state$detection, ', ', bias_state$eradication, ")")
bias_state$loc2 <- paste0(bias_state$location, bias_state$detection, bias_state$eradication)

#### Bias params ####
##### smartepicenter #####
path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40'
file_name = paste(path, 'bias_params.csv',sep = '/')
smartepicenter_biasparam_S5_R75_40 <- fread(file_name)
smartepicenter_biasparam_S5_R75_40 <- data.frame(smartepicenter_biasparam_S5_R75_40)[-1]

smartepicenter_biasparam_S5_R75_40$location <- 'smartepicenter'
smartepicenter_biasparam_S5_R75_40$detection <- 0.5
smartepicenter_biasparam_S5_R75_40$eradication <- 0.75
smartepicenter_biasparam_S5_R75_40$budget <- 40

path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40_b'
file_name = paste(path, 'bias_params.csv',sep = '/')
smartepicenter_biasparam_S5_R75_40b <- fread(file_name)
smartepicenter_biasparam_S5_R75_40b <- data.frame(smartepicenter_biasparam_S5_R75_40b)[-1]

smartepicenter_biasparam_S5_R75_40b$location <- 'smartepicenter'
smartepicenter_biasparam_S5_R75_40b$detection <- 0.5
smartepicenter_biasparam_S5_R75_40b$eradication <- 0.75
smartepicenter_biasparam_S5_R75_40b$budget <- 40

#--- Combine bias_params ---#

bias_param_40 <- rbind(smartepicenter_biasparam_S5_R75_40,smartepicenter_biasparam_S5_R75_40b)

#-- Combine bias --#
bias_params <- rbind(bias_param_40)

##### results -p ####
bias_params$rates <- paste0('(p = )', bias_params$detection, ',  \u03F5 = ', bias_params$eradication)
bias_params$rates2 <- paste0('(', bias_params$detection, ', ', bias_params$eradication, ")")
bias_params$loc2 <- paste0(bias_params$location, bias_params$detection, bias_params$eradication)

bias_param_detect  <- bias_params %>% filter(param %in% c("B0.p.h", "B0.p.h", "B1.p.l", "B1.p.h"))

##### results -eps ####
bias_param_eps  <- bias_params %>% filter(param %in% c("B0.eps.h", "B0.eps.h", "B1.eps.l", "B1.eps.h"))


#### Sites visit ####
##### smartepicenter #####

#--- S5_R75_40 ---#
path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40 <- fread(file_name)
sites_S5_R75_40 <- data.frame(sites_S5_R75_40)[-1]

sites_S5_R75_40$location <- 'smartepicenter'
sites_S5_R75_40$detection <- 0.5
sites_S5_R75_40$eradication <- 0.75
sites_S5_R75_40$budget <- 40

path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40_b'
file_name = paste(path, 'sites_visit.txt',sep = '/')
sites_S5_R75_40b <- fread(file_name)
sites_S5_R75_40b <- data.frame(sites_S5_R75_40b)[-1]

sites_S5_R75_40b$location <- 'smartepicenter'
sites_S5_R75_40b$detection <- 0.5
sites_S5_R75_40b$eradication <- 0.75
sites_S5_R75_40b$budget <- 40


#--- Combine dists ---#
sites_40 <- rbind(sites_S5_R75_40,sites_S5_R75_40b)


sites_smartepicenter <- rbind(sites_40)

sites <- rbind(sites_smartepicenter)

sites$visit[sites$visit > 1] <- 1

sites_visit <- aggregate(visit ~ week + year + sim + location + detection + eradication + budget, 
                         data = as.data.frame(sites), 
                         FUN = sum)

sites_visit <- sites_visit %>% filter(week < 5)
sites_visit$visit <- sites_visit$visit/40


#### dist traveled ####
##### smartepicenter #####
#--- S5_R75_40 ---#
path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_40 <- fread(file_name)
dist_S5_R75_40 <- data.frame(dist_S5_R75_40)[-1]

dist_S5_R75_40$location <- 'smartepicenter'
dist_S5_R75_40$detection <- 0.5
dist_S5_R75_40$eradication <- 0.75
dist_S5_R75_40$budget <- 40

path <- 'D:\\Chapter3\\results\\smartepicenter\\S5_R75_40_b'
file_name = paste(path, 'dist_travel.csv',sep = '/')
dist_S5_R75_40b <- fread(file_name)
dist_S5_R75_40b <- data.frame(dist_S5_R75_40b)[-1]

dist_S5_R75_40b$location <- 'smartepicenter'
dist_S5_R75_40b$detection <- 0.5
dist_S5_R75_40b$eradication <- 0.75
dist_S5_R75_40b$budget <- 40

#--- Combine dists ---#
dist_40 <- rbind(dist_S5_R75_40,dist_S5_R75_40b)


dist_smartepicenter <- rbind(dist_40)

dist <- rbind(dist_smartepicenter)

dist_travel <- aggregate(distance ~ sim + location + detection + eradication + budget, 
                         data = as.data.frame(dist), 
                         FUN = mean)

#### PLOTS ####
cols <- brewer.pal(12, "Paired") 
colors <- c(cols[1:4], cols[9:10])

colors2 <- c('deeppink3','orange2' ,'grey50', 'darkblue')

#### NO REMOVAL ####
ncpath <- 'D:\\Chapter3\\results\\noremoval'
file_name = paste(ncpath, 'states_fin_truth.csv',sep = '/')
noremoval <- fread(file_name)
noremoval <- data.frame(noremoval)

nc.val2 <- aggregate(state ~ sim + location + detection + eradication + budget, 
                     data = as.data.frame(noremoval), 
                     FUN = mean)

nc.val <- mean(nc.val2$state) -1 
nc.max <- max(nc.val2$state) -1 
nc.max95 <- quantile(nc.val2$state, 0.95) -1

finstate_truth$loc2 <- paste0(finstate_truth$location, finstate_truth$detection, finstate_truth$eradication)
colnames(finstate_truth)[5] <- "Investment"

finstate_truth$location2 <- finstate_truth$location
finstate_truth$location2[finstate_truth$location2 == 'hstatebins'] <- '1'
finstate_truth$location2[finstate_truth$location2 == 'linear'] <- '2'
finstate_truth$location2[finstate_truth$location2 == 'epicenter'] <- '3'
finstate_truth$location2[finstate_truth$location2 == 'smartepicenter'] <- '4'

finstate_truth %>% 
  ggplot(aes(x = location2, y = state, color = location,
             group = interaction(location, rates2)))+
  geom_boxplot() +
  geom_hline(yintercept = 0.93425, linetype = 2) + 
  stat_summary(fun.y = mean, geom = "errorbar",
               aes(ymax = after_stat(y), ymin = after_stat(y),
                   group = interaction(location, rates2)),
               width = .75, color = "black", linewidth = 1)+ 
  scale_x_discrete(breaks = c(
    "1",
    "2",
    '3',
    '4'
    ),
    labels=c(

      "1" = "High invasion",
      "2" = "Linear",
      "3" = "Epicenter (Old)",
      "4" = "Epicenter (New)"))+
  scale_fill_discrete(guide="none")+
  scale_fill_manual(name = paste0('Target probabilities (p, ', '\u03F5 )'),
                    values = colors) +
  scale_color_manual(name = "Spatial priority",
                     values = colors2, 
                     labels = c('Epicenter (New)', 'Epicenter(Old)', 'High invasion', 'Linear') )+
  xlab("Spatial priority")+
  ylab("Average final invasion state")+
  ggtitle("Established invasion: 40 hr budget outcomes with 0.5 detection & 0.75 erradication")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "none")

##### Suppression #####

colnames(finstate_truth)[5] <- "Budget"


budget40_suppress <- finstate_truth %>% 
  filter(Budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(state),
            max_c = max(state),
            
            lower = quantile(state, 0.05),
            upper = quantile(state, 0.95)
  )

budget40_suppress


##### Bias states ####
budget40_biasstate <- bias_state %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias),
            max_c = max(rel.bias))


budget40_biasstate


bias_param_detect$rates2 <- paste0('(', bias_param_detect$detection, ', ', bias_param_detect$eradication, ")")

bias_param_detect_years <- bias_state %>%
  group_by(location, year, rates, rates2, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_param_detect_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'hstatebins'] <- 'High invasion'
bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'linear'] <- 'Linear'
bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'smartepicenter'] <- 'smartepicenter'

col_old <- colnames(bias_param_detect_years)
colnames(bias_param_detect_years)[c(1,5)] <- c("Prioritization", "Investment")


##### Bias param time -p #####
bias_param_detect$rates2 <- paste0('(', bias_param_detect$detection, ', ', bias_param_detect$eradication, ")")

bias_param_detect_years <- bias_param_detect %>%
  group_by(location, year, rates, rates2, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_param_detect_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_param_detect_years$Prioritization[bias_param_detect_years$Prioritization == 'smartepicenter'] <- 'smartepicenter'



colnames(bias_param_detect_years)[5] <- "Investment"

bias_param_detect_years_sum <- bias_param_detect_years %>% filter(year == 2 | year == 7)
bias_param_detect_years_sum

for(i in 1:length(bias_param_detect_years_sum$rates)){
      if(bias_param_detect_years_sum$rates2[i] == '(0.25, 0.75)'){
    bias_param_detect_years_sum$year[i] <- bias_param_detect_years_sum$year[i] + 0.3
  }
  if(bias_param_detect_years_sum$rates2[i] == '(0.5, 0.5)'){
    bias_param_detect_years_sum$year[i] <- bias_param_detect_years_sum$year[i] + 0.6
  }
  if(bias_param_detect_years_sum$rates2[i] == '(0.5, 0.75)'){
    bias_param_detect_years_sum$year[i] <- bias_param_detect_years_sum$year[i] + 0.9
  }
  if(bias_param_detect_years_sum$rates2[i] == '(0.75, 0.5)'){
    bias_param_detect_years_sum$year[i] <- bias_param_detect_years_sum$year[i] + 1.2
  }
  
  if(bias_param_detect_years_sum$rates2[i] == '(0.75, 0.75)'){
    bias_param_detect_years_sum$year[i] <- bias_param_detect_years_sum$year[i] + 1.5
  }
}

for(i in 1:length(bias_param_detect_years_sum$rates)){
  if(bias_param_detect_years_sum$year[i] > 4){
    bias_param_detect_years_sum$year[i]<- bias_param_detect_years_sum$year[i] - 2
  } 
}

colnames(bias_param_detect_years_sum)[5] <- "Investment"


budget40_bias_param_detect <- bias_param_detect %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))

budget40_bias_param_detect

##### Bias param time -eps #####
bias_param_eps$rates2 <- paste0('(', bias_param_eps$detection, ', ', bias_param_eps$eradication, ")")

bias_param_eps_years <- bias_param_eps %>%
  group_by(location, year, rates, rates2, budget) %>%
  summarise(mean_b = mean(rel.bias),
            lower = quantile(rel.bias, 0.05),
            upper = quantile(rel.bias, 0.95))

colnames(bias_param_eps_years)[c(1,5)] <- c("Prioritization", "Budget")

bias_param_eps_years$Prioritization[bias_param_eps_years$Prioritization == 'smartepicenter'] <- 'smartepicenter'

colnames(bias_param_eps_years)[5] <- "Investment"


budget40_bias_param_eps <- bias_param_eps %>% 
  filter(budget == 40) %>% 
  group_by(loc2) %>%
  summarise(mean_c = mean(rel.bias))


budget40_bias_param_eps

##### Sites visited #####
total_visit <- sites_visit
total_visit$rates <- paste0('(p = ', total_visit$detection, ',  \u03F5 = ', total_visit$eradication)

total_visit$rates2 <- paste0('(', total_visit$detection, ', ', total_visit$eradication, ")")

total_visit <- total_visit %>% filter(detection < 1 & detection > 0)

total_visit$loc2 <- paste0(total_visit$location, total_visit$detection, total_visit$eradication)

colnames(total_visit)[7] <- 'Investment'

##### Distance #####
total_dist <- dist_travel
total_dist$rates <- paste0('(p = ', total_dist$detection, ',  \u03F5 = ', total_dist$eradication)

total_dist$rates2 <- paste0('(', total_dist$detection, ', ', total_dist$eradication, ")")

total_dist <- total_dist %>% filter(detection < 1 & detection > 0)

total_dist$loc2 <- paste0(total_dist$location, total_dist$detection, total_dist$eradication)

colnames(total_dist)[5] <- 'Investment'


#### Bias vs outcome ####
budget20_biasstate$budget <- 20
budget40_biasstate$budget <- 40
budget60_biasstate$budget <- 60

biasstate <- rbind(budget20_biasstate, budget40_biasstate, budget60_biasstate)
colnames(biasstate)[2:3] <- c('mean_bias', 'max_bias')

biasstate <- biasstate %>% select(loc2, 
                                budget, mean_bias, max_bias)

budget20_suppress$budget <- 20
budget40_suppress$budget <- 40
budget60_suppress$budget <- 60


suppress <- rbind(budget20_suppress,budget40_suppress,budget60_suppress)
colnames(suppress)[2:3] <- c('mean_suppress', 'max_suppress')

suppress <- suppress %>% select(
                    mean_suppress, max_suppress)


combined <- cbind(biasstate, suppress)

combined <- combined %>% select(loc2, mean_bias, max_bias,
                                budget, mean_suppress, max_suppress)

sites <- combined %>% filter(loc2 == 'linear0.50.75')
sites$loc2 <- 'Linear(0.5, 0.75)'

ggplot(combined)+
  geom_point(aes(x = mean_bias, y = mean_suppress)) + #, color = 'white')+
  geom_point(data = sites, aes(x = mean_bias, y = mean_suppress), color = 'red')+
  geom_vline(data = sites, aes(xintercept = mean_bias), color = 'red')+
  geom_text_repel(data=sites, aes(x = mean_bias, y = mean_suppress,
                                   label=loc2), 
                  color="black", 
                  segment.color = "white",
                  nudge_y = -0.01,
                  size=4, fontface="bold"
  )+
  xlab("Average invasion state bias") + ylab("Final invasion state")+
  theme_bw() +  facet_wrap(~budget) +
  
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        #  strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        axis.text=element_text(size=12),
        axis.title=element_text(size=14)
        # legend.position = "none",
  )


combined_1 <- psel(combined, 
                     low(mean_bias) * low(max_suppress))

combined_1

