#This script produces the Global Active Power plot (Plot 1, histogram) as described in Course Project 1 of the Exploratory Data Analysis course
#The data set for this plot is "Electric power consumption" from the UC Irvine Machine Learning Repository.

#To run this script, the unzipped data file, called 'household_power_consumption.txt' should be in the working directory
#and the computer on which it is run should have at least 300 Mb of RAM memory. 
#The resulting png-file with the plot is written to the working directory.

# Loading the data can take a long time.... If one of the other Plot-scripts has already been run, step 1 and 2 can be skipped.

#1. Load the data into R and extract the rows with date 01/02/2007 and 02/02/2007
DataSet <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

SelectedData <- DataSet[(DataSet$Date == "1/2/2007") |(DataSet$Date == "2/2/2007"),]

#2. Change the representation and class of the Date column (to "Date" class) and Time column (to datetime and "POSIXlt" & "POSIXt" class)
SelectedData$Date <- as.Date(SelectedData$Date,"%d/%m/%Y")

SelectedData$Time <- paste(SelectedData$Date,SelectedData$Time)
SelectedData$Time <- strptime(SelectedData$Time,"%Y-%m-%d %H:%M:%S")

#3.Launch a png-graphic device, create a plot with the right parameter settings in the file device and close the device
png(filename="plot1.png",width=480, height=480)
hist(SelectedData$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",col= "red" )
dev.off()