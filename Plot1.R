#Jon Hopkins week1 - Exploratory Data Analysis

#Plot 1
# Read data
MyData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
MyData[,"Date"] <- as.Date(MyData[,"Date"],format = "%d/%m/%Y")
# Filter data
MyDataSub<-subset(MyData,Date == "2007-02-01" | Date == "2007-02-02")
# Convert string to numeric format
GlobActPow<-suppressWarnings(as.numeric(MyDataSub[,"Global_active_power"]))
# Make and save plot
png("Plot1.png",width = 480, height = 480)
hist(GlobActPow, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
