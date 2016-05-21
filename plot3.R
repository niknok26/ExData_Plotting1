#
# Coursera: Data Science
# Exploratory Data Analysis
# Course Assignement #1
# Dennis Magsajo
# 
# plot3.R
#


# Read data set from file
raw <- read.table("household_power_consumption.txt",
                  sep=";",
                  header=TRUE, 
                  na.strings="?"
)

# Filter out the 2 days worth of data needed for plotting
data <- subset(raw, raw$Date %in% c("1/2/2007","2/2/2007"))


## Create PNG file for plotting
png(filename = "plot3.png", width = 480,height = 480, units = "px")

# Create blank plot with required parameters
with(data,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),
               Sub_metering_1,
               col="red",
               xlab="",
               ylab = "Energy sub metering",type="n")
)
# Draw lines for Sub_metering_1
with(data,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),
                Sub_metering_1,col="black"))

# Draw lines for Sub_metering_2
with(data,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),
                Sub_metering_2,col="red"))

# Draw lines for Sub_metering_3
with(data,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),
                Sub_metering_3,col="blue"))

# Draw Legend
legend("topright",legend=names(data[7:9]), col = c("black","red","blue"), lty = c(1,1,1) )

# Close device
dev.off()