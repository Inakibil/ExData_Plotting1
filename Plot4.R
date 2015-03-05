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
  
 
  
  par(mfrow=c(2,2)) ## par function is used to allow multiple plots
  
  ## Four plots are generated. (1,1) and (2,1) are Plot2 and Plot3 respectively
  ## whereas (1,2) and (2,2) are just time vs different variables plots.
  
  with(power_consumption_sub, {
    ##1,1
    plot(dt,Global_active_power,type ="l",xlab="",ylab="Global Active Power")
    ##1,2  
    plot(dt,Voltage,type="l",xlab="datetime")
    ##2,1 
    plot(dt,Sub_metering_1,type ="l",xlab="",ylab="Energy sub metering")
    lines(dt,Sub_metering_2,col = "red")
    lines(dt,Sub_metering_3,col = "blue")
    legend("topright",lwd = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.75)
    ##2,2
    plot(dt,Global_reactive_power,type ="l",xlab="",ylab="Global_reactive_power")
    x <-c("0.0","0.1","0.2","0.3","0.4","0.5")
    axis(2,at=x,label=y)    
    })
  
  dev.copy(png,"Plot4.png")
  dev.off()
}