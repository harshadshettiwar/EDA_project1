#import the dataset and subset the data using the location of observations
power_data_all<-read.csv("./InputData/household_power_consumption.txt", header=T, sep=';' , na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

power_data_all$Date <- as.Date(power_data_all$Date, format="%d/%m/%Y")

power_data_df<-data.frame(power_data_all)

power_data_subset<-power_data_df[c(66638:69517), ]

#convert date and time into date-time variable
date_new <- paste(as.Date(power_data_subset$Date), power_data_subset$Time)
power_data_subset$Date_new <- as.POSIXct(date_new)

#plot the data(plot3)
with(power_data_subset, {
  plot(Sub_metering_1~Date_new, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Date_new,col='Red')
  lines(Sub_metering_3~Date_new,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save the graph as .png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
