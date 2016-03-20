datafile <- "./data/household_power_consumption.txt"
DT <- read.table(datafile,sep = ";",stringsAsFactors = FALSE, header = TRUE,na.strings = "?")
subsetDT <- subset(DT, Date %in% c("1/2/2007","2/2/2007"))

gap <- as.numeric(subsetDT$Global_active_power)

png("plot1.png", width=480, height=480)

hist(gap,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "Red")

dev.off()
