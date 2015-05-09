### The data household_power_comsumption has been stored in the working directiory
#read the data into the working environment
ndata <- read.csv("household_power_consumption.txt", header =T, sep=";", na.strings ="?")

## use subset() to select 2 days of data for plotting 
ndata <- subset(ndata, ndata$Date == '1/2/2007'|ndata$Date == '2/2/2007', )


## use par to change the margins to fit our plot and call the png device
## then plot the histogram to file

	png( filename = 'plot1.png', width = 480, height = 480, bg ='white')
	par(  mar = c(8,6,4,2))

	hist(ndata$Global_active_power, col='red', main = 'Global Active Power', xlab='Global 	Active Power (kilowatts)')

##close the device connection

dev.off( )

