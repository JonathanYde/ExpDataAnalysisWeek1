##### I have deliberately decided to not clone the rdpeng-repository
##### I prefer to create my own Github-repository from scratch

##### WEEK 1 ASSIGNMENT #####

rm(list=ls())
require <- function(x) {if (!base::require(x, character.only = TRUE)) {install.packages(x, dep = TRUE) ; base::require(x, character.only = TRUE)}}#overwrites 'require' function to install missing packages


# read the data-file
all.data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)

# reformats the dates into date formats
all.data$Date <- as.Date(all.data$Date)

# subsets the dataframe by the specified dates
data <- subset(all.data, Date == "2007-02-01" || Date == "2007-02-02")

# concatenates the dates and timepoints into a new column "Day.Time"
data$Day.Time <- paste(data$Date, data$Time, sep = " ")

# reformats the time points (including date) back into the "Time" column as POSIXlt-format
data$Time <- strptime(data$Day.Time, format = "%Y-%m-%d %H:%M:%S")

# creates the plot without any point or lines
with(data, plot(Time, Sub_metering_1, type = "n", ylab = "Energy sub metering"))

# adds lines to the plot
with(data, lines(Time, Sub_metering_1))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))

# adds legend to the plot
# I chose to remove the border around the legend, as it didn't fit around the text, when copied to PNG-file
legend("top", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),pch = "-", bty="n")
# prints the plot to a file
dev.copy(png, file = "plot3.png", width=480, height=480); dev.off()

?legend
