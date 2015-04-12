##Load file into R and subset desired data
a <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt",
              sep = ";", na.strings= "?")
a$date <- paste(a$Date, a$Time)
a$date <- strptime(a$date, format = "%d/%m/%Y %H:%M:%S")
b <- subset(a, as.Date(date) == "2007-02-01" | as.Date(date) == "2007-02-02")

##Create png file
png(file = "plot3.png")

##Construct plot
plot(b$date, b$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(b$date, b$Sub_metering_2, type = "l", col = "red")
points(b$date, b$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Close graphics device (png file)
dev.off()