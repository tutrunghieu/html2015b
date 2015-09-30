graphics.off();

boxMuller <- function(n) 
{ 
U1 <- runif(n, 0, 1);
U2 <- runif(n, 0, 1);
x <- sqrt(-2*log(U1))*cos(2*pi*U2);
return(x);
}


z <- boxMuller(5000);
hist(z, breaks=30);
