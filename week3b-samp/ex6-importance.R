rm(list=ls()); graphics.off(); library(ggplot2);

sampleImp <- function(n, f, q)
{
   x <- rep(NA, n);
   w <- rep(NA, n);

   for(k in 1:n)
   {
      xk <- q$samp();
      x[k] <- xk;
      w[k] <- f(xk) / q$eval(xk);
   } 
   
   return( cbind(x=x, w=w) );
}

f <- function(x){ 
  0.3*dnorm(x, -5, 1) + 0.1*dnorm(x, 0, 0.5) + 0.6*dnorm(x, 5, 0.5) };

q <- list(
   eval=function(x) { dunif(x, -10, 10) },
   samp=function() { runif(1, -10, 10) }
);

L <- sampleImp(5000, f, q);
plot(L[,1], L[, 2], xlim=c(-10, 10) );


