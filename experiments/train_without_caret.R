noelia_train  <- function(train, test, class_index, verbose = FALSE) {
  
  train_features <- train[,-class_index]
  train_class <- train[,class_index]
  test_features <- test[,-class_index]
  test_class <- test[,class_index]
  
  distances <- get_distances("numerical")
  ks = c(1,2,3,5,7)
  ranking_rules <- c("plurality", "borda_count", "two", "three", "five", "seven")
  method <- c(distances, ranking_rules)
  grid <- expand.grid(method = method, k = ks, F1 = 0, Kappa = 0) %>% 
    mutate(k = as.factor(k),
           method = as.factor(method))
  
  
  for(d in distances) {
    out <- dknnfTrain(train_features, test_features, cl = train_class,
                      distance = d, ties = "randomly", verbose = verbose, developer = verbose)
    for(the_k in ks) {
      pred <- factor(predict_for_k(out$distances, out$cl, ties = "randomly", k = the_k), levels = levels(train_class))
      cm <- caret::confusionMatrix(pred, test_class)
      if(nrow(cm$byClass) > 1) {
        v <- cm$byClass[,'F1']
        v[is.na(v)] <- 0
        print(v)
        f <- mean(v)
        print(f)
      }
      else {
        f <- F_meas(cm$table)
      }
      grid <- grid %>% 
        mutate(F1 = replace(F1, (method == d & k == the_k), f), 
               Kappa = replace(Kappa, (method == d & k == the_k), cm$overall['Kappa'])) %>%
        as.data.frame()
      
    }
  }
  
  for(the_rr in ranking_rules) {
    out <- knn4Train(train_features, test_features, cl = train_class, 
                     rr = the_rr, atttype = "numerical", developer = verbose)
    for(the_k in ks) {
      pred <- factor(predict_using_por(out, ties = "randomly", k = the_k), levels = levels(train_class))
      cm <- caret::confusionMatrix(pred, test_class)
      if(nrow(cm$byClass) > 1) {
        v <- cm$byClass[,'F1']
        v[is.na(v)] <- 0
        print(v)
        f <- mean(v)
        print(f)
      }
      else {
        f <- F_meas(cm$table)
      }
      grid <- grid %>% 
        mutate(F1 = replace(F1, (method == the_rr & k == the_k), f), 
               Kappa = replace(Kappa, (method == the_rr & k == the_k), cm$overall['Kappa'])) %>%
        as.data.frame()
    }
  }
  
  grid <- grid %>% mutate(type = ifelse(method %in% distances, "distance", "rr"))
  return(grid)
}