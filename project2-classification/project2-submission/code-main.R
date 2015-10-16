rm(list=ls()); library(jpeg); library(ggplot2); library(caret); library(e1071);


setwd("C:/Users/henrytu/Desktop/project2-sample");
set.seed(1234);
source("code-utils.R");

## to get path from class
split1 <- function(x)
{
  y <- strsplit(x, "[/_]"); 
  return( y[[1]][2] );
}

print1 <- function(df)
{
  print( dim(df) );
  print( table(df$tag) );
}


## to load the data
load1 <- function(path, num=2688)
{
  if( file.exists("data.csv") ) 
  {
     df <- read.csv("data.csv"); 
     num <- min(num, nrow(df));
     df <- df[1:num, ];
  } else {
 
    files <- list.files(path, full.name=TRUE, pattern="jpg");
    num <- min(num, length(files));

    df <- sapply(files[1:num], colorAvg123);
    df <- data.frame( t(df) );

    df$source <- row.names(df);
    df$tag <- sapply(df$source, split1);

     write.table(df, file="data.csv", sep=",", row.names=FALSE);
  }  
  
  return(df);
}


## to measure the testing/training error to make sure that we have a reliable model
error1 <- function(M, x, y)
{
    y1 <- predict(M, newdata=x);
    e1 <- sum(y != y1); 
    print( table(y1, y) );
    return( e1 / length(y) );
}

## to fit the model to the training data and to show the error
fit1 <- function(df, mod1, mr, mc)
{
      cat("-------Original\n");
      print1(df);

      sink(file=paste("output-", mod1, "-mr", mr, "-mc", mc, ".txt", sep=""), type="output");

	cat("-------Sliced\n"); 
	x <- runif(mr, 1, nrow(df));
	df <- df[x, c(1:mc, 65)];
      print1(df);

	cat("-------Splitting\n"); 
	coin <- 0.7; cat("Training coin: ", coin, "\n");
	S <- createDataPartition(y=df$tag, p=coin, list=FALSE);
	A <- df[S,]; print1(A);
	B <- df[-S,];print1(B);

	cat("-------Fitting\n"); 
	M <- train(tag ~ ., method=mod1, data=A);
	cat("Model size: ", length(M), "\n");

	cat("-------Evaluation\n"); 
      print( error1(M, A, A$tag) );
      print( error1(M, B, B$tag) );

      sink(file=NULL);
}


plot1 <- function(df)
{
	cat("-------Slicing\n"); 
	x <- runif(2000, 1, nrow(df));
	df <- df[x, ];
      print1(df);

	cat("-------Splitting\n"); 
	coin <- 0.7; cat("Training coin: ", coin, "\n");
	S <- createDataPartition(y=df$tag, p=coin, list=FALSE);
	A <- df[S, c(1:50, 65)]; print1(A);
	B <- df[-S, c(1:50, 64, 65)];print1(B);

	cat("-------Fitting\n"); 
	M <- train(tag ~ ., method="rf", data=A);
	cat("Model size: ", length(M), "\n");

      labels <- predict(M, newdata=B);
      G <- split(1:length(labels), labels);
      N <- as.vector(B$source); 
 
      sink(file="output-enduser.html", type="output");
      for(g in names(G))
      {
         cat("<h1>", g, "</h1>\n");

         Gk <- G[[g]]; 
     
         for(k in Gk) cat("<img src='", N[k], "'> ", sep="");
         cat("\n");
      }

      sink(file=NULL);
}

main <- function() 
{ 
  cat( rep("\n", 10) );
  df <- load1("data"); 

  # fit1(df, "rf", 2000, 10);
  # fit1(df, "rf", 2000, 20);
  # fit1(df, "rf", 2000, 50);
  # fit1(df, "rf", 2000, 63);

  # fit1(df, "rpart", 2000, 10);
  # fit1(df, "rpart", 2000, 20);
  # fit1(df, "rpart", 2000, 50);
  # fit1(df, "rpart", 2000, 63);

  # fit1(df, "gbm", 2000, 10);
  # fit1(df, "gbm", 2000, 20);
  # fit1(df, "gbm", 2000, 50);
  # fit1(df, "gbm", 2000, 63);

  # plot1(df);
}

main();