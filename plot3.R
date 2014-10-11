# read data
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# get data from 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

# get times
times <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')

# export to png
png(filename = 'plot3.png', width = 480, height = 480)

# base graph
plot(times, data$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')

# second line
lines(times, data$Sub_metering_2, col='red')

# third line
lines(times, data$Sub_metering_3, col='blue')

# legend
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'))

# close graphics device
dev.off()