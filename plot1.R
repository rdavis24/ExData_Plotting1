file <- "./data/household_power_consumption.txt"
dd <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ee <- dd[dd$Date %in% c("1/2/2007", "2/2/2007") ,]

gap <- as.numeric(ee$Global_active_power)
png("plot1.png", width=480, height=480)
hist(as.numeric(gap), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()