library(data.table)

power.consum <- fread('household_power_consumption.txt', sep=';',
                      colClasses = c(rep('character', 9)),
                      na.strings = '?')
Date <- as.Date(power.consum$Date, '%e/%m/%Y')
idx <- Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02')
Feb.2007 <- power.consum[idx, ]
Time <- strptime(paste(Feb.2007$Date, Feb.2007$Time), '%e/%m/%Y %H:%M:%S')
png(filename = 'plot4.png', width = 480, height = 480, units='px')
split.screen(c(2,2))
screen(1)
plot(Time, as.numeric(Feb.2007$Global_active_power),
     main = '', ylab = 'Global Active Power', type = 'l')
screen(2)
plot(Time, as.numeric(Feb.2007$Voltage),
     main = '', ylab = 'Voltage', 
     xlab = 'datetime', type = 'l')
screen(3)
plot(Time, as.numeric(Feb.2007$Sub_metering_1), type='l',
     ylab='Engergy sub metering',
     col = 'black')
lines(Time, as.numeric(Feb.2007$Sub_metering_2),
      col = 'red')
lines(Time, as.numeric(Feb.2007$Sub_metering_3),
      col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black','red','blue'),lty = 1, cex = 0.6)
screen(4)
plot(Time, as.numeric(Feb.2007$Global_reactive_power), type = 'l',
     main = '', xlab = 'datetime', ylab = 'Global_reactive_power',
     cex.axis = 0.6)
dev.off()
