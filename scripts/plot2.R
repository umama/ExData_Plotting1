##Load file into R and subset desired data
a <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt",
              sep = ";", na.strings= "?")
a$date <- paste(a$Date, a$Time)
a$date <- strptime(a$date, format = "%d/%m/%Y %H:%M:%S")
b <- subset(a, as.Date(date) == "2007-02-01" | as.Date(date) == "2007-02-02")

##Create png file, construct plot
png(file = "plot2.png")
with(b, plot(date, Global_active_power, type = "l",
             ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()