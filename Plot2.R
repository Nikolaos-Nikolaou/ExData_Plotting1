
# Create a directory for all the files
if (!file.exists("./data")) {dir.create("./data")}

# Here are the data for this project:
myfile <- "C:/Users/Nikolaos Nikolaou/OneDrive/DataScienceSpecialization/Coursera/data/household_power_consumption.txt"

# Let's read them:
mydata <- read.table(myfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# Let's take only the data we want:
smyfile <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

# head(smyfile1)
# names(smyfile1)

# Convert Date and Time
mydatetime <- strptime(paste(smyfile$Date, smyfile$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Convert Global active power to numeric
global_active_power <- as.numeric(smyfile$Global_active_power)

# PNG
png("plot2.png", width=480, height=480)

# Second plot 
plot(mydatetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

# Days are correct but because the setup of my native language in my laptop, they are in greek.