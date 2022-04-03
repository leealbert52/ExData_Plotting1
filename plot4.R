## Homework assignment Course 4 Week 1 - April 2, 2022 
## Exploratory Data Analysis and Graphics devices in R
## Base plotting system
# data.table is not working properly on Mac. Change a different way to read in data

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

############################################################
## plot 4, plot4.R and plot4.png
##subplot_1 Global_active_power vs Datetime
##subplot_2 Voltage vs Datetime
##subplot_3 Energy sub_metering vs Datetime
##subplot_4 Global_reactive_power vs Datetime

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(yr2007$Datetime, yr2007$Global_active_power, xlab= "", ylab="Global active power")
plot(yr2007$Datetime, yr2007$Voltage, xlab="Datetime", ylab="Voltage")

plot(yr2007$Datetime, yr2007$Sub_metering_1,type="l", col='black', lty = 1,pch=19,lwd=1, xlab="", ylab="Energy sub metering")
lines(yr2007$Datetime, yr2007$Sub_metering_2, col='red', lty = 1, pch=19, lwd=1, xlab="", ylab="")
lines(yr2007$Datetime, yr2007$Sub_metering_3, col='blue', type = "b", lty = 1, pch=19, lwd=1, xlab="", ylab="")
legend("topright", 
       pch = c(1,2,3), 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(yr2007$Datetime, yr2007$Global_reactive_power, xlab="Datetime", ylab="Global reactive power")


##copy plot to a png file
dev.copy(png, "plot4.png")
png(filename = "plot4.png", width = 480, height = 480)
dev.off()

#on Mac it is a pdf first.  Export it and save for .png format