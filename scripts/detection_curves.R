library(plyr)
library(tidyverse)
library(here)
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

colors2 <- c('grey20','red')

hrsdat$data[hrsdat$data == 'eps'] <- paste0('\u03F5')

hrsdat %>% 
  ggplot(aes(x = hours, y = rate, color = data,
             group = interaction(rate, data)))+
  geom_boxplot() +
  scale_y_continuous(breaks = c(0.25, 0.5, 0.75))+
  scale_color_manual(name = "Parameter",
                     values = colors2, 
                     labels = c('p', paste0('\u03F5')))+
  
  xlab("Hours")+
  ylab("Rate")+
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

hrsdat_summary$data[hrsdat_summary$data == 'eps'] <- paste0('e')
hrsdat_summary$data[hrsdat_summary$data == 'p'] <- paste0('d')



hplot$data <- factor(hplot$data, 
                      levels = rev(hplot$data))

hplot <- 
hrsdat_summary %>% 
  ggplot(aes(y = rate, x = mean, xmin = lower, xmax = upper, shape = factor(data), 
             color = data,
             group = interaction(rate, factor(data))))+
  geom_point(size = 2) +
  geom_errorbar(width = 0.02)+
  scale_y_continuous(breaks = c(0, 0.25, 0.5, 0.75, 1.0))+
  xlab("Effort (hours)")+
  ylab("Rate")+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank())


hplot


hplot <- hplot + scale_colour_manual("Parameter",
                                       values = c('red', 'black'),
                                       labels = c(paste0('Eradication rate (', '\u03F5', ')'),
                                         'Detection rate (p)' 
                                                   
                                                 ),
                                     guide = guide_legend(reverse = TRUE)   
                                     )

hplot
  
hplot <- hplot +  scale_shape_manual(name = "Parameter",
                     values = c(16, 1), 
                     labels = c(paste0('Eradication rate (', '\u03F5', ')'),
                                'Detection rate (p)'),
                     guide = guide_legend(reverse = TRUE)   )

hplot
