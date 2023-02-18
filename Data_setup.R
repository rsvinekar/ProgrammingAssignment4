library(lubridate)
if(file.exists("../household_power_consumption.txt")){
  hspower<-read.table("../household_power_consumption.txt",header=TRUE,sep=";")
} else {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  data <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE,sep=";" )
  unlink(temp)
}
## data is not in Git repo. It is one level above

from <- ymd("2007-02-01")
to <- ymd("2007-02-02")
hspower <- hspower[dmy(hspower$Date) %in% from:to,]
write.table(hspower,col.names=TRUE,row.names=FALSE,sep=";",quote=FALSE,file="data.txt")