#Classification revision  
install.packages('ISLR') #need the package to use 
#documentation of ISLR https://cran.r-project.org/web/packages/ISLR/ISLR.pdf
library(ISLR)
names(Smarket)

#Starting with LDA 
#https://www.youtube.com/watch?v=azXCzI57Yfc video on what it is 
#LDA creates a new axis and projects the values on to that axis in a way to reduces the seperation between the catagories

dim(Smarket) #can see it has 1250 rows and 9 columns 
summary(Smarket) #brief look at what the data looks like

cor(Smarket[,-9]) # produces a matrix that contains all of the pairwise correlations among the predictors in a data set
#had to drop direction variable as qualatative 
#The cor() function will calculate the correlation between two vectors, or will create a correlation matrix when given a matrix.
#Correlation is a measure of association between two things,
#represented by a number from -1 to 1. A 1 represents perfect positive correlation, 
#a -1 represents perfect negative correlation, and 0 correlation means that the stocks move independently of each other
#video on correlation between two variables https://www.youtube.com/watch?v=QYWdllUtOo4

#Lag represents percentage returns from prior days e.g. Lag1 = Percentage return for previous day Lag2 = % return for 2 days prior
#today represents the percentage returns for today

#we can see that between lag1 - Lag5 and today very close to zero so almost no correlation between those two variables 
#The only correlation we can see is beween year and volume being 0.53900 being relevant 

attach(Smarket)
plot(Volume)

plot(Volume, Year)

#By plotting the data wesee that 
#Volumeis increasing over time. In other words, the average numberof shares traded daily increased from 2001 to 2005


#Logistic Regression
#Logistic regression is a special case of Generalised Linear Modelling (GLM) using the Binomial distribution family.
#video on log regression https://www.youtube.com/watch?v=yIYKR4sgzI8
#logistic regression predicts if something is true of false 1 or 0 
#logistic regression uses maximun likelikehood 

#we will fit a logistic regression model in order to predict Direction using Lag1 through Lag5 and Volume
glm.fits=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family=binomial) #GLM is the type and we use family=binomial to say logitic regression 
summary(glm.fit) #we want to look at the P value here to see associations the p value in this case is Pr(>|z|)
#the p-value tells us how likely it is to get a result like this if the null hypothesis is true

#The negative coefficient for this predictor suggests that if the market had a positive return yesterday,
#then it is less likely to go up today. However, at a value of 0.15, the p-valueis 
#still relatively large, and so there is no clear evidence of a real association between Lag1 and Direction


#Thepredict()function can be used to predict the probability that themarket will go up, given values of the predictors

glm.probs=predict(glm.fits,type="response")
glm.probs[1:10] #prints first 10 probabilities 
contrasts(Direction) #up is 1 down is 0 so we know its going up as closer to 1 


#In order to make a prediction as to whether the market will go up ordown on a particular day,
#we must convert these predicted probabilitiesinto class labels,Up or Down. The following two commands 
#create a vectorof class predictions based on whether the predicted probability of a market 
#increase is greater than orless than 0.5.
 
glm.pred=rep("Down",1250) #create an entire column of size 1250 of "Down"
glm.pred[glm.probs >.5]="Up" #then of the 1250 down changes the value to up if glm.probs associated row is > 0.5 

#if we want to see how many observations are correctly / incorrectly identified we can use a confusion matrix
table(glm.pred,Direction) #this is a confusion matrix 
#The diagonal elements of the confusion matrix indicate correct predictions,while the off-diagonals represent incorrect predictions
mean(glm.pred==Direction) #how accuracte we were 








