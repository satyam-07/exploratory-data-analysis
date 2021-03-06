data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
subdata <- subset(data,data$Date %in% c('1/2/2007','2/2/2007'))
subdata$Date <- as.Date(subdata$Date,format='%d/%m/%Y')
subdata$Time <- strptime(subdata$Time, format = '%H:%M:%S')
subdata[1:1440,'Time'] <- format(subdata[1:1440,'Time'], '2007-02-01 %H:%M:%S')
subdata[1440:2880,'Time'] <- format(subdata[1440:2880,'Time'], '2007-02-02 %H:%M:%S')
png(filename='plot_2.png')
plot(subdata$Time,as.numeric(subdata$Global_active_power),type="l",main='Global Active Power VS Time',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
