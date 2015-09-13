plot1 <-function(file)
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
    hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)" ,main = "Global Active Power" )
    
    dev.size("px")

    dev.copy(png,file="Plot1.png",height = 480, width = 480)
    # Close the device
    dev.off()
}