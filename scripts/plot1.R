##Load file into R and subset desired data
a <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt",
              sep = ";", na.strings= "?")
a$Date <- as.Date(a$Date, format = "%d/%m/%Y")
b <- subset(a, Date == "2007-02-01" | Date == "2007-02-02")

##Create png file and construct plot
png(file = "plot1.png")
with(b, hist(Global_active_power, col = "red", main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)"))
dev.off()