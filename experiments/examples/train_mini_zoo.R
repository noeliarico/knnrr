mini_zoo <- zoo %>% mutate(type = factor(zoo$type, levels = 1:7, labels = c("Mammal", "Bird", "Reptile", "Fish", "Amphibian", "Bug", "Invertebrate")))
mini_zoo <- mini_zoo %>% filter(type == "Fish" | type == "Bird" | type == "Invertebrate") %>% 
  #mutate_all(.funs=list(~as.numeric(.)))  %>% 
  #select_if(function(col) length(unique(col)) > 1)
  select(-one_of("legs")) %>%
  select_if(function(col) return(length(unique(col)) > 1)) %>% droplevels()
  
set.seed(123)
indexes <- createDataPartition(mini_zoo$type, p = 0.5, list = FALSE)
mini_zoo <- mini_zoo[indexes,]

mini_zoo <- mini_zoo %>% 
  #mutate_all(.funs=list(~as.numeric(.)))  %>% 
  select_if(function(col) length(unique(col)) > 1)

set.seed(123)
indexes <- createDataPartition(mini_zoo$type, p = 0.8, list = FALSE)
mini_zoo_train <- mini_zoo[indexes,]
mini_zoo_test <- mini_zoo[-indexes,]

rm(indexes)

sink("zoo_jaccard_randomly")
set.seed(123)
out <- dknnfTrain(mini_zoo_train[,-13], mini_zoo_test[,-13], mini_zoo_train$type,
                  k = 3, distance = "jaccard", ties = "randomly", developer = TRUE)
predict_for_k(out$distances, out$cl, "randomly")
sink()

sink("zoo_matching_randomly")
set.seed(123)
out <- dknnfTrain(mini_zoo_train[,-13], mini_zoo_test[,-13], mini_zoo_train$type,
                  k = 3, distance = "matching", ties = "randomly", developer = TRUE)
predict_for_k(out$distances, out$cl, "randomly")
sink()

sink("zoo_nominal_randomly_avg")
set.seed(123)
out <- dknnfTrain(mini_zoo_train[,-13], mini_zoo_test[,-13], mini_zoo_train$type,
                  k = 3, distance = "nominal_avg", ties = "randomly", developer = TRUE)
predict_for_k(out$distances, out$cl, "randomly")

sink()

sink("zoo_nominal_randomly_add")
set.seed(123)
out <- dknnfTrain(mini_zoo_train[,-13], mini_zoo_test[,-13], mini_zoo_train$type,
                  k = 3, distance = "nominal_add", ties = "randomly", developer = TRUE)
predict_for_k(out$distances, out$cl, "randomly")

sink()

sink("zoo_chebyshev_randomly")
set.seed(123)
out <- dknnfTrain(mini_zoo_train[,-13], mini_zoo_test[,-13], mini_zoo_train$type,
                  k = 3, distance = "chebyshev", ties = "randomly", developer = TRUE)
predict_for_k(out$distances, out$cl, "randomly")
sink()

set.seed(123)
out <- knn4Train(mini_zoo_train[,-13], mini_zoo_test[,-13], mini_zoo_train$type,
                  k = 3, rr = "borda_count", atttype = "custom", 
                  ties = "randomly", developer = TRUE)
predict_using_por(out, k = 3, ties = "randomly")

sink("zoo_jaccard_threshold")
set.seed(123)
out <- dknnfTrain(mini_zoo_train[,-13], mini_zoo_test[,-13], mini_zoo_train$type,
                  k = 4, distance = "jaccard", ties = "threshold", developer = TRUE)
predict_for_k(out$distances, out$cl, "threshold", k = 4)
sink()


sink("experiments/examples/zoo_rknn")
set.seed(123)
out <- knn4Train(mini_zoo_train[,-13], mini_zoo_test[,-13], mini_zoo_train$type,
                 k = 3, rr = "borda_count", atttype = "custom", 
                 ties = "threshold", developer = TRUE)
predict_using_por(out, k = 3, ties = "threshold")
sink()
