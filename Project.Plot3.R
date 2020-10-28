data1 <- readRDS("summarySCC_PM25.rds")
data2 <- readRDS("Source_Classification_Code.rds" )


subsetdata1  <- data1[data1$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetdata1, sum)

png("Project.Plot3.png", width = 480, height = 480)

g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions"))+
        ggtitle("Total Emissions in Baltimore City, Marylan (fips == 24510) from 1999 to 2008")
print(g)

dev.off()