library(tidyverse)
library(here)
library(plyr)
library(data.table)
library(RColorBrewer) 

path <- here::here("results", "test")

#### LOADING DATA ####
#---- no control ----#
path2 <- "nocontrol"
file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_nocontrol <- fread(file_name)
S_truthdat_nocontrol <- data.frame(S_truthdat_nocontrol)[-1]

#---- generating  ----#
path2 <- "generating"

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_generating <- fread(file_name)
dist_travel_generating <- data.frame(dist_travel_generating)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_generating <- fread(file_name)
site_visit_generating <- data.frame(site_visit_generating)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_generating <- fread(file_name)
S_truthdat_generating <- data.frame(S_truthdat_generating)[-1]

#---- est 1  ----#
path2 <- "years_1"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a1 <- fread(file_name)
est_states_a1 <- data.frame(est_states_a1)[-1]
est_states_a1$a <- 1

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a1 <- fread(file_name)
est_params_a1 <- data.frame(est_params_a1)[-1]
est_params_a1$a <- 1

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a1 <- fread(file_name)
bias_state_a1 <- data.frame(bias_state_a1)[-1]
bias_state_a1$a <- 1

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a1 <- fread(file_name)
bias_param_a1 <- data.frame(bias_param_a1)[-1]
bias_param_a1$a <- 1

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a1 <- fread(file_name)
CI_state_a1 <- data.frame(CI_state_a1)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a1 <- fread(file_name)
CI_param_a1 <- data.frame(CI_param_a1)[-1]
CI_param_a1$a <- 1


file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a1 <- fread(file_name)
dist_travel_a1 <- data.frame(dist_travel_a1)[-1]
dist_travel_a1$a <- 1

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a1 <- fread(file_name)
site_visit_a1 <- data.frame(site_visit_a1)[-1]
site_visit_a1$a <- 1

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a1 <- fread(file_name)
yM_dat_a1 <- data.frame(yM_dat_a1)[-1]
yM_dat_a1$a <- 1

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a1 <- fread(file_name)
S_truthdat_a1 <- data.frame(S_truthdat_a1)[-1]
S_truthdat_a1$a <- 1


#---- est 2  ----#
path2 <- "years_2"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a2 <- fread(file_name)
est_states_a2 <- data.frame(est_states_a2)[-1]

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a2 <- fread(file_name)
est_params_a2 <- data.frame(est_params_a2)[-1]

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a2 <- fread(file_name)
bias_state_a2 <- data.frame(bias_state_a2)[-1]

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a2 <- fread(file_name)
bias_param_a2 <- data.frame(bias_param_a2)[-1]

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a2 <- fread(file_name)
CI_state_a2 <- data.frame(CI_state_a2)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a2 <- fread(file_name)
CI_param_a2 <- data.frame(CI_param_a2)[-1]

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a2 <- fread(file_name)
dist_travel_a2 <- data.frame(dist_travel_a2)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a2 <- fread(file_name)
site_visit_a2 <- data.frame(site_visit_a2)[-1]

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a2 <- fread(file_name)
yM_dat_a2 <- data.frame(yM_dat_a2)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a2 <- fread(file_name)
S_truthdat_a2 <- data.frame(S_truthdat_a2)[-1]

#---- est 3  ----#
path2 <- "years_3"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a3 <- fread(file_name)
est_states_a3 <- data.frame(est_states_a3)[-1]

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a3 <- fread(file_name)
est_params_a3 <- data.frame(est_params_a3)[-1]

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a3 <- fread(file_name)
bias_state_a3 <- data.frame(bias_state_a3)[-1]

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a3 <- fread(file_name)
bias_param_a3 <- data.frame(bias_param_a3)[-1]

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a3 <- fread(file_name)
CI_state_a3 <- data.frame(CI_state_a3)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a3 <- fread(file_name)
CI_param_a3 <- data.frame(CI_param_a3)[-1]

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a3 <- fread(file_name)
dist_travel_a3 <- data.frame(dist_travel_a3)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a3 <- fread(file_name)
site_visit_a3 <- data.frame(site_visit_a3)[-1]

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a3 <- fread(file_name)
yM_dat_a3 <- data.frame(yM_dat_a3)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a3 <- fread(file_name)
S_truthdat_a3 <- data.frame(S_truthdat_a3)[-1]

