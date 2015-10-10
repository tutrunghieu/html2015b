graphics.off();
library(stats);
data(iris);
table(iris$Species);

d <- dist( (iris[, 1:4]) );

h = hclust(d, method="complete");
plot(h)

labels <- cutree(h, k=3); 
labels
