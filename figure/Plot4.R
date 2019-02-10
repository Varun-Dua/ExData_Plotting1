library(data.table)
t<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
tb<-t
tb$Date<-as.Date(tb$Date,"%d/%m/%Y")
dt<-data.table(tb)
DT<-dt[dt$Date>="2007-02-01" & dt$Date<="2007-02-02",]
x<-paste(DT$Date,DT$Time)
x<-as.character(x)
x<-strptime(x, format = "%Y-%m-%d %H:%M:%S", tz="GMT")
par(mfrow=c(2,2))
par(mar = c(4,4,4,4))

with(DT, plot(x, DT$Global_active_power, type = "n", ylab = "Global Active Power(kilowatts)",xlab = ""))
lines(x, DT$Global_active_power)

with(DT, plot(x,DT$Voltage,ylab = "Voltage", xlab= 'DateTime', type="n"))
lines(x,DT$Voltage)

DT$Sub_metering_1<-as.numeric(as.character(DT$Sub_metering_1))
DT$Sub_metering_2<-as.numeric(as.character(DT$Sub_metering_2))
DT$Sub_metering_3<-as.numeric(as.character(DT$Sub_metering_3))
with(DT, plot(x, DT$Sub_metering_1, type = "n", ylab = "Energy sub metering",xlab = ""), plot(x, DT$Sub_metering_2, type = "n", ylab = "Energy sub metering",xlab = ""), plot(x, DT$Sub_metering_3, type = "n", ylab = "Energy sub metering",xlab = ""))
lines(x, DT$Sub_metering_1,col="black")
lines(x, DT$Sub_metering_2,col="green")
lines(x, DT$Sub_metering_3,col="blue")


with(DT, plot(x,DT$Global_reactive_power,ylab = "Global Reactive power", xlab= 'DateTime', type="n"))
lines(x,DT$Global_reactive_power)

dev.copy(png, "Plot4.png")
dev.off()