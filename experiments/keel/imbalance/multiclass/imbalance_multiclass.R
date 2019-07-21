# contraceptiven -----------------------------------------------------------------

out <- fitNum(mini_contraceptiven)
fit_mini_contraceptiven_d <- out$fitd
fit_mini_contraceptiven_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- contraceptiven ---> ", now(), "\n"))
sink()

# contraceptive -----------------------------------------------------------------

out <- fitMix(mini_contraceptive)
fit_mini_contraceptive_d <- out$fitd
fit_mini_contraceptive_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- contraceptiven ---> ", now(), "\n"))
sink()

# glass -----------------------------------------------------------------

# con t3 da los mejores resultados
# set.seed(123)
# train_features <- createDataPartition(glass$typeGlass, p = 0.8, list = FALSE)
# train_features <- glass[train_features,]
# test_features <- glass[-train_features,]
# out <- knn4Train(train_features[,-10], test_features[,-10], cl = train_features[,10], 
#                  rr = "three", atttype = "numerical", developer = TRUE)
# pred <- factor(predict_using_por(out, ties = "randomly", k = 1), levels = train_features[,-10])
# cm <- caret::confusionMatrix(pred, test_features[,10])

# new_thyroid -----------------------------------------------------------------

out <- fitNum(new_thyroid)
fit_new_thyroid_d <- out$fitd
fit_new_thyroid_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- new_thyroid ---> ", now(), "\n"))
sink()

# penbased -----------------------------------------------------------------

out <- fitNum(mini_penbased)
fit_mini_penbased_d <- out$fitd
fit_mini_penbased_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_penbased ---> ", now(), "\n"))
sink()

# shuttle -----------------------------------------------------------------

out <- fitNum(mini_shuttle)
fit_mini_shuttle_d <- out$fitd
fit_mini_shuttle_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- shuttle ---> ", now(), "\n"))
sink()

# wine -----------------------------------------------------------------

out <- fitNum(wine)
fit_wine_d <- out$fitd
fit_wine_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- wine ---> ", now(), "\n"))
sink()

# yeast -----------------------------------------------------------------

out <- fitNum(yeast)
fit_yeast_d <- out$fitd
fit_yeast_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- yeast ---> ", now(), "\n"))
sink()

# mini_yeast -----------------------------------------------------------------

out <- fitNum(mini_yeast)
fit_mini_yeast_d <- out$fitd
fit_mini_yeast_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_yeast ---> ", now(), "\n"))
sink()
