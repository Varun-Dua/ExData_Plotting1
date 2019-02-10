library(data.table)
t<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
tb<-t
tb$Date<-as.Date(tb$Date,"%d/%m/%Y")
dt<-data.table(tb)
DT<-dt[dt$Date>="2007-02-01" & dt$Date<="2007-02-02",]
x<-paste(DT$Date,DT$Time)
x<-as.character(x)
x<-strptime(x, format = "%Y-%m-%d %H:%M:%S", tz="GMT")
with(DT, plot(x, DT$Global_active_power, type = "n", ylab = "Global Active Power(kilowatts)",xlab = ""))
lines(x, DT$Global_active_power)
dev.copy(png, "Plot2.png")
dev.off()