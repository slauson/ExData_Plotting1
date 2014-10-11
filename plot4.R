# read data
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# get data from 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

# get times
times <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')

# export to png
png(filename = 'plot4.png', width = 480, height = 480)

# configure 2 rows, 2 columns of graphs
par(mfrow = c(2, 2))

# first graph (Global Active Power)
plot(times, data$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

# second graph (Voltage)
plot(times, data$Voltage, type='l', xlab='datetime', ylab='Voltage', yaxt = 'n')
box()
axis(2, at = seq(234, 246, 2), label = FALSE, tick = TRUE)
axis(2, at = seq(234, 246, 4), label = TRUE, tick = TRUE)

# third graph (Engergy sub metering)
plot(times, data$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(times, data$Sub_metering_2, col='red')
lines(times, data$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'), bty = 'n')

# fourth graph (Global reactive power)
plot(times, data$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

# close graphics device
dev.off()