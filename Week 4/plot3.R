#!/usr/bin/Rscript
# *******************************************
# @author Pranay Sarkar

# Read data file
NEI <- readRDS("E:/Exploratory-Data-Analysis/Week 4/summarySCC_PM25.rds")
SCC <- readRDS("E:/Exploratory-Data-Analysis/Week 4/Source_Classification_Code.rds")
library(ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# 24510 is Baltimore, see plot2.R
subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)
#Saving to file
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.copy(png, file="plot3.png", height=640, width=480)
dev.off()