#---- est 4  ----#
path2 <- "years_4"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a4 <- fread(file_name)
est_states_a4 <- data.frame(est_states_a4)[-1]

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a4 <- fread(file_name)
est_params_a4 <- data.frame(est_params_a4)[-1]

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a4 <- fread(file_name)
bias_state_a4 <- data.frame(bias_state_a4)[-1]

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a4 <- fread(file_name)
bias_param_a4 <- data.frame(bias_param_a4)[-1]

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a4 <- fread(file_name)
CI_state_a4 <- data.frame(CI_state_a4)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a4 <- fread(file_name)
CI_param_a4 <- data.frame(CI_param_a4)[-1]

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a4 <- fread(file_name)
dist_travel_a4 <- data.frame(dist_travel_a4)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a4 <- fread(file_name)
site_visit_a4 <- data.frame(site_visit_a4)[-1]

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a4 <- fread(file_name)
yM_dat_a4 <- data.frame(yM_dat_a4)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a4 <- fread(file_name)
S_truthdat_a4 <- data.frame(S_truthdat_a4)[-1]

#---- est 5  ----#
path2 <- "years_5"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a5 <- fread(file_name)
est_states_a5 <- data.frame(est_states_a5)[-1]

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a5 <- fread(file_name)
est_params_a5 <- data.frame(est_params_a5)[-1]

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a5 <- fread(file_name)
bias_state_a5 <- data.frame(bias_state_a5)[-1]

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a5 <- fread(file_name)
bias_param_a5 <- data.frame(bias_param_a5)[-1]

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a5 <- fread(file_name)
CI_state_a5 <- data.frame(CI_state_a5)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a5 <- fread(file_name)
CI_param_a5 <- data.frame(CI_param_a5)[-1]

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a5 <- fread(file_name)
dist_travel_a5 <- data.frame(dist_travel_a5)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a5 <- fread(file_name)
site_visit_a5 <- data.frame(site_visit_a5)[-1]

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a5 <- fread(file_name)
yM_dat_a5 <- data.frame(yM_dat_a5)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a5 <- fread(file_name)
S_truthdat_a5 <- data.frame(S_truthdat_a5)[-1]


#---- est 6  ----#
path2 <- "years_6"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a6 <- fread(file_name)
est_states_a6 <- data.frame(est_states_a6)[-1]

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a6 <- fread(file_name)
est_params_a6 <- data.frame(est_params_a6)[-1]

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a6 <- fread(file_name)
bias_state_a6 <- data.frame(bias_state_a6)[-1]

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a6 <- fread(file_name)
bias_param_a6 <- data.frame(bias_param_a6)[-1]

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a6 <- fread(file_name)
CI_state_a6 <- data.frame(CI_state_a6)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a6 <- fread(file_name)
CI_param_a6 <- data.frame(CI_param_a6)[-1]

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a6 <- fread(file_name)
dist_travel_a6 <- data.frame(dist_travel_a6)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a6 <- fread(file_name)
site_visit_a6 <- data.frame(site_visit_a6)[-1]

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a6 <- fread(file_name)
yM_dat_a6 <- data.frame(yM_dat_a6)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a6 <- fread(file_name)
S_truthdat_a6 <- data.frame(S_truthdat_a6)[-1]


#---- est 7  ----#
path2 <- "years_7"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a7 <- fread(file_name)
est_states_a7 <- data.frame(est_states_a7)[-1]

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a7 <- fread(file_name)
est_params_a7 <- data.frame(est_params_a7)[-1]

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a7 <- fread(file_name)
bias_state_a7 <- data.frame(bias_state_a7)[-1]

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a7 <- fread(file_name)
bias_param_a7 <- data.frame(bias_param_a7)[-1]

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a7 <- fread(file_name)
CI_state_a7 <- data.frame(CI_state_a7)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a7 <- fread(file_name)
CI_param_a7 <- data.frame(CI_param_a7)[-1]

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a7 <- fread(file_name)
dist_travel_a7 <- data.frame(dist_travel_a7)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a7 <- fread(file_name)
site_visit_a7 <- data.frame(site_visit_a7)[-1]

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a7 <- fread(file_name)
yM_dat_a7 <- data.frame(yM_dat_a7)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a7 <- fread(file_name)
S_truthdat_a7 <- data.frame(S_truthdat_a7)[-1]


