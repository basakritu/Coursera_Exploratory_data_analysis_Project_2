data1 <- readRDS("summarySCC_PM25.rds")
data2 <- readRDS("Source_Classification_Code.rds" )


both <- merge(data1, data2, by="data2")
str(both)

library(ggplot2)


subsetdata1  <- data1[(data1$fips=="24510" | data1$fips=="06037") & data1$type=="ON-ROAD", ]

AggregatedTotalYearAndFips <- aggregate(Emissions ~ year + fips, subsetdata1, sum)
AggregatedTotalYear$fips[AggregatedTotalYear$fips=="24510"] <- "Baltimore, MD"
AggregatedTotalYear$fips[AggregatedTotalYear$fips=="06037"] <- "Los Angeles, CA"

png("Project.Plot6.png", width = 640, height = 640)

g <- ggplot(AggregatedTotalYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(.~ fips) + geom_bar(stat = "identity") + xlab("year") + 
        ylab(expression("Total PM"[2.5]*" Emissions")) + 
        ggtitle("Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = 24510) vs Los Angeles, CA (fips = 06037)  1999-2008")
print(g)

dev.off()