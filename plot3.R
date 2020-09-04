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
p3data <- cbind(timeformat, plotdata)
p3data$Global_active_power <- as.numeric(p3data$Global_active_power)

# Generate Plot 3
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(p3data$timeformat, p3data$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
points(p3data$timeformat, p3data$Sub_metering_2, col = "red", type = "l")
points(p3data$timeformat, p3data$Sub_metering_3, col = "blue", type = "l")
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()
