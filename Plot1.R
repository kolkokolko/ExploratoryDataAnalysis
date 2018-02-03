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
png("Plot_1.png",height = 480,width = 480)
with(rd,histogram(Global_active_power ,col="red",type="count",xlab="Global Active Power (Kilowatts)",ylab="Frequency",
                  main="Global Active Power"))
dev.off()

