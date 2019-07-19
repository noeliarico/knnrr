# contraceptive -----------------------------------------------------------------

imb_contraceptive <- read.keel("data/keel/imbalance/multiclass/contraceptive.dat")
ind <- createDataPartition(imb_contraceptive$class, p = 0.2, list = FALSE)
imb_contraceptive <- imb_contraceptive[ind,]
imb_contraceptive$a1 <- NULL
change <- colnames(imb_contraceptive)[colnames(imb_contraceptive) != "class"]
imb_contraceptive <- imb_contraceptive %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_contraceptive_d <- train(x =  imb_contraceptive[,-9],
                                 y = imb_contraceptive[,9],
                                 data = imb_contraceptive,
                                 method = dknn,
                                 preProcess = c("center", "scale"),
                                 trControl = multi_fitControl,
                                 tuneGrid = dgrid_num)

set.seed(123)
fit_imb_contraceptive_r <- train(x =  imb_contraceptive[,-9],
                                 y = imb_contraceptive[,9],
                                 data = imb_contraceptive,
                                 method = rknn,
                                 preProcess = c("center", "scale"),
                                 trControl = multi_fitControl,
                                 tuneGrid = rgrid_num)

compare_metric(fit_imb_contraceptive_r, fit_imb_contraceptive_d, metric = "Mean_F1", input = "numerical")
compare_metric(fit_imb_contraceptive_r, fit_imb_contraceptive_d, metric = "Kappa", input = "numerical")


# ecoli -----------------------------------------------------------------

imb_ecoli <- read.keel("data/keel/imbalance/multiclass/ecoli.dat")
change <- colnames(imb_ecoli)[colnames(imb_ecoli) != "class"]
imb_ecoli <- imb_ecoli %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_ecoli_d <- train(x =  imb_ecoli[,-8],
                         y = imb_ecoli[,8],
                         data = imb_ecoli,
                         method = dknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = dgrid_num)

set.seed(123)
fit_imb_ecoli_r <- train(x =  imb_ecoli[,-8],
                         y = imb_ecoli[,8],
                         data = imb_ecoli,
                         method = rknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = rgrid_num)

compare_metric(fit_imb_ecoli_r, fit_imb_ecoli_d, metric = "Kappa", input = "numerical")

# glass -----------------------------------------------------------------

imb_glass <- read.keel("data/keel/imbalance/multiclass/glass.dat")
change <- colnames(imb_glass)[colnames(imb_glass) != "typeGlass"]
imb_glass <- imb_glass %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_glass_d <- train(x =  imb_glass[,-10],
                         y = imb_glass[,10],
                         data = imb_glass,
                         method = dknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = dgrid_num)

set.seed(123)
fit_imb_glass_r <- train(x =  imb_glass[,-10],
                         y = imb_glass[,10],
                         data = imb_glass,
                         method = rknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = rgrid_num)

compare_metric(fit_imb_glass_r, fit_imb_glass_d, metric = "Mean_F1", input = "numerical")

# con t3 da los mejores resultados
set.seed(123)
train_features <- createDataPartition(imb_glass$typeGlass, p = 0.8, list = FALSE)
train_features <- imb_glass[train_features,]
test_features <- imb_glass[-train_features,]
out <- knn4Train(train_features[,-10], test_features[,-10], cl = train_features[,10], 
                 rr = "three", atttype = "numerical", developer = TRUE)
pred <- factor(predict_using_por(out, ties = "randomly", k = 1), levels = train_features[,-10])
cm <- caret::confusionMatrix(pred, test_features[,10])

# new_thyroid -----------------------------------------------------------------

imb_new_thyroid <- read.keel("data/keel/imbalance/multiclass/new-thyroid.dat")
change <- colnames(imb_new_thyroid)[colnames(imb_new_thyroid) != "class"]
imb_new_thyroid <- imb_new_thyroid %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_new_thyroid_d <- train(x =  imb_new_thyroid[,-6],
                           y = imb_new_thyroid[,6],
                           data = imb_new_thyroid,
                           method = dknn,
                           preProcess = c("center", "scale"),
                           trControl = multi_fitControl,
                           tuneGrid = dgrid_num)

set.seed(123)
fit_imb_new_thyroid_r <- train(x =  imb_new_thyroid[,-6],
                           y = imb_new_thyroid[,6],
                           data = imb_new_thyroid,
                           method = rknn,
                           preProcess = c("center", "scale"),
                           trControl = multi_fitControl,
                           tuneGrid = rgrid_num)

# penbased -----------------------------------------------------------------

