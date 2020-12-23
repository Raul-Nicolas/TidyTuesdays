library(ggplot2)
library(plotly)
library(gganimate)
tuesdata <- tidytuesdayR::tt_load('2020-12-22')
tuesdata <- tidytuesdayR::tt_load(2020, week = 52)
bm = tuesdata$`big-mac`

bm[bm$name == "United Stated",loc]

bm$sign <- bm$usd_raw >= 0

#Create a custom color scale
library(RColorBrewer)
myColors <- brewer.pal(2,"Set1")
names(myColors) <- levels(bm$usd_raw >= 0 )
colScale <- scale_colour_manual(name = "grp",values = myColors)



#pdf("Raw_Index.pdf")

q = ggplot(bm, aes(x = date, y = usd_raw))  
 
qq =   q + geom_hline(yintercept = 0)+
    geom_point( size = 5 ,aes(colour = factor(sign)), alpha = 0.2) +
    geom_line(aes(group = name), alpha = 0.1) + 
  labs(title = "Raw index, relative to the US dollar, per Country and per Year") + 
  theme_minimal()
 # dev.off()
  s <- attrs_selected(
    showlegend = TRUE,
    mode = "lines+markers",
    marker = list(symbol = "x")
  )
 
   hqq = ggplotly(qq)
   pdf("Raw_Index.pdf",width = 20, height=10)
   print(qq)
   dev.off()
#highlight( hqq , on = "plotly_hover", off = "plotly_doubleclick",dynamic = T , opacityDim = 0.01, selected = s)

   
   
  
  
   qq =   q + geom_hline(yintercept = 0)+
     geom_point( size = 5 ,aes(colour = factor(sign)), alpha = 0.2) +
     geom_line(aes(group = name), alpha = 0.1)+ 
     labs(title = "Raw index, relative to the US dollar per Year: {next_state}") +transition_states(states = name,
                                                                                                    transition_length = 0,
       state_length = 1)  + 
     theme_minimal()
   
    
   #qq
  animqq = qq 
  
 # finalanim = animate(animqq)
final = animate(animqq, fps = 1,  renderer = gifski_renderer())
  anim_save("changepercountrylabeled.gif", final)
  