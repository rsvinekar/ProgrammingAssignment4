library(lubridate)

hspower<-read.table("../household_power_consumption.txt",header=TRUE,sep=";")
## data is not in Git repo. It is one level above
#hspower$Date <- dmy(hspower$Date)
from <- ymd("2007-02-01")
to <- ymd("2007-02-02")
hspower <- hspower[dmy(hspower$Date) %in% from:to,]
#hspower[,3:9]<- lapply(hspower[,3:9],as.numeric)
#hspower$datetime <- dmy_hms(paste(hspower[,1],hspower[,2]))
write.table(hspower,col.names=TRUE,row.names=FALSE,sep=";",quote=FALSE,file="data.txt")