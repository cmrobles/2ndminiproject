getwd()
setwd("C:/Users/robles/OneDrive/Desktop/2ndminiproject/household_power_consumption")
getwd()



# loading the dataset
household_file <- ("./specdata/household_power_consumption.txt")

household_plot <- read.table(household_file, header = T, sep = ";", 
                             na.strings = "?")

# changing the format of the date column
household_plot$Date <- as.Date(household_plot$Date, format="%d/%m/%Y")

# creating another dataset which only contains data from 2007-02-01 and 2007-02-02
final_data <- household_plot[household_plot$Date=="2007-02-02"|household_plot$Date=="2007-02-01",]


# setting the time variable
final_data$Time <- paste(final_data$Date, final_data$Time, sep = " ")

final_data$Time <- strptime(final_data$Time, format = "%Y-%m-%d %H:%M:%S")

# plot 1 #######

hist(final_data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# saving the plot as png
dev.copy(png, "plot1.png")

# clearing the plots
dev.off()



# plot 2 #######

plot(final_data$Time,final_data$Global_active_power,
     ylab="Global Active Power (kilowatts)",xlab=" ",type="l")

# saving the plot as png
dev.copy(png, "plot2.png")

# clearing the plots
dev.off()



# plot 3 #######

plot(final_data$Time,final_data$Sub_metering_1,type="l",
     ylab="Energy sub metering", xlab=" ",col="black")

lines(final_data$Time,final_data$Sub_metering_2,type="l",col="red")

lines(final_data$Time,final_data$Sub_metering_3,type="l",col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"), col=c("black","red","blue"),
                              lty=1)

# saving the plot as png
dev.copy(png, "plot3.png")

# clearing the plots
dev.off()



# plot 4 #######

par(mfrow = c(2, 2)) 

# upper left
plot(final_data$Time,final_data$Global_active_power, xlab = " ", 
     ylab = "Global Active Power (kilowatt)", type = "l")

# upper right
plot(final_data$Time, final_data$Voltage, xlab = "datetime", ylab = "Voltage", 
     type = "l")  

# lower left
plot(final_data$Time,final_data$Sub_metering_1,type="l",
     ylab="Energy sub metering", xlab=" ",col="black")

lines(final_data$Time,final_data$Sub_metering_2,type="l",col="red")

lines(final_data$Time,final_data$Sub_metering_3,type="l",col="blue")

legend("topright",  bty="n", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black","red","blue"), cex = 0.5)

# lower right
plot(final_data$Time, final_data$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")


# saving the plot as png
dev.copy(png, "plot4.png")

# clearing the plots
dev.off()




