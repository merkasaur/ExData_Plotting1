householdpower <- "~/desktop/Data Science/Coursera/John Hopkins - R Programming/Exploratory Data Analysis/Week One/household_power_consumption.txt"
data <- read.table(householdpower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2007 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(data2007$Date, data2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data2007$Global_active_power)
subMetering1 <- as.numeric(data2007$Sub_metering_1)
subMetering2 <- as.numeric(data2007$Sub_metering_2)
subMetering3 <- as.numeric(data2007$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()