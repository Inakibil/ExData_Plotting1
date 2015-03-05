{
  Sys.setlocale("LC_TIME", "English")  ##Setting the English time
  
  
  
  ## The data is read. Some clues are added in order to accelerate the process
  ## The file is supossed to be unzipped in the wd
  power_consumption<- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
  
  ## The data is subsetted to those dates mentiones in the assignment
  power_consumption_sub<- subset(power_consumption,Date=="1/2/2007"| Date=="2/2/2007")
  
  png(file = "plot1.png")  ## Generating the png graphich device
  
  ## The histogram is created in red color and with the required x axis label
  with(power_consumption_sub,hist(Global_active_power,main = "Global Active Power", col = "red",xlab = "Global Active Power (Kilowatts)"))
  
  dev.off()

}