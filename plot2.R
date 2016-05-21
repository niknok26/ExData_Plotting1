#
# Coursera: Data Science
# Exploratory Data Analysis
# Course Assignement #1
# Dennis Magsajo
# 
# plot2.R
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
png(filename = "plot2.png", width = 480,height = 480, units = "px")

# Create blank plot with required parameters
with(data,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),
               Global_active_power,
               col="red",
               xlab="",
               ylab = "Global Active Power (kilowatts)",type="n")
              )
# Draw lines
with(data,lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),
                Global_active_power))

# Close device
dev.off()