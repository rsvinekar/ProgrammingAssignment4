## Plot 4
library(lubridate)
if(file.exists("../household_power_consumption.txt")){
  hspower <- read.table("../household_power_consumption.txt",header=TRUE,sep=";")
} else {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  hspower <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE,sep=";" )
  unlink(temp)
}

## data is not in Git repo. It is one level above

from <- ymd("2007-02-01")
to <- ymd("2007-02-02")
hspower <- hspower[ymd(hspower$Date) %in% from:to,]
hspower[,3:9] <- lapply(hspower[,3:9],as.numeric)
hspower$datetime <- ymd_hms(paste(hspower[,1],hspower[,2]))

png("plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2,2), mar=c(5,4,2,1), oma = c(2,1,2,1))

## Top left
plot(hspower$datetime,
     hspower$Global_active_power, 
     type = "l", 
     xlab="",
     ylab="Global Active Power"
)

## Top right
plot(hspower$datetime,hspower$Voltage, type = "l", xlab="datetime",ylab="Voltage")

## Bottom left
plot(hspower$datetime,hspower$Sub_metering_1, type = "l", xlab="",ylab="Energy sub metering")
lines(hspower$datetime,hspower$Sub_metering_2,col = "red")
lines(hspower$datetime,hspower$Sub_metering_3,col = "blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lwd=2, box.lwd = 0
      )
## Bottom right
plot(hspower$datetime,hspower$Global_reactive_power, type = "l", xlab="datetime",ylab="Global_Reactive_Power")
dev.off()
