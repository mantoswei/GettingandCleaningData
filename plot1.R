project<-read.table("~/Rprog/household_power_consumption.txt",header = T,sep = ";",na.strings = "?")
project.new<-project[(project$Date=="1/2/2007"|project$Date=="2/2/2007"),]
project.new$Date<-as.character(project.new$Date)
project.new$Date<-as.Date(strptime(project.new$Date, "%d/%m/%Y"))
jpeg(filename = "~/Rprog/plot1.png")
hist(project.new$Global_active_power,col = "Red",xlab = "Global Active Ppwer (kilowatts)",main = "Global Active Power")
div.off()