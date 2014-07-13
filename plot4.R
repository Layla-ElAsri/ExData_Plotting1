file = "household_power_consumption.txt"
data = subset(data.frame(read.table(file, header = TRUE, sep=";", na.strings="?")), Date=="1/2/2007" | Date=="2/2/2007")
dateTime = paste(data$Date, data$Time)
dateTime = strptime(dateTime, format='%d/%m/%Y %H:%M:%S')
png(file="plot4.png", width=480, height=480, bg = "transparent")
par(mfrow = c(2, 2))

with(data, plot(dateTime, Global_active_power, type="l", ylab="Global Active Power", xlab = ""))

with(data, plot(dateTime, Voltage, type="l", ylab="Voltage", xlab = "datetime"))

maxS = max(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))
with(data, plot(dateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "", ylim = c(0,maxS)))
par(new = T)
with(data, plot(dateTime, Sub_metering_2, col = "blue", type="l", ylab="", xlab = "", ylim = c(0,maxS)))
par(new = T)
with(data, plot(dateTime, Sub_metering_3, col = "red", type="l", ylab="", xlab = "", ylim = c(0,maxS)))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(dateTime, Global_reactive_power, type="l", xlab = "datetime"))

dev.off()
