# Creating Community Health by Simon Lennane ISBN 9781032490045
# Fig 10.1 Conceptual framework of anomie
# from Teymoori A, Bastian B, Jetten J. Towards a psychological analysis of anomie.Polit Psychol. 2017;38(6):1009-1023. doi:10.1111/pops.12377
# reprinted with kind permission of the author
# an error in the original image has been corrected

# this R code creates the image - run in RStudio

# you'll need to install this once if not already installed
  # run this line in console:
  # install.packages("ggplot2") 

library(ggplot2)

p <- ggplot() + coord_fixed() + expand_limits(x = c(-15, 100), y = c(-15, 100))

# axes
p <- p + geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 1, arrow = arrow(length = unit(0.5, "cm")))
p <- p + geom_segment(aes(x = 0, y = 0, xend = 0, yend = 100), size = 1, arrow = arrow(length = unit(0.5, "cm")))

# label axes
p <- p + annotate(geom = "text", x = 50, y = -12, family="Times", fontface = "bold", label = "Breakdown in social fabric\n(trust and moral decline)", size = 6, colour = "black") 
p <- p + annotate(geom = "text", x = -12, y = 50, family="Times", fontface = "bold", label = "Breakdown in leadership\n(legitimacy, effectiveness)", size = 6, colour = "black", angle = 90) 

# labels
p <- p + annotate(geom = "text", x = 25, y = 25, family="Times", label = "low anomie", size = 6, colour = "black") 
p <- p + annotate(geom = "text", x = 75, y = 25, family="Times", label = "disintegration", size = 6, colour = "black") 
p <- p + annotate(geom = "text", x = 25, y = 75, family="Times", label = "disregulation", size = 6, colour = "black") 
p <- p + annotate(geom = "text", x = 75, y = 75, family="Times", label = "high anomie", size = 6, colour = "black") 

# dotted lines
p <- p + geom_segment(aes(x = 50, y = 0, xend = 50, yend = 100), size = 0.5, linetype = "dotted")
p <- p + geom_segment(aes(x = 0, y = 50, xend = 100, yend = 50), size = 0.5, linetype = "dotted")

# small arrows
p <- p + geom_segment(aes(x = 43, y = 75, xend = 58, yend = 75), size = 0.5, arrow = arrow(length = unit(0.2, "cm")))
p <- p + geom_segment(aes(x = 75, y = 36.5, xend = 75, yend = 63.5), size = 0.7, arrow = arrow(length = unit(0.2, "cm")))

p <- p + theme_void()
p
