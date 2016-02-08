Plot1 <- function ()
{

byDate = getData()

png("plot1.png", width=480, height=480)
hist(as.numeric(byDate$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")


dev.off()

}

getData <- function() {
  
  dataFile <- "./data/household_power_consumption.txt"
  usage <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)
  byDate <- subset(usage, usage$Date %in% c("1/2/2007","2/2/2007"))
  byDate
  
}