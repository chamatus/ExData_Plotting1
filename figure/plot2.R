plot2 <- function(directory=getwd()){
  library(dplyr)
  library(lubridate)
  setwd(directory)
  df <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE)
  df <- subset(df, Date=="2/2/2007"|Date=="1/2/2007")
  df <- mutate(df,DateTime=dmy_hms(paste(Date,Time,sep=" ")))
  png("plot2.png")
  with(df,plot(DateTime,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=" "))
  lines(df$DateTime,df$Global_active_power)
  dev.off()
}