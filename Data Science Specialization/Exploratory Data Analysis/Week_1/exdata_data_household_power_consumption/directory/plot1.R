input <- read.table("household_power_consumption.txt", header = F, sep=";", skip = 66637, nrows = 2880);

colnames(input) <- c("Date","Time","Global_active_power",
"Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3");



DTime <- with(input, as.POSIXct(paste(input[,1], input[,2]), format="%m/%d/%Y %H:%M:%S"));DTime

hist(input$Global_active_power,main="Global active power", xlab="Global_active_power (Kilowatts)", border="blue", col="red",las=1, );
dev.copy(png,'myplot.png')
dev.off()