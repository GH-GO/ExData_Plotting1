#Jon Hopkins week1 - Exploratory Data Analysis

#Plot 2
# Read data
MyData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
MyData[,"Date"] <- as.Date(MyData[,"Date"],format = "%d/%m/%Y")
# Filter data
MyDataSub<-subset(MyData,Date == "2007-02-01" | Date == "2007-02-02")
# Date-time format
MyDateTime<-strptime(paste(MyDataSub$Date,MyDataSub$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
# Convert string to numeric format
GlobActPow<-as.numeric(MyDataSub[,"Global_active_power"])
# Make and save plot
png("Plot2.png",width = 480, height = 480)
plot(MyDateTime,GlobActPow,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")
dev.off()
