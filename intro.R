#Intro to R

country = c("Brazil","China","India","Suisse","USA")
lifexpt = c(74,76,65,83,79)

countrydata = data.frame(country,lifexpt)
countrydata$pop = c(199000,1390000,1240000,7997,318000)

country = c("Australia","Greece")
lifexpt = c(82,81)
pop = c(23050,11125)
newcountrydata = data.frame(country,lifexpt,pop)

allcountrydata = rbind(countrydata,newcountrydata)

setwd("/Users/mohamednabassoua/Documents/Analytics")

WHO = read.csv("WHO.csv")
str(WHO)
   
WHO_Europe = subset(WHO, Region == "Europe")
str(WHO_Europe)

write.csv(WHO_Europe, "WHO_Europe.csv")

WHO$Under15

mean(WHO$Under15)

sd(WHO$Under15)

summary(WHO$Under15)
which.min(WHO$Under15)

WHO$Country[86]
which.max(WHO$Under15)
WHO$Country[124]
plot(WHO$GNI,WHO$FertilityRate)
outliers = subset(WHO,GNI > 10000 & FertilityRate>2.5)

nrow(outliers)

outliers[c("Country","GNI","FertilityRate")]

mean(WHO$Over60)

which.min(WHO$Over60)

WHO$Country[183]

which.min(WHO$LiteracyRate)

WHO$Country[105]

which.max(WHO$LiteracyRate)

WHO$Country[44]

mean(WHO$Over60)

summary(WHO$Over60)

hist(WHO$CellularSubscribers)
boxplot(WHO$LifeExpectancy~WHO$Region)
boxplot(WHO$LifeExpectancy~WHO$Region, xlab="", ylab="Life Expentancy", main="Life Expectancy of countries by region")
table(WHO$Region)


tapply(WHO$Over60,WHO$Region,mean)

tapply(WHO$LiteracyRate,WHO$Region,min)

tapply(WHO$LiteracyRate,WHO$Region,min, na.rm=TRUE)

tapply(WHO$ChildMortality,WHO$Region,mean)
        
