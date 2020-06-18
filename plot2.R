names_df <- read.table("household_power_consumption.txt",nrows=1,sep=";",na.strings="NA")
df <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings="NA")
names(df) <- names_df[1,]
View(df)

df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- as.Date(df$Time,"%h:%m:%s")
df$DateTime <- strptime(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
par(fin=c(480,480))
plot(df$DateTime,df$Global_active_power,main="",xlab="",ylab="Global Active Power (Killowatts)",type='l')
dev.copy(png,"plot2.png")
dev.off()

