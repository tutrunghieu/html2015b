grahics.off();

n <- 100;
x <- runif(n, -100, 100);
y <- runif(n, -200, 200);

plot(x, y,);



n <- 1000;
x <- runif(n, -100, 100);
y <- runif(n, -200, 200);

dev.new(); plot(x, y,);
