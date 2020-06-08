library(dplyr)
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
plotdata<-data%>%filter(Date=="1/2/2007"|Date=="2/2/2007")

date<-paste(plotdata$Date,plotdata$Time,sep=" ")
time<-strptime(date,"%d/%m/%Y %H:%M:%S")
plotdata$Sub_metering_1<-as.numeric(plotdata$Sub_metering_1)
plotdata$Sub_metering_2<-as.numeric(plotdata$Sub_metering_2)
plotdata$Sub_metering_3<-as.numeric(plotdata$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(time,plotdata$Sub_metering_1,
     type="l",
     xlab="",ylab="Energy sub metering"
)
lines(time,plotdata$Sub_metering_2,col="red")
lines(time,plotdata$Sub_metering_3,col="blue")
legend("topright",lty=1,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )
dev.off()