##Plot 3
##load data file -- subset to only load data from the dates 2007-02-01 and 2007-02-02
library(dplyr)
filename <- "I:/Data Science Certification/4_Exploratory_Data_Analysis/Project1/household_power_consumption.txt"
ds <- read.table(filename, header=TRUE, sep=";", na.strings="?")
data <- filter(ds, Date == "1/2/2007" | Date == "2/2/2007")

##create date/time class
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##convert date values to Date types
data$Date <- as.Date(data$Date, format="%m/%d/%Y")
##convert char values to numeric values
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

##Create Plot 3
png(filename="plot3.png", width=480, height=480)
plot(DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DateTime, data$Sub_metering_2, type="l", col="red")
lines(DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()