##plot1

##read data
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.str=c("?"))

##format data
data$Date <- as.Date(data$Date, format=c("%d/%m/%Y"))
dataSub <- data[data$Date==as.Date("01/02/2007", format=c("%d/%m/%Y")) | data$Date==as.Date("02/02/2007", format=c("%d/%m/%Y")), ]

##plot
hist(dataSub$Global_active_power, col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")

##copy to png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
