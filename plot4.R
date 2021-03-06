## The data household_power_comsumption has been stored in the working directiory
#read the data into the working environment
ndata <- read.csv("household_power_consumption.txt", header =T, sep=";", na.strings ="?")

### use subset() to select 2 days of data for plotting 
ndata <- subset(ndata, ndata$Date == '1/2/2007'|ndata$Date == '2/2/2007', )

ndata$Date<- as.Date(ndata$Date, format = "%d/%m/%Y")

## Combine the Date and Time using paste to create DateTime column
DateTime<- paste(as.Date(ndata$Date), ndata$Time, sep = "")

ndata$DateTime<- as.POSIXct(DateTime)

## We use par to change the margins to fit our plot and call the png device


png( filename = "plot4.png", width = 480, height = 480, bg ="white")
par( mfrow= c(2,2), mar = c(10,6,1,2))
	
## plot (1,1)
	plot(ndata$Global_active_power~ndata$DateTime, type ="l", 
     ylab = "Global Active Power (kilowatts)", xlab="")
## plot (1,2)	
	plot(ndata$Voltage~ndata$DateTime, type ="l", 
     ylab = "Voltage", xlab="datetime")
 ## plot (2,1)    
	with(ndata, {
	   plot(Sub_metering_1~DateTime, type ="l", ylab = "Energy sub metering", xlab="")
		lines(Sub_metering_2~DateTime, col ="red")
		lines(Sub_metering_3~DateTime, col="blue")})
    		 legend("topright", col=c("black", "red", "blue"),legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"),  lty = 1, lwd =1)

## plot (2,2)
	   plot(ndata$Global_reactive_power~ndata$DateTime, type ="l", ylab = "Global_reactive_power", xlab="datetime")
		

dev.off()
