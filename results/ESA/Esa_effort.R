#Comparing the decision scenarios: 
library(tidyverse)
library(here)
library(plyr)
library(boot)
library(ggsci)
library(gridExtra)
library(RColorBrewer)
library(ggpubr)

path <- here::here("results", "ESA")
n.sites <- 50
n.sims <- 25
n.years <- 10

#### Effort dist####
##### e125, high occ ####
path2 <- "e125_hocc"

file_name = paste(path, path2,'logeffort_e125_hocc.csv',sep = '/')
e125_hocc_effort <- read.csv(file_name)[-1]
e125_hocc_effort$effort2 <- exp(e125_hocc_effort$effort)

p1 <- ggplot(e125_hocc_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.125, location = high occupancy")

##### e125, random ####
path2 <- "e125_random"

file_name = paste(path, path2,'logeffort_e125_random.csv',sep = '/')
e125_rand_effort <- read.csv(file_name)[-1]
e125_rand_effort$effort2 <- exp(e125_rand_effort$effort)

p2 <- ggplot(e125_rand_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.125, location = random")

##### e125, linear ####
path2 <- "e125_linear"

file_name = paste(path, path2,'logeffort_e125_linear.csv',sep = '/')
e125_linear_effort <- read.csv(file_name)[-1]
e125_linear_effort$effort2 <- exp(e125_linear_effort$effort)

p3 <- ggplot(e125_linear_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.125, location = linear")

##### e25, high occ ####
path2 <- "e25_hocc"

file_name = paste(path, path2,'logeffort_e25_hocc.csv',sep = '/')
e25_hocc_effort <- read.csv(file_name)[-1]
e25_hocc_effort$effort2 <- exp(e25_hocc_effort$effort)

p4 <- ggplot(e25_hocc_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.25, location = high occupancy")

##### e25, random ####
path2 <- "e25_random"

file_name = paste(path, path2,'logeffort_e25_random.csv',sep = '/')
e25_rand_effort <- read.csv(file_name)[-1]
e25_rand_effort$effort2 <- exp(e25_rand_effort$effort)

p5 <- ggplot(e25_rand_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.25, location = random")

##### e25, linear ####
path2 <- "e25_linear"

file_name = paste(path, path2,'logeffort_e25_linear.csv',sep = '/')
e25_linear_effort <- read.csv(file_name)[-1]
e25_linear_effort$effort2 <- exp(e25_linear_effort$effort)

p6 <- ggplot(e25_linear_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.25, location = linear")

##### e375, high occ ####
path2 <- "e375_hocc"

file_name = paste(path, path2,'logeffort_e375_hocc.csv',sep = '/')
e375_hocc_effort <- read.csv(file_name)[-1]
e375_hocc_effort$effort2 <- exp(e375_hocc_effort$effort)

p7 <- ggplot(e375_hocc_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.375, location = high occupancy")

##### e375, random ####
path2 <- "e375_random"

file_name = paste(path, path2,'logeffort_e375_random.csv',sep = '/')
e375_rand_effort <- read.csv(file_name)[-1]
e375_rand_effort$effort2 <- exp(e375_rand_effort$effort)

p8 <- ggplot(e375_rand_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.375, location = random")

##### e375, linear ####
path2 <- "e375_linear"

file_name = paste(path, path2,'logeffort_e375_linear.csv',sep = '/')
e375_linear_effort <- read.csv(file_name)[-1]
e375_linear_effort$effort2 <- exp(e375_linear_effort$effort)

p9 <- ggplot(e375_linear_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.375, location = linear")
##### e5, high occ ####
path2 <- "e5_hocc"

file_name = paste(path, path2,'logeffort_e5_hocc.csv',sep = '/')
e5_hocc_effort <- read.csv(file_name)[-1]
e5_hocc_effort$effort2 <- exp(e5_hocc_effort$effort)

p10 <- ggplot(e5_hocc_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.5, location = high occupancy")

##### e5, random ####
path2 <- "e5_random"

file_name = paste(path, path2,'logeffort_e5_random.csv',sep = '/')
e5_rand_effort <- read.csv(file_name)[-1]
e5_rand_effort$effort2 <- exp(e5_rand_effort$effort)

p11 <- ggplot(e5_rand_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.5, location = random")

##### e5, linear ####
path2 <- "e5_linear"

file_name = paste(path, path2,'logeffort_e5_linear.csv',sep = '/')
e5_linear_effort <- read.csv(file_name)[-1]
e5_linear_effort$effort2 <- exp(e5_linear_effort$effort)

p12 <- ggplot(e5_linear_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,1)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.5, location = linear")

##### e625, high occ ####
path2 <- "e625_hocc"

file_name = paste(path, path2,'logeffort_e625_hocc.csv',sep = '/')
e625_hocc_effort <- read.csv(file_name)[-1]
e625_hocc_effort$effort2 <- exp(e625_hocc_effort$effort)

head(sort(e625_hocc_effort$effort2, decreasing = TRUE),6)
head(sort(e625_hocc_effort$effort, decreasing = TRUE),6)
sum(e625_hocc_effort$effort2 > 10)/250

e625_hocc_effort <- e625_hocc_effort %>% filter(effort2 < 10)

p13 <- ggplot(e625_hocc_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
 theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,10)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.625, location = high occupancy")


##### e625, random ####
path2 <- "e625_random"

file_name = paste(path, path2,'logeffort_e625_random.csv',sep = '/')
e625_rand_effort <- read.csv(file_name)[-1]
e625_rand_effort$effort2 <- exp(e625_rand_effort$effort)

head(sort(e625_rand_effort$effort2, decreasing = TRUE),6)
head(sort(e625_rand_effort$effort, decreasing = TRUE),6)
sum(e625_rand_effort$effort2 > 10)/250


e625_rand_effort <- e625_rand_effort %>% filter(effort2 < 10)

p14 <- ggplot(e625_rand_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,10)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.625, location = random")

##### e625, linear ####
path2 <- "e625_linear"

file_name = paste(path, path2,'logeffort_e625_linear.csv',sep = '/')
e625_linear_effort <- read.csv(file_name)[-1]
e625_linear_effort$effort2 <- exp(e625_linear_effort$effort)

head(sort(e625_linear_effort$effort2, decreasing = TRUE),6)
head(sort(e625_linear_effort$effort, decreasing = TRUE),6)
sum(e625_linear_effort$effort2 > 10)/250


e625_linear_effort <- e625_linear_effort %>% filter(effort2 < 10)

p15 <- ggplot(e625_linear_effort, aes(x=year, y=effort2, group = year, color = as.factor(year))) + 
  geom_violin(trim=TRUE)+ 
  stat_summary(fun.data=mean_sdl, 
               geom="pointrange", color="black")+
  scale_color_grey(start = 0.8, end = 0.2) +
  theme_bw(base_size = 15) +
  scale_x_continuous(breaks = seq(1,10))+
  xlab("year")+
  ylim(0,10)+
  ylab("Effort (hours)")+
  theme(legend.position="none")+
  ggtitle("p = 0.625, location = linear")

#### all for each year ####
ggarrange(p1, p2, p3, nrow = 1)
ggarrange(p4, p5, p6, nrow = 1)
ggarrange(p7, p8, p9, nrow = 1)
ggarrange(p10, p11, p12, nrow = 1)
ggarrange(p13, p14, p15, nrow  = 1)

#### after 10 years effort combined ####
e125.hocc.effort <- e125_hocc_effort %>% filter(year == 10)
e125.rand.effort <- e125_rand_effort %>% filter(year == 10)
e125.linear.effort <- e125_linear_effort %>% filter(year == 10)

e25.hocc.effort <- e25_hocc_effort %>% filter(year == 10)
e25.rand.effort <- e25_rand_effort %>% filter(year == 10)
e25.linear.effort <- e25_linear_effort %>% filter(year == 10)

e375.hocc.effort <- e375_hocc_effort %>% filter(year == 10)
e375.rand.effort <- e375_rand_effort %>% filter(year == 10)
e375.linear.effort <- e375_linear_effort %>% filter(year == 10)

e5.hocc.effort <- e5_hocc_effort %>% filter(year == 10)
e5.rand.effort <- e5_rand_effort %>% filter(year == 10)
e5.linear.effort <- e5_linear_effort %>% filter(year == 10)

e625.hocc.effort <- e625_hocc_effort %>% filter(year == 10)
e625.rand.effort <- e625_rand_effort %>% filter(year == 10)
e625.linear.effort <- e625_linear_effort %>% filter(year == 10)

#### HOCC ####
hocc.effort <- rbind(e125.hocc.effort, e25.hocc.effort, e375.hocc.effort, e5.hocc.effort, e625.hocc.effort)
colnames(hocc.effort)[4] <- "Effort"

goal.p <- c(rep(0.125,length(e125.hocc.effort$sim)), rep(0.25,length(e25.hocc.effort$sim)),
            rep(0.375,length(e375.hocc.effort$sim)), rep(0.5,length(e5.hocc.effort$sim)),
            rep(0.625,length(e625.hocc.effort$sim)))

hocc.effort <- cbind(hocc.effort, goal.p)

ggplot(hocc.effort)+
  geom_point(mapping = aes(x = Effort,
                           y = goal.p),size = 3)+
  geom_line(mapping = aes(x = Effort, y = goal.p), se = T) +
  theme_bw(base_size = 25) +
  scale_y_continuous(breaks=c(0.125, 0.25, 0.375, 0.5, 0.625))+
  xlab("Effort (hours)")+
  ylab("Detection probability (p)")

#### COMBINED ####
effort.mean <- c(mean(e125.hocc.effort$effort2), mean(e125.rand.effort$effort2), mean(e125.linear.effort$effort2),
                 mean(e25.hocc.effort$effort2), mean(e25.rand.effort$effort2), mean(e25.linear.effort$effort2), 
                 mean(e375.hocc.effort$effort2), mean(e375.rand.effort$effort2), mean(e375.linear.effort$effort2),
                 mean(e5.hocc.effort$effort2), mean(e5.rand.effort$effort2), mean(e5.linear.effort$effort2), 
                 mean(e625.hocc.effort$effort2), mean(e625.rand.effort$effort2), mean(e625.linear.effort$effort2))

effort.low <- c(quantile(e125.hocc.effort$effort2, 0.05), quantile(e125.rand.effort$effort2, 0.05), quantile(e125.linear.effort$effort2, 0.05),
                quantile(e25.hocc.effort$effort2, 0.05), quantile(e25.rand.effort$effort2, 0.05), quantile(e25.linear.effort$effort2, 0.05),
                quantile(e375.hocc.effort$effort2, 0.05), quantile(e375.rand.effort$effort2, 0.05), quantile(e375.linear.effort$effort2, 0.05),
                quantile(e5.hocc.effort$effort2, 0.05), quantile(e5.rand.effort$effort2, 0.05), quantile(e5.linear.effort$effort2, 0.05),
                quantile(e625.hocc.effort$effort2, 0.05), quantile(e625.rand.effort$effort2, 0.05), quantile(e625.linear.effort$effort2, 0.05))

effort.high <- c(quantile(e125.hocc.effort$effort2, 0.95), quantile(e125.rand.effort$effort2, 0.95), quantile(e125.linear.effort$effort2, 0.95),
                quantile(e25.hocc.effort$effort2, 0.95), quantile(e25.rand.effort$effort2, 0.95), quantile(e25.linear.effort$effort2, 0.95),
                quantile(e375.hocc.effort$effort2, 0.95), quantile(e375.rand.effort$effort2, 0.95), quantile(e375.linear.effort$effort2, 0.95),
                quantile(e5.hocc.effort$effort2, 0.95), quantile(e5.rand.effort$effort2, 0.95), quantile(e5.linear.effort$effort2, 0.95),
                quantile(e625.hocc.effort$effort2, 0.95), quantile(e625.rand.effort$effort2, 0.95), quantile(e625.linear.effort$effort2, 0.95))

                 
goal.p <- c(rep(0.125,3), rep(0.25,3), rep(0.375,3), rep(0.5,3), rep(0.625,3))

Location <- rep(c("occupancy", "random", "linear"), 5)

effort.obj <- data.frame(Effort = effort.mean, 
                         effort.low = as.vector(effort.low), 
                         effort.high = as.vector(effort.high), 
                         goal.p = goal.p, Location = Location)

ggplot(effort.obj, aes(x = Effort, y = goal.p, col = Location, group = Location))+
  geom_point(size = 3)+
  geom_errorbar(aes(xmin=effort.low, xmax=effort.high),
                color = "black", width = 0.02)+
  facet_wrap(~Location)+
  scale_color_jama()+
  theme_bw(base_size = 25) +
  scale_y_continuous(breaks=c(0.125, 0.25, 0.375, 0.5, 0.625))+
  xlab("Effort (hours)")+
  ylab("Detection probability (p)")


ggplot(effort.obj)+
  geom_point(mapping = aes(x = Effort,
                           y = goal.p, col = Location),size = 3)+
  geom_smooth(span = 0.5, mapping = aes(x = Effort,
                                        y = goal.p, col = Location), se = F) +
  geom_errorbar(aes(Effort,goal.p, xmin=effort.low, xmax=effort.high),
                color = "black", width = 0.02)+
  scale_color_jama()+
  theme_bw(base_size = 25) +
  scale_y_continuous(breaks=c(0.125, 0.25, 0.375, 0.5, 0.625))+
  xlab("Effort (hours)")+
  ylab("Detection probability (p)")+
  facet_wrap(~Location)


#### Curve with minimum error things ####
effort.mean <- c(mean(e125.hocc.effort$effort2), mean(e125.rand.effort$effort2), mean(e125.linear.effort$effort2),
                 mean(e25.hocc.effort$effort2), mean(e25.rand.effort$effort2), mean(e25.linear.effort$effort2), 
                 mean(e375.hocc.effort$effort2), mean(e375.rand.effort$effort2), mean(e375.linear.effort$effort2),
                 mean(e5.hocc.effort$effort2), mean(e5.rand.effort$effort2), mean(e5.linear.effort$effort2), 
                 min(e625.hocc.effort$effort2), min(e625.rand.effort$effort2), min(e625.linear.effort$effort2))


effort.obj <- data.frame(Effort = effort.mean, 
                         effort.low = as.vector(effort.low), 
                         effort.high = as.vector(effort.high), 
                         goal.p = goal.p, Location = Location)

ggplot(effort.obj)+
  geom_point(mapping = aes(x = Effort,
                           y = goal.p, col = Location),size = 3)+
  geom_smooth(mapping = aes(x = Effort,
                            y = goal.p, col = Location), se = F) +
  geom_errorbar(aes(Effort,goal.p, xmin=effort.low, xmax=effort.high),
                color = "black", width = 0.02)+
  scale_color_jama()+
  theme_bw(base_size = 25) +
  scale_y_continuous(breaks=c(0.125, 0.25, 0.375, 0.5, 0.625))+
  xlab("Effort (hours)")+
  ylab("Detection probability (p)")+
  facet_wrap(~Location)


ggplot(effort.obj)+
  geom_point(mapping = aes(x = Effort,
                           y = goal.p, col = Location),size = 3)+
  geom_smooth(mapping = aes(x = Effort,
                            y = goal.p, col = Location), se = F) +
  scale_color_jama()+
  theme_bw(base_size = 25) +
  scale_y_continuous(breaks=c(0.125, 0.25, 0.375, 0.5, 0.625))+
  xlab("Effort (hours)")+
  ylab("Detection probability (p)")

