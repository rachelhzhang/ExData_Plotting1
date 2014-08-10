## Read in data

file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- file
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- rbind(data[data$Date == "2007-02-01",],data[data$Date == "2007-02-02",])
data$Time <- strptime(data$Time, format = "%T")

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

## Create plot
png(file = "plot3.png", width = 480, height = 480)
plot(data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$Sub_metering_2,type = "l", col = "red")
lines(data$Sub_metering_3,type = "l", col = "blue")
legend("topright", pch = "_", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()