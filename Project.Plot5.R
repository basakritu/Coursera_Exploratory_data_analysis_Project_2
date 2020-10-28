data1 <- readRDS("summarySCC_PM25.rds")
data2 <- readRDS("Source_Classification_Code.rds" )


both <- merge(data1, data2, by="data2")
str(both)

library(ggplot2)


subsetdata1  <- data1[data1$fips=="24510"  & data1$type=="ON-ROAD", ]

AggregatedTotalYear <- aggregate(Emissions ~ year, subsetdata1, sum)

png("Project.Plot5.png", width = 640, height = 640)

g <- ggplot(AggregatedTotalYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab("year") + ylab(expression("Total PM"[2.5]*" Emissions")) +
        ggtitle("Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = 24510) from 1999 to 2008")
print(g)

dev.off()