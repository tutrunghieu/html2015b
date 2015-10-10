library(kernlab)

data(spirals)
m <- specc(spirals, centers=2)

centers(m)
size(m)
withinss(m)

plot(spirals, col=m)
