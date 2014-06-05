columnames = c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3")
data = read.table(file="household_power_consumption.txt", sep = ";", col.names = columnames, skip=66637, nrows = 2880, na.strings = "?")

png(filename="plot1.png")
hist(data[,3], col = "red", main = "Global active power", xlab = "Global active power (kilowatts)")
dev.off()