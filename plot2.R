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
png("plot2.png")
plot(febdata$DateTime,febdata$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()