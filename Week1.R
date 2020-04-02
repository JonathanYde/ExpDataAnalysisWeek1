##### I have deliberately decided to not clone the rdpeng-repository
##### I prefer to create my own Github-repository from scratch

##### WEEK 1 ASSIGNMENT #####

rm(list=ls())
require <- function(x) {if (!base::require(x, character.only = TRUE)) {install.packages(x, dep = TRUE) ; base::require(x, character.only = TRUE)}}#overwrites 'require' function to install missing packages


# read the data-file
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)

# reformats the dates into date formats
data$Date <- as.Date(data$Date)

# concatenates the dates and timepoints into a new column "Day.Time"
data$Day.Time <- paste(data$Date, data$Time, sep = " ")

# reformats the time points (including date) back into the "Time" column as POSIXlt-format
data$Time <- strptime(data$Day.Time, format = "%Y-%m-%d %H:%M:%S")

