## Plot 3
source("Data_read.R")
png("plot3.png", width = 480, height = 480, bg = "transparent")

plot(hspower$datetime,
     hspower$Sub_metering_1, 
     type = "l", 
     xlab="",
     ylab="Energy sub metering"
     )
lines(hspower$datetime,hspower$Sub_metering_2,col = "red")
lines(hspower$datetime,hspower$Sub_metering_3,col = "blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), 
       lwd=2, box.lwd=0
       )
dev.off()
