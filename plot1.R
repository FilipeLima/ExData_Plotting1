names_df <- read.table("household_power_consumption.txt",nrows=1,sep=";",na.strings="NA")
df <- read.table("household_power_consumption.txt",skip=66637,nrows=2881,sep=";",na.strings="NA")
names(df) <- names_df[1,]
View(df)

df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$DateTime <- strptime(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

par(fin=c(480,480))
hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power (Killowatts)",col="orangered")
dev.copy(png,"plot1.png")
dev.off()


