rm(list = ls());

trainBag <- function(D, kpar)
{ 
  mr <- nrow(D);

  M <- list();
  
  for(k in 1:kpar)
  { 
    x <- unique( as.integer( runif(100, 1, mr) ) );
    M[[k]] <- train(Species ~ ., method="rpart", data=D)
  }
  
  return(M);
}

predictBag <- function(M, D)
{
   mc <- length(M); 
   mr <- nrow(D); 
    
   for(k in 1:mc) 
   {
      D[, paste("y", k, sep="")] <- predict(M[[k]], D); 
   }
   
   return(D);
}

data(iris);

M <- trainBag(iris, 5);
y <- predictBag(M, iris);
print(y[1:20, ]);