rm(list=ls()); graphics.off(); library(ggplot2);

sampleReject <- function(n, f, g)
{
   x <- rep(NA, n);

   cnt <- 0;
   while(cnt < n)
   {
      xk <- g();
      uk <- runif(1, 0, 1);
      if( uk < f(xk) ) { cnt <- cnt + 1; x[cnt] <- xk; }
   } 
   
   return(x);
}

f <- function(x){ 0.3*dnorm(x, -5, 1) + 0.1*dnorm(x, 0, 0.5) + 0.6*dnorm(x, 5, 0.5) }

q <- function(x){ runif(1, -10, 10) } 

X <- sampleReject(5000, f, q);

hist(X, breaks=70, xlim=c(-10, 10) );

