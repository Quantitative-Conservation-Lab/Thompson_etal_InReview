library(plyr)
library(tidyverse)
library(here)
library(rPref)

library(data.table)
library(RColorBrewer) 
library(ggrepel)

cols <- brewer.pal(12, "Paired") 
colors <- c(cols[1:4], cols[9:10])

##### plots space 1 ####
path <- 'E:\\Chapter3\\results'
file_name = paste(path, 'suppression_data2.csv',sep = '/')
suppression_alls1 <- fread(file_name)

file_name = paste(path, 'pareto_data2.csv',sep = '/')
pareto_alls1 <- fread(file_name)


suppression_alls1$type[suppression_alls1$type == 'expected value'] <- 'i) expected value'
suppression_alls1$type[suppression_alls1$type == 'mini-max'] <- 'ii) mini-max'

pareto_alls1$type[pareto_alls1$type == 'expected value'] <- 'i) expected value'
pareto_alls1$type[pareto_alls1$type == 'mini-max'] <- 'ii) mini-max'

p1 <- ggplot(suppression_alls1)+
  geom_point(aes(x = Budget, y = state,
                 shape = location,
                 color = rates2, size = data))+
  #geom_text_repel(data=pareto_alls1, aes(x = Budget, y = state,
   #                                      label=pareto_alls1$location2), 
    #              color="black", 
     #             segment.color = "white",
      #            size=5 , fontface="bold", 
       #           nudge_y = -0.1,
 #                 nudge_x = 2
#  )+
  scale_x_continuous(breaks = c(20,40,60))+
  ylim(c(0.2, 1.5))+
  scale_size_manual(name = 'Data', values = c(2,5))+
  scale_shape_manual(name = "Priotization",
                     values = c(21, 22, 24), 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  ylab("Final invasion state") +
  xlab("Budget (hours)")+
  facet_wrap(~type)+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        text = element_text(size = 15),
        legend.position = "none"
  )

p1

##### plots space 2 ####
path <- 'E:\\Chapter3\\results-space2'
file_name = paste(path, 'suppression_data2.csv',sep = '/')
suppression_alls2 <- fread(file_name)

file_name = paste(path, 'pareto_data2.csv',sep = '/')
pareto_alls2 <- fread(file_name)


suppression_alls2$type[suppression_alls2$type == 'expected value'] <- 'i) expected value'
suppression_alls2$type[suppression_alls2$type == 'mini-max'] <- 'ii) mini-max'

pareto_alls2$type[pareto_alls2$type == 'expected value'] <- 'i) expected value'
pareto_alls2$type[pareto_alls2$type == 'mini-max'] <- 'ii) mini-max'

p2<- ggplot(suppression_alls2)+
  geom_point(aes(x = Budget, y = state,
                 shape = location,
                 color = rates2, size = data))+
  #geom_text_repel(data=pareto_alls1, aes(x = Budget, y = state,
  #                                      label=pareto_alls1$location2), 
  #              color="black", 
  #             segment.color = "white",
  #            size=5 , fontface="bold", 
  #           nudge_y = -0.1,
  #                 nudge_x = 2
  #  )+
  scale_x_continuous(breaks = c(20,40,60))+
  ylim(c(0.2, 1.5))+
  scale_size_manual(name = 'Data', values = c(2,5))+
  scale_shape_manual(name = "Priotization",
                     values = c(21, 22, 24), 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  ylab("Final invasion state") +
  xlab("Budget (hours)")+
  facet_wrap(~type)+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        text = element_text(size = 15),
        legend.position = "none"
  )
p2

