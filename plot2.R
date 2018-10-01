# Read in data, accounting for NA symbols
power_data <- read.delim('household_power_consumption.txt', sep = ";", na.strings = "?", header = TRUE)

# Format Dates
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

# Select subset of data for the days we want
power_data_selected_days <- subset(power_data, Date == as.Date("2007-02-01 00:00:00") | Date == as.Date("2007-02-02 00:00:00"))

# Generate datetime column
power_data_selected_days$DateTime <- strptime(paste(power_data_selected_days$Date, power_data_selected_days$Time), format='%Y-%m-%d %H:%M:%S')

# Save plot once generated (dev.copy method not working)
png("plot2.png", width = 480, height = 480)

# Plot line
plot(power_data_selected_days$DateTime, power_data_selected_days$Global_active_power, type="o", pch=NA, xlab="", ylab="Global Active Power (kilowatts)")

dev.off()