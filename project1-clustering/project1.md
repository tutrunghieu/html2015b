# Course project 1, image clustering

You are given the images inside the zip file mit8-images-64x64.zip which contains 2688 images in 8 categories.

You will have to work in the images to answer the following questions

### Q1. Find the feature selection function to convert an image into a vector

You have to describe your function and write your code in R

You have to load the dataset with 2688 vectors corresponding to 2688 images

```
library(jpeg);

# to read all the files in one folder
files <- list.files("C:/opt/images/mit8-images", full.name=TRUE);

# to read an image from one file in the list
img <- readJPEG(files[1]);

# to read an image from one file
img <- readJPEG("C:/opt/images/mit8-images/coast_arnat59.jpg");

# to display the image
img[1:3, 1:3, ]
```


### Q2. Divide the images into k clusters using kmeans.

You have to decide the number of clusters using training / testing errors.

You may have to try different seed number using set.seed(n) to figure out the numbers.

### Q3. Rendering the result in HTML page

You have to render the results in one html page which contains many groups (clusters).

Each cluster contains many members (images).


### Submission 

Please submit the code and the report on github.

Send the URL of your project to the reviewer for grading.

In your project, you have to create the file project-report.md in order to answer the above questions.



  