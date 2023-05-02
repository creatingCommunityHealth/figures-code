# Creating Community Health by Simon Lennane ISBN 9781032490045
# Fig 1.1 visual metaphor for the nature of place
# Canter D. The Psychology of Place.Architectural Press; 1977. ISBN 0851395325
# Reproduced by kind permission of David Canter

# this R code creates the image - run in RStudio

# you'll need to install these once if not already installed
# run these line in console:
# install.packages("ggplot2") 
# install.packages("ggforce")

library(ggforce)
library(ggplot2)

p <- ggplot() + coord_fixed() 
p <- p + geom_circle(aes(x0 = 2, y0 = 5, r = 2.5)) 
p <- p + geom_circle(aes(x0 = 5, y0 = 5, r = 2.5)) 
p <- p + geom_circle(aes(x0 = 3.5, y0 = 2.5, r = 2.5)) 
p <- p + geom_arc(aes(x0=2, y0=5, r=2.5, start=0.64, end=1.65), size = 2) 
p <- p + geom_arc(aes(x0=2, y0=5, r=2.5, start=2.5, end=3.55), size = 2)  
p <- p + geom_arc(aes(x0=5, y0=5, r=2.5, start=4.63, end=5.65), size = 2)
p <- p + geom_arc(aes(x0=5, y0=5, r=2.5, start=2.73, end=3.8), size = 2)
p <- p + geom_arc(aes(x0=3.5, y0=2.5, r=2.5, start=0.39, end=1.5), size = 2)
p <- p + geom_arc(aes(x0=3.5, y0=2.5, r=2.5, start=4.8, end=5.9), size = 2)
p <- p + annotate(geom = "text", x = 1, y = 5.5, label = "activities", family="Times", size = 6, colour = "black") 
p <- p + annotate(geom = "text", x = 6, y = 5.8, label = "physical", family="Times", size = 6, colour = "black") 
p <- p + annotate(geom = "text", x = 6, y = 5.3, label = "attributes", family="Times", size = 6, colour = "black") 
p <- p + annotate(geom = "text", x = 3.5, y = 4.25, label = "places", family="Times", size = 6, colour = "black") 
p <- p + annotate(geom = "text", x = 3.5, y = 1.5, label = "conceptions", family="Times", size = 6, colour = "black") 
p <- p + theme_void()
p