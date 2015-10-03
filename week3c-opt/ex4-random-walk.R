
library(ggplot2);

x <- c(0, 0);

D <- matrix(nrow=100, ncol=2);
for(k in 1:100)
{ 
   x <- x + rnorm(2, 0, 1);
   D[k, ] <- x;
}

x <- D[, 1];
y <- D[, 2];
plot(x, y, type='l', xlim=c(-10, 10), ylim=c(-10, 10) );
 

