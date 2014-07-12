setwd("C:/R_exerc/explo")
power<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
power$Date<-paste(power$Date, power$Time, sep=" ")
power$Date<-strptime(power$Date, format="%d/%m/%Y %H:%M:%S")
i<-strptime("2007-02-01 00:00:01", format="%Y-%m-%d %H:%M:%S")
j<-strptime("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")
power2<-subset(power, power$Date>i)
power3<-subset(power2, power2$Date<j)
png(file="plot2.png")
with(power3, plot(power3$Date,power3$Global_active_power, 
                  type="l", main="", xlab="", ylab="Global active power (kilowatts)"))
dev.off()

