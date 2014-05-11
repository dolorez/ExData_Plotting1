setwd("E:/coursera/exploratory data analysis/ExData_Plotting1")
# it was unclear whether the instructions required to repeat the download each time in the file (this doesn't make much sense, though)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "project1.zip")
unzip("project1.zip")
# normally, I would start here, after downloading and unpacking the files
electric <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
electric$Date <- as.Date(electric$Date, format="%d/%m/%Y")
electric$Time <- format(electric$Time, format="%H:%M:%S", usetz="FALSE")
electric <- electric[electric$Date >= "2007-02-01" & electric$Date <= "2007-02-02",]
png(filename = "plot4.png"
    , width = 480
    , height = 480
    , units = "px"
    , bg = "white")
Sys.setlocale("LC_TIME","C") # needed to format day name abbreviations in English
par(mfrow = c(2,2))
plot(strptime(paste(electric$Date, electric$Time), format="%Y-%m-%d %H:%M:%S"), electric$Global_active_power
     , type="l"
     , xlab=""
     , ylab="Global Active Power (kilowatts)"
)
plot(strptime(paste(electric$Date, electric$Time), format="%Y-%m-%d %H:%M:%S"), electric$Voltage
     , type="l"
     , xlab="datetime"
     , ylab="Voltage"
)
plot(strptime(paste(electric$Date, electric$Time), format="%Y-%m-%d %H:%M:%S"), electric$Sub_metering_1
     , type="l"
     , xlab=""
     , ylab="Energy sub metering")
points(strptime(paste(electric$Date, electric$Time), format="%Y-%m-%d %H:%M:%S"), electric$Sub_metering_2
       , type="l"
       , col="red")
points(strptime(paste(electric$Date, electric$Time), format="%Y-%m-%d %H:%M:%S"), electric$Sub_metering_3
       , type="l"
       , col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(strptime(paste(electric$Date, electric$Time), format="%Y-%m-%d %H:%M:%S"), electric$Global_reactive_power
     , type="l"
     , xlab="datetime"
     , ylab="Global_reactive_power"
)
dev.off()
