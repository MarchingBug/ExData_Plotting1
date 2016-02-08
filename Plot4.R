Plot4 <- function ()
{

byDate = getData()

dateTimes <- strptime(paste(byDate$Date, byDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
powerValues <- as.numeric(byDate$Global_active_power)
reactiveValues <- as.numeric(byDate$Global_reactive_power)
voltage <- as.numeric(byDate$Voltage)

sb1  <- as.numeric(byDate$Sub_metering_1)
sb2  <- as.numeric(byDate$Sub_metering_2)
sb3  <- as.numeric(byDate$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

##First Row, First Column
plot(dateTimes, powerValues, type="l", xlab="", ylab="Global Active Power")

##First Row, Second Column
plot(dateTimes, voltage, type="l", xlab="datetime", ylab="Voltage")


##Second row, first Column
plot(dateTimes, sb1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTimes, sb2, type="l", col="red")
lines(dateTimes, sb3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Second row, second column
plot(dateTimes, reactiveValues, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

}

getData <- function() {
  
  dataFile <- "./data/household_power_consumption.txt"
  usage <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)
  byDate <- subset(usage, usage$Date %in% c("1/2/2007","2/2/2007"))
  byDate
  
}