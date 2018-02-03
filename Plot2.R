library(lubridate)
library(dplyr)
setwd("C:/Users/hrist499/AppData/Local/lxss/home/dankata/Coursera/DataScience/ExploratoryDataAnalysis/")
rawData <-read.csv("../household_power_consumption.txt",sep=";",na.strings = "?")
rd <- tbl_df(subset(rawData, Date %in% c("1/2/2007","2/2/2007")))
rd <- mutate(rd,dateTime = paste(Date,Time))
rd$dateTime <- dmy_hms(rd$dateTime)
str(rd)

png("Plot_2.png",height = 480,width = 480)
with(rd, plot(dateTime,Global_active_power,pch=20,type="l",ylab="Global Active Power (Kilowatts)"))
dev.off()

