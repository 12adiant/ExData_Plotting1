rm(list=ls(all=TRUE)) #Clear Global environment
plot1 = read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?") #Read .csv into data frame
attach(plot1) #localize variables
subsetdate = subset(plot1,Date=="1/2/2007" | Date =="2/2/2007") #subset dates required
attach(subsetdate) #localize variables
numericx = as.numeric(as.character(Global_active_power)) #change x variable to numeric
png("plot1.png", width = 480, height = 480) #open png device
hist(numericx,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)") #define plot parameters
dev.off() #close device
