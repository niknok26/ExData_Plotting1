#
# Coursera: Data Science
# Exploratory Data Analysis
# Course Assignement #1
# Dennis Magsajo
# 
# plot1.R
#


# Read data set from file
raw <- read.table("household_power_consumption.txt",
                     sep=";",
                     header=TRUE, 
                     na.strings="?"
                    )

# Filter out the 2 days worth of data needed for plotting
data <- tbl_df(subset(raw, raw$Date %in% c("1/2/2007","2/2/2007")))

## Create PNG file for plotting
png(filename = "plot1.png", width = 480,height = 480, units = "px")

# Plot with required parameters
hist(data$Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")

# Close device
dev.off()