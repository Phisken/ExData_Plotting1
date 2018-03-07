# load all Data
inputdata <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
# subset data only on the relevant dates
relevantdata <- subset(inputdata, Date == "1/2/2007" | Date == "2/2/2007")
relevantdata$DateAndTime <- strptime(paste(relevantdata$Date, relevantdata$Time), "%d/%m/%Y %H:%M:%S")

# open png device
png(filename = "plot2.png", width = 480, height = 480)

# create plot
plot(relevantdata$DateAndTime, relevantdata$Global_active_power, type = "n", xlab="", ylab = "Global Active Power (kilowatts)")
lines(relevantdata$DateAndTime, relevantdata$Global_active_power)

# close png device
dev.off()