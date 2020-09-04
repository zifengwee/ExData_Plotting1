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
p1data <- cbind(timeformat, plotdata)
p1data$Global_active_power <- as.numeric(p1data$Global_active_power)

# Generate Plot 1
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(p1data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
