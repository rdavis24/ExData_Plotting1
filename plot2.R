file <- "./data/household_power_consumption.txt"
dd <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ee <- dd[dd$Date %in% c("1/2/2007", "2/2/2007") ,]

gap <- as.numeric(ee$Global_active_power)
datetime <- strptime(paste(ee$Date, ee$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()