#---- est 8  ----#
path2 <- "years_8"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a8 <- fread(file_name)
est_states_a8 <- data.frame(est_states_a8)[-1]

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a8 <- fread(file_name)
est_params_a8 <- data.frame(est_params_a8)[-1]

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a8 <- fread(file_name)
bias_state_a8 <- data.frame(bias_state_a8)[-1]

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a8 <- fread(file_name)
bias_param_a8 <- data.frame(bias_param_a8)[-1]

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a8 <- fread(file_name)
CI_state_a8 <- data.frame(CI_state_a8)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a8 <- fread(file_name)
CI_param_a8 <- data.frame(CI_param_a8)[-1]

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a8 <- fread(file_name)
dist_travel_a8 <- data.frame(dist_travel_a8)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a8 <- fread(file_name)
site_visit_a8 <- data.frame(site_visit_a8)[-1]

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a8 <- fread(file_name)
yM_dat_a8 <- data.frame(yM_dat_a8)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a8 <- fread(file_name)
S_truthdat_a8 <- data.frame(S_truthdat_a8)[-1]

#---- est 9  ----#
path2 <- "years_9"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a9 <- fread(file_name)
est_states_a9 <- data.frame(est_states_a9)[-1]

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a9 <- fread(file_name)
est_params_a9 <- data.frame(est_params_a9)[-1]

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a9 <- fread(file_name)
bias_state_a9 <- data.frame(bias_state_a9)[-1]

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a9 <- fread(file_name)
bias_param_a9 <- data.frame(bias_param_a9)[-1]

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a9 <- fread(file_name)
CI_state_a9 <- data.frame(CI_state_a9)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a9 <- fread(file_name)
CI_param_a9 <- data.frame(CI_param_a9)[-1]

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a9 <- fread(file_name)
dist_travel_a9 <- data.frame(dist_travel_a9)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a9 <- fread(file_name)
site_visit_a9 <- data.frame(site_visit_a9)[-1]

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a9 <- fread(file_name)
yM_dat_a9 <- data.frame(yM_dat_a9)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a9 <- fread(file_name)
S_truthdat_a9 <- data.frame(S_truthdat_a9)[-1]


#---- est 10  ----#
path2 <- "years_10"

file_name = paste(path, path2,'states.csv',sep = '/')
est_states_a10 <- fread(file_name)
est_states_a10 <- data.frame(est_states_a10)[-1]

file_name = paste(path, path2,'params.csv',sep = '/')
est_params_a10 <- fread(file_name)
est_params_a10 <- data.frame(est_params_a10)[-1]

file_name = paste(path, path2,'bias_states.csv',sep = '/')
bias_state_a10 <- fread(file_name)
bias_state_a10 <- data.frame(bias_state_a10)[-1]

file_name = paste(path, path2,'bias_param.csv',sep = '/')
bias_param_a10 <- fread(file_name)
bias_param_a10 <- data.frame(bias_param_a10)[-1]

file_name = paste(path, path2,'CI_state.csv',sep = '/')
CI_state_a10 <- fread(file_name)
CI_state_a10 <- data.frame(CI_state_a10)[-1]

file_name = paste(path, path2,'CI_param.csv',sep = '/')
CI_param_a10 <- fread(file_name)
CI_param_a10 <- data.frame(CI_param_a10)[-1]

file_name = paste(path, path2,'dist_travel.csv',sep = '/')
dist_travel_a10 <- fread(file_name)
dist_travel_a10 <- data.frame(dist_travel_a10)[-1]

file_name = paste(path, path2,'site_visit.csv',sep = '/')
site_visit_a10 <- fread(file_name)
site_visit_a10 <- data.frame(site_visit_a10)[-1]

file_name = paste(path, path2,'yM_dat.csv',sep = '/')
yM_dat_a10 <- fread(file_name)
yM_dat_a10 <- data.frame(yM_dat_a10)[-1]

file_name = paste(path, path2,'S_truthdat.csv',sep = '/')
S_truthdat_a10 <- fread(file_name)
S_truthdat_a10 <- data.frame(S_truthdat_a10)[-1]

#### Combining data across alternatives ####
est_state  <- rbind(est_states_a1, est_states_a2, est_states_a3,est_states_a4,est_states_a5,
                     est_states_a6,est_states_a7,est_states_a8,est_states_a9,est_states_a10)

est_param  <- rbind(est_params_a1, est_params_a2, est_params_a3,est_params_a4,est_params_a5,
                     est_params_a6,est_params_a7,est_params_a8,est_params_a9,est_params_a10)


bias_state <- rbind(bias_state_a1, bias_state_a2, bias_state_a3,bias_state_a4,bias_state_a5,
                    bias_state_a6, bias_state_a7,bias_state_a8,bias_state_a9,bias_state_a10)

