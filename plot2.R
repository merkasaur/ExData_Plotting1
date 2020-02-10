householdpower <- "~/Desktop/Data Science/Coursera/John Hopkins - R Programming/Exploratory Data Analysis/Week One/household_power_consumption.txt"
data <- read.table(householdpower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2007 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(data2007$Date, data2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data2007$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()