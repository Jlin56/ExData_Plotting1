## first load the data, the data file is called "household_power_consumption.txt".
## It is not uploaded into this repo because of its size. The codes below assume
## the data file is in the same folder as this plotting.R file and also assumes
## that the currently working directory is the same as this plotting.R file.

library(data.table)
energy_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
# extract only energy data for 2 specified dates
energy_data <- energy_data[energy_data$Date == "1/2/2007" | energy_data$Date == "2/2/2007",]

# Fourth plot, use par() and mfrow to create subfigure structure, then use plot
# function to plot the subfigures

filename <- "plot4.png"
png(filename,width=480,height=480,units="px")

x <- 1:2880
y11 <- energy_data$Global_active_power
y12 <- energy_data$Voltage
y211 <- energy_data$Sub_metering_1
y212 <- energy_data$Sub_metering_2
y213 <- energy_data$Sub_metering_3
y22 <- energy_data$Global_reactive_power
par(mfrow = c(2, 2))
# subfigure 11
plot(x,y11,type="l",xaxt="n",xlab = "",ylab = "Global Avtive Power")
x_ticks <- seq(min(x), max(x), length.out = 3)
axis(1, at = x_ticks, labels = c("Thu","Fri","Sat"), cex.axis = 0.8)
# subfigure 12
plot(x,y12,type="l",xaxt="n",xlab = "datetime",ylab = "Voltage")
x_ticks <- seq(min(x), max(x), length.out = 3)
axis(1, at = x_ticks, labels = c("Thu","Fri","Sat"), cex.axis = 0.8)
# subfigure 21
plot(x,y211,type="l",xaxt="n",xlab = "",ylab = "Energy sub metering")
lines(x,y212,col="red")
lines(x,y213,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","blue", "red"), lty = c(1,1,1), lwd = 2,bty = "n")
x_ticks <- seq(min(x), max(x), length.out = 3)
axis(1, at = x_ticks, labels = c("Thu","Fri","Sat"), cex.axis = 0.8)
# subfigure 22
plot(x,y22,type="l",xaxt="n",xlab = "datetime",ylab = "Global_relative_power")
x_ticks <- seq(min(x), max(x), length.out = 3)
axis(1, at = x_ticks, labels = c("Thu","Fri","Sat"), cex.axis = 0.8)

dev.off()