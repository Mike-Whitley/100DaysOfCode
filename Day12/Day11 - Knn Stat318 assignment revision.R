# Title     : Knn from stat318 assignment attempt
# Objective : Complete Assignment 1 again as given in stat318 to revise Knn
# Created by: Mike
# Created on: 2/12/2020

#fit kNN regression models to the Autodata set to predict Y=mpg using X=horsepower.
#This data has been divided into training and testing sets:AutoTrain.csv and AutoTest.csv(download these sets from Learn).
#ThekNN() R function on Learn should be used to answer this question (you need torun the kNNcode before calling the function).
#(a)  Perform  kNN  regression  with k=  2,5,10,20,30,50  and  100,  (learning  from  thetraining data)
#and compute the training and testing MSE for each value ofk.
#(b)  Which value of k performed best? Explain.
#(c)  Plot the training data, testing data and the best kNN model in the same figure.
#(The points() function is useful to plot the kNN model because it is discontinuous.)
#(d)  Describe the bias-variance trade-off for kNN regression.

test = read.csv("C:/Users/Mike/Desktop/100DaysOfCode/Day12/AutoTest.csv")
train  = read.csv("C:/Users/Mike/Desktop/100DaysOfCode/Day12/AutoTrain.csv")


attach(autotrain)
summary(mpg)
summary(horsepower)
## STAT318/462 kNN regression function

k =c(2,5,10,20,30,50,100);
test.error =numeric(7);
train.error =numeric(7);
kNN <- function(k,x.train,y.train,x.pred) {
  
## Initialize:
n.pred <- length(x.pred);		y.pred <- numeric(n.pred)

## Main Loop
for (i in 1:n.pred){
  d <- abs(x.train - x.pred[i])
  dstar = d[order(d)[k]]
  y.pred[i] <- mean(y.train[d <= dstar])
}
## Return the vector of predictions
invisible(y.pred)
}


for (i in 1:7){
  pred = kNN((k[i]),
             train$horsepower,
             train$mpg,
             test$horsepower)
  test.error[i] = mean((pred - test$mpg)^2)
  pred = kNN(k[i],
             train$horsepower,
             train$mpg,
             train$horsepower)
  train.error[i] = mean((pred - train$mpg)^2)
  
}
test.error
train.error


kNN.error =min(test.error)
kNN.error

kbest = k[which.min(test.error)]
kbest




