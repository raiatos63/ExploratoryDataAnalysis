plot4 <-function(file)
{
    
    #Read the data. Also numeric columns are read as character as there are question marks in order to mark missing values
    
    data <- read.csv(file, header = TRUE, sep = ";",colClasses = c("character", "character","character", "character","character", 
                                                                   "character", "character", "character","character"))
    
    data$Date <- as.character(data$Date)
    #Select the correct time
    
    #Select the data
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
    
    #
    data$Time <- as.character(data$Time)
    data$Time <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
    
    
    png(file="Plot4.png")
    par(mfrow = c(2,2))
    #plot the histogram
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
    
    data$Global_active_power <- as.numeric(data$Global_active_power)
    plot(data$Time, data$Global_active_power, type="l",xlab = "",ylab = "Global Active Power")
    
    data$Voltage <- as.numeric(data$Voltage)
    plot(data$Time, data$Voltage, type="l",xlab = "datetime",ylab = "Voltage")
    
    
    plot(data$Time, data$Sub_metering_1, type="n",xlab = "",ylab = "Energy sub metering", col = "black")
    points(data$Time, data$Sub_metering_1, type="l",xlab = "",ylab = "Energy sub metering", col = "black")
    points(data$Time, data$Sub_metering_2, type="l",xlab = "",ylab = "", col = "red")
    points(data$Time, data$Sub_metering_3, type="l",xlab = "",ylab = "", col = "blue")
    legend("topright", lty=1, col=c("Black","red","blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    data$Global_active_power <- as.numeric(data$Global_active_power)
    plot(data$Time, data$Global_reactive_power, type="l",xlab = "datetime",ylab = "Global_reactive_power")
    
    
    #dev.copy(png,"Plot4.png")
    # Close the device
    par(mfrow=c(1,1))
    dev.off()
    
}