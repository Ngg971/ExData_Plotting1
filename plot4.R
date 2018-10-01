# Read in data, accounting for NA symbols
power_data <- read.delim('household_power_consumption.txt', sep = ";", na.strings = "?", header = TRUE)

# Format Dates
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

# Select subset of data for the days we want
power_data_selected_days <- subset(power_data, Date == as.Date("2007-02-01 00:00:00") | Date == as.Date("2007-02-02 00:00:00"))

# Generate datetime column
power_data_selected_days$DateTime <- strptime(paste(power_data_selected_days$Date, power_data_selected_days$Time), format='%Y-%m-%d %H:%M:%S')

# Save plot once generated (dev.copy method not working)
png("plot4.png", width = 480, height = 480)

# Set plot area
par(mfrow=c(2,2))

# Add first plot
plot(power_data_selected_days$DateTime, power_data_selected_days$Global_active_power, type="o", pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
    
# Add second plot
plot(power_data_selected_days$DateTime, power_data_selected_days$Voltage, type="o", pch=NA, xlab="", ylab="Voltage")

# Add third plot
plot(power_data_selected_days$DateTime, power_data_selected_days$Sub_metering_1, type="o", pch=NA, xlab="", ylab="Energy sub metering")
lines(power_data_selected_days$DateTime, power_data_selected_days$Sub_metering_2, col="red")
lines(power_data_selected_days$DateTime, power_data_selected_days$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), lty=1)

# Add fourth plot
plot(power_data_selected_days$DateTime, power_data_selected_days$Global_reactive_power, type="o", pch=NA, xlab="", ylab="Global Reactive Power (kilowatts)")
dev.off()