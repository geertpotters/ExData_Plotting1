setwd("C:/R_exerc/explo")
Sys.setlocale("LC_TIME", "C")
power<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
power$Date<-paste(power$Date, power$Time, sep=" ")
power$Date<-strptime(power$Date, format="%d/%m/%Y %H:%M:%S")
i<-strptime("2007-02-01 00:00:01", format="%Y-%m-%d %H:%M:%S")
j<-strptime("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")
power2<-subset(power, power$Date>i)
power3<-subset(power2, power2$Date<j)
png(file="plot4.png")

par(mfrow=c(2,2))

plot(power3$Date,power3$Global_active_power, 
     type="l", main="", xlab="", ylab="Global active power (kilowatts)")

plot(power3$Date,power3$Voltage, 
     type="l", main="", xlab="datatime", ylab="Voltage")

plot(power3$Date,power3$Sub_metering_1, 
     type="l", main="", xlab="", ylab="Energy sub metering", col=1)
lines(power3$Date,power3$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering",col=2)
lines(power3$Date,power3$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering",col=4)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1))

plot(power3$Date,power3$Global_reactive_power, 
     type="l", main="", xlab="datatime", ylab="Global_reactive_power (kilowatts)")

dev.off()