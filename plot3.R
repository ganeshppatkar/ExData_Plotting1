##Construct Plot 1 for Assignment 1
## Read ExData_Plotting1 txt file from stored repository
ElectData <-read.table("~/R/EDA_Assignment1/exdata_Data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Read subset of data - 2-day period in February, 2007
Plot3_Data <-rbind(ElectData[ElectData$Date=="1/2/2007",],ElectData[ElectData$Date=="2/2/2007",])
## Format data and time column
Plot3_Data$Date <- as.Date(Plot3_Data$Date,"%d/%m/%Y")
Plot3_Data<-cbind(Plot3_Data, "DateTime" = as.POSIXct(paste(Plot3_Data$Date, Plot3_Data$Time)))

##Plot 3
with(Plot3_Data, 
     {plot(Sub_metering_1 ~ DateTime, 
           type="l", xlab= "", 
           ylab="Energy Sub Metering")
     })

lines(Plot3_Data$Sub_metering_2 ~ Plot3_Data$DateTime, col = 'Red')
lines(Plot3_Data$Sub_metering_3 ~ Plot3_Data$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file ='plot3.png', height=480, width=480)
dev.off()