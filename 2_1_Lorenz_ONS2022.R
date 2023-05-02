# Creating Community Health by Simon Lennane ISBN 9781032490045
# Fig 3.1 Lorenz curve, UK data
# https://www.ons.gov.uk/peoplepopulationandcommunity/personalandhouseholdfinances/incomeandwealth/bulletins/totalwealthingreatbritain/april2018tomarch2020

# this R code creates the image - run in RStudio

# download the data
data <- read.csv("https://www.ons.gov.uk/generator?uri=/peoplepopulationandcommunity/personalandhouseholdfinances/incomeandwealth/bulletins/totalwealthingreatbritain/april2018tomarch2020/79196ada&format=csv")

# you'll need to install these libraries once if not already installed
# run this line in console:
# for example # install.packages("ggplot2") 

# load necessary libraries
library(ggplot2)
library(dplyr)
library(svglite)
library(scales)
library(geomtextpath)
# library(pracma) # to calculate Gini

# tidy data
data <- rename(data, wealth = X)
data$wealth <- as.numeric(as.character(data$wealth ))
data <- data[7:105,]
data$percentile <- 1:nrow(data)

# small fudge needed to make graph go from 0 to 100
data <- data %>% add_row(wealth = 0, percentile = 0)
data <- data %>% add_row(wealth = 0, percentile = -1)
data$Figure.2..The.richest.1..of.households.had.wealth.of.more.than..3.6.million..least.wealthy.10..had..15.400.or.less <- NULL
data <- data %>% arrange(percentile)
data = mutate(data, centile = percentile + 1)

# find the straight line representing wealth equality
data = mutate(data, flat = centile * 3668200 / 99)

# this line finds maximum gap between Lorenz & equal wealth line
# data = mutate(data, diff = flat - wealth) # 79th percentile
# 2.108 times difference maximal at 79th centile = 47.44%


# change y axis to millions
data$wealth <- data$wealth / 1000000
data$flat <- data$flat / 1000000


# View(data)
# make graph:
p <- ggplot(data) 
p <- p + geom_line(data=data, aes(x=centile,y=flat), size=0.4, linetype=1) 
p <- p + geom_textpath(x = data$centile, y=data$flat, family="Times", size = 7, vjust = -0.2, text_smoothing = 80, text_only = TRUE, label="Equal wealth distribution")
p <- p + geom_area(aes(x=centile,y=flat), fill="#006060", alpha=0.2) 
p <- p + geom_line(data=data, aes(x=centile,y=wealth), size = 1, colour = "#008080") 
p <- p + geom_textpath(x = data$centile, y=data$wealth, family="Times", size = 7, vjust = -0.2, text_smoothing = 50, text_only = TRUE, label="Actual wealth distribution")
p <- p + geom_area(aes(x=centile,y=wealth), fill="#008080", alpha=0.4)
p <- p + labs(x = "Centile", y = "Wealth, £mn") 
p <- p + scale_x_continuous(breaks = seq(0, 100, 10)) 
p <- p + scale_y_continuous(labels = comma) 
p <- p + coord_cartesian(xlim = c(4.5,95.5)) # loses space either side of graph

# p <- p + ggtitle("Lorenz curve: UK total household wealth by percentile, 2018-20")
# set graph proportions to golden ratio 'cos it's pretty
p <- p + theme(aspect.ratio=2500000000000000 / 4045084971874737, panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank(), axis.ticks = element_blank(), axis.title.x = element_text(family="Times", size = 16), axis.title.y = element_text(family="Times", size = 16), axis.text = element_text(family="Times", size = 12))

# add annotations
# p <- p + annotate(geom = "text", x=47, y=2, family="Times", label="Wealth equality", size = 6, angle = 30, colour = "black") 
# p <- p + annotate(geom = "text", x=35, y=0.3, family="Times", label="Actual", size = 6, angle = 9, colour = "black") 
# p <- p + annotate(geom = "text", x=45, y=0.41, family="Times", label="wealth", size = 6, angle = 10.5, colour = "black") 
# p <- p + annotate(geom = "text", x=58, y=0.58, family="Times", label="distribution", size = 6, angle = 12, colour = "black") 

# p <- p + annotate(geom = "text", x=77, y=1.75, family="Times", label="Robin Hood index", size = 5, angle = 90, colour = "black")
# p <- p + annotate("segment", x = 79, xend = 79, y = 0.85, yend = 2.92, linetype=5, colour = "black", size=1, alpha=0.6)
# p <- p + annotate("segment", x = 79, xend = 79, y = 0, yend = 0.800000, linetype=2, colour = "black", size=1, alpha=0.6) 
# p <- p + annotate(geom = "text", x=65, y=1.500000, family="Times", label="A", size = 10, colour = "black") 
# p <- p + annotate(geom = "text", x=93, y=0.700000, family="Times", label="B", size = 10, colour = "black") 
# p <- p + annotate(geom = "text", x=25, y=3.500000, family="Times", label="Gini = A / (A + B)", size = 6, colour = "black")
# produce graph
p <- p + theme(panel.background = element_rect(fill = 'white', color = 'white')) # panel.grid.major.x = element_blank() , panel.grid.major.y = element_blank(), axis.ticks.x=element_blank(), axis.ticks.y=element_blank()
p






