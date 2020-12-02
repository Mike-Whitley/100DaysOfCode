#what is Knn(k nearest neighbor) ?
# https://www.youtube.com/watch?v=4HKqjENq9OU good resource to learn what it is
#used for classification based on feature simularity in a simple way classifies based on neighbors
#when we we use Knn - when data is labeled and noise free and usually small
#uses euclidean distance to find closest next point https://en.wikipedia.org/wiki/Euclidean_distance



install.packages('ISLR') #need the package to use
library(MASS)
#documentation of ISLR https://cran.r-project.org/web/packages/ISLR/ISLR.pdf
library(ISLR)
names(Smarket)
attach(Smarket) 

train=(Year<2005)#observations that occurred before 2005 are set to TRUE, where as those that correspond to observations in 2005 are set to FALSE.
Direction.2005=Direction [!train]
# Knn requires four inputs
#1)matrix containing the predictors associated with the training data, labeled train.X below
#2)A matrix containing the predictors associated with the data for which we wish to make predictions, labeled test.X below.
#3)A vector containing the class labels for the training observations, labeled train.Direction below.
#4)A value for K, the number of nearest neighbors to be used by the classifier
library(class)
train.X=cbind(Lag1,Lag2)[train,] #We use the cbind() function, short for column bind, to bind the Lag1 and Lag2 variables together into two matrices
test.X=cbind(Lag1,Lag2)[!train,] #
#one set for training one for testing
train.Direction=Direction[train]

#set a seed as want same results as book
set.seed(1)
knn.pred=knn(train.X,test.X,train.Direction,k=1) #Knn command using K = 1 not great

table(knn.pred,Direction.2005)
mean(knn.pred== Direction.2005)# we can tell its accuracy using this command this is just values from our table
#(83+43)/252 diagonal/total values so we want to pick a K that gives us the best result

knn.pred=knn(train.X,test.X,train.Direction,k=3) #Knn command using K = 3 this time making it 54% sightly better
#however if we increase k more than 3 we dont get any better than this so QDA at the moment with 60% provides the best result 



