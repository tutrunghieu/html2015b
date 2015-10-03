rm(list = ls());


maximize <- function(f, x1, x2, y1, y2, n)
{
   x_star <- NA;
   f_star <- NA;

   for(k in 1:n)
   {
      xk <- runif(1, x1, x2);
      yk <- runif(1, y1, y2);
      fk <- f(xk, yk);
 
      if(k==1) { x_star = c(xk, yk); f_star = fk; }
      else if(fk > f_star) { x_star = c(xk, yk); f_star = fk; }
   }
   
   return( list(x=x_star, f=f_star) );
}

D <- rnorm(1000, 1, 3);

f <- function(m, s) 
{ 
    x <- (D - m);
    x <- sum( x*x );
    s <- 2*s*s; 
    return( exp(-x/s) );
}

maximize(f, -10, 10, 0.001, 5, 100000)


