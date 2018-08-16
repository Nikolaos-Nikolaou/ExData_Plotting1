
# Create a directory for all the files
if (!file.exists("./data")) {dir.create("./data")}

# Here are the data for this project:
myfile <- "C:/Users/Nikolaos Nikolaou/OneDrive/DataScienceSpecialization/Coursera/data/household_power_consumption.txt"

# Let's read them:
mydata <- read.table(myfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# Let's take only the data we want:
smyfile <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert Date and Time
mydatetime <- strptime(paste(smyfile$Date, smyfile$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Convert Global active/reactive power to numeric
global_active_power <- as.numeric(smyfile$Global_active_power)
global_reactive_power <- as.numeric(smyfile$Global_reactive_power)

# ConvertConvert Sub metering to numeric & Voltage to numeric
myv <- as.numeric(smyfile$Voltage)
mysubM1 <- as.numeric(smyfile$Sub_metering_1)
mysubM2 <- as.numeric(smyfile$Sub_metering_2)
mysubM3 <- as.numeric(smyfile$Sub_metering_3)

# PNG
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(mydatetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(mydatetime, myv, type="l", xlab="datetime", ylab="Voltage")

plot(mydatetime, mysubM1, type="l", ylab="Energy Submetering", xlab="")
lines(mydatetime, mysubM2, type="l", col="red")
lines(mydatetime, mysubM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(mydatetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

# Days are correct but because the setup of my native language in my laptop, they are in greek.