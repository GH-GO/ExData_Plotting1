#Jon Hopkins week1 - Exploratory Data Analysis

#Plot 4
# Read data
MyData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
MyData[,"Date"] <- as.Date(MyData[,"Date"],format = "%d/%m/%Y")
# Filter data
MyDataSub <- subset(MyData,Date == "2007-02-01" | Date == "2007-02-02")

GlobActPow <- suppressWarnings(as.numeric(MyDataSub[,"Global_active_power"]))
MyDateTime <- strptime(paste(MyDataSub$Date,MyDataSub$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
MySubP1 <- as.numeric(MyDataSub[,"Sub_metering_1"])
MySubP2 <- as.numeric(MyDataSub[,"Sub_metering_2"])
MySubP3 <- as.numeric(MyDataSub[,"Sub_metering_3"])
GlobReaPow <- as.numeric(MyDataSub[,"Global_reactive_power"])
Volt <- as.numeric(MyDataSub[,"Voltage"])

png("Plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

# Plot 1
plot(MyDateTime,GlobActPow,type = "l",xlab = " ",ylab = "Global Active Power")

# Plot 2
plot(MyDateTime,Volt,type = "l",xlab = "datetime",ylab = "Voltage")

#Plot 3
plot(MyDateTime,MySubP1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(MyDateTime, MySubP2, col = "red")
lines(MyDateTime, MySubP3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))

#Plot 4
plot(MyDateTime,GlobReaPow,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
