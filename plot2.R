setwd("G:/Downloads/Online Course Coursera - Exploratory Data Analysis/Course Project 1")

## Grab relevant data
readData <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", 
                       header = TRUE, sep = ";", blank.lines.skip = TRUE, 
                       nrows = 100000)
subsetData <- subset( readData, Date == "1/2/2007" | Date == "2/2/2007")

## Get x-axis data
newDate <- as.Date(subsetData$"Date", "%d/%m/%Y")
newDateTime <- paste( newDate, subsetData$"Time" )

strpDateTime <- strptime(newDateTime, format="%Y-%m-%d %H:%M:%S")

## Get y-axis data
glbActPwr <- subsetData$Global_active_power
glbActPwr <- as.numeric( as.character( glbActPwr ) ) ## Changes the scale

## Open a png device. Creates a png file in working directory
png(filename = "plot2.png")

## Create a line graph
plot(strpDateTime, glbActPwr, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Close the png file device
dev.off()

# Clear the environment
remove( list=ls() )