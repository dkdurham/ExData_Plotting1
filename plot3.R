plot.new()
x <- exdata$datetime
y <- exdata$Sub_metering_1
z <- exdata$Sub_metering_2
a <- exdata$Sub_metering_3
plot(x, y, xlab="", ylab="Energy sub metering", type = "l")
lines(x, z, col = "red")
lines(x, a, col = "blue")
legend("topright", lwd= c(1,1,1), cex=0.8, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png")
dev.off()