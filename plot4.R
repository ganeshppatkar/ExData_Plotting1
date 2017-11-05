##Construct Plot 1 for Assignment 1
## Read ExData_Plotting1 txt file from stored repository
ElectData <-read.table("~/R/EDA_Assignment1/exdata_Data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

##Plot 4 Sub Data
Plot4_Data <-rbind(ElectData[ElectData$Date=="1/2/2007",],ElectData[ElectData$Date=="2/2/2007",])
## Format Date and time
Plot4_Data$Date <- as.Date(Plot4_Data$Date,"%d/%m/%Y")
Plot4_Data<-cbind(Plot4_Data, "DateTime" = as.POSIXct(paste(Plot4_Data$Date, Plot4_Data$Time)))

##Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(Plot4_Data$Global_active_power ~ Plot4_Data$DateTime, type="l", xlab= "", 
     ylab="Global Active Power")
plot(Plot4_Data$Voltage ~ Plot4_Data$DateTime, type="l", xlab= "Datetime", 
     ylab="Voltage")
with(Plot4_Data, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy sub metering")})
lines(Plot4_Data$Sub_metering_2 ~ Plot4_Data$DateTime, col = 'Red')
lines(Plot4_Data$Sub_metering_3 ~ Plot4_Data$DateTime, col = 'Blue')

plot(Plot4_Data$Global_reactive_power ~ Plot4_Data$DateTime, type="l", xlab= "datetime", 
     ylab="Global_reactive_power")

dev.copy(png, file ='plot4.png', height=480, width=480)
dev.off()