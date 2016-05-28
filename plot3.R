library(tidyr)
library(dplyr)
exdata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
exdata <- exdata %>% unite(datetime, Date, Time, sep=" ")
exdata$datetime <- strptime(exdata$datetime, format="%d/%m/%Y %H:%M:%S")
date1 <- as.POSIXlt("2007-02-01 00:00:00")
date2 <- as.POSIXlt("2007-02-02 23:59:59")
exdata <- subset(exdata, datetime >= date1 & datetime <= date2)
cols <- c(2:8)
exdata[,cols] <- apply(exdata[,cols], 2, function(x) as.numeric(as.character(x)))

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