bias_param <- rbind(bias_param_a1, bias_param_a2, bias_param_a3,bias_param_a4,bias_param_a5,
                    bias_param_a6, bias_param_a7,bias_param_a8,bias_param_a9,bias_param_a10)

CI_state <- rbind(CI_state_a1, CI_state_a2, CI_state_a3,CI_state_a4,CI_state_a5,
                    CI_state_a6, CI_state_a7,CI_state_a8,CI_state_a9,CI_state_a10)

CI_param <- rbind(CI_param_a1, CI_param_a2, CI_param_a3,CI_param_a4,CI_param_a5,
                    CI_param_a6, CI_param_a7,CI_param_a8,CI_param_a9,CI_param_a10)

dist_travel_generating <- dist_travel_generating %>% select("week", "year", "sim", "distance", "alt")
colnames(dist_travel_generating)[5] <- 'a'


dist_travel <- rbind(dist_travel_a1, dist_travel_a2, dist_travel_a3,dist_travel_a4,
                     dist_travel_a5, dist_travel_a6, dist_travel_a7,dist_travel_a8,dist_travel_a9, dist_travel_a10)

site_visit <- rbind(site_visit_a1, site_visit_a2, site_visit_a3,site_visit_a4,
                     site_visit_a5, site_visit_a6, site_visit_a7,site_visit_a8,site_visit_a9, site_visit_a10)


yM_dat <- rbind(yM_dat_a1, yM_dat_a2, yM_dat_a3,yM_dat_a4,yM_dat_a5,
                  yM_dat_a6, yM_dat_a7,yM_dat_a8,yM_dat_a9,yM_dat_a10)

colnames(S_truthdat_nocontrol)[6] <- 'a'
colnames(S_truthdat_generating)[6] <- 'a'

S_truthdat_nocontrol$type <- 'truth'
S_truthdat_generating$type <- 'truth'

S_truthdat <- rbind(S_truthdat_a1, S_truthdat_a2, S_truthdat_a3,S_truthdat_a4,
                    S_truthdat_a5, S_truthdat_a6, S_truthdat_a7,S_truthdat_a8,S_truthdat_a9, S_truthdat_a10)


S_truthdat$type <- 'truth'


#### Plots ####
hours <- expand.grid(s = c(0.5, 1, 2, 3), r =  c(1,2,3,4))
hours <- hours %>% filter(s < r)

alt.hours <- rep(NA, length(hours$s))
for(i in 1:length(alt.hours)){
  alt.hours[i] <- paste0("search = ",  hours$s[i], " & removal = ", hours$r[i])
}

col <- brewer.pal(9, "Set1") 
colors <- colorRampPalette(col)(10)


##### Max Rhat ####
sum(est_param$Rhat > 1.1)/ length(est_param$Rhat)

paste0(sum(est_param$Rhat > 1.1), " out of ", length(est_param$Rhat),
       " parameters had rhat > 1.1")  

##### Bias states ####
bias_state$a <- as.factor(bias_state$a) 

ggplot(bias_state) + 
  geom_boxplot(aes(x = a, y = rel.bias, group = a, col = a))+
  scale_color_manual(name = "hrs spent searching and removing at a site)", labels = alt.hours, values = colors) +
  xlab("Search + Removal Alternative")+ ylab("State Relative Bias")+
  labs(title = "State relative bias for each alternative ")

##### Bias params ####
mean.param <- array(NA, c(10,21,20,10))
true.param <- array(NA, c(10,21,20,10))
param.bias <- array(NA, c(10,21,20,10))

parm.list <- est_param$param[1:21]

est_param$year <- as.numeric(est_param$year)
est_param$a <- as.numeric(est_param$a)

for(y in 2:10){
  for(i in 1:21){ #param
    for(s in 1:20){
      for(al in 1:10){
        mean.param[y,i,s,al] <- as.numeric(est_param %>% filter(param == parm.list[i] & sim == s & year == y &  a == al) %>% select(mean))
        true.param[y,i,s,al] <- as.numeric(est_param %>% filter(param == parm.list[i] & sim == s & year == y & a == al) %>% select(truth))
        param.bias[y,i,s,al] <- ((mean.param[y,i,s,al])-(true.param[y,i,s,al]))/(true.param[y,i,s,al])
        
      }
    }
  }
}

param.bias <- as.data.frame.table(param.bias)
colnames(param.bias) <- c("year", "param", "sim", "a", "rel.bias")
param.bias <-  as.data.frame(sapply(param.bias,as.numeric))
param.bias <- param.bias %>% filter(year > 1)

for(i in 1:length(param.bias$year)){
  param.bias$param2[i] <- parm.list[param.bias$param[i]]
}

