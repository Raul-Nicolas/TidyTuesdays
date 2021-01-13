library(ggplot2)
library(plotly)
library(gganimate)
library("RColorBrewer")
#load data
tuesdata <- tidytuesdayR::tt_load('2021-01-05')
td = tuesdata$transit_cost
td = td[!is.na(td$country),]
td = td %>% 
  mutate(speed = length/(as.numeric(end_year) - as.numeric(start_year)))



has10 = td[td$country %in% names(which(table(td$country) > 10)),]
ggplot(data = has10 , aes(x = log(length), y = log(as.numeric(real_cost)), col = (stations))) + 
  geom_point() + 
  scale_color_viridis() #+ ylim(c(0,50000)) 

ggplot(data = has10 , aes(x = country, y = stations)) + 
  geom_violin()

ggplot(data = has10 , aes(x = year, y = as.numeric(real_cost), col = country)) + 
  geom_point() 

 #+ ylim(c(0,50000))




ggplot(data = td , aes(x = as.numeric(cost_km_millions), y = speed, col = country)) + 
  geom_point() 

ggplot(data = has10 , aes(x = as.numeric(cost_km_millions), y = speed, col = country)) + 
  geom_point() + 
  scale_color_viridis(discrete = T) + 
  theme_dark()



ggplot(data = has10 , aes(x = as.numeric(length), y = speed , col = country)) + 
  geom_point() + 
  theme_dark()+ 
    scale_color_manual(values = brewer.pal(n = 10, name = "Paired"))


