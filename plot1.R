#import the dataset and subset the data using the location of observations
power_data_all<-read.csv("./InputData/household_power_consumption.txt", header=T, sep=';' , na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power_data_df<-data.frame(power_data_all)
power_data_subset<-power_data_df[c(66638:69517), ]



#plot the data(plot1)

hist(power_data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save the graph as .png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


