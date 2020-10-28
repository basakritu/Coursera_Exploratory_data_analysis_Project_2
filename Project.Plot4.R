data1 <- readRDS("summarySCC_PM25.rds")
data2 <- readRDS("Source_Classification_Code.rds" )


both <- merge(data1, data2, by="data2")
str(both)

library(ggplot2)

coalMatches  <- grepl("coal", both$Short.Name, ignore.case=TRUE)
subsetboth <- both[coalMatches, ]

AggregatedTotalYear <- aggregate(Emissions ~ year, subsetboth, sum)

png("Project.Plot4.png", width = 640, height = 640)

g <- ggplot(AggregatedTotalYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity") + xlab("year") + ylab(expression("Total PM"[2.5]*" Emissions")) +
        ggtitle("Total Emissions from cola sources from 1999 to 2008")
print(g)

dev.off()