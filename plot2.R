file = "household_power_consumption.txt"
data = subset(data.frame(read.table(file, header = TRUE, sep=";", na.strings="?")), Date=="1/2/2007" | Date=="2/2/2007")
dateTime = paste(data$Date, data$Time)
dateTime = strptime(dateTime, format='%d/%m/%Y %H:%M:%S')
png(file="plot2.png", width=480, height=480, bg = "transparent")
with(data, plot(dateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = ""))
dev.off()
