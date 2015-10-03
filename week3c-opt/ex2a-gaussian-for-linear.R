rm(list = ls());


minimize <- function(f, m1, s1, m2, s2, n)
{
   x_star <- NA;
   f_star <- NA;

   for(k in 1:n)
   {
      xk <- rnorm(1, m1, s1);
      yk <- rnorm(1, m2, s2);
      fk <- f(xk, yk);
 
      if(k==1) { x_star = c(xk, yk); f_star = fk; }
      else if(fk < f_star) { x_star = c(xk, yk); f_star = fk; }
   }
   
   return( list(x=x_star, f=f_star) );
}

D <- rbind(
c(1, 2),
c(2, 4),
c(3, 6.1),
c(4, 7.9)
);

f <- function(a, b) {
 x <- D[, 1];
 y <- D[, 2];
 e <- a*x + b - y 
 return( sum(e*e) );
} 

minimize(f, 0, 10, 0, 20, 9000)


