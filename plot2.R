## Coursera - Data Scientist Track
## Course: Exploratory Data Analysis
## Week: 1
## Assignment: Base Plot System, Plot #2
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
png(file = "plot2.png")
with(pow.data, plot(datetime, Global_active_power, type="l", main="Global Active Power", 
                    ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