param.bias$a <- as.factor(param.bias$a)

param.bias_sub <- param.bias %>% filter(param2 != 'alpha.h' & param2 != 'alpha.l' & param2 != 'delta')

ggplot(param.bias_sub) + 
  geom_boxplot(aes(x = a, y = rel.bias, group = a, col = a))+
  geom_hline(yintercept = 0, color = 'red')+
  scale_color_manual(name = "hrs spent searching and removing at a site)", labels = alt.hours, values = colors) +
  xlab("Search + Removal Alternative")+ ylab("Parameter Relative Bias")+
  facet_wrap(~param2, scales = 'free')

param.bias1 <- param.bias_sub %>% filter( a == '1')

ggplot(param.bias1) + 
  geom_boxplot(aes(x = year, y = rel.bias, group = year))+
  geom_hline(yintercept = 0, color = 'red')+
  scale_color_manual(name = "hrs spent searching and removing at a site)", labels = alt.hours, values = colors) +
  xlab("Alternative")+ ylab("Relative Bias for Estimating Parameter")+
  facet_wrap(~param2)

#change in relative bias: 
param.biasy1 <- param.bias_sub %>% filter(year == 2)
param.biasy10 <- param.bias_sub %>% filter(year == 10)

delta.rel.bias <- rbind(param.biasy1, param.biasy10)
delta.rel.bias$year <- as.factor(delta.rel.bias$year)

ggplot(delta.rel.bias) + 
  geom_boxplot(aes(x = a, y = rel.bias, fill = year))+
  geom_hline(yintercept = 0, color = 'red')+
  xlab("Hours alternative")+ ylab("Relative Bias for Estimating Parameter")+
  facet_wrap(~param2)

##### CI states ####
CI_state$a <- as.factor(CI_state$a) 

ggplot(CI_state) + 
  geom_boxplot(aes(x = a, y = CI.coverage, group = a, col = a))+
  scale_color_manual(name = "hrs spent searching and removing at a site)", labels = alt.hours, values = colors) +
  xlab("Search + Removal Alternative")+ ylab("CI coverage Estimating State")+
  labs(title = "Estimated final average state across sites and simulations")

mean(CI_state$CI.coverage)

##### CI params ####
CI_param$a <- as.factor(CI_param$a) 

ggplot(CI_param) + 
  geom_boxplot(aes(x = a, y = CI.coverage, group = a, col = a))+
  scale_color_manual(name = "hrs spent searching and removing at a site)", labels = alt.hours, values = colors) +
  xlab("Search + Removal Alternative")+ ylab("CI coverage Estimating State")+
  labs(title = "Estimated final average state across sites and simulations")+
  facet_wrap(~param)

mean(CI_param$CI.coverage, na.rm = T)

##### Estimated final state ####
est_state_final <- est_state %>% filter(year == 10)
est_state_final$a <- as.factor(est_state_final$a) 

ggplot(est_state_final) + 
  geom_boxplot(aes(x = a, y = mean, group = a, col = a))+
  scale_color_manual(name = "hrs spent searching and removing at a site)", labels = alt.hours, values = colors) +
  xlab("Search + Removal Alternative")+ ylab("Average estimated final state") +
  labs(title = "Average estimated final state across sites and simulations")

##### Distance traveled ####
dist_travel$a <- as.factor(dist_travel$a) 

ggplot(dist_travel) + 
  geom_boxplot(aes(x = a, y = distance, group = a, col = a))+
  scale_color_manual(name = "hrs spent searching and removing at a site)", labels = alt.hours, values = colors) +
  xlab("Search + Removal Alternative")+ ylab("Distance traveled")+
  labs(title = "Distance traveled each week")


##### True State ####
S_truthdat_final <- S_truthdat %>% filter(year == 10)
S_truthdat_final$a <- as.factor(S_truthdat_final$a) 


S_truthdat_final2 <- aggregate(state ~ site + a + type,
                               data = as.data.frame(S_truthdat_final), FUN = mean)


ggplot(S_truthdat_final2) +
  geom_boxplot(aes(x = a, y = state, group = a, col = a))+
  scale_color_manual(name = "hrs spent searching and removing at a site)", labels = alt.hours, values = colors) +
  xlab("Search + Removal Alternative")+ ylab("Average estimated final state") +
  labs(title = "Average estimated final state across sites and simulations")

##### True State vs est state ####
ggplot(S_truthdat)


#### State through time ####

S_truthdat_generating$type <- 'truth'