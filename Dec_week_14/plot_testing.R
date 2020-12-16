setwd("C:/Users/Raul/Documents/Tidy_Tuesday/TidyTuesdays/Dec_week_14/")

library(tidyr)
library(dplyr)
library(ggplot2)
pdf("plot_of_Warped_wall.pdf")
ninja_warrior %>%  
  filter(obstacle_name == "Warped Wall") %>%
  mutate(season = as.character(season)) %>%
  count(season) %>%
  ggplot( aes(x = reorder(season, n), y= n)) + 
  geom_bar(stat = "identity", colour = "purple" , fill = "dark gray") + 
  theme(panel.background = element_rect(fill = "black", colour = "black") ,
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
          labs(x = "Season", y = "Frequency of appearance")
dev.off()



  
ninja_warrior %>% 
  count(obstacle_name) %>%
  ggplot( aes(x = reorder(obstacle_name, n), y= n)) + 
  geom_bar(stat = "identity")  
