
p <- function(x)
{
 #  return ( dunif(x[1], -10, 10)*dnorm(x[2], -5, 5)*dnorm(x[3], -3, 3) );
   return ( dnorm(x[1], 0, 10)*dnorm(x[2], 0, 5)*dnorm(x[3], 0, 3) );
}

#p(0, 0, 0); p(-11, 0, 0)



sample <- function(X, d, p)
{
   X_star <- X;
   p_star <- 0;

   for(k in 1:100)
   {
     Xk <- X;
     Xk[d] <- runif(1, 0, 10);
     pk <- p(Xk);
     if(k==1) { X_star = Xk; p_star = pk; }
     else if(pk > p_star) { X_star = Xk; p_star = pk; } 
   }

   return(X_star);
} 

X1 <- c(0, 0, 0); 

X2 <- sample(X1, 1, p); X2
X3 <- sample(X2, 2, p); X3
X4 <- sample(X3, 3, p); X4

X5 <- sample(X4, 1, p); X5
X6 <- sample(X5, 2, p); X6
X7 <- sample(X6, 3, p); X7


maximize <- function(p, X, n)
{
   x_star <- NA;
   f_star <- NA;

   Xk <- X;
   d <- 1;
   for(k in 1:n)
   {
      Xk <- sample(Xk, d, p);
      d <- d + 1; if(d > length(X) ) d <- 1;
      pk <- p(Xk);
 
      if(k==1) { x_star = Xk; f_star = pk; }
      else if(pk > f_star) { x_star = Xk; f_star = pk; }
   }
   
   return( list(x=x_star, f=f_star) );
}

maximize(p, c(0, 0, 0), 1000);



