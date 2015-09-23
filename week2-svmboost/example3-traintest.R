rm(list=ls()); library(caret); library(e1071);

traintest <- function(A, B) 
{ 
  A <- iris;
  x <- subset(A, select=-c(Species));
  y <- subset(A, select=c(Species));
  M <- svm(x, y, type='C', kernel='polynomial', degree=3);
  print(M);
  x <- subset(A, select=-c(Species));
  y <- A[, "Species"]; 
  y1 <- predict (M, x); 
  e1 <- abs(y1 != y);
  cat("Training error:", sum(e1)/nrow(A), "\n");
  x <- subset(B, select=-c(Species));
  y <- B[, "Species"]; 
  y1 <- predict (M, x); 
  e1 <- abs(y1 != y);
  cat("Testing error:", sum(e1)/nrow(B) , "\n");
}

data(iris);
set.seed(4321);
S <- createDataPartition(iris$Species, p=0.7, list=FALSE);
A <- iris[S, ]; B <- iris[-S, ];
traintest(A, B);

set.seed(123);
S <- createDataPartition(iris$Species, p=0.7, list=FALSE);
A <- iris[S, ]; B <- iris[-S, ];
traintest(A, B);

set.seed(125);
S <- createDataPartition(iris$Species, p=0.7, list=FALSE);
A <- iris[S, ]; B <- iris[-S, ];
traintest(A, B);
