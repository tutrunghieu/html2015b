rm(list=ls()); library(jpeg); library(ggplot2);

setwd("C:/Users/henrytu/Desktop/project1-sample");
set.seed(1234);
source("utils.R");

load1 <- function(path, num=2688)
{
  files <- list.files(path, full.name=TRUE, pattern="jpg");
  num <- min(num, length(files));

  df <- sapply(files[1:num], colorAvg123);
  return( t(df) );
}

explore1 <- function(df, kpar)
{
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


df <- load1("data"); 
explore1(df, c(2, 3, 10, 15, 20, 30, 35, 40));
plot1(df, 15);
plot1(df, 20);