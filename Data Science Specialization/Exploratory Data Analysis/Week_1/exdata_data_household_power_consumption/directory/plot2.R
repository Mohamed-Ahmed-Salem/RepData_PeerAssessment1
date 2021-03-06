input <- read.table("household_power_consumption.txt", header = F, sep=";", skip = 66637, nrows = 2880);

colnames(input) <- c("Date","Time","Global_active_power",
                     "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3");



DTime <- with(input, as.POSIXct(paste(input[,1], input[,2]), format="%d/%m/%Y %H:%M:%S"));DTime
plot(Global_active_power ~ DTime, data=input, type="l", col="blue")
## I live in Egypt so the graph is labeled in Arabic language.. :D
dev.copy(png,'myplot.png')
dev.off()