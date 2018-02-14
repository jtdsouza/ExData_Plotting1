##Read Data File from Current Working Directory
rawdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE,na.strings="?")

## Type Date, Time , & relevantNumeric columns
dataset<-rawdata
dataset$Time<-paste(rawdata$Date,rawdata$Time,sep=" ")
dataset$Time<-strptime(dataset$Time,format="%d/%m/%Y %H:%M:%S")
dataset$Sub_metering_1<-as.numeric(rawdata$Sub_metering_1)
dataset$Sub_metering_2<-as.numeric(rawdata$Sub_metering_2)
dataset$Sub_metering_3<-as.numeric(rawdata$Sub_metering_3)
dataset$Date<-as.Date(rawdata$Date, format="%d/%m/%Y")

##Get relevant subset for plotting
plotdata<-subset(dataset,Date=="2007-02-01"|Date=="2007-02-02")

##Plot to png file in Current Working Directory
png("plot3.png")
plot(plotdata$Time,plotdata$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
points(plotdata$Time,plotdata$Sub_metering_2,type="l",col="red")
points(plotdata$Time,plotdata$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=1)
dev.off()
