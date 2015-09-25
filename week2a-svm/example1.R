rm(list = ls()); # to remove variable

library(caret); # for machine learning
library(e1071); # to use svm

data(iris);  #to load dataset

# print( iris ); # to print the data table
print( head(iris) ); # to print just first rows of the data table
print( iris[5:15, ] ); # to print just selected rows of the table



D <- read.csv("C:/Users/henrytu/Desktop/example1.csv", header=TRUE);
print(D);