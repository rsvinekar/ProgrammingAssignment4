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
hspower <- hspower[dmy(hspower$Date) %in% from:to,]
hspower[,3:9] <- lapply(hspower[,3:9],as.numeric)
hspower$datetime <- ymd_hms(paste(hspower[,1],hspower[,2]))

png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(hspower$datetime,
     hspower$Global_active_power, 
     type = "l", 
     xlab="",
     ylab="Global Active Power (kilowatts)"
     )
dev.off()
