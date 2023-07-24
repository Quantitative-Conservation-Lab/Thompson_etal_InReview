#Comparing the decision scenarios: 
library(tidyverse)
library(here)
library(plyr)
library(boot)

path <- here::here("results", "ESA")

#### Final states ####
##### No control scenario ####
path2 <- "nocontrol"
file_name = paste(path, path2,'States_nocontrol.csv',sep = '/')
nocontrol.states <- read.csv(file_name)[-1]

nc.final <- nocontrol.states %>% filter(year == 10)
nc.final$dr <- "no control"

##### status quo -fixed ####
path2 <- "statusquo"
file_name = paste(path, path2,'States_statusquo.csv',sep = '/')
sq.states <- read.csv(file_name)[-1]

sq.final <- sq.states %>% filter(year == 10)
sq.final$dr <- "status quo fixed"

##### Status quo -rand ####
path2 <- "statusquo_rand"
file_name = paste(path, path2,'States_statusquo.csv',sep = '/')
sqrand.states <- read.csv(file_name)[-1]

sqrand.final <- sqrand.states %>% filter(year == 10)
sqrand.final$dr <- "status quo random"

##### more data very low p ####
path2 <- "moredata_verylowp"
file_name = paste(path, path2,'States_moredat_lowp.csv',sep = '/')
citizenvlowp.states <- read.csv(file_name)[-1]

citizenvlowp.final <- citizenvlowp.states %>% filter(year == 10)
citizenvlowp.final$dr <- "citizen very low p"

##### more data low p ####
path2 <- "moredata_lowp"
file_name = paste(path, path2,'States_moredat_lowp.csv',sep = '/')
citizenlowp.states <- read.csv(file_name)[-1]

citizenlowp.final <- citizenlowp.states %>% filter(year == 10)
citizenlowp.final$dr <- "citizen low p"

##### more data high p ####
path2 <- "moredata_highp"
file_name = paste(path, path2,'States_moredat_highp.csv',sep = '/')
citizenhighp.states <- read.csv(file_name)[-1]

citizenhighp.final <- citizenhighp.states %>% filter(year == 10)
citizenhighp.final$dr <- "citizen high p"

##### compare final states ####
state.final <- rbind(nc.final, sq.final, sqrand.final, 
                     citizenvlowp.final, citizenlowp.final, citizenhighp.final)


means <- aggregate(state ~  dr, state.final, mean)

ggplot(state.final, aes(x = dr, y = state))+
  geom_boxplot()+
  stat_summary(fun=mean, colour="darkred", geom="point", 
               shape=18, size=3, show.legend=FALSE) + 
  geom_text(data = means, aes(label = state, y = state + 0.08))

##### compare final states each site ####
means <- aggregate(state ~  dr + site, state.final, mean)

ggplot(state.final, aes(x = site, y = state, group = site))+
  geom_boxplot()+
  facet_wrap(~dr) +
  stat_summary(fun=mean, colour="darkred", geom="point", 
               shape=18, size=3, show.legend=FALSE) + 
  geom_text(data = means, aes(label = state, y = state + 0.12))


#### evaluate detection rates rho h ####
pmulti.l <- 0.6 #detection probability (for multistate data)
pmulti.h <- 0.9 #detection probability (for multistate data)

##### status quo -fixed ####
path2 <- "statusquo"
file_name = paste(path, path2,'rho.hs.est_statusquo.csv',sep = '/')
sq.rhoh <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, sq.rhoh, mean)
sds <- aggregate(sd ~  year, sq.rhoh, mean)

sq.rhoh <- cbind(means, sds$sd)
colnames(sq.rhoh)[3] <- 'sd'
sq.rhoh$dr <- "status quo fixed"

file_name = paste(path, path2,'rho.ls.est_statusquo.csv',sep = '/')
sq.rhol <- read.csv(file_name)[-1]


means <- aggregate(mean ~  year, sq.rhol, mean)
sds <- aggregate(sd ~  year, sq.rhol, mean)

sq.rhol <- cbind(means, sds$sd)
colnames(sq.rhol)[3] <- 'sd'
sq.rhol$dr <- "status quo fixed"

# ggplot(sq.rhol, aes(x=year, y=mean, fill=year)) + 
#   geom_point()+
#   geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
#                 position=position_dodge(0.05))+
#   geom_hline(yintercept = pmulti.l, color = 'red')
  