#### legends ####
rates_legend <- ggplot(suppression_alls2)+
  geom_point(aes(x = Budget, y = state,
             #    shape = location,
                 color = rates2#, size = data
             ))+
  geom_text_repel(data=pareto_alls2, aes(x = Budget, y = state,
                                         label=pareto_alls2$location2), 
                  color="black", 
                  segment.color = "white",
                  size=3 , fontface="bold", 
                  nudge_y = -0.1,
                  nudge_x = 2
  )+
  scale_size_manual(name = 'Data', values = c(2,5))+
  scale_shape_manual(name = "Priotization",
                     values = c(21, 22, 24), 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors,
                     guide = guide_legend(
                       direction = "horizontal",
                       title.position = "top"
                     )) +
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  ylab("Final invasion state") +
  xlab("Budget (hours)")+
  facet_wrap(~type)+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        #  strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        text = element_text(size = 15),
        legend.box = "vertical"
  )

rates_legend

shape_legend <- ggplot(suppression_alls2)+
  geom_point(aes(x = Budget, y = state,
                     shape = location#,
                 #color = rates2#, size = data
  ))+
  geom_text_repel(data=pareto_alls2, aes(x = Budget, y = state,
                                         label=pareto_alls2$location2), 
                  color="black", 
                  segment.color = "white",
                  size=3 , fontface="bold", 
                  nudge_y = -0.1,
                  nudge_x = 2
  )+
  scale_size_manual(name = 'Data', values = c(2,5))+
  scale_shape_manual(name = "Priotization",
                     values = c(21, 22, 24), 
                     labels = c('Epicenter', 'High invasion', 'Linear'),
                     )+
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  ylab("Final invasion state") +
  xlab("Budget (hours)")+
  facet_wrap(~type)+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        #  strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        text = element_text(size = 15)
  )

shape_legend


data_legend <- ggplot(suppression_alls2)+
  geom_point(aes(x = Budget, y = state,
                 #shape = location#,
                 #color = rates2#,
                 size = data
  ))+
  geom_text_repel(data=pareto_alls2, aes(x = Budget, y = state,
                                         label=pareto_alls2$location2), 
                  color="black", 
                  segment.color = "white",
                  size=3 , fontface="bold", 
                  nudge_y = -0.1,
                  nudge_x = 2
  )+
  scale_size_manual(name = 'Data', values = c(2,5))+
  scale_shape_manual(name = "Priotization",
                     values = c(21, 22, 24), 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  ylab("Final invasion state") +
  xlab("Budget (hours)")+
  facet_wrap(~type)+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        #  strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        text = element_text(size = 15)
  )

data_legend

legend1 <- cowplot::get_legend(rates_legend)
legend2 <- cowplot::get_legend(shape_legend)
legend3 <- cowplot::get_legend(data_legend)

library(cowplot)

plot_grid(
    plot_grid(p1, p2, nrow = 2, labels = c('A', 'B')),
    plot_grid(legend2, legend1, legend3, nrow = 1, labels = c('', '', '')),
  nrow = 2,
  rel_heights = c(0.8, 0.2)
)
                  
#### OTHER PLOT ####

suppression_alls2ex <- suppression_alls2 %>% filter(type == 'i) expected value')
suppression_alls1ex <- suppression_alls1 %>% filter(type == 'i) expected value')

suppression_allex <- rbind(suppression_alls2ex, suppression_alls1ex)

p4<- ggplot(suppression_allex)+
  geom_point(aes(x = rates2, y = state,
                 shape = location,
                 color = rates2, size = data))+
  ylim(c(0.2, 1))+
  scale_size_manual(name = 'Data', values = c(2,5))+
  scale_shape_manual(name = "Priotization",
                     values = c(21, 22, 24), 
                     labels = c('Epicenter', 'High invasion', 'Linear') )+
  scale_color_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                     values = colors) +
  scale_fill_manual(name = paste0('Management rates (p, ', '\u03F5 )'),
                    values = colors) +
  ylab("Final invasion state") +
  xlab(paste0('Management rates (p, ', '\u03F5 )'))+
  theme_bw() +   
  theme(strip.background=element_rect(colour="white",
                                      fill="white"),
        strip.text.x = element_blank(),
        panel.border = element_rect(colour = "gray", size = 1.5), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        text = element_text(size = 15),
        legend.position = "none"
  )
p4
