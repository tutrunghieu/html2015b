library(jpeg);
img <- readJPEG("C:/opt/images/mit8-images/coast_arnat59.jpg");
print( img[1:5, 1:7, ] );

r_ch <- img[, , 1]; #first channel
g_ch <- img[, , 2]; #second channel
b_ch <- img[, , 3]; #third channel

print( dim(r_ch) );
print( dim(g_ch) );
print( dim(b_ch) );



