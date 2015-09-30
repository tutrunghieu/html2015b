graphics.off();

x <- 1:100;
plot(x, 2*x + 3, xlim=c(0, 100), ylim=c(0, 200), type="l");


x <- 1:100;
e <- rnorm(length(x), 0, 10);
y <- 2*x + 10 + e;
plot(x, y, xlim=c(0, 100), ylim=c(0, 200), type="l");

M <- lm(y ~ x);
M