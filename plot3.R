
##Read the information and convert it into a data frame
data<-read.table("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=F, sep=";")

##Extract the relevant rows of data for dates 1st Feb 2007 to 2 Feb 2007
datasubset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Obtain a character vector of date/time that corresponds to the respective Global Active Power in the datasubset
datetime<-paste(datasubset$Date,datasubset$Time, sep=" ")

##Plot line graph of submetering 1,2 and 3
png("plot3.png", width=480, height=480)
plot(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Sub_metering_1, ylab="Energy sub metering", xlab="",type="l")
lines(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Sub_metering_2,col="red")
lines(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1,col=c("black","red","blue"))
dev.off()