# plot2.R

# Load and prepare data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time),
                                 format="%d/%m/%Y %H:%M:%S")

# Plot 2: Line plot
png("plot2.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
