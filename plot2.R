## JHU Course 4, Week 1, April 2, 2022
## Programming assignment for Exploratory Graphics
## save the plot as a png file
## dlpyr was not working well, change to a different way to access the data 

## load library
library(data.table)
library(lubridate)
library(dplyr)

# getwd() =='~/R_exercise/Coursera/Course4/'

power <- read.csv("household_power_consumption.txt", sep = ';', na.strings="?")

#str(power)

power$Year = year(as.Date(power$Date, "%d/%m/%Y")) 
power$Month = month(as.Date(power$Date, "%d/%m/%Y")) 
power$Day = mday(as.Date(power$Date, "%d/%m/%Y")) 

yr2007 = power[(power$Year == 2007 & power$Month == 2 & power$Day %in% c(1,2)),]

yr2007$Datetime <- as.POSIXct(paste(yr2007$Date, yr2007$Time), format = "%d/%m/%Y %H:%M:%S") 

#dim 2880 x 13
dim(yr2007)

############################################################
## plot 2 : 2007-02-01 is Thursday, 2007-02-02 is Friday 
## Global_active_power vs Datetime

plot(yr2007$Datetime, yr2007$Global_active_power, xlab="Datetime", ylab="Global active power")
lines(yr2007$Datetime, yr2007$Global_active_power, lty = 1)

dev.copy(png, "plot2.png")
png(filename="plot2.png", width=480, height=480)
dev.off()

