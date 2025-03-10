## first load the data, the data file is called "household_power_consumption.txt".
## It is not uploaded into this repo because of its size. The codes below assume
## the data file is in the same folder as this plotting.R file and also assumes
## that the currently working directory is the same as this plotting.R file.

library(data.table)
energy_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
# extract only energy data for 2 specified dates
energy_data <- energy_data[energy_data$Date == "1/2/2007" | energy_data$Date == "2/2/2007",]

# second plot, use plot function to plot global active power over time. Note that
# the xlabel is switched to "Thu", "Fri", and "Sat".

filename <- "plot2.png"
png(filename,width=480,height=480,units="px")

# plot the figure
x <- 1:2880
y <- energy_data$Global_active_power
plot(x,y,type="l",xaxt="n",xlab = "",ylab = "Global Avtive Power (kilowatts)")
x_ticks <- seq(min(x), max(x), length.out = 3)
axis(1, at = x_ticks, labels = c("Thu","Fri","Sat"), cex.axis = 0.8)

dev.off()