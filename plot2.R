# Loading the data
datafile <- "./data/household_power_consumption.txt"
DT <- read.table(datafile,sep = ";",stringsAsFactors = FALSE, header = TRUE,na.strings = "?")

# Subsetting dataset for necessary days
subsetDT <- subset(DT, Date %in% c("1/2/2007","2/2/2007"))

# Loading columns necessary for plotting
gap <- as.numeric(subsetDT$Global_active_power)

# Taking datetime values from Cols $Date and $Time for x-axis
dates <- strptime(paste(subsetDT$Date,subsetDT$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

# Plotting to PNG file
png("plot2.png", width=480, height=480)

plot(dates,gap,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
