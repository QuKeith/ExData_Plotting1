##plot4

##read data
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.str=c("?"))

##format data
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format=c("%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data$Date, format=c("%d/%m/%Y"))
dataSub <- data[data$Date==as.Date("01/02/2007", format=c("%d/%m/%Y")) | data$Date==as.Date("02/02/2007", format=c("%d/%m/%Y")), ]

##plot
par(mfrow=c(2,2))
par(mar=c(4,4,3,3))

with(dataSub, plot(DateTime, Global_active_power, type="l", xlab=NA, ylab="Global Active Power"))

with(dataSub, plot(DateTime, Voltage, type="l", xlab="datetime"))

with(dataSub, plot(DateTime, Global_active_power, type="n", xlab=NA, ylab="Energy sub metering", yaxt="none", ylim=c(0,38)))
axis(2, at=seq(0,30,10), labels=seq(0,30,10))
with(dataSub,lines(DateTime, Sub_metering_1))
with(dataSub,lines(DateTime, Sub_metering_2, col="red"))
with(dataSub,lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n", cex=0.75)

with(dataSub, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

##copy to png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
