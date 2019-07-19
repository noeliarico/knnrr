# contraceptive -----------------------------------------------------------------

# imb_contraceptive <- read.keel("data/keel/imbalance/multiclass/contraceptive.dat")
# change <- colnames(imb_contraceptive)[colnames(imb_contraceptive) != "class"]
# imb_contraceptive <- imb_contraceptive %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
# 
# set.seed(123)
# fit_imb_contraceptive_d <- train(x =  imb_contraceptive[,-10],
#                                  y = imb_contraceptive[,10],
#                                  data = imb_contraceptive,
#                                  method = dknn,
#                                  preProcess = c("center", "scale"),
#                                  trControl = multi_fitControl,
#                                  tuneGrid = dgrid_num)
# 
# set.seed(123)
# fit_imb_contraceptive_r <- train(x =  imb_contraceptive[,-10],
#                                  y = imb_contraceptive[,10],
#                                  data = imb_contraceptive,
#                                  method = rknn,
#                                  preProcess = c("center", "scale"),
#                                  trControl = multi_fitControl,
#                                  tuneGrid = rgrid_num)
# 
# compare_metric(fit_imb_contraceptive_r, fit_imb_contraceptive_d, metric = "Mean_", input = "numerical")

# dermatology -----------------------------------------------------------------

#Nas en 34 y las otras son categoricas

# imb_dermatology <- read.keel("data/keel/imbalance/multiclass/dermatology.dat")
# change <- colnames(imb_dermatology)[colnames(imb_dermatology) != "class"]
# imb_dermatology <- imb_dermatology %>% mutate_at(change, function(x) {as.numeric(as.character(x))})
# 
# set.seed(123)
# fit_imb_dermatology_d <- train(x =  imb_dermatology[,-35],
#                                y = imb_dermatology[,35],
#                                data = imb_dermatology,
#                                method = dknn,
#                                preProcess = c("center", "scale"),
#                                trControl = multi_fitControl,
#                                tuneGrid = dgrid_num)
# 
# set.seed(123)
# fit_imb_dermatology_r <- train(x =  imb_dermatology[,-35],
#                                y = imb_dermatology[,35],
#                                data = imb_dermatology,
#                                method = rknn,
#                                preProcess = c("center", "scale"),
#                                trControl = multi_fitControl,
#                                tuneGrid = rgrid_num)
# 
# compare_metric(fit_imb_dermatology_r, fit_imb_dermatology_d, metric = "Mean_", input = "numerical")