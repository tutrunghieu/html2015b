rm(list=ls()); graphics.off(); set.seed(1234); 

show <- function(df)
{
  h = hclust(dist(df), method="complete");
  dev.new(); plot(h);

  labels <- cutree(h, k=3); 
}

x <- cbind( c(1, 2, 4, 5, 6, 6.5) ); show(x);
x <- cbind( c(1, 2, 4, 5, 6, 7) ); show(x);
x <- cbind( c(1, 2, 4, 5, 6, 8) ); show(x);

