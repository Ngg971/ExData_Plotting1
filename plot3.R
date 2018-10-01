# Read in data, accounting for NA symbols
power_data <- read.delim('household_power_consumption.txt', sep = ";", na.strings = "?", header = TRUE)

# Format Dates
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

# Select subset of data for the days we want
power_data_selected_days <- subset(power_data, Date == as.Date("2007-02-01 00:00:00") | Date == as.Date("2007-02-02 00:00:00"))

# Generate datetime column
power_data_selected_days$DateTime <- strptime(paste(power_data_selected_days$Date, power_data_selected_days$Time), format='%Y-%m-%d %H:%M:%S')

# Plot lines
plot(power_data_selected_days$DateTime, power_data_selected_days$Sub_metering_1, type="o", pch=NA, xlab="", ylab="Energy sub metering")
lines(power_data_selected_days$DateTime, power_data_selected_days$Sub_metering_2, col="red")
lines(power_data_selected_days$DateTime, power_data_selected_days$Sub_metering_3, col="blue")

# Add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), lty=1)

# Save plot
dev.copy(png, file="plot3.png")
