#Knn ISLR 4.6.6 An Application to Caravan Insurance Data
#practical example of Knn
library(ISLR)
library(class)
dim(Caravan) #part of the ISLR dataset #5822 rows 86 columns
#This data set includes 85 predictors that measure
#demographic characteristics for 5,822 individuals. The response variable is Purchase,
#which indicates whether or not a given individual purchases a
#caravan insurance policy. In this data set, only 6% of people purchased caravan insurance.
attach(Caravan)
summary(Purchase)
#when we do Knn we want to standardize the data all variables are given a mean of zero and a standard deviation of one. Then
#all variables will be on a comparable scale as its hard to compare 50 years in age to dollars vs time in mins vs yen

#The scale() function does just this. In standardizing the data, we exclude column 86, because that is the
#qualitative Purchase variable
#We can conveniently exclude a column by making its index negative
Caravan[,86] #lots of yes and no's cant scale a yes or no 
standardized.X=scale(Caravan[,-86])

var(Caravan [,1]) #variance before standardizing 
var(standardized.X[,1])#variance after standardizing just checkig it worked


#We now split the observations into a test set, containing the first 1,000
#observations, and a training set, containing the remaining observations.
#We fit a KNN model on the training data using K = 1, and evaluate its
#performance on the test data.

test=1:1000
train.X=standardized.X[-test,] #take everything but first 1000 rows
test.X=standardized.X[test,] #yields the submatrix of the data containing the observations whose indices range from 1 to 1,000
train.Y=Purchase[-test]
test.Y=Purchase[test]


#random guessing is 6% chance 

set.seed(1)
knn.pred=knn(train.X,test.X,train.Y,k=1)

mean(test.Y!=knn.pred) #error rate 11.8%
mean(test.Y!="No")  #proportion of "yes" train cases


table(knn.pred,test.Y)#confusion matrix the accuracy of "Yes" predictions = 9/(68+9) = 11.6%



#if we do k=3 we get better results
knn.pred=knn(train.X,test.X,train.Y,k=3)
table(knn.pred,test.Y)
5/26 #19.2%

#k = 5 gives the best result so far

knn.pred=knn(train.X,test.X,train.Y,k=5)
table(knn.pred,test.Y)
4/15 #26.6%












