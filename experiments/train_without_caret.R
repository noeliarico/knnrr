train_keel  <- function(train, test, verbose = FALSE) {
  
  train_features <- train[,-1]
  train_class <- train[,1]
  test_features <- test[,-1]
  test_class <- test[,1]
  
  distances <- get_distances("numerical")
  ks = c(1,2,3,5,7)
  ranking_rules <- c("plurality", "borda_count", "two", "three", "five", "seven")
  method <- c(distances, ranking_rules)
  grid <- expand.grid(method = method, k = ks, F1 = 0, Balanced_Accuracy = 0, Kappa = 0) %>% 
    mutate(k = as.factor(k),
           method = as.factor(method))
  
  for(d in distances) {
    out <- dknnfTrain(train_features, test_features, cl = train_class,
                      distance = d, ties = "randomly", verbose = verbose, developer = verbose)
    for(the_k in ks) {
      pred <- factor(predict_for_k(out$distances, out$cl, ties = "randomly", k = the_k), levels = levels(train_class))
      cm <- caret::confusionMatrix(pred, test_class)
      if(length(unique(train_class)) > 2) {
        v <- cm$byClass[,'F1']
        v[is.na(v)] <- 0
        f <- mean(v)
        v <- cm$byClass[,'Balanced Accuracy']
        v[is.na(v)] <- 0
        ba <- mean(v)
      }
      else {
        f <- F_meas(cm$table)
        ba <- cm$byClass['Balanced Accuracy']
      }
      grid <- grid %>% 
        mutate(F1 = replace(F1, (method == d & k == the_k), f), 
               Balanced_Accuracy = replace(Balanced_Accuracy, (method == d & k == the_k), ba), 
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
      if(length(unique(train_class)) > 2) {
        v <- cm$byClass[,'F1']
        v[is.na(v)] <- 0
        f <- mean(v)
        v <- cm$byClass[,'Balanced Accuracy']
        v[is.na(v)] <- 0
        ba <- mean(v)
      }
      else {
        f <- F_meas(cm$table)
        ba <- cm$byClass['Balanced Accuracy']
      }
      grid <- grid %>% 
        mutate(F1 = replace(F1, (method == the_rr & k == the_k), f), 
               Balanced_Accuracy = replace(Balanced_Accuracy, (method == the_rr & k == the_k), ba), 
               Kappa = replace(Kappa, (method == the_rr & k == the_k), cm$overall['Kappa'])) %>%
        as.data.frame()
    }
  }
  
  grid <- grid %>% mutate(type = ifelse(method %in% distances, "distance", "rr"))
  return(grid)
}
