# read data
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# get data from 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

# get times
times <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')

# export to png
png(filename = 'plot2.png', width = 480, height = 480)

# base graph
plot(times, data$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

# close graphics device
dev.off()