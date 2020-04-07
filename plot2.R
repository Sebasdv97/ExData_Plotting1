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
####2###
png(file="plot2.png",width = 480,height = 480)
library(datasets)
with(TidyDataset,plot(DATE,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = ""))
dev.off()
