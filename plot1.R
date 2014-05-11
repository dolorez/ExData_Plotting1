setwd("E:/coursera/exploratory data analysis/ExData_Plotting1")
# it was unclear whether the instructions required to repeat the download each time in the file (this doesn't make much sense, though)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "project1.zip")
unzip("project1.zip")
# normally, I would start here, after downloading and unpacking the files
electric <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
electric$Date <- as.Date(electric$Date, format="%d/%m/%Y")
electric$Time <- format(electric$Time, format="%H:%M:%S", usetz="FALSE")
electric <- electric[electric$Date >= "2007-02-01" & electric$Date <= "2007-02-02",]
png(filename = "plot1.png"
  , width = 480
  , height = 480
  , units = "px"
  , bg = "white")
hist(electric$Global_active_power
     , col="red"
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)"
     , ylab="Frequency")
dev.off()
