rm(list = ls());
library(jpeg);


colorHist <- function(img)
{
   img <- round( round(255 * img )/ 16 );

   mr = nrow(img[,,1]);
   mc = ncol(img[,,1]);

   h <- array(0*1:4096, c(16, 16, 16) );

   for(r in 1:mr) for(c in 1:mc) 
   {
     rk <- img[r, c, 1] + 1;
     gk <- img[r, c, 2] + 1;
     bk <- img[r, c, 3] + 1;

    h[rk, gk, bk] <- h[rk, gk, bk] + 1;
   }

   return( as.integer(h) );
}


# to read all the files in one folder
files <- list.files("C:/Users/henrytu/Desktop/images", full.name=TRUE);

i1 <- readJPEG(files[1]); h1 <- colorHist(i1); print( c(min(h1), max(h1), which(h1>0) ));
i1 <- readJPEG(files[2]); h1 <- colorHist(i1); print( c(min(h1), max(h1), which(h1>0) ) );
i1 <- readJPEG(files[3]); h1 <- colorHist(i1); print( c(min(h1), max(h1), which(h1>0) ) );

