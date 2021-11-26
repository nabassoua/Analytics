#Basic data analyis using crime data set from Chicago

#Working directory
setwd("/Users/mohamednabassoua/Documents/Analytics/Analytics")
#Read dataset. Ensure 'char' converted to Factors by using "TRUE" for the variable below
crime = read.csv("mvtWeek1.csv",stringsAsFactors=TRUE)
str(crime)
#Maximum variable of the variable ID
max(crime$ID)
#Minimum value of the variable "Beat"
min(crime$Beat)
summary(crime)
#Number of crime for which an arrest was made. Look for the number under logical "TRUE"
summary(crime$Arrest)
# No of obs with "LocationDescription == ALLEY"
summary(crime$LocationDescription)
#First entry of "Date" in the data set
crime$Date[1]
#Convert the variable "Date" into a Date object in R
DateConvert = as.Date(strptime(crime$Date, "%m/%d/%y %H:%M"))
#Month and Year of the median date in the dataset
summary(DateConvert)
#Create 2 new variables in our data frame that correspond to month and day of the week
crime$Month = months(DateConvert)
crime$Weekday = weekdays(DateConvert)
#Replace old date variable with DateConvert
crime$Date = DateConvert
str(crime)
#Month in wich fewest motor vehicle thefts occured. Look for the month with the smallest number
table(crime$Month)
#Weekday with the most motor vehicle thefts
table(crime$Weekday)
#Month with the the largest number of motor vehicle thefts for which an arrest was made
#Output: Month will be along rows and Arrest along columns
table(crime$Month, crime$Arrest)


