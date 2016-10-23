rm(list=ls(all=TRUE)) #Clear Global environment
plot2 = read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?") #Read .csv into data frame
attach(plot2) #localize variables
subsetdate = subset(plot2,Date=="1/2/2007" | Date =="2/2/2007") #subset dates required
attach(subsetdate) #localize variables
rm(plot2) #Cleanup Globals
Date = as.Date(Date, format = "%d/%m/%Y") #Specify Date Format
Concant = as.POSIXct(paste(Date, Time)) #Concatenate Date and Time
png("plot2.png", width = 480, height = 480) #open png device
plot(Concant, Global_active_power,type = "l", ylab= "Global Active Power(kilowatts)", xlab= "") #define plot parameters
dev.off() #close device