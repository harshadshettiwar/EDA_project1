#import the dataset and subset the data using the location of observations
power_data_all<-read.csv("./InputData/household_power_consumption.txt", header=T, sep=';' , na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

power_data_all$Date <- as.Date(power_data_all$Date, format="%d/%m/%Y")

power_data_df<-data.frame(power_data_all)

power_data_subset<-power_data_df[c(66638:69517), ]

#convert date and time into date-time variable
date_new <- paste(as.Date(power_data_subset$Date), power_data_subset$Time)
power_data_subset$Date_new <- as.POSIXct(date_new)

#plot the data(plot2)
plot(power_data_subset$Global_active_power~power_data_subset$Date_new, type="l", ylab="Global Active Power (kilowatts)", xlab="")


#save the graph as .png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


