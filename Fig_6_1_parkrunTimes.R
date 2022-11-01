parkrunFinishTimes <- read.csv("~/parkrunFinishTimes.csv")
# View(parkrunFinishTimes)

library(tufte)
library(ggplot2)
library(dplyr)
library(stargazer)
library(scales)
library(viridis)
library(stringr)
library(lubridate)
parkrunFinishTimes$finish <- str_sub(parkrunFinishTimes$Finish.time, end=-3)
# str(parkrunFinishTimes)
parkrunFinishTimes$seconds <- as.numeric(as.period(ms(parkrunFinishTimes$finish), unit = "sec"))

p <- ggplot(parkrunFinishTimes, aes(x=Year, y=seconds, width=0.8)) 
p <- p + geom_bar(stat="identity", position=position_dodge(), colour="#008080", fill="#008080", alpha = 0.3) 
p <- p + geom_text(aes(label = finish), vjust = 0.5, hjust = 1.5, size = 6, angle = 90, colour = "black", family = "Times") 
p <- p + labs(y = "Finishing time", x = "Year")
p <- p + theme(text = element_text(family = "Times", size = 20), axis.ticks.y = element_blank(), axis.text.y = element_blank(), panel.grid.major = element_blank(),panel.grid.minor = element_blank(), panel.background = element_blank())
p


