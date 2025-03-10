## first load the data, the data file is called "household_power_consumption.txt".
## It is not uploaded into this repo because of its size. The codes below assume
## the data file is in the same folder as this plotting.R file and also assumes
## that the currently working directory is the same as this plotting.R file.

library(data.table)
energy_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
# extract only energy data for 2 specified dates
energy_data <- energy_data[energy_data$Date == "1/2/2007" | energy_data$Date == "2/2/2007",]

# first plot, histogram, use the hist function, and also png function to save
# file as plot1.png
filename <- "plot1.png"
png(filename,width=480,height=480,units="px")

# plot the figure
hist(energy_data$Global_active_power,col="red",xlab="Global Avtive Power (kilowatts)",main="Global Active Power")

dev.off()