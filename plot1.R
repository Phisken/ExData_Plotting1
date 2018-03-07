# load all Data
inputdata <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
# subset data only on the relevant dates
relevantdata <- subset(inputdata, Date == "1/2/2007" | Date == "2/2/2007")

# open png device
png(filename = "plot1.png", width = 480, height = 480)

# create plot
hist(relevantdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# close png device
dev.off()
