rm(list=ls()); dev.off();
library(ggplot2); library(caret); 

h1 <- function(msg) { cat("\n", msg, "\n"); }

main <- function()
{
h1("-------------loading data");
data(iris); 
cat("\n"); print( names(iris) );
cat("\n"); print( table(iris$Species) );

h1("-------------splitting data");
S <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)
A <- iris[S,]; B <- iris[-S,]; 
cat("\n"); print(head(A)); 
cat("\n"); print(head(B));

h1("-------------plotting data");
dev.new(); 
print( qplot(Petal.Width, Sepal.Width, colour=Species, data=A) );
dev.new(); 
print( qplot(Petal.Width, Petal.Length, colour=Species, data=A) );


h1("-------------model fitting");
M <- train(Species ~ ., method="rpart", data=A)
cat("\n"); print(M$finalModel)
dev.new(); plot(M$finalModel, uniform=TRUE, main="Classification Tree");
text(M$finalModel, use.n=TRUE, all=TRUE, cex=.8)

h1("-------------testing if it fits");
y <- A$Species;
y1 <- predict(M, newdata=A);
e1 <- abs(y != y1);
cat("\n"); print(head(data.frame( y, y1, e1 )));
cat("\n"); print(table( y1, y ));

h1("-------------testing if it handles new input");
y <- B$Species;
y1 <- predict(M, newdata=B);
e1 <- abs(y != y1);
cat("\n"); print(head(data.frame( y, y1, e1 )));
cat("\n"); print(table( y1, y ));
} 

cat(rep("\n", 10)); main(); cat("\n");