##### Status quo -rand ####
path2 <- "statusquo_rand"
file_name = paste(path, path2,'rho.hs.est_statusquo.csv',sep = '/')
sqr.rhoh <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, sqr.rhoh, mean)
sds <- aggregate(sd ~  year, sqr.rhoh, mean)

sqr.rhoh <- cbind(means, sds$sd)
colnames(sqr.rhoh)[3] <- 'sd'
sqr.rhoh$dr <- "status quo random"

file_name = paste(path, path2,'rho.ls.est_statusquo.csv',sep = '/')
sqr.rhol <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, sqr.rhol, mean)
sds <- aggregate(sd ~  year, sqr.rhol, mean)

sqr.rhol <- cbind(means, sds$sd)
colnames(sqr.rhol)[3] <- 'sd'
sqr.rhol$dr <- "status quo random"

##### more data very low p ####
path2 <- "moredata_verylowp"
file_name = paste(path, path2,'rho.hs.est_moredat_lowp.csv',sep = '/')
vlowp.rhoh <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, vlowp.rhoh, mean)
sds <- aggregate(sd ~  year, vlowp.rhoh, mean)

vlowp.rhoh <- cbind(means, sds$sd)
colnames(vlowp.rhoh)[3] <- 'sd'
vlowp.rhoh$dr <- "citizen very low p"

file_name = paste(path, path2,'rho.ls.est_moredat_lowp.csv',sep = '/')
vlowp.rhol <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, vlowp.rhol, mean)
sds <- aggregate(sd ~  year, vlowp.rhol, mean)

vlowp.rhol <- cbind(means, sds$sd)
colnames(vlowp.rhol)[3] <- 'sd'
vlowp.rhol$dr <- "citizen very low p"


##### more data low p ####
path2 <- "moredata_lowp"
file_name = paste(path, path2,'rho.hs.est_moredat_lowp.csv',sep = '/')
lowp.rhoh <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, lowp.rhoh, mean)
sds <- aggregate(sd ~  year, lowp.rhoh, mean)

lowp.rhoh <- cbind(means, sds$sd)
colnames(lowp.rhoh)[3] <- 'sd'
lowp.rhoh$dr <- "citizen low p"

file_name = paste(path, path2,'rho.ls.est_moredat_lowp.csv',sep = '/')
lowp.rhol <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, lowp.rhol, mean)
sds <- aggregate(sd ~  year, lowp.rhol, mean)

lowp.rhol <- cbind(means, sds$sd)
colnames(lowp.rhol)[3] <- 'sd'
lowp.rhol$dr <- "citizen low p"

##### more data high p ####
path2 <- "moredata_highp"
file_name = paste(path, path2,'rho.hs.est_moredat_highp.csv',sep = '/')
highp.rhoh <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, highp.rhoh, mean)
sds <- aggregate(sd ~  year, highp.rhoh, mean)

highp.rhoh <- cbind(means, sds$sd)
colnames(highp.rhoh)[3] <- 'sd'
highp.rhoh$dr <- "citizen high p"

file_name = paste(path, path2,'rho.ls.est_moredat_highp.csv',sep = '/')
highp.rhol <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, highp.rhol, mean)
sds <- aggregate(sd ~  year, highp.rhol, mean)

highp.rhol <- cbind(means, sds$sd)
colnames(highp.rhol)[3] <- 'sd'
highp.rhol$dr <- "citizen high p"

##### compare detection ####
rhoh <- rbind(sq.rhoh, sqr.rhoh, vlowp.rhoh, lowp.rhoh, highp.rhoh)

ggplot(rhoh, aes(x=year, y=mean, group = dr)) + 
  geom_point()+
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = pmulti.h)+
  facet_wrap(~dr)

rhol <- rbind(sq.rhol, sqr.rhol, vlowp.rhol, lowp.rhol, highp.rhol)

ggplot(rhol, aes(x=year, y=mean, group = dr)) + 
  geom_point()+
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=.2,
                position=position_dodge(0.05))+
  geom_hline(yintercept = pmulti.l)+
  facet_wrap(~dr)

#### Citizen science detection ####
##### more data very low p ####
psingle.l <- 0.1 #detection probability (for single state data)
psingle.h <- 0.2 #detection probability (for single state data)

