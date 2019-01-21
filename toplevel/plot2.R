#Plot2
#Reading data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#Converting Date and Time variables to Date/Time classes in R 
subsetpower$Date <- as.Date(subsetpower$Date, format="%d/%m/%Y")
subsetpower$Time <- strptime(subsetpower$Time, format="%H:%M:%S")
subsetpower[1:1440,"Time"] <- format(subsetpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetpower[1441:2880,"Time"] <- format(subsetpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#plot function
plot(subsetpower$Time,as.numeric(as.character(subsetpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# editing graph title
title(main="Global Active Power Vs Time")