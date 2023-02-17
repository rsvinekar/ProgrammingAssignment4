library(lubridate)
if(!file.exists("data.txt")){
  source("Data_setup.R")
}
hspower<-read.table("data.txt",header=TRUE,sep=";")
hspower[,3:9]<- lapply(hspower[,3:9],as.numeric)
hspower$datetime <- dmy_hms(paste(hspower[,1],hspower[,2]))
