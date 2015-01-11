# Read input file already extracted from the zip file
# Input file is extracted in the current working directory

input_dat <- read.csv("household_power_consumption.txt", stringsAsFactor = FALSE, sep = ";")

#Convert the relevant columns for plot1 to appropriate types
input_dat$Date <- as.Date(input_dat$Date, "%d/%m/%Y")
input_dat$Global_active_power <- as.numeric(input_dat$Global_active_power)

#Create a subset of relevant dates and plot the histogram
rep_dat <- subset(input_dat, input_dat$Date == "2007-02-01" | input_dat$Date == "2007-02-02")

png(file = "plot1.png", bg = "transparent")
hist(rep_dat$Global_active_power, 
     col = "orangered1", 
     main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)")
dev.off()