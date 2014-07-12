# Generate third plot
#####################

# load data, working directory has to be adjusted accordingly
setwd('D:\\exploratorydataanalysis\\project1')
data<-read.table(file='household_power_consumption.txt',sep=';',na.strings='?',header=TRUE)

# make a combinded 'date and time' column
data$datetime<-as.POSIXct(paste(as.character(data$Date),as.character(data$Time)),format='%d/%m/%Y %H:%M:%S')

# remove old 'Date' and 'Time' columns
data.subset1<-subset(data,select=-c(Time,Date))
head(data.subset1)
# subset data to only include relevant time frame
data.subset2<-subset(data.subset1,datetime>as.POSIXct('2007-02-01 00:00:00')&
                       datetime<=as.POSIXct('2007-02-03 00:00:00'))

# plot3: sub metering
png(width=480,height=480,file='plot3.png')
Sys.setlocale("LC_TIME", "English")
with(data.subset2,plot(Sub_metering_1~datetime
                       ,col='black',ylab='Energy sub metering',xlab='',type='n'))
with(data.subset2,lines(Sub_metering_1~datetime,col='black'))
with(data.subset2,lines(Sub_metering_2~datetime,col='red'))
with(data.subset2,lines(Sub_metering_3~datetime,col='blue'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
dev.off()
# plot4: 4 plots in one set
png(width=480,height=480,file='plot4.png')
par(mfrow=c(2,2))
# first plot
with(data.subset2,plot(Global_active_power~datetime
                       ,col='black',ylab='Global Active Power',xlab='',type='l'))
# second plot
with(data.subset2,plot(Voltage~datetime
                       ,col='black',ylab='Voltage',xlab='datetime',type='l'))


# third plot
with(data.subset2,plot(Sub_metering_1~datetime
                       ,col='black',ylab='Energy sub metering',xlab='',type='n'))
with(data.subset2,lines(Sub_metering_1~datetime,col='black'))
with(data.subset2,lines(Sub_metering_2~datetime,col='red'))
with(data.subset2,lines(Sub_metering_3~datetime,col='blue'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1,bty='n',cex=0.7)

# fourth plot
with(data.subset2,plot(Global_reactive_power~datetime
                       ,col='black',xlab='datetime',type='l'))

dev.off()
