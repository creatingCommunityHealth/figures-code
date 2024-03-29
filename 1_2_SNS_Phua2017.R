# Creating Community Health by Simon Lennane ISBN 9781032490045
# Fig 1.2 Bonding and bridging on social network sites
# Phua J, Jin SV, Kim J (Jay). Uses and gratifications of social networking sites for bridging and bonding social capital: a comparison of Facebook, Twitter, Instagram, and Snapchat.
# Comput Hum Behav. 2017;72:115-122.doi:10.1016/j.chb.2017.02.041
# 

# this R code creates the image - run in RStudio

# you'll need to install these once if not already installed
# run these line in console:
# install.packages("ggplot2") 
# install.packages("ggforce")

library(ggforce)
library(ggplot2)

# user numbers used to derive radius of circles - circle area reflects user numbers (so radius = square root of area / pi)

p <- ggplot()
p <- p + coord_fixed()
p <- p + geom_circle(aes(x0 = 65, y0 = 34.5, r = 10.09), fill = "#008080", alpha = 0.3) 
p <- p + geom_circle(aes(x0 = 56.5, y0 = 14, r = 11.28), fill = "#008080", alpha = 0.15) 
p <- p + geom_circle(aes(x0 = 25, y0 = 30, r = 22.92), fill = "#008080", alpha = 0.25) 
p <- p + geom_circle(aes(x0 = 0, y0 = 15, r = 5.64), fill = "#008080", alpha = 0.2) 

p <- p + annotate(geom = "text", x = 65, y = 34.5, family="Times", label = "Twitter", size = 6, colour = "black")
p <- p + annotate(geom = "text", x = 65, y = 31, family="Times", label = "(320mn)", size = 5, colour = "black")
p <- p + annotate(geom = "text", x = 56.5, y = 14, family="Times", label = "Instagram", size = 6, colour = "black")
p <- p + annotate(geom = "text", x = 56.5, y = 10.5, family="Times", label = "(400mn)", size = 5, colour = "black")
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

