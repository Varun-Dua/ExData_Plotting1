library(data.table)
t<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
tb<-t
tb$Date<-as.Date(tb$Date,"%d/%m/%Y")
dt<-data.table(tb)
DT<-dt[dt$Date>="2007-02-01" & dt$Date<="2007-02-02",]
G<-as.character(DT$Global_active_power)
G<-as.numeric(G)
hist(G, main = "Global Active Power", col = "red", xlab = "Global Active Power(kilowatts)")
dev.copy(png, "Plot1.png")
dev.off()