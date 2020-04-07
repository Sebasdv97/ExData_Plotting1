##creating the df that I need###
list.files()
data<-read.table("household_power_consumption.txt",na.strings = "?",sep = ";",header =TRUE)
data$DATE<-paste(data$Date,data$Time," ")
strptime(data$DATE, "%d/%m/%Y %H:%M:%S")
data$DATE<-strptime(data$DATE, "%d/%m/%Y %H:%M:%S")
data$DATE<-as.Date(data$DATE,format = "%d/%m/%Y %H:%M:%S")
#data$DATE<-format(as.Date(data$DATE),"%d/%m/%Y %H:%M:%S")
class(data$DATE)
data$Date<-NULL
data$Time<-NULL
TidyDataset<-data[,c(ncol(data),1:(ncol(data)-1))] #reorder de dataframe
date_02_01<-subset(TidyDataset,TidyDataset$DATE=="2007-02-01")
date_02_02<-subset(TidyDataset,TidyDataset$DATE=="2007-02-02")
TidyDataset_final_version<-rbind(date_02_01,date_02_02)
####hist###
png(file="plot1.png",width = 480,height = 480)
library(datasets)
with(TidyDataset_final_version,hist(Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power"))
dev.off()
####2####
library(datasets)
with(TidyDataset_final_version,plot(DATE,Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power"))
format(as.Date(TidyDataset_final_version$DATE),"%d/%m/%Y %H:%M:%S")
