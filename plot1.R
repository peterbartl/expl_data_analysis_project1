# Generate first plot
#####################

# Extimate memory size necessary for loading data
# 8 bytes per element
# 2.000.000 x 9 elements
8*2000000*9/1000000
# about 144Mbytes

# load data, working directory has to be adjusted accordingly
setwd('D:\\exploratorydataanalysis\\project1')
data<-read.table(file='household_power_consumption.txt',sep=';',na.strings='?',header=TRUE)

# look at actual size of data in memory
print(object.size(data),units='Mb')
# result on my machine: 126.8 Mb
# estimate was quite good

# first look at structure of data
head(data)
str(data)

# make a combinded 'date and time' column
data$datetime<-as.POSIXct(paste(as.character(data$Date),as.character(data$Time)),format='%d/%m/%Y %H:%M:%S')

# remove old 'Date' and 'Time' columns
data.subset1<-subset(data,select=-c(Time,Date))
head(data.subset1)

# subset data to only include relevant time frame
data.subset2<-subset(data.subset1,datetime>as.POSIXct('2007-02-01 00:00:00')&
                       datetime<=as.POSIXct('2007-02-03 00:00:00'))

# plot1: histogram
par(mfrow=c(1,1))
png(width=480,height=480,file='plot1.png')
with(data.subset2,hist(Global_active_power
         ,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)'))
dev.off()

