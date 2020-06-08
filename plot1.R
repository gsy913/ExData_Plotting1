library(dplyr)
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
plotdata<-data%>%filter(Date=="1/2/2007"|Date=="2/2/2007")

plotdata$Global_active_power<-as.numeric(plotdata$Global_active_power)
png("plot1.png",width=480,height=480)
hist(plotdata$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylim=c(0,1200),
     main="Global Active Power")
dev.off()

