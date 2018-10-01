# Read in data, accounting for NA symbols
power_data <- read.delim('household_power_consumption.txt', sep = ";", na.strings = "?", header = TRUE)

# Format Dates
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")

# Select subset of data for the days we want
power_data_selected_days <- subset(power_data, Date == as.Date("2007-02-01 00:00:00") | Date == as.Date("2007-02-02 00:00:00"))

# Plot histogram
hist(power_data_selected_days$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Save plot
dev.copy(png, file="plot1.png")
