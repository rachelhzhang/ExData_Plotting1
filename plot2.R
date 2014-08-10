## Read in data

file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- file
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- rbind(data[data$Date == "2007-02-01",],data[data$Date == "2007-02-02",])
data$Time <- strptime(data$Time, format = "%T")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

## Create plot and copy to png file
png(file = "plot2.png", width = 480, height = 480)
plot(data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()