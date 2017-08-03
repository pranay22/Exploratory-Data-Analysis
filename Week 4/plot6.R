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

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# 24510 is Baltimore, see plot2.R, 06037 is LA CA
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

#Saving to file
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.copy(png, file="plot4.png", height=1040, width=480)
dev.off()

