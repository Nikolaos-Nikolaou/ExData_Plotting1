
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

# Convert Global active power to numeric
# global_active_power <- as.numeric(smyfile$Global_active_power)

# Convert Sub metering to numeric
mysubM1 <- as.numeric(smyfile$Sub_metering_1)
mysubM2 <- as.numeric(smyfile$Sub_metering_2)
mysubM3 <- as.numeric(smyfile$Sub_metering_3)

# PNG
png("plot3.png", width=480, height=480)

# Third plot
plot(mydatetime, mysubM1, type="l", ylab="Energy Submetering", xlab="")
lines(mydatetime, mysubM2, type="l", col="red")
lines(mydatetime, mysubM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

# Days are correct but because the setup of my native language in my laptop, they are in greek.