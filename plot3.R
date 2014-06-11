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
subMeter1 <- subsetData$"Sub_metering_1"
subMeter2 <- subsetData$"Sub_metering_2"
subMeter3 <- subsetData$"Sub_metering_3"

## Open a png device. Creates a png file in working directory
png(filename = "plot3.png")

## Create a line graph
plot( strpDateTime, subMeter1, type = "l")
lines(strpDateTime, subMeter2, col = "red")
lines(strpDateTime, subMeter3, col = "blue")

## Create a legend
legend("topright", col = c( "black", "red", "blue" ), lty = 1, 
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )

## Close the png file device
dev.off()

# Clear the environment
remove( list=ls() )