# Title     : Revision on LDA and QDA using R 
#continue working through the revision material from UC stat318 based on https://trevorhastie.github.io/ISLR/ISLR%20Seventh%20Printing.pdf
# Objective : basic concepts and understanding of LDA
#what is LDA? https://www.youtube.com/watch?v=azXCzI57Yfc
#what is QDA? #https://online.stat.psu.edu/stat508/lesson/9/9.2/9.2.8
# Created by: Mike
# Created on: 30/11/2020
install.packages('ISLR') #need the package to use
library(MASS)
#documentation of ISLR https://cran.r-project.org/web/packages/ISLR/ISLR.pdf
library(ISLR)
names(Smarket)

attach(Smarket) #attach so we dont need to use $ to link

#LDA on the Smarket data. In R,we fit an LDA model using the lda() function, which is part of the MASS library
train=(Year<2005)#observations that occurred before 2005 are set to TRUE, where as those that correspond to observations in 2005 are set to FALSE.
#The object train is a Boolean vector, since its elements are TRUE and FALSE this splits our sample in to 2005 obersvations and pre 2005 obs 
#E.g. Smarket[train,] would pull out all records that arent in 2005

lda.fit=lda(Direction~Lag1+Lag2, data=Smarket, subset=train)

lda.fit

#we can see that down is 0.492 meaning 49.2% of the training observations correspond to days which the market went down and 50.8% where the market went up
plot(lda.fit)


#In order to better assess the ac-curacy of the logistic regression model in this setting, we can fit the modelusing part of the data,
#and then examine how well it predicts theheld outdata. This will yield a more realistic error rate, 
#in the sense that in prac-tice we will be interested in our model's performance not on the data thatwe used to fit the model, 
#but rather on days in the future for which themarket's movements are unknown



#we willfirst create a vector correspondingto the observations from 2001 through 2004
train=(Year<2005)
#We will then use this vectorto create a held out data set of observations from 2005
Smarket.2005=Smarket[!train,]#The new data set called Smarket.2005 contains the rows of Smarket beyond 2005
Direction.2005=Direction [!train]

lda.pred=predict(lda.fit, Smarket.2005)
lda.class=lda.pred$class
mean(lda.class==Direction.2005)
sum(lda.pred$posterior[,1]>=.5) #Applying a 50 % threshold to the posterior probabilities allows us to recre-ate the predictions contained inlda.pred$class.
sum(lda.pred$posterior[,1]<.5)

#If we wanted to use a posterior probability threshold other than 50 % inorder to make predictions, then we could easily do so. For instance, 
#supposethat we wish to predict a market decrease only if we are very certain that themarket will indeed decrease on that day-say, 
#if the posterior probabilityis at least 90 %
sum(lda.pred$posterior[,1]>.9)

#QDA is similar to LDA but you assue the covariance matrix can be differet for each class 
qda.fit=qda(Direction~Lag1+Lag2,data=Smarket,subset=train)
qda.fit
qda.class=predict(qda.fit,Smarket.2005)$class
table(qda.class,Direction.2005)
mean(qda.class==Direction.2005) # QDA predictions are accurate almost 60 % of the time
