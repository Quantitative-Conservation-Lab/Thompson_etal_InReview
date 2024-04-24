library(tidyverse)
library(here)
library(plyr)
library(data.table)
library(RColorBrewer) 

#### load data ####
#space 1 data
path <- 'D:\\Chapter3\\p_eps_hrs\\space1'
file_name = paste(path, 'hrsdat_1.csv',sep = '/')
hrsdat_1_s1 <- fread(file_name)
hrsdat_1_s1 <- data.frame(hrsdat_1_s1)[-1]

path <- 'D:\\Chapter3\\p_eps_hrs\\space1'
file_name = paste(path, 'hrsdat_1.csv',sep = '/')
hrsdat_2_s1 <- fread(file_name)
hrsdat_2_s1 <- data.frame(hrsdat_2_s1)[-1]

path <- 'D:\\Chapter3\\p_eps_hrs\\space2'
file_name = paste(path, 'hrsdat_1.csv',sep = '/')
hrsdat_1_s2 <- fread(file_name)
hrsdat_1_s2 <- data.frame(hrsdat_1_s2)[-1]


path <- 'D:\\Chapter3\\p_eps_hrs\\space2'
file_name = paste(path, 'hrsdat_1.csv',sep = '/')
hrsdat_2_s2 <- fread(file_name)
hrsdat_2_s2 <- data.frame(hrsdat_2_s2)[-1]

hrsdat <- rbind(hrsdat_1_s1, hrsdat_2_s1, hrsdat_1_s2, hrsdat_2_s2)


detach(package:plyr)


hrsdat$hours[hrsdat$hours < 0] <- 0

hrsdat_summary  <- hrsdat %>% 
  group_by(rate, data) %>%
  summarise(mean = mean(hours ),
            lower = quantile(hours , 0.05),
            upper = quantile(hours , 0.95)
  )

hrsdat_summary <- data.frame(hrsdat_summary)

hrsdat_summary


#### PLOTS ####
cols <- brewer.pal(12, "Paired") 

colors2 <- c('red','grey20')


hrsdat %>% 
  ggplot(aes(x = rate, y = hours, color = data,
             group = interaction(rate, data)))+
  geom_boxplot() +
  scale_x_continuous(breaks = c(0.25, 0.5, 0.75))+
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c(paste0('\u03F5'), 'eps'))+
  
  xlab("Rate")+
  ylab("Hours")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank())+
  facet_wrap(~data, scales="free")

#### PLOTS 2 ####
cols <- brewer.pal(12, "Paired") 

colors2 <- c('red','grey20')


hrsdat_summary %>% 
  ggplot(aes(x = rate, y = mean, ymin = lower, ymax = upper, color = data,
             group = interaction(rate, data)))+
  geom_point() +
  geom_errorbar()+
  scale_color_manual(name = "Priotization",
                     values = colors2, 
                     labels = c(paste0('\u03F5'), 'p'))+
  scale_x_continuous(breaks = c(0.25, 0.5, 0.75))+
  xlab("Rate")+
  ylab("Hours")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank())+
  facet_wrap(~data, scales="free")
