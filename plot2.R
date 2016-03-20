datafile <- "./data/household_power_consumption.txt"
DT <- read.table(datafile,sep = ";",stringsAsFactors = FALSE, header = TRUE,na.strings = "?")
subsetDT <- subset(DT, Date %in% c("1/2/2007","2/2/2007"))

gap <- as.numeric(subsetDT$Global_active_power)
dates <- strptime(paste(subsetDT$Date,subsetDT$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(dates,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
