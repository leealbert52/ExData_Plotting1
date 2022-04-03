## Homework assignment Course 4 Week 1 - April 2, 2022 
## Exploratory Data Analysis and Graphics devices in R
## Base plotting system

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
  
# 2880 X 13
dim(power)

###########################################################
## plot 3 plot3.R and plot3.png overlay
## Energy sub_metering vs. datetime  

par(oma=c(4,4,0,0))
plot(yr2007$Datetime, yr2007$Sub_metering_1,type="l", col='black', lty = 1,pch=19,lwd=1, xlab="", ylab="")
lines(yr2007$Datetime, yr2007$Sub_metering_2, col='red', lty = 1, pch=19, lwd=1, xlab="", ylab="")
lines(yr2007$Datetime, yr2007$Sub_metering_3, col='blue', type = "b", lty = 1, pch=19, lwd=1, xlab="", ylab="")

legend("topright", 
       pch = c(1,2,3), 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

mtext(text="Energy sub metering", side=2, line=0, outer=TRUE)

##copy plot to a png file
dev.copy(png, "plot3.png")
png(filename = "plot3.png", width = 480, height = 480)
dev.off()

## now .png file is created, working fine now