path2 <- "moredata_verylowp"
file_name = paste(path, path2,'alpha.hs.est_moredat_lowp.csv',sep = '/')
vlowp.alphah <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, vlowp.alphah, mean)
sds <- aggregate(sd ~  year, vlowp.alphah, mean)

vlowp.alphah <- cbind(means, sds$sd)
colnames(vlowp.alphah)[3] <- 'sd'
vlowp.alphah$dr <- "citizen very low p"

vlowp.alphah$val_h <- inv.logit(vlowp.rhoh$mean - vlowp.alphah$mean)

file_name = paste(path, path2,'alpha.ls.est_moredat_lowp.csv',sep = '/')
vlowp.alphal <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, vlowp.alphal, mean)
sds <- aggregate(sd ~  year, vlowp.alphal, mean)

vlowp.alphal <- cbind(means, sds$sd)
colnames(vlowp.alphal)[3] <- 'sd'
vlowp.alphal$dr <- "citizen very low p"

vlowp.alphal$val_l <- inv.logit(vlowp.rhol$mean - vlowp.alphal$mean)

vlowp.alphas <- cbind(vlowp.alphah, val_l = vlowp.alphal$val_l)

ggplot(vlowp.alphas) + 
  geom_point(aes(x=year, y=val_h), col = "red")+
  geom_point(aes(x=year, y=val_l), col = "blue")+
  geom_hline(yintercept = psingle.h, col = "red")+
  geom_hline(yintercept = psingle.l, col = "blue")

##### more data low p ####
path2 <- "moredata_lowp"
file_name = paste(path, path2,'alpha.hs.est_moredat_lowp.csv',sep = '/')
lowp.alphah <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, lowp.alphah, mean)
sds <- aggregate(sd ~  year, lowp.alphah, mean)

lowp.alphah <- cbind(means, sds$sd)
colnames(lowp.alphah)[3] <- 'sd'
lowp.alphah$dr <- "citizen low p"

lowp.alphah$val_h <- inv.logit(lowp.rhoh$mean - lowp.alphah$mean)

file_name = paste(path, path2,'alpha.ls.est_moredat_lowp.csv',sep = '/')
lowp.alphal <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, lowp.alphal, mean)
sds <- aggregate(sd ~  year, lowp.alphal, mean)

lowp.alphal <- cbind(means, sds$sd)
colnames(lowp.alphal)[3] <- 'sd'
lowp.alphal$dr <- "citizen low p"

lowp.alphal$val_l <- inv.logit(lowp.rhol$mean - lowp.alphal$mean)

lowp.alphas <- cbind(lowp.alphah, val_l = lowp.alphal$val_l)

ggplot(lowp.alphas) + 
  geom_point(aes(x=year, y=val_h), col = "red")+
  geom_point(aes(x=year, y=val_l), col = "blue")+
  geom_hline(yintercept = psingle.h, col = "red")+
  geom_hline(yintercept = psingle.l, col = "blue")

##### more data high p ####
path2 <- "moredata_highp"
file_name = paste(path, path2,'alpha.hs.est_moredat_highp.csv',sep = '/')
hp.alphah <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, hp.alphah, mean)
sds <- aggregate(sd ~  year, hp.alphah, mean)

hp.alphah <- cbind(means, sds$sd)
colnames(hp.alphah)[3] <- 'sd'
hp.alphah$dr <- "citizen high p"

hp.alphah$val_h <- inv.logit(highp.rhoh$mean - hp.alphah$mean)

file_name = paste(path, path2,'alpha.ls.est_moredat_highp.csv',sep = '/')
hp.alphal <- read.csv(file_name)[-1]

means <- aggregate(mean ~  year, hp.alphal, mean)
sds <- aggregate(sd ~  year, hp.alphal, mean)

hp.alphal <- cbind(means, sds$sd)
colnames(hp.alphal)[3] <- 'sd'
hp.alphal$dr <- "citizen high p"

hp.alphal$val_l <- inv.logit(highp.rhol$mean - hp.alphal$mean)

hp.alphas <- cbind(hp.alphah, val_l = hp.alphal$val_l)

ggplot(hp.alphas) + 
  geom_point(aes(x=year, y=val_h), col = "red")+
  geom_point(aes(x=year, y=val_l), col = "blue")+
  geom_hline(yintercept = psingle.h, col = "red")+
  geom_hline(yintercept = psingle.l, col = "blue")

