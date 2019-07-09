library(caret)
library(dplyr)
library(nnet)
library(parallel)

set.seed(1234)
indexes <- createDataPartition(iris$Species, times = 1, p = 0.08, list = FALSE)
mini_iris <- iris[indexes,]
mini_iris <- as.data.frame(mini_iris) 
rownames(mini_iris) <- paste0("X", 1:nrow(mini_iris))


itest <- c(4,8,12)
mini_iris_train <- mini_iris[-itest,]
mini_iris_test <- mini_iris[itest,]
set.seed(123)
sink("experiments/examples/iris_rknn")

for(i in 22:100) {
  set.seed(i)
  indexes <- createDataPartition(iris$Species, times = 1, p = 0.08, list = FALSE)
  mini_iris <- iris[indexes,]
  mini_iris <- as.data.frame(mini_iris) 
  rownames(mini_iris) <- paste0("X", 1:nrow(mini_iris))
  itest <- c(4,8,12)
  mini_iris_train <- mini_iris[-itest,]
  mini_iris_test <- mini_iris[itest,]
  set.seed(123)
out <- knn4Train(mini_iris_train[,-5], mini_iris_test[,-5], mini_iris_train$Species,
          k = 3, rr = "plurality", 
          atttype = "custom", ties = "randomly", developer = TRUE)
po <- predict_using_por(out, ties = "randomly", k = 1)
outm <- dknnfTrain(mini_iris_train[,-5], mini_iris_test[,-5], mini_iris_train$Species,
                   k = 1, distance = "manhattan", ties = "randomly", developer = TRUE)
pom <- predict_for_k(outm$distances, outm$cl, "randomly", k = 1)
oute <- dknnfTrain(mini_iris_train[,-5], mini_iris_test[,-5], mini_iris_train$Species,
                   k = 1, distance = "euclidean", ties = "randomly", developer = TRUE)
poe <- predict_for_k(oute$distances, outm$cl, "randomly", k = 1)
outc <- dknnfTrain(mini_iris_train[,-5], mini_iris_test[,-5], mini_iris_train$Species,
                   k = 1, distance = "chebyshev", ties = "randomly", developer = TRUE)
poc <- predict_for_k(outc$distances, outm$cl, "randomly", k = 1)
  if(sum(po!=pom) >= 1){
    stop(i)
  }
  if(sum(po!=poe) >= 1){
    stop(i)
  }
}
sink()
