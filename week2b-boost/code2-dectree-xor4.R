rm(list=ls()); dev.off();
library(ggplot2); library(caret); 


h1 <- function(msg) { cat("\n", msg, "\n"); }


main <- function()
{
h1("-------------loading data");
x <- runif(7000, -10, 10);
y <- runif(7000, -20, 20);
z <- as.factor( 2*(x*y > 0) + (x>0) );
A <- data.frame(x, y, z);

h1("-------------rendering data");
print( qplot(x, y, color=z) );


h1("-------------model fitting");
M <- train(z ~ ., method="rpart", data=A)
cat("\n"); print(M$finalModel)
dev.new(); plot(M$finalModel, uniform=TRUE, main="Classification Tree");
text(M$finalModel, use.n=TRUE, all=TRUE, cex=.8)

h1("-------------testing if it fits");
y <- A$z;
y1 <- predict(M, newdata=A);
e1 <- abs(y != y1);
cat("\n"); print(head(data.frame( y, y1, e1 )));
cat("\n"); print(table( y1, y ));
cat("\n"); cat("Total error:", sum(e1), "\n");
} 

cat(rep("\n", 10)); main(); cat("\n");