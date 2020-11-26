# Learning R from basic continuation 


A=matrix(1:16,4,4) #generate a 4x4 matrix with nums 1 - 16
A

#pulling out explicit columns of a matrix or a single value etc..
A[2,3] #pulls out row 2 column 3 [row, col]

#if you want where rows intersect use
A[c(1,3),c(2,4)] #Suppose we want the values at rows 1 and 3 where the intersect
#with columns 2 and 4: so positions (1,2),(1,4),(3,2)(3,4) creates a new matrix

#you can use sequence instead of explicit columns
A[1:3,2:4] #we want rows 1 to 3 and only columns 2 3 and 4 
#or
A[1:2,] #just rows 1 and 2 and all columns

#A negative column or row index is taken to mean all EXCEPT. 
#The following will (first of all) return values of rows except for 1 and 3
A[-c(1,3),]
#dimensions of a matrix is dim()
dim(A)

###############Processing Data$#############################
#have put the auto.csv file in the same folder as this file and directed to that path
Auto=read.csv("C:/Users/Mike/Documents/R basics/auto.csv",header=T,na.strings="?") 
#header is set to true since the variable in the CSV file the top most value of each row is a title
#na.strings="?" means any value of a ? is replaced with NA when read usually done with "" e.g. no value
AutoWithMissingValues=read.csv("AutoWithMissingValues.csv", header=T, na.strings="")


fix(Auto) #this is a cool function that opens the data frame up in a GUI aspect to manually edit the values :D

Auto=na.omit(Auto) #if we want to remove all missing values in a dataframe use this command

names(Auto) #displays the titles /headers of the data frames columns

#if we want to plot the data we have taken in 
plot(Auto$cylinders, Auto$mpg) #Auto is the dataframe and cylinders and mpg are the columns

#if we want to not have to use $ we can attach the dataframe then just call the columns 
attach(Auto)
plot(cylinders, mpg)
#detach()

#Factors are the data objects which are used to categorize the data and store it as levels. 
#They can store both strings and integers. They are useful in the columns which have a 
#limited number of unique values. Like "Male, "Female" and True, False etc. 
#They are useful in data analysis for statistical modeling.

#factors are categorical variables it sorts the data in to catagories

cylinders=as.factor(cylinders) #as.factor same as factor so we have 5 catagories of cylinders 3 4 5 6 8
plot(cylinders, mpg) #this will plot it as a bar and wisker graph as its now catagorical

plot(cylinders, mpg, col="red", varwidth=T)
#varwidth = True makes boxplot widths proportional to the square root of the samples sizes

#to make a histogram we use hist(
#e.g.
hist(mpg)
hist(mpg,col=2) #col refers to the colour of the hisogram not the columns used

hist(mpg,col=3,breaks=15) #this breaks it in to the prettiest
#close to 15 breaks possible it doesn't force it in this case it did 20 breaks 


pairs(Auto) #returns a plot matrix, consisting of scatterplots for each variable-combination of a data frame.

summary(Auto) #returns a summary of the data e.g. mean med max min quartile  
#for all the data
summary(mpg) #but can do for specific caragory 




