input <- read.table("household_power_consumption.txt", header = F, sep=";", skip = 66637, nrows = 2880);

colnames(input) <- c("Date","Time","Global_active_power",
                     "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3");



DTime <- with(input, as.POSIXct(paste(input[,1], input[,2]), format="%d/%m/%Y %H:%M:%S"));DTime

#############################################


par(mfrow=c(2,2))
plot(Global_active_power ~ DTime, data=input, type="l", col="black")

plot(Voltage ~ DTime, data=input, type="l", col="black",ylab=("Voltage"), xlab=("datetime"))

plot(DTime,input$Sub_metering_1, data=input,type="l",col="black", ylab="Energy Sub Metering")
lines(DTime,input$Sub_metering_2, data=input,col="red")
lines(DTime,input$Sub_metering_3, data=input,col="blue")

plot(Global_reactive_power ~ DTime, data=input, type="l", col="black", xlab=("datetime"))

###################################################################
## I live in Egypt so the graph is labeled in Arabic language.. :D
dev.copy(png,'myplot.png')
dev.off()