setwd("G:/Downloads/Online Course Coursera - Exploratory Data Analysis/Course Project 1")

## Grab header names
theHeader <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", 
                     header = FALSE, sep = ";", nrows = 1, colClasses = "character")

## Grab relevant data
readData <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", 
                     header = FALSE, sep = ";", skip = 66637, blank.lines.skip = TRUE, 
                     nrows = 2880)

## Attach header names to readData
colnames(readData) <- theHeader[1,]

## Combine "Date" and "Time" vectors into dateTime
dateTime <- paste( readData$"Date", readData$"Time")

## Open a png device. Creates a "plot1.png" file in working directory
png(filename = "plot1.png")

## Create a histogram with specific modifications.
hist(readData$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Close the png file device
dev.off()



# # Clear the environment
# remove( list=ls() )