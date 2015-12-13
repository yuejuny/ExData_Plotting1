library(data.table)

power.consum <- fread('household_power_consumption.txt', sep=';',
                      colClasses = c(rep('character', 9)),
                      na.strings = '?')
Date <- as.Date(power.consum$Date, '%e/%m/%Y')
idx <- Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02')
Feb.2007 <- power.consum[idx, ]
Time <- strptime(paste(Feb.2007$Date, Feb.2007$Time), '%e/%m/%Y %H:%M:%S')
png(filename = 'plot2.png', width = 480, height = 480, units='px')
plot(Time, as.numeric(Feb.2007$Global_active_power), type='l',
     ylab='Global Active Power (kilowatts)')
dev.off()
