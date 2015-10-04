rm(list=ls()); library(jpeg); library(ggplot2);
setwd("C:/Users/henrytu/Desktop/project1-sample");
set.seed(1234);

load1 <- function(path, num=2688)
{

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
  img <- readJPEG(img);
  m1 <- colorAvg(img);
  m2 <- colorAvg2(img);
  m3 <- colorAvg3(img); 
  m <- rbind(m1, m2, m3);

  return( as.vector(m) );   
}

files <- list.files(path, full.name=TRUE);
num <- min(num, length(files));

df <- sapply(files[1:num], colorAvg123);
return( t(df) );
}


explore1 <- function(df, kpar)
{

eval <- function(X, L, C)
{
   n <- nrow(X);
   e <- rep(NA, n);

   for(k in 1:n)
   {
       Xk <- X[k, ];
       Ck <- C[L[k], ];
       e[k] <- mean( abs( Xk - Ck ) );
   }

   return( sum(e) );
}

   error <- c();

   for(k in kpar)
   {
     m <- kmeans(df, k, nstart=1, iter.max=10);  
     ek <-  eval(df, m$cluster, m$centers);
     cat(k, ek, "\n");
     error  <- c(error, ek);
   }

   plot(kpar, error, type="l");
}


plot1 <- function(df, kpar, fname)
{
m <- kmeans(df, kpar, nstart=1, iter.max=10);  
labels <- m$cluster;

N <- row.names(df);
G <- split(1:length(labels), labels);

sink(file=paste("output", kpar, ".html", sep=""), type="output");
for(g in names(G))
{
  cat("<h1>Group ", g, "</h1>\n");

  Gk <- G[[g]];
  for(k in Gk) cat("<img src='", N[k], "'> ", sep="");
  cat("\n");
}
sink(file=NULL);

}


df <- load1("data"); # print(head(df));
explore1(df, c(2, 3, 10, 15, 20, 30, 35, 40));
plot1(df, 15);
plot1(df, 20);

ls()