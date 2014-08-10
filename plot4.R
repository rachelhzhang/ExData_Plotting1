## Read in data

file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- file
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- rbind(data[data$Date == "2007-02-01",],data[data$Date == "2007-02-02",])
data$Time <- strptime(data$Time, format = "%T")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

## Create plots
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
## Plot 1
plot(data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
## Plot 2
plot(data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
## Plot 3
plot(data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$Sub_metering_2,type = "l", col = "red")
lines(data$Sub_metering_3,type = "l", col = "blue")
legend("topright", pch = "_", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
##Plot 4
plot(data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()