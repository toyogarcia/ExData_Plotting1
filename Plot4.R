# Set working directory
setwd("C:/Coursera/Data Science/4.- Exploratory Data Analysis/Week 1/Exercises/Assignment/")

# file 
fileDat <- "household_power_consumption.txt"

#read the data
data <- read.table(fileDat, header=TRUE, sep=";", na.strings="?" , stringsAsFactors = FALSE)

#subset the dates
data2 <- subset(data, as.Date(Date,format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date,format="%d/%m/%Y") <= "2007-02-02")

Sys.setlocale("LC_ALL", "English")

# Generate the plot
png(filename="Plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(data2,{
    plot(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), Global_active_power, xlab = "", ylab="Global Active Power", type="l")
    plot(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), Voltage, xlab = "datetime", ylab="Voltage", type="l",  yaxp=c(234,246,3))
    plot(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, xlab = "", ylab="Energy sub metering",type="l", ylim = c(0, max(Sub_metering_1, Sub_metering_2, Sub_metering_3)))
    par(new=TRUE)
    plot(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, xlab = "", ylab="Energy sub metering",type="l",col="red", ylim = c(0, max(Sub_metering_1, Sub_metering_2, Sub_metering_3)))
    par(new=TRUE)
    plot(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, xlab = "", ylab="Energy sub metering",type="l",col="blue", ylim = c(0, max(Sub_metering_1, Sub_metering_2, Sub_metering_3)))
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black", "red", "blue"), lty=1, bty="n")
    plot(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type="l")
})
dev.off()
