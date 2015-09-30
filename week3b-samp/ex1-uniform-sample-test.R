setwd("C:/Users/henrytu/Desktop/week3b-samp");

x <- runif(5000, -5, 7);

# histogram test
hist(x, breaks=20, xlim=c(-6, 8))

min(x)
max(x)
mean(x)

# quantile test
quantile(x, probs=c(0, 0.25, 0.5, 0.75, 1));