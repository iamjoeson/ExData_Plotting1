Data <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

head(Data)

Data1 <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
Data1$Date <- as.Date(Data1$Date, "%d/%m/%Y")
Data1_Time <- paste(as.Date(Data1$Date), Data1$Time)
Data1$Datetime <- as.POSIXct(Data1_Time)

with(Data1, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})

png("plot2.png", width=480, height=480)
dev.off()
