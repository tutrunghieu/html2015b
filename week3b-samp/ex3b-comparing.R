setwd("C:/Users/henrytu/Desktop/week3b-samp");

x <- rnorm(10000, 0, 1);
hist(x, breaks=50, xlim=c(-10, 10))


x <- rnorm(10000, 0, 5);
dev.new(); hist(x, breaks=50, xlim=c(-10, 10))
