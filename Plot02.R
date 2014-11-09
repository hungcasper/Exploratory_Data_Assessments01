##Getting the data from .txt
dataset<-read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset$Date<-as.Date(dataset$Date, format="%d/%m/%Y")

##Getting sub_data
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

##Conveting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##Plot2
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")


##saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
