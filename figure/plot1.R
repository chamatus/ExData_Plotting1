plot1 <- function(directory=getwd()){
  setwd(directory)
  df <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE)
  df <- subset(df, Date=="2/2/2007"|Date=="1/2/2007")
  png("plot1.png")
  hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
  dev.off()
}