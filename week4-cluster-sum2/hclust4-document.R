rm(list=ls());

D <- list(
c("I", "love", "you"),
c("I", "love", "you", "love", "you"),
c("I", "love", "you", "I", "love", "you"),
c("they", "hate", "him"),
c("they", "hate", "him", "hate", "him", "hate", "him"),
c("they", "hate", "him", "they", "hate", "hate", "hate", "him")
); 

wordHist <- function(D, V = c("I", "love", "you", "they", "hate", "him"))
{
  H <- factor(D, labels=V, levels=V);
  return( table(H) );
}

df <- t(sapply(D, wordHist) );
df

h = hclust(dist(df), method="complete");
dev.new(); plot(h);

labels <- cutree(h, k=2); # df <- cbind(df, labels); df
labels

