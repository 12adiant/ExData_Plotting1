rm(list=ls(all=TRUE)) #Clear Global environment
plot4 = read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?") #Read .csv into data frame
attach(plot4) #localize variables
subsetdate = subset(plot4,Date=="1/2/2007" | Date =="2/2/2007") #subset dates required
attach(subsetdate) #localize variables
rm(plot4) #Cleanup Globals
Date = as.Date(Date, format = "%d/%m/%Y") #Specify Date Format
Concant = as.POSIXct(paste(Date, Time)) #Concatenate Date and Time
png("plot4.png", width = 480, height = 480) #open png device
par(mfcol=c(2,2))
plot(Concant, Global_active_power,type = "l", ylab= "Global Active Power", xlab= "") #define plot parameters
plot(Concant, Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="") #define plot parameters
lines(Concant, Sub_metering_2, type="l", col="red") #define plot parameters
lines(Concant, Sub_metering_3, type="l", col="blue") #define plot parameters
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue")) #add legend
plot(Concant,Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(Concant,Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()