##creating the df that I need###
list.files()
data<-read.table("household_power_consumption.txt",na.strings = "?",sep = ";",header =TRUE)
data$DATE<-paste(data$Date,data$Time," ")
strptime(data$DATE, "%d/%m/%Y %H:%M:%S")
data$DATE<-strptime(data$DATE, "%d/%m/%Y %H:%M:%S")
data<-data[data$DATE> "2007-02-01 00:00:00" & data$DATE < "2007-02-02 24:00:00",]
class(data$DATE)
data$Date<-NULL
data$Time<-NULL
TidyDataset<-data[,c(ncol(data),1:(ncol(data)-1))] #reorder de dataframe
####3###
png(file="plot3.png",width = 480,height = 480)
library(datasets)
with(TidyDataset,plot(DATE,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = ""))
with(TidyDataset,points(DATE,Sub_metering_2,type = "l",col="red"))
with(TidyDataset, points(DATE,Sub_metering_3,type = "l",col="blue"))
legend("topright",lty=1:2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
