##Read Data File from Current Working Directory
rawdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE,na.strings="?")

## Type Date, Time , & relevantNumeric columns
dataset<-rawdata
dataset$Time<-paste(rawdata$Date,rawdata$Time,sep=" ")
dataset$Time<-strptime(dataset$Time,format="%d/%m/%Y %H:%M:%S")
dataset$Global_active_power<-as.numeric(rawdata$Global_active_power)
dataset$Date<-as.Date(rawdata$Date, format="%d/%m/%Y")

##Get relevant subset for plotting
plotdata<-subset(dataset,Date=="2007-02-01"|Date=="2007-02-02")

##Plot to png file in Current Working Directory
png("plot1.png")
hist((plotdata$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

