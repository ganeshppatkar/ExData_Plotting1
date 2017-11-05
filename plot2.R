##Construct Plot 2 for Assignment 1
## Read ExData_Plotting1 txt file from stored repository
ElectData <-read.table("~/R/EDA_Assignment1/exdata_Data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Read subset of data - 2-day period in February, 2007
Plot2_Data <-rbind(ElectData[ElectData$Date=="1/2/2007",],ElectData[ElectData$Date=="2/2/2007",])
## Format date and time 
Plot2_Data$Date <- as.Date(Plot2_Data$Date,"%d/%m/%Y")
Plot2_Data<-cbind(Plot2_Data, "DateTime" = as.POSIXct(paste(Plot2_Data$Date, Plot2_Data$Time)))

##Plot 2
plot(Plot2_Data$Global_active_power ~ Plot2_Data$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")

dev.copy(png, file ='plot2.png', height=480, width=480)
dev.off()