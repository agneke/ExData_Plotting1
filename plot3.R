columnames = c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3")
data = read.table(file="household_power_consumption.txt", sep = ";", col.names = columnames, skip=66637, nrows = 2880, na.strings = "?")

data[,1] = paste(data[,1], data[,2], sep=" ")
data$Date = strptime(data$Date,  "%d/%m/%Y %H:%M:%S")

png(filename="plot3.png")
plot(data[,1], data[,7], ylab = "Energy sub metering", xlab = NA, type="n")
lines(data[,1], data[,7])
lines(data[,1], data[,8], col="red")
lines(data[,1], data[,9], col="blue")
legend("topright", lty=1 , col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()