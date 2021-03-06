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

# Draw the chart
png("plot3.png")
plot(febdata$DateTime,febdata$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
lines(febdata$DateTime,febdata$Sub_metering_2,col="red")
lines(febdata$DateTime,febdata$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = c(1,1,1))
dev.off()