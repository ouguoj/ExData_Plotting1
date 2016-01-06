
##Read the information and convert it into a data frame
data<-read.table("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=F, sep=";")

##Extract the relevant rows of data for dates 1st Feb 2007 to 2 Feb 2007
datasubset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Plot histogram in a png format
png("plot1.png", width=480, height=480)
hist(datasubset$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="orangered")
dev.off()
