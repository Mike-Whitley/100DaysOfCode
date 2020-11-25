#Basic R commands  reviewing R from the start for a good understanding before tackling more complex tasks again


#assign variables
x <- c(1,3,2,5) #c stands for concatenate this makes a vector in x variable
x #gives the vector x back


#get length of a vector
length(x) #how many items in the vector

#create a matrix
y=matrix (data=c(1,2,3,4) , nrow=2, ncol =2) #this is a 2x2 matrix goes 1 3 then 2 4
y 
#however if we set
y = matrix (c(1,2,3,4) ,2,2,byrow =TRUE)#and byrow is true we get a 12 34 matrix

#a matrix can take regular changes directly like in matrix multiplication or sqrts
#e.g.
sqrt(y)


#generating random normal variables 
n = rnorm(10) #generates a random vector of 10 random elements
n

#By default, rnorm() creates standard normal random variables with a mean
#of 0 and a standard deviation of 1. However, the mean and standard deviation
#can be altered using the mean and sd arguments

#correlation between two vectors = cor()
#e.g.
x=rnorm(50)
y=x+rnorm(50, mean=50, sd=.1)
cor(x,y)

#if we want exact same set of random numbers we can use set.seed(1234)

#mean = mean()
#variance = var()

#plotting in R 
x=rnorm(100)
y=rnorm(100)
plot(x,y) #plots a basic graph x by y scatter plot no labels only x and y axis
plot(x,y,xlab=" this is the x-axis",ylab=" this is the y-axis",
     main=" Plot of X vs Y") #same graph but with labels


#how to save a plot
pdf(file = "../../../Documents/R basics/My Plot.pdf")#you can also use jpeg etc instead of pdf # defaults to save in documents atm?
plot(x,y,col ="green")
dev.off() #this indicates to R that the plot has been created and to save it now

#three dimensional plotting using contour()
x=seq (1 ,10)
x=seq(-pi ,pi ,length =50)
y=x
f=outer(x,y,function (x,y)cos(y)/(1+x^2))
contour (x,y,f)
contour (x,y,f,nlevels =45, add=T)
fa=(f-t(f))/2
contour (x,y,fa,nlevels =15)

#heat map plotting great for temperature in weather forcasts image()
image(x,y,fa) #this is a heat map command
#alternatively you can produice a three-dimensional plot using persp()
#with theta and phi control the angles at which the plot is viewed.
persp(x,y,fa ,theta =30)
persp(x,y,fa ,theta =30, phi =20)

