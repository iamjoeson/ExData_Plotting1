Data <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

head(Data)

Data1 <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))

hist(Data1$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (killowatts)", ylab = "Frequency", col = "Red")

png("plot1.png", width = 480, height = 480)
dev.off()
