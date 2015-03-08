# generate plot
source("readData.R")

# select image as graphics device
png("plot2.png")

# create plot
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="",
     cex.lab=0.5, cex.axis=0.5, cex.sub=0.7)

# annotate plot
mtext("Global Active Power (kilowatts)", 2, line=2, cex=0.5)

# close graphics device
dev.off()