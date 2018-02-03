library(lubridate)
library(dplyr)
setwd("C:/Users/hrist499/AppData/Local/lxss/home/dankata/Coursera/DataScience/ExploratoryDataAnalysis/")
rawData <-read.csv("../household_power_consumption.txt",sep=";",na.strings = "?")
rd <- tbl_df(subset(rawData, Date %in% c("1/2/2007","2/2/2007")))
rd <- mutate(rd,dateTime = paste(Date,Time))
rd$dateTime <- dmy_hms(rd$dateTime)
str(rd)

png("Plot_4.png",height = 480,width = 480)
par(mfcol=c(2,2))
#####top left graph
with(rd, plot(dateTime,Global_active_power,pch=20,type="l",xlab="",ylab="Global Active Power (Kilowatts)"))
#####bottom left graph
with(rd, plot(dateTime,Sub_metering_1,pch=20,type="l", ylab = "Energy Sub Metering",xlab = ""))
points(rd$dateTime,rd$Sub_metering_2, col="red", type="l")
points(rd$dateTime,rd$Sub_metering_3, col="blue", type="l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),pch = c(151,151,151))
#topRight graph
with(rd,plot(dateTime,Voltage,type="l"))
#bottom right graph
with(rd,plot(dateTime,Global_reactive_power,type="l"))
dev.off()

