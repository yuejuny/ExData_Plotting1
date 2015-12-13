library(data.table)

power.consum <- fread('household_power_consumption.txt', sep=';',
                      colClasses = c(rep('character', 9)),
                      na.strings = '?')

Date <- as.Date(power.consum$Date, '%e/%m/%Y' )
idx <- Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02')
Feb.2007 <- power.consum[idx, ]
png(filename = 'plot1.png', width = 480, height = 480, units='px')
hist(as.numeric(Feb.2007$Global_active_power),
     main = 'Global Active Power',
     xlab='Global Active Power (kilowatts)',
     col='red')
dev.off()
