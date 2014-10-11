# read data
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# get data from 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

# export to png
png(filename = 'plot1.png', width = 480, height = 480)

# base graph
hist(data$Global_active_power[!is.na(data$Global_active_power)], breaks=16, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)', axes=FALSE, xlim=c(0, 8))

# custom x-axis
axis(1, c(0, 2, 4, 6))

# custom y-axis
axis(2, c(0, 200, 400, 600, 800, 1000, 1200))

# close graphics device
dev.off()