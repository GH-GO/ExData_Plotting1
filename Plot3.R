#Jon Hopkins week1 - Exploratory Data Analysis

#Plot 3
# Read data
MyData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
MyData[,"Date"] <- as.Date(MyData[,"Date"],format = "%d/%m/%Y")
# Filter data
MyDataSub<-subset(MyData,Date == "2007-02-01" | Date == "2007-02-02")
# Date-time format
MyDateTime<-strptime(paste(MyDataSub$Date,MyDataSub$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
# Convert string to numeric format
SubP1<-as.numeric(MyDataSub[,"Sub_metering_1"])
SubP2<-as.numeric(MyDataSub[,"Sub_metering_2"])
SubP3<-as.numeric(MyDataSub[,"Sub_metering_3"])

# Make and save plot
png("Plot3.png",width = 480, height = 480)
plot(MyDateTime,SubP1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(MyDateTime, SubP2, col = "red")
lines(MyDateTime, SubP3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))
dev.off()