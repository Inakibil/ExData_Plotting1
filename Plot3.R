{
  Sys.setlocale("LC_TIME", "English")  ##Setting the English time
  
  png(file = "plot3.png")  ## Generating the png graphich device
  
  ## The data is read. Some clues are added in order to accelerate the process
  ## The file is supossed to be unzipped in the wd
  power_consumption<- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings="?")
  
  ## The data is subsetted to those dates mentiones in the assignment
  power_consumption_sub<- subset(power_consumption,Date=="1/2/2007"| Date=="2/2/2007")
  
  ## The Date and Time variables are combined and converted to POSIXct class
  sub <- paste(power_consumption_sub$Date,power_consumption_sub$Time)
  dt <- strptime(sub,"%d/%m/%Y %H:%M:%S")
  
  ## 
  
  ## The plot function is used setting it to line type 
  ## and defining the axis labels as required. From the initial
  ## plot two more representation are added with "lines" function for each
  ## sub metering. Finally the  legend is added in the toprigth position
  with(power_consumption_sub,plot(dt,Sub_metering_1,type ="l",xlab="",ylab="Energy sub metering"))
  with(power_consumption_sub,lines(dt,Sub_metering_2,col = "red"))
  with(power_consumption_sub,lines(dt,Sub_metering_3,col = "blue"))
  legend("topright",lwd = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  dev.off()

}