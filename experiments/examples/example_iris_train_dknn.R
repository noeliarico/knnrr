sink.reset <- function(){
  for(i in seq_len(sink.number())){
    sink(NULL)
  }
}

library(caret)
library(dplyr)
library(nnet)
library(parallel)

data("iris")

set.seed(123)
indexes <- createDataPartition(iris$Species, times = 1, p = 0.08, list = FALSE)
mini_iris <- iris[indexes,]
row.names(mini_iris) <- c(LETTERS[1:3], "X1", LETTERS[4:6], "X2", LETTERS[7:9], "X3")


set.seed(123)
itest <- c(1,5,9)
mini_iris_train <- mini_iris[-itest,]
mini_iris_test <- mini_iris[itest,]
sink("iris_euclidean_randomly")
set.seed(123)
out <- dknnfTrain(mini_iris_train[,-5], mini_iris_test[,-5], mini_iris_train$Species,
          k = 3, distance = "euclidean", ties = "randomly", developer = TRUE)
predict_for_k(out$distances, out$cl, "randomly")
sink("iris_manhattan_randomly")
set.seed(123)
out <- dknnfTrain(mini_iris_train[,-5], mini_iris_test[,-5], mini_iris_train$Species,
          k = 3, distance = "manhattan", ties = "randomly", developer = TRUE)
predict_for_k(out$distances, out$cl, "randomly")
sink("iris_chebyshev_randomly")
set.seed(123)
out <- dknnfTrain(mini_iris_train[,-5], mini_iris_test[,-5], mini_iris_train$Species,
          k = 3, distance = "chebyshev", ties = "randomly", developer = TRUE)
predict_for_k(out$distances, out$cl, "randomly")

sink.reset()
