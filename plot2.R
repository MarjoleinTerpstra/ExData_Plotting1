#This script produces the Global Active Power vs time plot (Plot 2, line plot) as described in Course Project 1 of the Exploratory Data Analysis course
#The data set for this plot is "Electric power consumption" from the UC Irvine Machine Learning Repository.

#To run this script, the unzipped data file, called 'household_power_consumption.txt' should be in the working directory
#and the computer on which it is run should have at least 300 Mb of RAM memory. 
#The resulting png-file with the plot is written to the working directory.

#0. Set the system to use the English representation for dates and times
Sys.setlocale("LC_TIME", "en")

#1. Load the data into R and extract the rows with date 01/02/2007 and 02/02/2007
# Loading the data can take a long time....
DataSet <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

SelectedData <- DataSet[(DataSet$Date == "1/2/2007") |(DataSet$Date == "2/2/2007"),]

#2. Change the representation and class of the Date column (to "Date" class) and Time column (to datetime and "POSIXlt" & "POSIXt" class)
SelectedData$Date <- as.Date(SelectedData$Date,"%d/%m/%Y")

SelectedData$Time <- paste(SelectedData$Date,SelectedData$Time)
SelectedData$Time <- strptime(SelectedData$Time,"%Y-%m-%d %H:%M:%S")

#3.Launch a png-graphic device, create a plot with the right parameter settings in the file device and close the device
png(filename="plot2.png",width=480, height=480)
plot(SelectedData$Time,SelectedData$Global_active_power,xlab ="",ylab="Global Active Power (kilowatts)", type="l")
dev.off()



   