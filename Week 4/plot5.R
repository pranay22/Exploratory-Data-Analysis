#!/usr/bin/Rscript
# *******************************************
# @author Pranay Sarkar

# Read data file
NEI <- readRDS("E:/Exploratory-Data-Analysis/Week 4/summarySCC_PM25.rds")
SCC <- readRDS("E:/Exploratory-Data-Analysis/Week 4/Source_Classification_Code.rds")
library(ggplot2)
# merge the two data sets 
NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#Saving to file
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.copy(png, file="plot4.png", height=840, width=480)
dev.off()