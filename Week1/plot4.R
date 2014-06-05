columnames = c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3")
data = read.table(file="household_power_consumption.txt", sep = ";", col.names = columnames, skip=66637, nrows = 2880, na.strings = "?")

data[,1] = paste(data[,1], data[,2], sep=" ")
data$Date = strptime(data$Date,  "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")
par(mfrow = c(2,2))
plot(data[,1], data[,3], type = "l", ylab = "Global Active Power (kilowatts)", xlab =NA)
plot(data[,1], data[,5], type="l", xlab = "datetime", ylab = "voltage")

plot(data[,1], data[,7], ylab = "Energy sub metering", xlab = NA, type="n")
lines(data[,1], data[,7])
lines(data[,1], data[,8], col="red")
lines(data[,1], data[,9], col="blue")
legend("topright", bty="n", lty=1 , col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data[,1], data[,4], type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()