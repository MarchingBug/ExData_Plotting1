Plot2 <- function ()
{

byDate = getData()


dateTimes <- strptime(paste(byDate$Date, byDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
powerValues <- as.numeric(byDate$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTimes, powerValues, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

}

getData <- function() {
  
  dataFile <- "./data/household_power_consumption.txt"
  usage <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)
  byDate <- subset(usage, usage$Date %in% c("1/2/2007","2/2/2007"))
  byDate
  
}