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
y <- exdata$Global_active_power
plot(x, y, xlab="", ylab="Global Active Power (kilowatts)", type = "l")
dev.copy(png, "plot2.png")
dev.off() 