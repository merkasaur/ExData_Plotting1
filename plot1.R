Householdpower <- "~/Desktop/Data Science/Coursera/John Hopkins - R Programming/Exploratory Data Analysis/Week One/household_power_consumption.txt"
data <- read.table(Householdpower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2007 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
GAP <- as.numeric(data2007$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
