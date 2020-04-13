Data <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

head(Data)

Data1 <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
Data1$Date <- as.Date(Data1$Date, format="%d/%m/%Y")
Data1_Time <- paste(as.Date(Data1$Date), Data1$Time)
Data1$Datetime <- as.POSIXct(Data1_Time)

with(Data1, {
        plot(Sub_metering_1 ~ Datetime, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(Sub_metering_2 ~ Datetime, col = "red")
lines(Sub_metering_3 ~ Datetime, col = "Blue")
})
legend("topright", lty = 1, lwd = 2, cex = 0.75, bty = "n", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png("plot3.png", width=480, height=480)
dev.off()
