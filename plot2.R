library(dplyr)
library(lubridate)
d<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
d$date_time<-paste(d$Date, d$Time)
d$date_time<-strptime(d$date_time, format="%d/%m/%Y %H:%M:%S")
d$Date<-as.Date(d$Date,"%d/%m/%Y" )
x<-d[d$Date=="2007-02-01" | d$Date=="2007-02-02",]
x<-x[wday(x$Date)==5|wday(x$Date)==6 |wday(x$Date)==7,]
Sys.setlocale("LC_TIME", "English")
png(filename = "plot2.png", width = 480, height = 480)
plot(x$date_time, x$Global_active_power, type='l', ylab = "Global Active Power (kilowatts)", xlab='')
dev.off()
