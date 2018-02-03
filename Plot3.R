# add libraries
library(lubridate)
library(dplyr)

#set working dir
setwd("C:/Users/hrist499/AppData/Local/lxss/home/dankata/Coursera/DataScience/ExploratoryDataAnalysis/")

#read file 
rawData <-read.csv("../household_power_consumption.txt",sep=";",na.strings = "?")


#Subset the required dates and convert the date time to posix
rd <- tbl_df(subset(rawData, Date %in% c("1/2/2007","2/2/2007")))
rd <- mutate(rd,dateTime = paste(Date,Time))
rd$dateTime <- dmy_hms(rd$dateTime)
str(rd)

#Create Plot
png("Plot_3.png",height = 480,width = 480)
with(rd, plot(dateTime,Sub_metering_1,pch=20,type="l", ylab = "Energy Sub Metering"))
points(rd$dateTime,rd$Sub_metering_2, col="red", type="l")
points(rd$dateTime,rd$Sub_metering_3, col="blue", type="l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),pch = c(151,151,151))
dev.off()

