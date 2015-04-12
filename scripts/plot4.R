##Load file into R and subset desired data
a <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt",
              sep = ";", na.strings= "?")
a$date <- paste(a$Date, a$Time)
a$date <- strptime(a$date, format = "%d/%m/%Y %H:%M:%S")
b <- subset(a, as.Date(date) == "2007-02-01" | as.Date(date) == "2007-02-02")

##Open graphics device
png(file = "plot4.png")

##Set global parameters
par(mfcol = c(2, 2))

##1st plot
with(b, plot(date, Global_active_power, type = "l",
             ylab = "Global Active Power", xlab = ""))

##2nd plot
plot(b$date, b$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(b$date, b$Sub_metering_2, type = "l", col = "red")
points(b$date, b$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##3rd plot
plot(b$date, b$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##4th plot
with(b, plot(date, Global_reactive_power, type = "l", xlab = "datetime"))

##Close graphics device
dev.off()