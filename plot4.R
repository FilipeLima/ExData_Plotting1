names_df <- read.table("household_power_consumption.txt",nrows=1,sep=";",na.strings="NA")
df <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings="NA")
names(df) <- names_df[1,]
View(df)

df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- as.Date(df$Time,"%h:%m:%s")
df$DateTime <- strptime(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

par(fin=c(480,480))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar = c(4, 4, 4, 4), oma = c(1, 1, 1, 1))

plot(df$DateTime,df$Global_active_power,main="",xlab="",ylab="Global Active Power (Killowatts)",type='l')

plot(df$DateTime,df$Voltage,main="",xlab="datetime",ylab="Voltage",type='l')


plot(df$DateTime,df$Sub_metering_1 ,main="",xlab="",ylab="Energy sub Metering",type='l')
points(df$DateTime,df$Sub_metering_2 ,main="",xlab="",col="red",ylab="Energy sub Metering",type='l')
points(df$DateTime,df$Sub_metering_3 ,main="",xlab="",col="blue",ylab="Energy sub Metering",type='l')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")

plot(df$DateTime,df$Global_reactive_power,main="",xlab="datetime",type='l',ylab="Global_reactive_power")

dev.off()




