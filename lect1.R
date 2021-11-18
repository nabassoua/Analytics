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
