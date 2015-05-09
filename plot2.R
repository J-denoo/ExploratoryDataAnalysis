
# The data household_power_comsumption has been stored in the working directiory
#read the data into the working environment
data1 <- read.csv("household_power_consumption.txt", header =T, sep=";", na.strings ="?")

## use subset to select  2 days data for plotting
ndata <- subset(data1, data1$Date == '1/2/2007'|data1$Date == '2/2/2007', )

ndata$Date<- as.Date(ndata$Date, format = "%d/%m/%Y")

## Combine the Date and Time using paste to create DateTime column
DateTime<- paste(as.Date(ndata$Date), ndata$Time, sep = "")

ndata$DateTime<- as.POSIXct(DateTime)

## We use par to change the margins to fit our plot and call the png device

png( filename = "plot2.png", width = 480, height = 480, bg ="white")
par( mar = c(6,6,1,2))

plot(ndata$Global_active_power~ndata$DateTime, type ="l", 
     ylab = "Global Active Power (kilowatts)", xlab="")

dev.off( )



