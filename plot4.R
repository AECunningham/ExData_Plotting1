# NB - File is assumed to be already downloaded to the working directory. (Instructions say to 'include code for reading the data'.)

# Read the data
powerdata <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?",stringsAsFactors = FALSE)

# Create subset of data for 1/2/07 and 2/2/07 only
powerdata$DateDate <- as.Date(powerdata$Date,format='%d/%m/%Y')
startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")
febdata <- powerdata[which(powerdata$DateDate >= startdate & powerdata$DateDate <= enddate),]

# Create new 'DateTime' field which combines the date and time for observations on those two days
febdata$DateTime <- strptime(paste(febdata$Date,febdata$Time), "%d/%m/%Y %H:%M:%S")

# Draw the four charts
png("plot4.png")
par(mfrow=c(2,2))
# Chart 1
plot(febdata$DateTime,febdata$Global_active_power,type="l",xlab = "",ylab = "Global Active Power")
# Chart 2
plot(febdata$DateTime,febdata$Voltage,type="l",xlab = "datetime",ylab = "Voltage")
# Chart 3
plot(febdata$DateTime,febdata$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
lines(febdata$DateTime,febdata$Sub_metering_2,col="red")
lines(febdata$DateTime,febdata$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = c(1,1,1),bty="n")
# Chart 4
plot(febdata$DateTime,febdata$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()