Data <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

head(Data)

Data1 <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
Data1$Date <- as.Date(Data1$Date, format="%d/%m/%Y")
Data1_Time <- paste(as.Date(Data1$Date), Data1$Time)
Data1$Datetime <- as.POSIXct(Data1_Time)

par(mfrow=c(2,2), mar=c(4,4,2,1))

with(Data1, {
        plot(Global_active_power ~ Datetime, type = "l", 
             xlab = "", ylab = "Global Active Power")
        
        plot(Voltage ~ Datetime, type="l", 
             xlab = "datetime", ylab = "Voltage")})
        
plot(Data1$Sub_metering_1 ~ Data1$Datetime, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(Data1$Sub_metering_2 ~ Data1$Datetime, col = "red")
lines(Data1$Sub_metering_3 ~ Data1$Datetime, col = "Blue")
legend("topright", lty = 1, lwd = 1, cex = 0.5, y.intersp = 0.4, bty = "o", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))       

plot(Data1$Global_reactive_power ~ Data1$Datetime, type = "l", xlab="datetime", ylab="Global_reactive_power")

png("plot4.png", width=480, height=480)

dev.off()
