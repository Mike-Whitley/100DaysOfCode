#revision of linear regressionand multiple linear regression

library(MASS)# for the dataset

#what is  linear regression?
#Linear regression attempts to model the 
#relationship between two variables by fitting 
#a linear equation to observed data. 
#One variable is considered to be an explanatory variable, and the other is considered to be a dependent variable. For example, a modeler might want to relate the weights of individuals
#to their heights using a linear regression model. 


fix(Boston) #this is a dataset in the library mass 
#The Boston data frame has 506 rows and 14 columns.

names(Boston) # titles from the Boston 

attach(Boston)

lm.fit = lm(medv~lstat) #uses lm() function  #this is the trend line 
#To do linear (simple and multiple) regression in R you need the built-in lm function.
#could also do lm.fit = lm(medv~lstat, data = Boston) if not attached 

lm.fit #lm stands for linear model 
names(lm.fit) #lm.fit contains these values 

coef(lm.fit) # return the model’s regression coefficients.

predict(lm.fit, data.frame(lstat = c(5,10,15)), interval = "confidence")
#The 95 % confidence interval associated with an lstat value of 10 is (24.47, 25.63)


plot(lstat, medv) #plots the lstat and medv
#lstat = lower status of the population (percent). medv = median value of owner-occupied homes in \$1000s
abline(lm.fit) #this add a line to the current graph this is the trend line 

plot(lstat, medv, pch=18) #can add col="blue" to change circle colours or change symbol in pch=16 1-20 or "symbol here"
abline(lm.fit, lwd = 3 , col = "red") #plot line again but change to red lwd is line width

plot(1:20, 1:20, pch = 1:20)#cool way to see them all


#Diagnositic plots

#Four diagnostic plots are automatically produced by applying the plot() function directly to the output from lm().
par(mfrow = c(2,2))
plot(lm.fit)


#Multiple Linear Regression 
#The syntax lm(y∼x1+x2+x3) is used to fit a model with three predictors: x1, x2, and x3.
#The summary() function will now output the regression coefficients for all these predictors.

#so if we add the age to our prior linear regression model 

lm.fit = lm(medv~lstat+age, data = Boston)
summary(lm.fit)
#if we wanted to do all predictors i.e all 13 we can just do a dot
lm.fit = lm(medv~., data = Boston)
summary(lm.fit)
#or everything but age
lm.fit1 = lm(medv~.-age, data = Boston)
summary(lm.fit1)
#or we can update and remove age retroactively using update function
lm.fit1 = update(lm.fit, ~.-age)
