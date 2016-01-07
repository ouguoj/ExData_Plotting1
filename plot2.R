
##Read the information and convert it into a data frame
data<-read.table("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=F, sep=";")

##Extract the relevant rows of data for dates 1st Feb 2007 to 2 Feb 2007
datasubset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Obtain a character vector of date/time that corresponds to the respective Global Active Power in the datasubset
datetime<-paste(datasubset$Date,datasubset$Time, sep=" ")

##Convert datatime from a charcter vector to Date/Time classes and plot line graph
png("plot2.png", width=480, height=480)
plot(strptime(datetime, "%d/%m/%Y %H:%M:%S"),datasubset$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",type="l")
dev.off()