# generate plot
source("readData.R")

# select image as graphics device
png("plot4.png")

# create plot
par(mfrow=c(2,2), mar=c(4.1,3.1,1.1,1.1)) # 4 figures arranged in 2 rows and 2 columns
# source: http://research.stowers-institute.org/mcm/efg/R/Graphics/Basics/mar-oma/index.htm

# Upper left plot
# create plot
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="",
     cex.lab=0.5, cex.axis=0.5, cex.sub=0.7)
mtext("Global Active Power", 2, line=2, cex=0.5)

# Upper right plot
plot(hpc$DateTime, hpc$Voltage, type="l", xlab="", ylab="", yaxt="n",
     cex.lab=0.5, cex.axis=0.5, cex.sub=0.7)
axis(2, c(234,238,242,246), cex.axis=0.5)
mtext("datetime", 1, line=2, cex=0.5)
mtext("Voltage", 2, line=2, cex=0.5)

# Lower left plot
plot(hpc$DateTime, hpc$Sub_metering_1, type="l", xlab="", ylab="",  
     cex.lab=0.5, cex.axis=0.5, cex.sub=0.7)
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", xlab="", ylab="", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", xlab="", ylab="", col="blue")
mtext("Energy sub metering", 2, line=2, cex=0.5)
legend("topright", # places a legend at the appropriate place 
       names(hpc)[7:9], # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       col=c("black","red","blue"), # gives the legend lines the correct color and width
       cex=0.5, bty="n")
#source: http://www.r-bloggers.com/adding-a-legend-to-a-plot/

# Lower right plot
plot(hpc$DateTime, hpc$Global_reactive_power, type="l", xlab="", ylab="",
     cex.lab=0.5, cex.axis=0.5, cex.sub=0.7)
mtext("datetime", 1, line=2, cex=0.5)
mtext("Global_reactive_power", 2, line=2, cex=0.5)

# close graphics device
dev.off()