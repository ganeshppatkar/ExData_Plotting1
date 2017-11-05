##Construct Plot 1 for Assignment 1
## Read ExData_Plotting1 txt file from stored repository
ElectData <-read.table("~/R/EDA_Assignment1/exdata_Data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Read subset of data - 2-day period in February, 2007
Plot1_Data <-rbind(ElectData[ElectData$Date=="1/2/2007",],ElectData[ElectData$Date=="2/2/2007",])

## Construct Plot1
hist(as.numeric(Plot1_Data$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")

dev.copy(png, file ='plot1.png', height=480, width=480)
dev.off()