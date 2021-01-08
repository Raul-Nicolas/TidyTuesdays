library(ggplot2)
library(plotly)
library(gganimate)

#load data
tuesdata <- tidytuesdayR::tt_load('2021-01-05')
td = tuesdata$transit_cost
td = td[!is.na(td$country),]
td = td %>% 
  mutate( n_stations = ifelse(stations %in% 1:5, "Between 1 and 5",
                              ifelse(stations %in% 6:10, "Between 21 and 40",
                                     ifelse(stations %in% 41:60, "Between 41 and 60",
                                            ifelse(stations %in% 61:80, "Between 61 and 80",
                                                   ifelse(stations %in% 81:100, "Between 81 and 100",
                                                           "More than 100"))))))
                            


has10 = td[td$country %in% names(which(table(td$country) > 10)),]
ggplot(data = has10 , aes(x = log(length), y = log(as.numeric(real_cost)), col = (stations))) + 
  geom_point() + 
  scale_color_viridis() #+ ylim(c(0,50000)) 

ggplot(data = has10 , aes(x = country, y = stations)) + 
  geom_violin()

ggplot(data = has10 , aes(x = year, y = as.numeric(real_cost), col = country)) + 
  geom_point() 

+ 
  scale_color_viridis() #+ ylim(c(0,50000))
sdasasd