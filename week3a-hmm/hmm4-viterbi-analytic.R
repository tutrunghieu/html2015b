rm(list=ls()); library(HMM); 

M <- initHMM(
   c("A","B", "C"), 
   c("x1", "x2", "y1", "y2", "z1", "z2"), 
   startProbs=c(1, 0, 0),
   transProbs=rbind(
      c(0, 1, 0), 
      c(0, 0, 1), 
      c(0.9, 0.1, 0)),
   emissionProbs=rbind(
        c(0.7, 0.3, 0, 0, 0, 0), 
        c(0, 0, 0.1, 0.9, 0, 0), 
        c(0, 0, 0, 0, 0.4, 0.6) )
);
# print(M);

Y <- c("x1", "y2"); alpha <- forward(M, Y); print(exp(alpha));
Y <- c("x1", "y2", "z1"); alpha <- forward(M, Y); print(exp(alpha));
Y <- c("x1", "y2", "z1", "x1"); alpha <- forward(M, Y); print(exp(alpha));



