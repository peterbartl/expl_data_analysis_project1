# Generate second plot
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

# plot2: power over time
png(width=480,height=480,file='plot2.png')
Sys.setlocale("LC_TIME", "English")
with(data.subset2,plot(Global_active_power~datetime
,col='black',ylab='Global Active Power (kilowatts)',xlab='',type='l'))
dev.off()
