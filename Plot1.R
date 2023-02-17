## Plot 1
source("Data_read.R")
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(hspower$Global_active_power, 
     col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power"
)
dev.off()