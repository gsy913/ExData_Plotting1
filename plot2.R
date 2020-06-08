library(dplyr)
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
plotdata<-data%>%filter(Date=="1/2/2007"|Date=="2/2/2007")

date<-paste(plotdata$Date,plotdata$Time,sep=" ")
time<-strptime(date,"%d/%m/%Y %H:%M:%S")
plotdata$Global_active_power<-as.numeric(plotdata$Global_active_power)
png("plot2.png",width=480,height=480)
plot(time,plotdata$Global_active_power,
     type="l",
     xlab="",ylab="Global Active Power (kilowatts)"
     )
dev.off()