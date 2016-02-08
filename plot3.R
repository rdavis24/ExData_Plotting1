file <- "./data/household_power_consumption.txt"
dd <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ee <- dd[dd$Date %in% c("1/2/2007", "2/2/2007") ,]

gap <- as.numeric(ee$Global_active_power)
datetime <- strptime(paste(ee$Date, ee$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(ee$Sub_metering_1)
sm2 <- as.numeric(ee$Sub_metering_2)
sm3 <- as.numeric(ee$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue"), bty="o")
dev.off()