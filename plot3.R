plot3 <-function(file)
{
    data <- read.csv(file, header = TRUE, sep = ";",colClasses = c("character", "character","character", "character","character", 
                                                                   "character", "character", "character","character"))
    
    data$Date <- as.character(data$Date)
    #Select the correct time
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
    data$Time <- as.character(data$Time)
    data$Time <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
    
    
    
    #plot the histogram
    png(file="Plot3.png")
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
    plot(data$Time, data$Sub_metering_1, type="n",xlab = "",ylab = "Energy sub metering", col = "black")
    points(data$Time, data$Sub_metering_1, type="l",xlab = "",ylab = "Energy sub metering", col = "black")
    points(data$Time, data$Sub_metering_2, type="l",xlab = "",ylab = "", col = "red")
    points(data$Time, data$Sub_metering_3, type="l",xlab = "",ylab = "", col = "blue")
    legend("topright", lty=1, col=c("Black","red","blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
           
    
    # Close the device
    dev.off()
}