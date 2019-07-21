# yeast_0_3_5_9_vs_7_8 ---------------------------------------------------

set.seed(123)
fit_yeast_0_3_5_9_vs_7_8_d <- train(x =  yeast_0_3_5_9_vs_7_8[,-1],
                             y = yeast_0_3_5_9_vs_7_8[,1],
                             data = yeast_0_3_5_9_vs_7_8,
                             method = dknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = dgrid_num)

set.seed(123)
fit_yeast_0_3_5_9_vs_7_8_r <- train(x =  yeast_0_3_5_9_vs_7_8[,-1],
                             y = yeast_0_3_5_9_vs_7_8[,1],
                             data = yeast_0_3_5_9_vs_7_8,
                             method = rknn,
                             preProcess = c("center", "scale"),
                             trControl = binary_fitControl,
                             tuneGrid = rgrid_num)

# compare_metric(fit_yeast_0_3_5_9_vs_7_8_r, fit_yeast_0_3_5_9_vs_7_8_d, metric = "F1", input = "numerical")


# yeast6 ------------------------------------------------------------------

set.seed(123)
fit_yeast6_d <- train(x =  yeast6[,-1],
                                        y = yeast6[,1],
                                        data = yeast6,
                                        method = dknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = dgrid_num)

set.seed(123)
fit_yeast6_r <- train(x =  yeast6[,-1],
                                        y = yeast6[,1],
                                        data = yeast6,
                                        method = rknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = rgrid_num)

# compare_metric(fit_yeast6_r, fit_yeast6_d, metric = "Kappa", input = "numerical")
# 

# glass2 ------------------------------------------------------------------

set.seed(123)
fit_glass2_d <- train(x =  glass2[,-1],
                          y = glass2[,1],
                          data = glass2,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_glass2_r <- train(x =  glass2[,-1],
                          y = glass2[,1],
                          data = glass2,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)


# glass4 ------------------------------------------------------------------

set.seed(123)
fit_glass4_d <- train(x =  glass4[,-1],
                          y = glass4[,1],
                          data = glass4,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_glass4_r <- train(x =  glass4[,-1],
                          y = glass4[,1],
                          data = glass4,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

# glass5 ------------------------------------------------------------------

set.seed(123)
fit_glass5_d <- train(x =  glass5[,-1],
                          y = glass5[,1],
                          data = glass5,
                          method = dknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = dgrid_num)

set.seed(123)
fit_glass5_r <- train(x =  glass5[,-1],
                          y = glass5[,1],
                          data = glass5,
                          method = rknn,
                          preProcess = c("center", "scale"),
                          trControl = binary_fitControl,
                          tuneGrid = rgrid_num)

# compare_metric(fit_glass5_r, fit_glass5_d, metric = "F1", input = "numerical")


# ecoli4 ------------------------------------------------------------------

set.seed(123)
fit_ecoli4_d <- train(x =  ecoli4[,-1],
                                        y = ecoli4[,1],
                                        data = ecoli4,
                                        method = dknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = dgrid_num)

set.seed(123)
fit_ecoli4_r <- train(x =  ecoli4[,-1],
                                        y = ecoli4[,1],
                                        data = ecoli4,
                                        method = rknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = rgrid_num)

compare_metric(fit_ecoli4_r, fit_ecoli4_d, metric = "F1", input = "numerical")

# ecoli_0_1_4_6_vs_5 ---------------------------------------------------

set.seed(123)
fit_ecoli_0_1_4_6_vs_5_d <- train(x =  ecoli_0_1_4_6_vs_5[,-1],
                                      y = ecoli_0_1_4_6_vs_5[,1],
                                      data = ecoli_0_1_4_6_vs_5,
                                      method = dknn,
                                      preProcess = c("center", "scale"),
                                      trControl = binary_fitControl,
                                      tuneGrid = dgrid_num)

set.seed(123)
fit_ecoli_0_1_4_6_vs_5_r <- train(x =  ecoli_0_1_4_6_vs_5[,-1],
                                      y = ecoli_0_1_4_6_vs_5[,1],
                                      data = ecoli_0_1_4_6_vs_5,
                                      method = rknn,
                                      preProcess = c("center", "scale"),
                                      trControl = binary_fitControl,
                                      tuneGrid = rgrid_num)

# compare_metric(fit_ecoli_0_1_4_6_vs_5_r, fit_ecoli_0_1_4_6_vs_5_d, metric = "F1", input = "numerical")

# ecoli_0_1_4_7_vs_2_3_5_6 ---------------------------------------------------

set.seed(123)
fit_ecoli_0_1_4_7_vs_2_3_5_6_d <- train(x =  ecoli_0_1_4_7_vs_2_3_5_6[,-1],
                                            y = ecoli_0_1_4_7_vs_2_3_5_6[,1],
                                            data = ecoli_0_1_4_7_vs_2_3_5_6,
                                            method = dknn,
                                            preProcess = c("center", "scale"),
                                            trControl = binary_fitControl,
                                            tuneGrid = dgrid_num)

set.seed(123)
fit_ecoli_0_1_4_7_vs_2_3_5_6_r <- train(x =  ecoli_0_1_4_7_vs_2_3_5_6[,-1],
                                            y = ecoli_0_1_4_7_vs_2_3_5_6[,1],
                                            data = ecoli_0_1_4_7_vs_2_3_5_6,
                                            method = rknn,
                                            preProcess = c("center", "scale"),
                                            trControl = binary_fitControl,
                                            tuneGrid = rgrid_num)

# compare_metric(fit_ecoli_0_1_4_7_vs_2_3_5_6_r, fit_ecoli_0_1_4_7_vs_2_3_5_6_d, metric = "F1", input = "numerical")

# ecoli_0_6_7_vs_5 --------------------------------------------------------

set.seed(123)
fit_ecoli_0_6_7_vs_5_d <- train(x =  ecoli_0_6_7_vs_5[,-1],
                                    y = ecoli_0_6_7_vs_5[,1],
                                    data = ecoli_0_6_7_vs_5,
                                    method = dknn,
                                    preProcess = c("center", "scale"),
                                    trControl = binary_fitControl,
                                    tuneGrid = dgrid_num)

set.seed(123)
fit_ecoli_0_6_7_vs_5_r <- train(x =  ecoli_0_6_7_vs_5[,-1],
                                    y = ecoli_0_6_7_vs_5[,1],
                                    data = ecoli_0_6_7_vs_5,
                                    method = rknn,
                                    preProcess = c("center", "scale"),
                                    trControl = binary_fitControl,
                                    tuneGrid = rgrid_num)

# ecoli_0_1_4_7_vs_5_6 --------------------------------------------------------

set.seed(123)
fit_ecoli_0_1_4_7_vs_5_6_d <- train(x =  ecoli_0_1_4_7_vs_5_6[,-1],
                                        y = ecoli_0_1_4_7_vs_5_6[,1],
                                        data = ecoli_0_1_4_7_vs_5_6,
                                        method = dknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = dgrid_num)

set.seed(123)
fit_ecoli_0_1_4_7_vs_5_6_r <- train(x =  ecoli_0_1_4_7_vs_5_6[,-1],
                                        y = ecoli_0_1_4_7_vs_5_6[,1],
                                        data = ecoli_0_1_4_7_vs_5_6,
                                        method = rknn,
                                        preProcess = c("center", "scale"),
                                        trControl = binary_fitControl,
                                        tuneGrid = rgrid_num)


# compare_metric(fit_ecoli_0_1_4_7_vs_5_6_r, fit_ecoli_0_1_4_7_vs_5_6_d, metric = "F1", input = "numerical")
