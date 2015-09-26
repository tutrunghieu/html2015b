rm(list = ls()); 
library(jpeg);

colorAvg <- function(img)
{
  r <- mean(img[,,1]);
  g <- mean(img[,,2]);
  b <- mean(img[,,3]);
  return( c(r, g, b) );
}

colorAvgTable <- function(files)
{
  X <- matrix(nrow=length(files), ncol=3);

  for(k in 1:length(files))
  { 
     ik <- readJPEG(files[k]);
     X[k, ] <- colorAvg(ik);
   }
   return(X);
}

files <- list.files("C:/opt/images/mit8-images", full.name=TRUE);
X <- colorAvgTable(files[1:10]);
X
