library(caret)
library(dplyr)
library(nnet)
library(parallel)

set.seed(123)
indexes <- createDataPartition(iris$Species, times = 1, p = 0.08, list = FALSE)
mini_iris <- iris[indexes,]
mini_iris <- as.data.frame(mini_iris) 

set.seed(123)
itest <- c(4,8,12)
mini_iris_train <- mini_iris[-itest,]
mini_iris_test <- mini_iris[itest,]
sink("experiments/iris_rknn")
knn4Train(mini_iris_train[,-5], mini_iris_test[,-5], mini_iris_train$Species,
          k = 3, rr = "plurality", atttype = "custom", ties = "randomly", developer = TRUE)
sink()
