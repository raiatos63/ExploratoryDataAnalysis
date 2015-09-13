plot2 <-function(file)
{
    data <- read.csv(file, header = TRUE, sep = ";",colClasses = c("character", "character","character", "character","character", 
                                                                   "character", "character", "character","character"))
    
    data$Date <- as.character(data$Date)
    #Select the correct time
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
    data$Time <- as.character(data$Time)
    data$Time <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
    
    
    
    #plot the histogram
    data$Global_active_power <- as.numeric(data$Global_active_power)
    plot(data$Time, data$Global_active_power, type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
    dev.copy(png,"Plot2.png")
    # Close the device
    dev.off()
}