# Loading the data
datafile <- "./data/household_power_consumption.txt"
DT <- read.table(datafile,sep = ";",stringsAsFactors = FALSE, header = TRUE,na.strings = "?")

# Subsetting dataset for necessary days
subsetDT <- subset(DT, Date %in% c("1/2/2007","2/2/2007"))

# Loading columns necessary for plotting
sm1 <- as.numeric(subsetDT$Sub_metering_1)
sm2 <- as.numeric(subsetDT$Sub_metering_2)
sm3 <- as.numeric(subsetDT$Sub_metering_3)

# Taking datetime values from Cols $Date and $Time for x-axis
dates <- strptime(paste(subsetDT$Date,subsetDT$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

# Plotting to PNG file
png("plot3.png", width=480, height=480)

plot(dates,sm1,type="l",xlab="",ylab="Energy sub metering")
lines(dates,sm2,type="l",col="Red")
lines(dates,sm3,type="l",col="blue")

legend("topright", col=c("black", "red", "blue"), c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty=1)

dev.off()

