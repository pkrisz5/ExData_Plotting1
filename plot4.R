library(dplyr)
library(lubridate)
d<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
d$date_time<-paste(d$Date, d$Time)
d$date_time<-strptime(d$date_time, format="%d/%m/%Y %H:%M:%S")
d$Date<-as.Date(d$Date,"%d/%m/%Y" )
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
x<-d[d$Date=="2007-02-01" | d$Date=="2007-02-02",]
x<-x[wday(x$Date)==5|wday(x$Date)==6 |wday(x$Date)==7,]
Sys.setlocale("LC_TIME", "English")
plot(x$date_time, x$Global_active_power, type='l', ylab = "Global Active Power", xlab='')

plot(x$date_time, x$Sub_metering_1 , type='l', ylab = "Energy sub metering", xlab='')
lines(x$date_time, x$Sub_metering_2, col="red")
lines(x$date_time, x$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(x$date_time, x$Voltage, type='l', ylab = "Voltage", xlab='datetime')

plot(x$date_time, x$Global_reactive_power, type='l', ylab = "Global_reactive_power", xlab='datetime')
dev.off()
