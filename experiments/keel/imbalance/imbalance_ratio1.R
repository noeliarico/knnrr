# ecoli_0_vs_1 --------------------------------------------------------

set.seed(123)
fit_ecoli_0_vs_1_d <- train(x =  ecoli_0_vs_1[,-1],
                          y = ecoli_0_vs_1[,1],
                          data = ecoli_0_vs_1,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_ecoli_0_vs_1_r <- train(x =  ecoli_0_vs_1[,-1],
                          y = ecoli_0_vs_1[,1],
                          data = ecoli_0_vs_1,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

# compare_metric(fit_ecoli_0_vs_1_r, fit_ecoli_0_vs_1_d, metric = "Neg_Pred_Value", input = "numerical")


# iris0 -------------------------------------------------------------------

set.seed(123)
fit_iris0_d <- train(x =  iris0[,-1],
                                y = iris0[,1],
                                data = iris0,
                                method = dknn,
                                preProcess = c("center", "scale"),
                                trControl = binary_fitControl,
                                tuneGrid = dgrid_num)

set.seed(123)
fit_iris0_r <- train(x =  iris0[,-1],
                                y = iris0[,1],
                                data = iris0,
                                method = rknn,
                                preProcess = c("center", "scale"),
                                trControl = binary_fitControl,
                                tuneGrid = rgrid_num)

# compare_metric(fit_iris0_r, fit_iris0_d, metric = "F1", input = "numerical")

# glass0 ------------------------------------------------------------------

set.seed(123)
fit_glass0_d <- train(x =  glass0[,-1],
                            y = glass0[,1],
                            data = glass0,
                            method = dknn,
                            preProcess = c("center", "scale"),
                            trControl = binary_fitControl,
                            tuneGrid = dgrid_num)

set.seed(123)
fit_glass0_r <- train(x =  glass0[,-1],
                            y = glass0[,1],
                            data = glass0,
                            method = rknn,
                            preProcess = c("center", "scale"),
                            trControl = binary_fitControl,
                            tuneGrid = rgrid_num)

# compare_metric(fit_glass0_r, fit_glass0_d, metric = "F1", input = "numerical")

# glass1 ------------------------------------------------------------------

set.seed(123)
fit_glass1_d <- train(x =  glass1[,-1],
                          y = glass1[,1],
                          data = glass1,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_glass1_r <- train(x =  glass1[,-1],
                          y = glass1[,1],
                          data = glass1,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

# compare_metric(fit_glass1_r, fit_glass1_d, metric = "F1", input = "numerical")

# glass6 ------------------------------------------------------------------

set.seed(123)
fit_glass6_d <- train(x =  glass6[,-1],
                          y = glass6[,1],
                          data = glass6,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_glass6_r <- train(x =  glass6[,-1],
                          y = glass6[,1],
                          data = glass6,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

# haberman ----------------------------------------------------------------

haberman <- as.data.frame(haberman)
sink("haberman")
set.seed(123)
fit_haberman_d <- train(x =  haberman[,-1],
                             y = haberman[,1],
                             data = haberman,
                             method = dknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = dgrid_num)

set.seed(123)
fit_haberman_r <- train(x =  haberman[,-1],
                             y = haberman[,1],
                             data = haberman,
                             method = rknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = rgrid_num)
sink()
# compare_metric(fit_haberman_r, fit_haberman_d, metric = "F1", input = "numerical")

# wisconsin ---------------------------------------------------------------

set.seed(123)
fit_wisconsin_d <- train(x =  wisconsin[,-1],
                        y = wisconsin[,1],
                        data = wisconsin,
                        method = dknn,
                        preProcess = c("center", "scale"),
                        trControl = binary_fitControl,
                        tuneGrid = dgrid_num)

set.seed(123)
fit_wisconsin_r <- train(x =  wisconsin[,-1],
                        y = wisconsin[,1],
                        data = wisconsin,
                        method = rknn,
                        preProcess = c("center", "scale"),
                        trControl = binary_fitControl,
                        tuneGrid = rgrid_num)

compare_metric(fit_wisconsin_r, fit_wisconsin_d, metric = "F1", input = "numerical")

