## JHU Course 4, Week 1
## April 1, 2022
## Programming assignment for Exploratory Graphics
## save the plot as a png file

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

## plot 1
hist(yr2007$Global_active_power, col="red", 
     main="Histogram of Global Active Power 2007-02-01/02",
     xlab="Global active power")

dev.copy(png, "plot1.png")
png(filename="plot1.png", width = 480, height = 480)
dev.off()
