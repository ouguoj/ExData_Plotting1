##Read the information and convert it into a data frame
data<-read.table("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=F, sep=";")

##Extract the relevant rows of data for dates 1st Feb 2007 to 2 Feb 2007
datasubset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Obtain a character vector of date/time that corresponds to the respective Global Active Power in the datasubset
datetime<-paste(datasubset$Date,datasubset$Time, sep=" ")

#Plot 4 graphs 


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
##Plot first graph
plot(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",type="l")

##Plot second graph
plot(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Voltage, ylab="Voltage", xlab="datetime",type="l")

##Plot third graph
plot(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Sub_metering_1, ylab="Energy sub metering", xlab="",type="l")
lines(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Sub_metering_2,col="red")
lines(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1,col=c("black","red","blue"))

##Plot 4th graph
plot(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime",type="l")
dev.off()