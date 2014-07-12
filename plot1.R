setwd("C:/R_exerc/explo")
power<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
power$Date<-strptime(power$Date, format="%d/%m/%Y")
i<-strptime("2007-02-01", format="%Y-%m-%d")
j<-strptime("2007-02-02", format="%Y-%m-%d")
power<-power[power$Date==i | power$Date==j,]
head(power)
hist(power$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global active power (kilowatts)")
png(file="plot1.png")
with(power, hist(power$Global_active_power, col="red", main="Global Active Power", 
                 xlab="Global active power (kilowatts)"))
dev.off()
