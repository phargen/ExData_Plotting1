# Script to create some exploratory plots of the dataset

# Source data from UC Irvine Machine Learning Repository at http://archive.ics.uci.edu/ml/
# Electrical Power Consumption data set at https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
# Description of variables found in CodeBook.md

# Rough data set size calculation:
# 2,075,259 rows and 9 columns, conservative at 8 bytes per data item ~= 150 MB, no problem for loading it all in RAM

# Download file if doesn't already exist
if(!file.exists("data"))
    dir.create("data")
if(!file.exists("data/household_power_consumption.zip"))
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                  "data/household_power_consumption.zip", method="curl")

# Unzip file if doesn't already exist
if(!file.exists("data/household_power_consumption.txt"))
    unzip("data/household_power_consumption.zip", exdir = "./data")

if(!exists("hpc")) {
    # Read data file for only two dates required 2007-02-01 and 2007-02-02 if doesn't exist in current environment
    # want lines 66638 to 69517
    hpc <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                      colClasses = c(rep("character", 2), rep("numeric", 7)), nrows = 2880, skip = 66636,
                      col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
    # strptime(hpc[1,1], "%d/%m/%Y")
    # strptime(hpc[1,2], "%H:%M:%S")
}
