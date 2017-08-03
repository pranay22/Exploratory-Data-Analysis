#!/usr/bin/Rscript
# *******************************************
# @author Pranay Sarkar

# Read data file
NEI <- readRDS("E:/Exploratory-Data-Analysis/Week 4/summarySCC_PM25.rds")
SCC <- readRDS("E:/Exploratory-Data-Analysis/Week 4/Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#Saving to file
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.copy(png, file="plot2.png", height=640, width=960)
dev.off()

