#read the data
data <- read.table("household_power_consumption.txt", sep = ";", header=T, na.strings="?")
#subset the data for the deisred dates
subdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(file="plot1.png")

hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "RED")



dev.off()