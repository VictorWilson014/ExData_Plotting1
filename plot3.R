# plot3.R

# Load and prepare data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time),
                                 format="%d/%m/%Y %H:%M:%S")

# Plot 3: Energy sub-metering
png("plot3.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
dev.off()
