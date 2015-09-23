rm(list = ls()); # to remove variable

library(caret); # for machine learning
library(e1071); # to use svm

data(iris);  #to load dataset

# print( iris ); # to print the data table
print( head(iris) ); # to print just first rows of the data table
print( iris[5:15, ] ); # to print just selected rows of the table



D <- read.csv("C:/Users/henrytu/Desktop/example1.csv", header=TRUE);
print(D);

M <- lm(y ~ x, D);
print(M);

y <- D$y; #The ground-truth values in the dataset 
y1 <- predict(M, D); #The predict valuese by the model M
e1 <- abs(y - y1);

print( data.frame(y, y1, e1));
print( sum(e1) );


D$xx <- D$x * D$x;
print(D);

M <- lm(y ~ x + xx, D);
print(M);

y <- D$y; #The ground-truth values in the dataset 
y1 <- predict(M, D); #The predict valuese by the model M
e1 <- abs(y - y1);

print( data.frame(y, y1, e1));
print( sum(e1) );


