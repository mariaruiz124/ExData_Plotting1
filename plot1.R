## Read data from file 
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
powercons <- read.csv("./data/household_power_consumption.txt", sep = ";", stringsAsFactors=F, 
                      na.strings = "?", 
                      colClasses = c("myDate", "character", rep("numeric",7)))

## Select data for dates 01/02/2007 and 02/02/2007
powercons2 <- subset(powercons, as.character(powercons$Date) %in% c("2007-02-01", "2007-02-02"))

## Create histogram
par(mfrow = c(1, 1), mar = c(5.1 4.1 4.1 2.1))
hist(powercons2$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

## Copy plot to a PNG file
dev.copy(png, file = "./ExData_Plotting1/plot1.png")  
dev.off()
