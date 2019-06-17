library(caret)
library(dplyr)
library(nnet)
library(parallel)
set.seed(123)
indexes <- createDataPartition(iris$Species, times = 1, p = 0.08, list = FALSE)

mini_iris <- iris[indexes,]

#folds <- createFolds(mini_iris$Species, 2, list = FALSE)
#mini_iris_train <- mini_iris[folds == 1,]
#mini_iris_test <- mini_iris[folds == 2,]

# fitControl <- trainControl(## 10-fold CV
#   method = "cv",
#   number = 2)

fitControl <- trainControl(method = "cv", number = 2)

# knn4Train(mini_iris_train[,-5], 
#           mini_iris_test[,-5], 
#           mini_iris_train$Species, 
#           ties = "randomly", 
#           developer = TRUE)

mini_iris <- as.data.frame(mini_iris) 

set.seed(123)
# train(Species ~ .,
#       data = mini_iris,
#       method = rknn,
#       trControl = fitControl)

# train(x =  iris[,-5],
#       y = iris[,5],
#       method = rknn,
#       # trControl = fitControl)


train(x =  mini_iris[,-5],
      y = mini_iris[,5],
      data = mini_iris,
      method = rknn,
      trControl = fitControl)


