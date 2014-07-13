file = "household_power_consumption.txt"
data = subset(data.frame(read.table(file, header = TRUE, sep=";", na.strings="?")), Date=="1/2/2007" | Date=="2/2/2007")
data$Date = as.Date(data$Date)
data$Time = strptime(data$Time, format="%H:%M:%S")
png(file="plot1.png", width=480, height=480, bg = "transparent")
with(data, hist(data$Global_active_power, breaks = 12, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col= "red"))
dev.off()
