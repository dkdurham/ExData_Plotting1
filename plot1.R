hist(exdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col = "red")
dev.copy(png, "plot1.png")
dev.off()