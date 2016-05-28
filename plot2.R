plot.new()
x <- exdata$datetime
y <- exdata$Global_active_power
plot(x, y, xlab="", ylab="Global Active Power (kilowatts)", type = "l")
dev.copy(png, "plot2.png")
dev.off() 