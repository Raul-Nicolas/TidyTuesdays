library(ggplot2)
library(plotly)
library(gganimate)

#load data
tuesdata <- tidytuesdayR::tt_load('2020-12-22')
bm = tuesdata$`big-mac`

#select max values per date starting from 2012-06-01
bmax= bm %>% 
  group_by(date) %>% 
  filter(date >= as.Date("2012-06-01")) %>% 
  filter(usd_raw ==max(usd_raw))

#Polygon for the red box
box = data.frame(x = c(min(bmax$date)+300,min(bmax$date)-150,max(bmax$date)+150,max(bmax$date)-300), y =c(-0.75,0.02,0.02, -0.75))

#Mcdonalds logo
img <- readPNG("mcdonald-s-golden-arches-logo-93483062BF-seeklogo.com.png")
g <- rasterGrob(img, interpolate=TRUE)

#Plotting
png("Top_countries_raw_index.png", height =1024  , width =  512)
ggplot(data = bmax, aes(x = date, y = usd_raw, width  = 120, fill = "#FFC72C" )) + 
  geom_bar(stat = "identity", fill = "#FFC72C",color = "#FFa500", size = 1.3 , position = position_dodge(width=1.5)) + 
  scale_x_continuous(limits=c(min(bmax$date)-200,max(bmax$date)+200))+
  geom_text(aes(label=iso_a3),position=position_stack(0.5), angle = 90, color ="#ff8c00" , fontface = "bold", size= 4) + 
  geom_text(aes(label=date),hjust=-0.25, angle = 90, color ="#ff8c00" , fontface = "bold") + 
  scale_y_continuous(limits=c(-max(bmax$usd_raw),1),name="Countries with highest Raw index relative to the US dollar per year:")+
  geom_polygon(data = box, aes(x = x , y = y ))+    scale_fill_manual(values = "#DA291C")  +
  annotation_custom(g, xmin=min(bmax$date)+20, xmax=max(bmax$date)+20, ymin=-0.55, ymax=-0.2) + 
  theme_minimal()+ theme(legend.position = "none" ,axis.text.x=element_blank(), axis.title.x=element_blank()) +
  theme(axis.title.y=element_text(size=20))
dev.off()















