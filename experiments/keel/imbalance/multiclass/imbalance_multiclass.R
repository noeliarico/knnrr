# contraceptive -----------------------------------------------------------------

contraceptive <- as.data.frame(contraceptive)
set.seed(123)
fit_contraceptive_d <- train(x =  contraceptive[,-1],
                                 y = contraceptive[,1],
                                 data = contraceptive,
                                 method = dknn,
                                 preProcess = c("center", "scale"),
                                 trControl = multi_fitControl,
                                 tuneGrid = dgrid_num)

set.seed(123)
fit_contraceptive_r <- train(x =  contraceptive[,-1],
                                 y = contraceptive[,1],
                                 data = contraceptive,
                                 method = rknn,
                                 preProcess = c("center", "scale"),
                                 trControl = multi_fitControl,
                                 tuneGrid = rgrid_num)

# compare_metric(fit_contraceptive_r, fit_contraceptive_d, metric = "Mean_F1", input = "numerical")
# compare_metric(fit_contraceptive_r, fit_contraceptive_d, metric = "Kappa", input = "numerical")

# ecoli -----------------------------------------------------------------

ecoli <- as.data.frame(ecoli)
set.seed(123)
fit_ecoli_d <- train(x =  ecoli[,-1],
                         y = ecoli[,1],
                         data = ecoli,
                         method = dknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = dgrid_num)

set.seed(123)
fit_ecoli_r <- train(x =  ecoli[,-1],
                         y = ecoli[,1],
                         data = ecoli,
                         method = rknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = rgrid_num)

# compare_metric(fit_ecoli_r, fit_ecoli_d, metric = "Kappa", input = "numerical")

# glass -----------------------------------------------------------------

glass <- as.data.frame(glass)
set.seed(123)
fit_glass_d <- train(x =  glass[,-1],
                         y = glass[,1],
                         data = glass,
                         method = dknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = dgrid_num)

set.seed(123)
fit_glass_r <- train(x =  glass[,-1],
                         y = glass[,1],
                         data = glass,
                         method = rknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = rgrid_num)

# 

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

new_thyroid <- as.data.frame(new_thyroid)
set.seed(123)
fit_new_thyroid_d <- train(x =  new_thyroid[,-1],
                           y = new_thyroid[,1],
                           data = new_thyroid,
                           method = dknn,
                           preProcess = c("center", "scale"),
                           trControl = multi_fitControl,
                           tuneGrid = dgrid_num)

set.seed(123)
fit_new_thyroid_r <- train(x =  new_thyroid[,-1],
                           y = new_thyroid[,1],
                           data = new_thyroid,
                           method = rknn,
                           preProcess = c("center", "scale"),
                           trControl = multi_fitControl,
                           tuneGrid = rgrid_num)

# penbased -----------------------------------------------------------------

penbased <- as.data.frame(penbased)
set.seed(123)
fit_penbased_d <- train(x =  penbased[,-1],
                            y = penbased[,1],
                            data = penbased,
                            method = dknn,
                            preProcess = c("center", "scale"),
                            trControl = multi_fitControl,
                            tuneGrid = dgrid_num)

set.seed(123)
fit_penbased_r <- train(x =  penbased[,-1],
                            y = penbased[,1],
                            data = penbased,
                            method = rknn,
                            preProcess = c("center", "scale"),
                            trControl = multi_fitControl,
                            tuneGrid = rgrid_num)

# compare_metric(fit_penbased_r, fit_penbased_d, metric = "Mean_F1", input = "numerical")
# compare_metric(fit_penbased_r, fit_penbased_d, metric = "Kappa", input = "numerical")

# shuttle -----------------------------------------------------------------

shuttle <- as.data.frame(shuttle)
set.seed(123)
fit_shuttle_d <- train(x =  shuttle[,-1],
                           y = shuttle[,1],
                           data = shuttle,
                           method = dknn,
                           preProcess = c("center", "scale"),
                           trControl = multi_fitControl,
                           tuneGrid = dgrid_num)

set.seed(123)
fit_shuttle_r <- train(x =  shuttle[,-1],
                           y = shuttle[,1],
                           data = shuttle,
                           method = rknn,
                           preProcess = c("center", "scale"),
                           trControl = multi_fitControl,
                           tuneGrid = rgrid_num)

# compare_metric(fit_shuttle_r, fit_shuttle_d, metric = "Mean_F1", input = "numerical")
# compare_metric(fit_shuttle_r, fit_shuttle_d, metric = "Kappa", input = "numerical")


# wine -----------------------------------------------------------------

wine <- as.data.frame(wine)
set.seed(123)
fit_wine_d <- train(x =  wine[,-1],
                        y = wine[,1],
                        data = wine,
                        method = dknn,
                        preProcess = c("center", "scale"),
                        trControl = multi_fitControl,
                        tuneGrid = dgrid_num)

set.seed(123)
fit_wine_r <- train(x =  wine[,-14],
                        y = wine[,14],
                        data = wine,
                        method = rknn,
                        preProcess = c("center", "scale"),
                        trControl = multi_fitControl,
                        tuneGrid = rgrid_num)

# compare_metric(fit_wine_r, fit_wine_d, metric = "Mean_F1", input = "numerical")

# yeast -----------------------------------------------------------------

yeast <- as.data.frame(yeast)

set.seed(123)
fit_yeast_d <- train(x =  yeast[,-1],
                         y = yeast[,1],
                         data = yeast,
                         method = dknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = dgrid_num)

set.seed(123)
fit_yeast_r <- train(x =  yeast[,-1],
                         y = yeast[,1],
                         data = yeast,
                         method = rknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = rgrid_num)

# compare_metric(fit_yeast_r, fit_yeast_d, metric = "Mean_F1", input = "numerical")
# compare_metric(fit_yeast_r, fit_yeast_d, metric = "Kappa", input = "numerical")
