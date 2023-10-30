library(tidyverse)
library(here)
library(RColorBrewer)

#### hocc_data ####
path <- here::here("results", "multistate", "hocc_datM_p1")
file_name = paste(path, 'States_e1_hocc.csv',sep = '/')
occ1_df <- read.csv(file_name)[-1]
occ1_df$param <- '1'

path <- here::here("results", "multistate", "hocc_datM_p2")
file_name = paste(path, 'States_e1_hocc.csv',sep = '/')
occ2_df <- read.csv(file_name)[-1]
occ2_df$param <- '2'

path <- here::here("results", "multistate", "hocc_datM_p3")
file_name = paste(path, 'States_e1_hocc.csv',sep = '/')
occ3_df <- read.csv(file_name)[-1]
occ3_df$param <- '3'

path <- here::here("results", "multistate", "hocc_datM_p4")
file_name = paste(path, 'States_e1_hocc.csv',sep = '/')
occ4_df <- read.csv(file_name)[-1]
occ4_df$param <- '4'

occ_df <- rbind(occ1_df, occ2_df, occ3_df, occ4_df)
occ_df$dr <- 'occ'

#### linear_data ####
path <- here::here("results", "multistate", "linear_datM_p1")
file_name = paste(path, 'States_e1_linear.csv',sep = '/')
linear1_df <- read.csv(file_name)[-1]
linear1_df$param <- "1"

path <- here::here("results", "multistate", "linear_datM_p2")
file_name = paste(path, 'States_e1_linear.csv',sep = '/')
linear2_df <- read.csv(file_name)[-1]
linear2_df$param <- "2"

path <- here::here("results", "multistate", "linear_datM_p3")
file_name = paste(path, 'States_e1_linear.csv',sep = '/')
linear3_df <- read.csv(file_name)[-1]
linear3_df$param <- "3"

path <- here::here("results", "multistate", "linear_datM_p4")
file_name = paste(path, 'States_e1_linear.csv',sep = '/')
linear4_df <- read.csv(file_name)[-1]
linear4_df$param <- "4"

linear_df <- rbind(linear1_df, linear2_df, linear3_df, linear4_df)
linear_df$dr <- 'linear'

#### random_data ####
path <- here::here("results", "multistate", "random_datM")
file_name = paste(path, 'States_random.csv',sep = '/')

random_df <- read.csv(file_name)[-1]
random_df$dr <- 'random'
random_df$param <- as.factor(random_df$param)

#### COMBINE DATA ####
results_df <- rbind(occ_df, linear_df, random_df)

#### FINAL RESULTS ####
fin_res <- results_df %>% filter(week == 4, year == 10)

means <- aggregate(state ~  param + dr, fin_res, mean)
means$state <- round(means$state, 2)

ggplot(fin_res)+
  geom_violin(mapping = aes(x = param, y = state, fill = param))+
  scale_fill_brewer(palette = 'Paired')+ 
  stat_summary(aes(x = param, y = state),
               fun=mean, colour="black", geom="point",
               shape=18, size=4, show.legend=FALSE) + 
  geom_text(data = means, aes(x = param, label = state, y = state + 0.08), size = 6)+
  facet_wrap(~dr)


means <- aggregate(state ~  dr, fin_res, mean)
means$state <- round(means$state, 4)

ggplot(fin_res)+
  geom_violin(mapping = aes(x = dr, y = state, fill = dr))+
  scale_fill_brewer(palette = 'Dark2')+ 
  stat_summary(aes(x = dr, y = state),
               fun=mean, colour="black", geom="point",
               shape=18, size=4, show.legend=FALSE) + 
  geom_text(data = means, aes(x = dr, label = state, y = state + 0.3), size = 6)

#### site invasion ####
invasion <- array(NA, c(3, 4, 20))

drs <- c("linear", "occ", "random")

for(d in 1:3){
  for(p in 1:4){
    for(s in 1:20){
      df <- filter(fin_res, sim == s, param == as.factor(p), dr == drs[d])
      invasion[d,p,s] <- 1- sum(df$state == 1)/40
    }
  }
}

invasion_df <- adply(invasion, c(1,2,3))
colnames(invasion_df) <- c("dr", "param", "sim", "val")
invasion_df$dr <- as.factor(invasion_df$dr)
invasion_df$param <- as.factor(invasion_df$param)

means <- aggregate(val~  param + dr, invasion_df, mean)
means$val <- round(means$val, 2)

ggplot(invasion_df)+
  geom_violin(mapping = aes(x = param, y = val, fill = param))+
  scale_fill_brewer(palette = 'Paired')+ 
  stat_summary(aes(x = param, y = val),
               fun=mean, colour="black", geom="point",
               shape=18, size=4, show.legend=FALSE) + 
  geom_text(data = means, aes(x = param, label = val, y = val + .05), size = 6)+
  facet_wrap(~dr)

means <- aggregate(val~  dr, invasion_df, mean)
means$val <- round(means$val, 2)

ggplot(invasion_df)+
  geom_violin(mapping = aes(x = dr, y = val, fill = dr))+
  scale_fill_brewer(palette = 'Dark2')+ 
  stat_summary(aes(x = dr, y = val),
               fun=mean, colour="black", geom="point",
               shape=18, size=4, show.legend=FALSE) + 
  geom_text(data = means, aes(x = dr, label = val, y = val + .05), size = 6)

