
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

# PNG
png("plot1.png", width=480, height=480)

# Convert Global active power to numeric
Global_active_power <- as.numeric(smyfile1$Global_active_power)

# First plot - Histogram
hist(Global_active_power, main="Global Active power", xlab="Global Active power(kilowatts)", ylab="Frequency", col="red" )

dev.off()