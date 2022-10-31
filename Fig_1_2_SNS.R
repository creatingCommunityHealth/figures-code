# This Rstudio code is for 
# Fig 1.2 bonding and bridging in social networking sites 
# creatingCommunityHealth by Simon Lennane

library(ggforce)
library(ggplot2)

# start a blank canvas
p <- ggplot()
p <- p + coord_fixed()

# The area of the circles is in proportion to user numbers, so the radius comes from the square root of the area, divided by pi
p <- p + geom_circle(aes(x0 = 65, y0 = 34.5, r = 10.09), fill = "#008080", alpha = 0.3) 
p <- p + geom_circle(aes(x0 = 56.5, y0 = 14, r = 11.28), fill = "#008080", alpha = 0.15) 
p <- p + geom_circle(aes(x0 = 25, y0 = 30, r = 22.92), fill = "#008080", alpha = 0.25) 
p <- p + geom_circle(aes(x0 = 0, y0 = 15, r = 5.64), fill = "#008080", alpha = 0.2) 

p <- p + annotate(geom = "text", x = 65, y = 34.5, family="Times", label = "Twitter", size = 6, colour = "black")
p <- p + annotate(geom = "text", x = 65, y = 31, family="Times", label = "(320m)", size = 5, colour = "black")
p <- p + annotate(geom = "text", x = 56.5, y = 14, family="Times", label = "Instagram", size = 6, colour = "black")
p <- p + annotate(geom = "text", x = 56.5, y = 10.5, family="Times", label = "(400m)", size = 5, colour = "black")
p <- p + annotate(geom = "text", x = 25, y = 30, family="Times", label = "Facebook", size = 7, colour = "black")
p <- p + annotate(geom = "text", x = 25, y = 26.5, family="Times", label = "(1.65bn)", size = 6, colour = "black")
p <- p + annotate(geom = "text", x = 0, y = 15.5, family="Times", label = "Snapchat", size = 5, colour = "black")
p <- p + annotate(geom = "text", x = 0, y = 13, family="Times", label = "(100mn)", size = 5, colour = "black")

p <- p + annotate(geom = "text", x = -4, y = 0, family="Times", label = "Bonding", size = 6, colour = "black")
p <- p + annotate(geom = "text", x = 70, y = 0, family="Times", label = "Bridging", size = 6, colour = "black")

p <- p + geom_segment(aes(x = 35, y = 0, xend = 5, yend = 0), arrow = arrow(length = unit(0.5, "cm")))
p <- p + geom_segment(aes(x = 35, y = 0, xend = 60, yend = 0), arrow = arrow(length = unit(0.5, "cm")))

p <- p + theme_void()
p

