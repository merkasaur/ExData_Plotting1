householdpower <- "~/desktop/Data Science/Coursera/John Hopkins - R Programming/Exploratory Data Analysis/Week One/household_power_consumption.txt"
data <- read.table(householdpower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2007 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(data2007$Date, data2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data2007$Global_active_power)
GRP <- as.numeric(data2007$Global_reactive_power)
voltage <- as.numeric(data2007$Voltage)
subMetering1 <- as.numeric(data2007$Sub_metering_1)
subMetering2 <- as.numeric(data2007$Sub_metering_2)
subMetering3 <- as.numeric(data2007$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()