imb_penbased <- read.keel("data/keel/imbalance/multiclass/penbased.dat")
ind <- createDataPartition(imb_penbased$class, p = 0.1, list = FALSE)
imb_penbased <- imb_penbased[ind,]
change <- colnames(imb_penbased)[colnames(imb_penbased) != "class"]
imb_penbased <- imb_penbased %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_penbased_d <- train(x =  imb_penbased[,-17],
                            y = imb_penbased[,17],
                            data = imb_penbased,
                            method = dknn,
                            preProcess = c("center", "scale"),
                            trControl = multi_fitControl,
                            tuneGrid = dgrid_num)

set.seed(123)
fit_imb_penbased_r <- train(x =  imb_penbased[,-17],
                            y = imb_penbased[,17],
                            data = imb_penbased,
                            method = rknn,
                            preProcess = c("center", "scale"),
                            trControl = multi_fitControl,
                            tuneGrid = rgrid_num)

compare_metric(fit_imb_penbased_r, fit_imb_penbased_d, metric = "Mean_F1", input = "numerical")
compare_metric(fit_imb_penbased_r, fit_imb_penbased_d, metric = "Kappa", input = "numerical")

# shuttle -----------------------------------------------------------------

imb_shuttle <- read.keel("data/keel/imbalance/multiclass/shuttle.dat")
ind <- createDataPartition(imb_shuttle$class, p = 0.1, list = FALSE)
imb_shuttle <- imb_shuttle[ind,]
change <- colnames(imb_shuttle)[colnames(imb_shuttle) != "class"]
imb_shuttle <- imb_shuttle %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_shuttle_d <- train(x =  imb_shuttle[,-10],
                           y = imb_shuttle[,10],
                           data = imb_shuttle,
                           method = dknn,
                           preProcess = c("center", "scale"),
                           trControl = multi_fitControl,
                           tuneGrid = dgrid_num)

set.seed(123)
fit_imb_shuttle_r <- train(x =  imb_shuttle[,-10],
                           y = imb_shuttle[,10],
                           data = imb_shuttle,
                           method = rknn,
                           preProcess = c("center", "scale"),
                           trControl = multi_fitControl,
                           tuneGrid = rgrid_num)

compare_metric(fit_imb_shuttle_r, fit_imb_shuttle_d, metric = "Mean_F1", input = "numerical")
compare_metric(fit_imb_shuttle_r, fit_imb_shuttle_d, metric = "Kappa", input = "numerical")


# wine -----------------------------------------------------------------

imb_wine <- read.keel("data/keel/imbalance/multiclass/wine.dat")
change <- colnames(imb_wine)[colnames(imb_wine) != "class"]
imb_wine <- imb_wine %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_wine_d <- train(x =  imb_wine[,-14],
                        y = imb_wine[,14],
                        data = imb_wine,
                        method = dknn,
                        preProcess = c("center", "scale"),
                        trControl = multi_fitControl,
                        tuneGrid = dgrid_num)

set.seed(123)
fit_imb_wine_r <- train(x =  imb_wine[,-14],
                        y = imb_wine[,14],
                        data = imb_wine,
                        method = rknn,
                        preProcess = c("center", "scale"),
                        trControl = multi_fitControl,
                        tuneGrid = rgrid_num)

compare_metric(fit_imb_wine_r, fit_imb_wine_d, metric = "Mean_F1", input = "numerical")

# yeast -----------------------------------------------------------------

imb_yeast <- read.keel("data/keel/imbalance/multiclass/yeast.dat")
ind <- createDataPartition(imb_yeast$class, p = 0.2, list = FALSE)
imb_yeast <- imb_yeast[ind,]
change <- colnames(imb_yeast)[colnames(imb_yeast) != "class"]
imb_yeast <- imb_yeast %>% mutate_at(change, function(x) {as.numeric(as.character(x))})

set.seed(123)
fit_imb_yeast_d <- train(x =  imb_yeast[,-9],
                         y = imb_yeast[,9],
                         data = imb_yeast,
                         method = dknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = dgrid_num)

set.seed(123)
fit_imb_yeast_r <- train(x =  imb_yeast[,-9],
                         y = imb_yeast[,9],
                         data = imb_yeast,
                         method = rknn,
                         preProcess = c("center", "scale"),
                         trControl = multi_fitControl,
                         tuneGrid = rgrid_num)

compare_metric(fit_imb_yeast_r, fit_imb_yeast_d, metric = "Mean_F1", input = "numerical")
compare_metric(fit_imb_yeast_r, fit_imb_yeast_d, metric = "Kappa", input = "numerical")
