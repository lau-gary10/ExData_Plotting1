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
plot_1 <- function(subsetData, strpDateTime){
        
        ## Get Global Active Power
        glbActPwr <- subsetData$Global_active_power
        glbActPwr <- as.numeric( as.character( glbActPwr ) ) ## Changes the scale
        
        ## Create a line graph
        plot(strpDateTime, glbActPwr, type="l", xlab = "", 
             ylab = "Global Active Power (kilowatts)")
}

plot_2 <- function(subsetData, strpDateTime){
        
        ## Get Energy Sub Metering
        subMeter1 <- subsetData$"Sub_metering_1"
        subMeter2 <- subsetData$"Sub_metering_2"
        subMeter3 <- subsetData$"Sub_metering_3"
        
        ## Create a line graph
        plot( strpDateTime, subMeter1, type = "l")
        lines(strpDateTime, subMeter2, col = "red")
        lines(strpDateTime, subMeter3, col = "blue")
        
        ## Create a legend
        legend("topright", col = c( "black", "red", "blue" ), lty = 1, 
               legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )
}

plot_3 <- function(subsetData, strpDateTime){
      
        ## Get Voltage
        volt <- subsetData$"Voltage"
        volt <- as.numeric( as.character(volt) )

        ## Create a line graph
        plot( strpDateTime, volt, type = "l", xlab = "datetime", ylab = "Voltage" )
}

plot_4 <- function(subsetData, strpDateTime){
        
        ## Get Global Reactive Power
        glbReaPwr <- subsetData$"Global_reactive_power"
        
        ## Create a line graph
        plot( strpDateTime, glbReaPwr, type = "l", xlab = "datetime", 
              ylab = "Global_reactive_power")
}

## Open a png device. Creates a png file in working directory
png(filename = "plot4.png")

par( mfrow = c( 2, 2 ) )
plot_1(subsetData, strpDateTime)
plot_3(subsetData, strpDateTime)
plot_2(subsetData, strpDateTime)
plot_4(subsetData, strpDateTime)

## Close the png file device
dev.off()

# Clear the environment
remove( list=ls() )