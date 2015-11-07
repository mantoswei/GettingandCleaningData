#get the txt data into R, choose the rows on specific two days 
project<-read.table("~/Rprog/household_power_consumption.txt",header = T,sep = ";",na.strings = "?")
project.new<-project[(project$Date=="1/2/2007"|project$Date=="2/2/2007"),]
#combine Date and Time , then turn them into OSIXlt format
n<-as.character(paste(project.new$Date,project.new$Time))
project.new$newtime<-strptime(n,"%d/%m/%Y %H:%M:%S")
#Create the plot with Global active power and time, in line style
jpeg(filename = "~/Rprog/plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(project.new, {
  plot(newtime, Global_active_power,type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(newtime,Voltage, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(newtime,project.new$Sub_metering_1,type = "l",
       xlab=NA, ylab="Global Active Ppwer (kilowatts)",axes=T,ann=T)
       lines(project.new$newtime,project.new$Sub_metering_2,col="Red")
       lines(project.new$newtime,project.new$Sub_metering_3,col="Blue")
       legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(newtime,Global_reactive_power, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()