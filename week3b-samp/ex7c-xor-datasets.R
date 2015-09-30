
n <- 9000;
x <- runif(n, -10, 10);
y <- runif(n, -50, 50);
z <- as.factor( x*y > 0 );
z <- as.factor( 2*(x*y > 0) + (x>0) );

qplot(x, y, color=z);
