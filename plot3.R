setwd(dir = "C:/Users/mathewb/Google Drive/Studies/Data Science/Course 4 - Exploratory Data Analysis/Assignment 1/Assignment_1_Exploratory_Data")

## Read in data, and inspect to ascertain if it was read in correctly.
readdata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

# Add read data into new dbase for working with
data <- readdata 
head(data)

## Set date and Time Variables
data$DT <- paste(data$Date, data$Time)
data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")

## Subset specific time period
DSub <- subset(data, as.Date(DT) >= "2007-02-01" & as.Date(DT) <= "2007-02-02")

## plot 3
# Create plot of Days and Energy submetering1/2/3 with legend, and correct colours
png("plot3.png")
plot(DSub$DT, DSub$Sub_metering_1, col = "Black", pch = ".",
     ylab = "Energy sub metering", xlab = "")
lines(DSub$DT, DSub$Sub_metering_1, col = "Black")
lines(DSub$DT, DSub$Sub_metering_2, col = "Red")
lines(DSub$DT, DSub$Sub_metering_3, col = "Blue")
legend("topright", pch = 1, col = c("Black", "Red", "Blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()