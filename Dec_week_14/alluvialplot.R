setwd("C:/Users/Raul/Documents/Tidy_Tuesday/TidyTuesdays/Dec_week_14/")
library(tidytuesdayR)
library(tidyr)
library(dplyr)
library(ggplot2)
library(ggalluvial)
tt_data <- tt_load("2020-12-15")
ninja_warrior= tt_data$ninja_warrior
nw_freq = data.frame(table(ninja_warrior[,c(1,3,4)]))
#test = nw_freq[order(nw_freq$Freq, decreasing = T),][1:100,]
#ggplot(test, aes(y = Freq, axis1 = obstacle_name,  , axis2 = location, axis3 = round_stage )) +
#  geom_alluvium(aes(fill = season), width = 1/12) 
top10freq=names(table(ninja_warrior$obstacle_name)[order(table(ninja_warrior$obstacle_name), decreasing = T)])[1:10]
topfrequentobst_nw = nw_freq[nw_freq$obstacle_name %in% top10freq,]
ap<- ggplot(topfrequentobst_nw, aes(y = Freq, axis1 = obstacle_name ,  axis3 = round_stage, axis2 = season )) +
  geom_alluvium(aes(fill = obstacle_name), width = 1/12) +
  theme_bw() +
  geom_stratum(width = 1/12, fill = "gray27", color = "grey") +
  geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
  scale_x_discrete(limits = c("Obstacle_name",  "Season","Round stage" ), expand = c(.05, .05)) +
  scale_fill_brewer(type = "qual", palette = "Set3") +
  ggtitle("Top 20 obstacles distribution through seasons and round stages")

png("C:/Users/Raul/Documents/Tidy_Tuesday/TidyTuesdays/Dec_week_14/alluvial_plot.png", width = 2080, height = 1480,res=120)
ap
dev.off()
