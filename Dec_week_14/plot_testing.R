setwd("C:/Users/Raul/Documents/Tidy_Tuesday/TidyTuesdays/Dec_week_14/")

library(tidyr)
library(dplyr)
library(ggplot2)

ninjacount = ninja_warrior %>% 
  count(obstacle_name) 
 g <- ggplot(data = ninjacount, aes(x = reorder(obstacle_name, n), y= n)) + 
  geom_bar(stat = "identity" , color = 'gray37' , fill = "gray37") + 
  theme( panel.background = element_rect(fill = "white") ,
         panel.border = element_blank(),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         axis.text.x=element_blank(),
         axis.ticks.x=element_blank()
  )  +  labs(x = "Obstacle", y = "Frequency of appearance")
arrows = tibble(x1 = 200,
               x2 = 223,
               y1 = 80,
               y2 = 75)


g
#pdf("plot_of_Warped_wall.pdf")
g + geom_curve(
  data = arrows, aes(x = x1, y = y1, xend = x2, yend = y2),
  arrow = arrow(length = unit(0.07, "inch")), size = 1,
  color = "gray20", curvature = -0.3
)  +
  annotate(
    "text", x = 165, y = 80,  size = 8, color = "gray20", lineheight = .9, 
    label = "Warped Wall") 
#dev.off()




pdf("plot_of_Warped_wall.pdf")
ggplot(data = ninjacount) +  theme( panel.background = element_rect(fill = "white") ,
                                    panel.border = element_blank(),
                                    panel.grid.major = element_blank(),
                                    panel.grid.minor = element_blank(),
                                    axis.text.x=element_blank(),
                                    axis.ticks.x=element_blank(),
                                    legend.position = "none"
                                    
)+ geom_line( aes(x = 1:225, y= n[order(n)], color = '#E69F00', size = 1))  +
  scale_color_manual(values=c('purple')) +
   geom_area(aes(x = 1:225,y= n[order(n)])) + geom_curve(
    data = arrows, aes(x = x1, y = y1, xend = x2, yend = y2),
    arrow = arrow(length = unit(0.07, "inch")), size = 1,
    color = "gray20", curvature = -0.3
  )  + annotate(
    "text", x = 165, y = 80,  size = 8, color = "gray20", lineheight = .9, 
    label = "Warped Wall")  +  labs(x = "Obstacle", y = "Frequency of appearance")
dev.off()
