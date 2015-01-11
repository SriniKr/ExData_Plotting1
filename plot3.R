# Read input file already extracted from the zip file
# Input file is extracted in the current working directory

input_dat <- read.csv("household_power_consumption.txt", stringsAsFactor = FALSE, sep = ";")

#Convert the relevant columns for plot1 to appropriate types
input_dat$Date <- as.Date(input_dat$Date, "%d/%m/%Y")
input_dat$Global_active_power <- as.numeric(input_dat$Global_active_power)
input_dat$DateTime <- strptime(paste(input_dat$Date, input_dat$Time), "%Y-%m-%d %H:%M:%S")
input_dat$Sub_metering_1 <- as.numeric(input_dat$Sub_metering_1)
input_dat$Sub_metering_2 <- as.numeric(input_dat$Sub_metering_2)
input_dat$Sub_metering_3 <- as.numeric(input_dat$Sub_metering_3)

#Create a subset of relevant dates and plot the histogram
rep_dat <- subset(input_dat, input_dat$Date == "2007-02-01" | input_dat$Date == "2007-02-02")

png(file = "plot3.png", bg = "transparent")
plot(rep_dat$DateTime, 
     rep_dat$Sub_metering_1, 
     xlab = "", 
     ylab = "Energy Sub Metering", 
     type = "n")
lines(rep_dat$DateTime, rep_dat$Sub_metering_1, col = "black")
lines(rep_dat$DateTime, rep_dat$Sub_metering_2, col = "red")
lines(rep_dat$DateTime, rep_dat$Sub_metering_3, col = "blue")
dev.off()