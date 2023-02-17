## Plot 4
source("Data_read.R")
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
