library(dplyr)
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
plotdata<-data%>%filter(Date=="1/2/2007"|Date=="2/2/2007")

date<-paste(plotdata$Date,plotdata$Time,sep=" ")
time<-strptime(date,"%d/%m/%Y %H:%M:%S")
plotdata$Global_active_power<-as.numeric(plotdata$Global_active_power)
plotdata$Voltage<-as.numeric(plotdata$Voltage)
plotdata$Global_reactive_power<-as.numeric(plotdata$Global_reactive_power)
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))
plot(time,plotdata$Global_active_power,
     type="l",
     xlab="",ylab="Global Active Power (kilowatts)"
)
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
plot(time,plotdata$Voltage,
     type="l",
     xlab="datetime",ylab="Voltage"
)
plot(time,plotdata$Global_reactive_power,
     type="l",
     xlab="datetime",ylab="Global_reactive_power"
)
dev.off()