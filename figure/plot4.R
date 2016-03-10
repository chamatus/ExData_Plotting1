plot4 <- function(directory=getwd()){
  library(dplyr)
  library(lubridate)
  setwd(directory)
  df <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE)
  df <- subset(df, Date=="2/2/2007"|Date=="1/2/2007")
  df <- mutate(df,DateTime=dmy_hms(paste(Date,Time,sep=" ")))
  png("plot4.png")
  par(mfrow=c(2,2))
  
  with(df,plot(DateTime,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=" "))
  lines(df$DateTime,df$Global_active_power)
  
  with(df,plot(DateTime,Voltage,type="n",ylab="Voltage", xlab="datetime"))
  lines(df$DateTime,df$Voltage)
  
  with(df,plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=" "))
  lines(df$DateTime,df$Sub_metering_1)
  lines(df$DateTime,df$Sub_metering_2,col="red")
  lines(df$DateTime,df$Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))
  
  with(df,plot(DateTime,Global_reactive_power,type="n",ylab="Global_reactive_power", xlab="datetime"))
  lines(df$DateTime,df$Global_reactive_power)
  
  dev.off()
}