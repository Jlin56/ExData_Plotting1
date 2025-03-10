## first load the data, the data file is called "household_power_consumption.txt".
## It is not uploaded into this repo because of its size. The codes below assume
## the data file is in the same folder as this plotting.R file and also assumes
## that the currently working directory is the same as this plotting.R file.

library(data.table)
energy_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
# extract only energy data for 2 specified dates
energy_data <- energy_data[energy_data$Date == "1/2/2007" | energy_data$Date == "2/2/2007",]

# third plot, use plot function to plot energy sub metering over time. Note that
# the xlabel is switched to "Thu", "Fri", and "Sat".

filename <- "plot3.png"
png(filename,width=480,height=480,units="px")

# plot the figure
x <- 1:2880
y1 <- energy_data$Sub_metering_1
y2 <- energy_data$Sub_metering_2
y3 <- energy_data$Sub_metering_3
plot(x,y1,type="l",xaxt="n",xlab = "",ylab = "Energy sub metering")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","blue", "red"), lty = c(1,1,1), lwd = 2)
x_ticks <- seq(min(x), max(x), length.out = 3)
axis(1, at = x_ticks, labels = c("Thu","Fri","Sat"), cex.axis = 0.8)

dev.off()