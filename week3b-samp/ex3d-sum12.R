
sum12 <- function(n)
{ 
 x <- -6;
 for(k in 1:12) x <- x + runif(n, 0, 1);
 return(x);
}

t <- sum12(5000);
hist(t, breaks=30);
