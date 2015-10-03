rm(list = ls());


minimize <- function(f, x1, x2, y1, y2, n)
{
   x_star <- NA;
   f_star <- NA;

   for(k in 1:n)
   {
      xk <- runif(1, x1, x2);
      yk <- runif(1, y1, y2);
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

minimize(f, -100, 100, -500, 500, 900000)


