#!/usr/bin/Rscript
# *******************************************
# @author Pranay Sarkar

# Read data file
NEI <- readRDS("E:/Exploratory-Data-Analysis/Week 4/summarySCC_PM25.rds")
SCC <- readRDS("E:/Exploratory-Data-Analysis/Week 4/Source_Classification_Code.rds")
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

# Saving to file
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.copy(png, file="plot1.png", height=640, width=640)
dev.off()

