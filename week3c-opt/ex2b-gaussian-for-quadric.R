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


f <- function(x, y) { x <- x-10; y <- y-20; x*x + y*y }
minimize(f, 0, 10, 0, 20, 5000)


