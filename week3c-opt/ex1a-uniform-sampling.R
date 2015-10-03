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


f <- function(x, y) { x <- x-10; y <- y-20; x*x + y*y }

# f(10, 20); f(10, 21); f(12, 20); f(12, 21)

minimize(f, -10, 10, -20, 20, 1000)


