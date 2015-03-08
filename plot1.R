# generate plot
source("readData.R")

# select image as graphics device
png("plot1.png")

# create plot
hist(hpc$Global_active_power, main = "Global Active Power",
     xlab= "Global Active Power (kilowatts)", col="red", 
     cex.lab=0.7, cex.axis=0.7, cex.main=0.7, cex.sub=0.7)

# annotate plot

# close graphics device
dev.off()