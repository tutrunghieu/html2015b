rm(list = ls()); library(jpeg);

colorAvg <- function(img)
{
  r <- mean(img[,,1]);
  g <- mean(img[,,2]);
  b <- mean(img[,,3]);
  return( c(r, g, b) );
}

colorAvg2 <- function(img)
{
   mr = nrow(img);
   mc = ncol(img);
   mr <- mr / 2;
   mc <- mc / 2;

   a1 <- img[1:mr, 1:mc, ];
   a2 <- img[1:mr + mr, 1:mc, ];
   a3 <- img[1:mr, 1:mc + mc, ];
   a4 <- img[1:mr + mr, 1:mc + mc, ];
  
   v1 <- colorAvg(a1);
   v2 <- colorAvg(a2);
   v3 <- colorAvg(a3);
   v4 <- colorAvg(a4);
   
   m <- rbind(v1, v2, v3, v4);

   return(m);   
}

colorAvg3 <- function(img)
{
   mr = nrow(img);
   mc = ncol(img);
   mr <- mr / 2;
   mc <- mc / 2;

   a1 <- img[1:mr, 1:mc, ];
   a2 <- img[1:mr + mr, 1:mc, ];
   a3 <- img[1:mr, 1:mc + mc, ];
   a4 <- img[1:mr + mr, 1:mc + mc, ];
  
   v1 <- colorAvg2(a1);
   v2 <- colorAvg2(a2);
   v3 <- colorAvg2(a3);
   v4 <- colorAvg2(a4);
   
   m <- rbind(v1, v2, v3, v4);

   return(m);   
}

colorAvg123 <- function(img)
{
  m1 <- colorAvg(img);
  m2 <- colorAvg2(img);
  m3 <- colorAvg3(img); 
  m <- rbind(m1, m2, m3);

  return( as.vector(m) );   
}

colorAvgSpatialTable <- function(files, dpar=21*3)
{

   X <- matrix(nrow=length(files), ncol=dpar);

   for(k in 1:length(files))
   { 
     ik <- readJPEG(files[k]);
     X[k, ] <- colorAvg123(ik);
   }

   return(X);
}

files <- list.files("C:/opt/images/mit8-images", full.name=TRUE);

X <- colorAvgSpatialTable(files[1:10]);
X[, 1:7]

