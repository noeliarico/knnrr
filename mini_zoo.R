mini_zoo <- zoo %>% filter(type == 4 | type == 2 | type == 7) %>% 
  #mutate_all(.funs=list(~as.numeric(.)))  %>% 
  #select_if(function(col) length(unique(col)) > 1)
  select(-one_of("legs")) %>%
  select_if(function(col) return(length(unique(col)) > 1))
  
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
sink.reset()
