names_df <- read.table("household_power_consumption.txt",nrows=1,sep=";",na.strings="NA")
df <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings="NA")
names(df) <- names_df[1,]
View(df)

df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- as.Date(df$Time,"%h:%m:%s")
df$DateTime <- strptime(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
par(fin=c(480,480))
plot(df$DateTime,df$Sub_metering_1 ,main="",xlab="",ylab="Energy sub Metering",type='l')
points(df$DateTime,df$Sub_metering_2 ,main="",xlab="",col="red",ylab="Energy sub Metering",type='l')
points(df$DateTime,df$Sub_metering_3 ,main="",xlab="",col="blue",ylab="Energy sub Metering",type='l')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)

dev.copy(png,"plot3.png")
dev.off()



