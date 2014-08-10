powerdata <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?",stringsAsFactors = FALSE)
powerdata$DateDate <- as.Date(powerdata$Date,format='%d/%m/%Y')
startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")
febdata <- powerdata[which(powerdata$DateDate >= startdate & powerdata$DateDate <= enddate),]
febdata$DateTime <- strptime(paste(febdata$Date,febdata$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(febdata$DateTime,febdata$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()