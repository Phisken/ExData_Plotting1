# load all Data
inputdata <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
# subset data only on the relevant dates
relevantdata <- subset(inputdata, Date == "1/2/2007" | Date == "2/2/2007")
relevantdata$DateAndTime <- strptime(paste(relevantdata$Date, relevantdata$Time), "%d/%m/%Y %H:%M:%S")

# open png device
png(filename = "plot4.png", width = 480, height = 480)

# create plot
par(mfrow= c(2,2))

plot(relevantdata$DateAndTime, relevantdata$Global_active_power, type = "n", xlab="", ylab = "Global Active Power")
lines(relevantdata$DateAndTime, relevantdata$Global_active_power)

plot(relevantdata$DateAndTime, relevantdata$Voltage, xlab="datetime", ylab = "Voltage", type = "n")
lines(relevantdata$DateAndTime, relevantdata$Voltage)

plot(relevantdata$DateAndTime, relevantdata$Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering")
lines(relevantdata$DateAndTime, relevantdata$Sub_metering_1)
lines(relevantdata$DateAndTime, relevantdata$Sub_metering_2, col = "red")
lines(relevantdata$DateAndTime, relevantdata$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(relevantdata$DateAndTime, relevantdata$Global_reactive_power, xlab="datetime", ylab = "Global_reactive_power", type = "n")
lines(relevantdata$DateAndTime, relevantdata$Global_reactive_power)

# close png device
dev.off()