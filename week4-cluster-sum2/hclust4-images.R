rm(list=ls());

set.seed(1234);
setwd("C:/Users/henrytu/Desktop");
source("utils.R");

load1 <- function(path, num=2688)
{
  files <- list.files(path, full.name=TRUE, pattern="jpg");
  num <- min(num, length(files));

  df <- sapply(files[1:num], colorAvg123);
  return( t(df) );
}
df <- load1("data", 1000);
df

h = hclust(dist(df), method="complete");
dev.new(); plot(h);

labels <- cutree(h, k=2); # df <- cbind(df, labels); df
labels

