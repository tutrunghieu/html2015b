setwd("C:/Users/henrytu/Desktop/week3b-samp");

x <- rnorm(10000, 0, 1);

# histogram test
hist(x, breaks=50, xlim=c(-4, 4))

min(x)
max(x)
mean(x)

# quantile test
quantile(x, probs=c(0, 0.25, 0.5, 0.75, 1));