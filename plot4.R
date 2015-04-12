## Coursera - Data Scientist Track
## Course: Exploratory Data Analysis
## Week: 1
## Assignment: Base Plot System, Plot #4
## Date: 12-Apr-2015
## Author: Paul Kaufmann
##

# Read in the power data and convert to a data table.
pow.data <- read.table("power_data.txt", sep=";", header=T, na.strings="?", colClasses=c("character", "character",rep("numeric",7)))
pow.data <- data.table(pow.data)

# Add a Date/Time column
dt1 <- paste(pow.data$Date, pow.data$Time)
datetime <-  as.POSIXct(strptime(dt1, "%d/%m/%Y %H:%M:%S"))
pow.data <- cbind(pow.data,datetime)
remove(dt1)

# Extract only the data for the time range we need.
pow.data <- pow.data[datetime >= "2007-02-01" & datetime < "2007-02-03",]

# Create chart on PNG graphic device.
png(file = "plot4.png")

par(mfrow=c(2,2))
with( pow.data, {
    
    # Plot 1,1
    plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
    
    # Plot 1,2
    plot(datetime, Voltage, type="l")

    # Plot 2,1
    par(cex=.8)
    plot(datetime, Sub_metering_1, type="l",col="black", ylab="Energy sub metering", xlab="")
    lines(datetime, Sub_metering_2, type="l",col="red")
    lines(datetime, Sub_metering_3, type="l",col="blue")
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           col=c("black","red","blue"), lty=1, box.lty=0, inset=.01)
    
    # Plot 2,2
    plot(datetime, Global_reactive_power, type="l")

    })

dev.off()
