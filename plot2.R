#download data if needed

if (!file.exists("./household_power_consumption.txt")) {
  if (!file.exists("./exdata%2Fdata%2Fhousehold_power_consumption.zip")) {
    fURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fURL,destfile="exdata%2Fdata%2Fhousehold_power_consumption.zip")
  }
  unzip("./exdata%2Fdata%2Fhousehold_power_consumption.zip")
}


#read the data
data <- read.table("household_power_consumption.txt", sep = ";", header=T, na.strings="?")
#subset the data for the deisred dates
subdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png(file="plot2.png")

#plot Global Active power over time
plot(strptime(paste(subdata$Date,subdata$Time), format = "%d/%m/%Y %H:%M:%S"), subdata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")


#turn off device
dev.off()