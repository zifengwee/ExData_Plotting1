#Download and read file
setwd("C:/Users/Wee Zi Feng/Documents/R/Git/ExData_Plotting1")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "C:/Users/Wee Zi Feng/Documents/R/Git/ExData_Plotting1/exdata_data_household_power_consumption.zip", method = "curl")
unzip("exdata_data_household_power_consumption.zip")

#Change "?" to NA, extract only required data, convert "Global Active Power" to numeric data type.
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
rawdata[rawdata == "?"] <- NA
plotdata <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007"),]
timeformat <-strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
p4data <- cbind(timeformat, plotdata)
p4data$Global_active_power <- as.numeric(p4data$Global_active_power)

# Generate Plot 4
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

hist(p4data$Global_active_power, col = "red", main = "Global Active Power", ylab = "Global Active Power (kilowatts)")

plot(p4data$timeformat, p4data$Global_active_power, type = "l", xlab = "datatime", ylab = "Voltage")

plot(p4data$timeformat, p4data$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
points(p4data$timeformat, p4data$Sub_metering_2, col = "red", type = "l")
points(p4data$timeformat, p4data$Sub_metering_3, col = "blue", type = "l")
legend("topright", bty="n", col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)

plot(p4data$timeformat, p4data$Global_reactive_power, col = "black", type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
