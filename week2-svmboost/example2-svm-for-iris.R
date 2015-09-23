rm(list=ls()); library(caret); library(e1071);
data(iris);
set.seed(4321);

A <- iris;
x <- subset(A, select=-c(Species));
y <- subset(A, select=c(Species));
M <- svm(x, y, type='C', kernel='polynomial', degree=3);
print(M);

x <- subset(A, select=-c(Species));
y <- A[, "Species"]; 

y1 <- predict (M, x); 
e1 <- abs(y1 != y);

print(head(data.frame( y, y1, e1 )));
print(data.frame( key="Total error", val=sum(e1) ));
table(y1, y);

