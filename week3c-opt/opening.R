setwd("C:/Users/henrytu/Desktop/week3c-opt");

openfile <- function(name)
{
  if(!file.exists(name)) file.create(name);
  file.edit(name);
}

# openfile("ex1a-uniform-sampling.R");

L <- list.files(".");
L <- L[ (L != "opening.R") ];
sapply(L, openfile);
