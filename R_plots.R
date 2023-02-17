## ----setup, include=FALSE-------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## -------------------------------------------------------------------------------------------
hspower <- read.table("../household_power_consumption.txt",header = TRUE, sep = ";")


## -------------------------------------------------------------------------------------------
str(hspower)


## -------------------------------------------------------------------------------------------
library(lubridate)
## We will use lubridate functions
## Convert all columns 3 to 9 to numeric
hspower$Date <- dmy(hspower$Date)


## -------------------------------------------------------------------------------------------
str(hspower) ## Check up


## -------------------------------------------------------------------------------------------
from <- ymd("2007-02-01")
to <- ymd("2007-02-02")
hspower <- hspower[hspower$Date %in% from:to,]


## -------------------------------------------------------------------------------------------
dim(hspower) ## Checkup


## -------------------------------------------------------------------------------------------
hspower[,3:9]<- lapply(hspower[,3:9],as.numeric)
hspower$datetime <- ymd_hms(paste(hspower[,1],hspower[,2]))

## -------------------------------------------------------------------------------------------
str(hspower) ## Checkup


## -------------------------------------------------------------------------------------------
hist(hspower$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


## -------------------------------------------------------------------------------------------
plot(hspower$datetime,hspower$Global_active_power, type = "l", xlab="",ylab="Global Active Power (kilowatts)")


## -------------------------------------------------------------------------------------------
plot(hspower$datetime,hspower$Sub_metering_1, type = "l", xlab="",ylab="Energy sub metering")
lines(hspower$datetime,hspower$Sub_metering_2,col = "red")
lines(hspower$datetime,hspower$Sub_metering_3,col = "blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=2, box.lwd=0)


## -------------------------------------------------------------------------------------------
plot(hspower$datetime,hspower$Voltage, type = "l", xlab="datetime",ylab="Voltage")


## -------------------------------------------------------------------------------------------
plot(hspower$datetime,hspower$Global_reactive_power, type = "l", xlab="datetime",ylab="Global_Reactive_Power")


## -------------------------------------------------------------------------------------------
par(mfrow = c(2,2), mar=c(4,4,0,2))

plot(hspower$datetime,hspower$Global_active_power, type = "l", xlab="",ylab="Global Active Power")

plot(hspower$datetime,hspower$Voltage, type = "l", xlab="datetime",ylab="Voltage")

plot(hspower$datetime,hspower$Sub_metering_1, type = "l", xlab="",ylab="Energy sub metering")
lines(hspower$datetime,hspower$Sub_metering_2,col = "red")
lines(hspower$datetime,hspower$Sub_metering_3,col = "blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=2, box.lwd = 0)

plot(hspower$datetime,hspower$Global_reactive_power, type = "l", xlab="datetime",ylab="Global_Reactive_Power")


