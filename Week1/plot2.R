columnames = c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3")
data = read.table(file="household_power_consumption.txt", sep = ";", col.names = columnames, skip=66637, nrows = 2880, na.strings = "?")

data[,1] = paste(data[,1], data[,2], sep=" ")
data$Date = strptime(data$Date,  "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png")
plot(data[,1], data[,3], type = "l", ylab = "Global Active Power (kilowatts)", xlab =NA)
dev.off()