#Basic data analysis

#Working directory
setwd("/Users/mohamednabassoua/Documents/Analytics/Analytics")
#Read dataset. Ensure 'char' converted to Factors by using "TRUE" for the variable below
USDA = read.csv("USDA.csv",stringsAsFactors=TRUE)
str(USDA)
#High level statistical data across all obs for each variable
summary(USDA)
#Amount of sodium in all the food in our dataset
USDA$Sodium
#Food with highest level of sodium. Returns 265, the index of the food with the highest sodium amount
which.max(USDA$Sodium)
#Names of all variables in the USDA dataframe
names(USDA)
# The food with the highest amount of sodium. The result is table salt
USDA$Description[265]
#Create new data frame for food containing more than 10,000 mg of sodium
HighSodium = subset(USDA, Sodium>10000)
# no of obs in the new data frame above. Result is 10 food
nrow(HighSodium)
HighSodium$Description
# find the word 'caviar' in the description vector. The match function is case sensitive. It returns 4154 as the row number 
match("CAVIAR", USDA$Description)
# Sodium level of CAVIAR
USDA$Sodium[4154]
#Concise way to find the sodium level without knowing exact row number
USDA$Sodium[match("CAVIAR", USDA$Description)]
#Summary stats for a variable
summary(USDA$Sodium)
#Standard deviation, excluding NA obs.
sd(USDA$Sodium,na.rm=TRUE)
#Scatter plot
plot(USDA$Protein, USDA$TotalFat,xlab="Protein",ylab="Fat",main="Protein vs Fat",col="red")
#Histogram of Vitamin C
hist(USDA$VitaminC, xlab="Vitamin C (mg)", main="Histogram of Vitamin C (mg)")
#Histogram of Vitamin C with limit for x values
hist(USDA$VitaminC, xlab="Vitamin C (mg)", main="Histogram of Vitamin C (mg)", xlim=c(0,100))
#Breaks to 100 cells as opposed to 1 big cell
hist(USDA$VitaminC, xlab="Vitamin C (mg)", main="Histogram of Vitamin C (mg)", xlim=c(0,100), breaks=100)
#In the above we only see 5 cells and each cell is 20 mg long while we were expecting 100 cells.
#In fact R did the right thing because originally the max was 2000 mg so 2000/100 = 20 mg which is correct.
#So the break should have been 2000 as shown below
hist(USDA$VitaminC, xlab="Vitamin C (mg)", main="Histogram of Vitamin C (mg)", xlim=c(0,100), breaks=2000)
#Box plot for sugar
boxplot(USDA$Sugar,main = "Box plot of sugar level", ylab="Sugar in g")
# 1 if food has higher sodium than average and 0 otherwise 
#HighSodium = USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE)
#str(HighSodium)
# use as.numeric to change TRUE & FALSE to 1 & 0 respectively  
USDA$HighSodium = as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE))
#str(HighSodium)
#Add  new variables to our data frame
USDA$HighFat = as.numeric(USDA$TotalFat > mean(USDA$TotalFat, na.rm=TRUE))
USDA$HighProtein = as.numeric(USDA$Protein > mean(USDA$Protein, na.rm=TRUE))
USDA$HighCarbs = as.numeric(USDA$Carbohydrate > mean(USDA$Carbohydrate, na.rm=TRUE))
#Food with high sodium i.e value is 1 in the HighSodium variable
table(USDA$HighSodium)
#Food with high sodium and high fat. Row in the output corresponds to high sodium
table(USDA$HighSodium, USDA$HighFat)
#Average amount of iron sorted by high and low protein
#the cols heading 0 and 1 refer to protein level in the output.
#For example food with low protein content have on average 2.55mg of iron
tapply(USDA$Iron,USDA$HighProtein,mean,na.rm=TRUE)
#Max level of vitamin C in food with low and high carb
tapply(USDA$VitaminC,USDA$HighCarbs,max,na.rm=TRUE)
tapply(USDA$VitaminC,USDA$HighCarbs,summary,na.rm=TRUE)
