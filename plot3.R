#read the data
data <- read.table("household_power_consumption.txt", sep = ";", header=T, na.strings="?")
#subset the data for the deisred dates
subdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(file="plot3.png")

#plot Global Active power over time
plot(strptime(paste(subdata$Date,subdata$Time), format = "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "s")
points(strptime(paste(subdata$Date,subdata$Time), format = "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_2, type = "s", col = "red")
points(strptime(paste(subdata$Date,subdata$Time), format = "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_3, type = "s", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col=c("black", "red", "blue"))

dev.off()