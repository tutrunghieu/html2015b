rm(list=ls()); dev.off();
library(ggplot2); library(caret); 


h1 <- function(msg) { cat("\n", msg, "\n"); }


main <- function()
{
h1("-------------loading data");
x <- runif(1000, -10, 10);
y <- runif(1000, -20, 20);
z <- as.factor( ifelse(x*y > 0, "face", "back") );
A <- data.frame(x, y, z);

h1("-------------rendering data");
print( qplot(x, y, color=z) );


h1("-------------model fitting");
M <- train(z ~ ., method="rf", data=A)
print(M);

h1("-------------testing if it fits");
y <- A$z;
y1 <- predict(M, newdata=A);
e1 <- abs(y != y1);
cat("\n"); print(head(data.frame( y, y1, e1 )));
cat("\n"); print(table( y1, y ));
cat("\n"); cat("Total error:", sum(e1), "\n");

h1("-------------testing if it handles new input");
x <- runif(5000, -100, 100);
y <- runif(5000, -200, 200);
z <- as.factor( ifelse(x*y > 0, "face", "back") );
B <- data.frame(x, y, z);

y <- B$z;
y1 <- predict(M, newdata=B);
e1 <- abs(y != y1);
cat("\n"); print(head(data.frame( y, y1, e1 )));
cat("\n"); print(table( y1, y ));
cat("\n"); cat("Total error:", sum(e1), "\n");

} 

cat(rep("\n", 10)); main(); cat("\n");