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
png(filename="Plot2.png")
with(data2, plot(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()