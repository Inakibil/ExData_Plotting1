{
  Sys.setlocale("LC_TIME", "English")  ##Setting the English time
  
  
  ## The data is read. Some clues are added in order to accelerate the process
  ## The file is supossed to be unzipped in the wd
  power_consumption<- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
  
  ## The data is subsetted to those dates mentiones in the assignment
  power_consumption_sub<- subset(power_consumption,Date=="1/2/2007"| Date=="2/2/2007")
  
  ## The Date and Time variables are combined and converted to POSIXct class
  sub <- paste(power_consumption_sub$Date,power_consumption_sub$Time)
  dt <- strptime(sub,"%d/%m/%Y %H:%M:%S")
  
  png(file = "plot2.png")  ## Generating the png graphich device
  
  ## Finally the plot function is used setting it to line type 
  ## and defining the axis labels as required
  with(power_consumption_sub,plot(dt,Global_active_power,type ="l",xlab="",ylab="Global Active Power (Watts)"))
  
  dev.off()

}