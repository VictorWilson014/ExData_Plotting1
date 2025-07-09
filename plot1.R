# plot1.R

# Load and prepare data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

# Plot 1: Histogram
png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
