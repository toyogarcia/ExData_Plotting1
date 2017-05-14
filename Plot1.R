# Set working directory
setwd("C:/Coursera/Data Science/4.- Exploratory Data Analysis/Week 1/Exercises/Assignment/")

# file 
fileDat <- "household_power_consumption.txt"

#read the data
data <- read.table(fileDat, header=TRUE, sep=";", na.strings="?" , stringsAsFactors = FALSE)

#subset the dates
data2 <- subset(data, as.Date(Date,format="%d/%m/%Y") >= "2007-02-01" & as.Date(Date,format="%d/%m/%Y") <= "2007-02-02")

# Generate the plot
png(filename="Plot1.png")
hist(data2$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()