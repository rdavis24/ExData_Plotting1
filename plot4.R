file <- "./data/household_power_consumption.txt"
dd <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ee <- dd[dd$Date %in% c("1/2/2007", "2/2/2007") ,]

gap <- as.numeric(ee$Global_active_power)
grp <- as.numeric(ee$Global_reactive_power)
datetime <- strptime(paste(ee$Date, ee$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(ee$Sub_metering_1)
sm2 <- as.numeric(ee$Sub_metering_2)
sm3 <- as.numeric(ee$Sub_metering_3)
voltage <- as.numeric(ee$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue"), bty="n")

plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()