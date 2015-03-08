setwd(dir = "C:/Users/mathewb/Google Drive/Studies/Data Science/Course 4 - Exploratory Data Analysis/Assignment 1")

## Read in data, and inspect to ascertain if it was read in correctly.
readdata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

# Add read data into new dbase for working with
data <- readdata 
head(data)

## Set date and Time Variables
data$DT <- paste(data$Date, data$Time)
data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")
head(data)

## Subset specific time period
DSub <- subset(data, as.Date(DT) >= "2007-02-01" 
                         & as.Date(DT) <= "2007-02-02")

## plot 1
png("plot1.png")
hist(DSub$Global_active_power, col="Red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()




