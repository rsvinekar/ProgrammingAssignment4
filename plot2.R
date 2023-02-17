source("Data_read.R")
png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(hspower$datetime,
     hspower$Global_active_power, 
     type = "l", 
     xlab="",
     ylab="Global Active Power (kilowatts)"
     )
dev.off()
