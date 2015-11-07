#get the txt data into R, choose the rows on specific two days 
project<-read.table("~/Rprog/household_power_consumption.txt",header = T,sep = ";",na.strings = "?")
project.new<-project[(project$Date=="1/2/2007"|project$Date=="2/2/2007"),]
#combine Date and Time , then turn them into OSIXlt format
n<-as.character(paste(project.new$Date,project.new$Time))
project.new$newtime<-strptime(n,"%d/%m/%Y %H:%M:%S")
#Create the plot with Global active power and time, in line style
jpeg(filename = "~/Rprog/plot2.png")
with(project.new,plot(newtime,Global_active_power, type = "l",xlab=NA, ylab="Global Active Ppwer (kilowatts)"))
dev.off()