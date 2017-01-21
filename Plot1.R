## Getting full dataset
#setwd("C:/Users/Ajay_jain/coursework/mod4/")
dataload <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataload$Date <- as.Date(dataload$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(dataload, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataload)

## creating datetime column
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1- Histogram on Global active power with labels and Color
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file in png format and closing the device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
