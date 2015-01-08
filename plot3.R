#reading file into R (first 70000 rows)

data <- read.table("household_power_consumption.txt",skip = 66600, nrow = 3400, sep = ";", na.strings = "?", 
col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, sep = ";", header = TRUE)))

#changing variable "Date" and "Time" to character
data$Date <- as.character(data$Date)
data$Time  <- as.character(data$Time)

#subsetting appropriate dates (1/2/2007:2/2/2007)
subset_data  <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

#convert Date and Time to PosIx format
subset_data$DateTime  <- paste(subset_data$Date, subset_data$Time)
subset_data$newDate  <- strptime(subset_data$DateTime, "%d/%m/%Y %H:%M:%S")

#make plot3.png
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(subset_data$newDate, subset_data$Sub_metering_1, type = "l", 
xlab = "", ylab = "Energy sub metering")
points(subset_data$newDate, subset_data$Sub_metering_2, type = "l", col = "red")
points(subset_data$newDate, subset_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
lwd = 3)
dev.off()





