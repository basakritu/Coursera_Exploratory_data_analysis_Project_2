data1 <- readRDS("summarySCC_PM25.rds")
data2 <- readRDS("Source_Classification_Code.rds" )

summary(data1)
summary(data2)
str(data1)
str(data2)

subsetdata1  <- data1[data1$fips=="24510", ]

aggregatedTotalYear <- aggregate(Emissions ~ year, subsetdata1, sum)

png("Project.Plot2.png")

barplot(height = aggregatedTotalYear$Emissions, names.arg = aggregatedTotalYear$year,
        xlab = "Years", ylab = expression("total PM"[2.5]*" emission"), 
        main = expression("Total PM"[2.5]*" in the Baltimore City, MD emissions at various years"))
        
dev.off()