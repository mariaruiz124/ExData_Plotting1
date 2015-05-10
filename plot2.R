## Read data from file 
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
powercons <- read.csv("./data/household_power_consumption.txt", sep = ";", stringsAsFactors=F, 
                      na.strings = "?", 
                      colClasses = c("myDate", "character", rep("numeric",7)))

## Select data only for dates 01/02/2007 and 02/02/2007
powercons2 <- subset(powercons, as.character(powercons$Date) %in% c("2007-02-01", "2007-02-02"))

## Add a new column combining Date and Time
powercons2$DateTime <- strptime(paste(as.character(powercons2$Date), powercons2$Time),"%Y-%m-%d %H:%M:%S")
 
## Create plot
with(powercons2, plot(DateTime, Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)"))

## Copy plot to a PNG file
dev.copy(png, file = "./ExData_Plotting1/plot2.png")  
dev.off()