# generate plot
source("readData.R")

# select image as graphics device
png("plot3.png")

# create plot
plot(hpc$DateTime, hpc$Sub_metering_1, type="l", xlab="", ylab="",  
     cex.lab=0.5, cex.axis=0.5, cex.sub=0.7)
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", xlab="", ylab="", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", xlab="", ylab="", col="blue")

# annotate plot
mtext("Energy sub metering", 2, line=2, cex=0.5)

legend("topright", # places a legend at the appropriate place 
       names(hpc)[7:9], # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       col=c("black","red","blue"), # gives the legend lines the correct color and width
       cex=0.5)
#source: http://www.r-bloggers.com/adding-a-legend-to-a-plot/

# close graphics device
dev.off()