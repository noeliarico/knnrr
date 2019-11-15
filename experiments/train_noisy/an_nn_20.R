# ecoli_20an_nn -----------------------------------------------------------

out <- fitNum(ecoli_20an_nn)
fit_ecoli_20an_nn_d <- out$fitd
fit_ecoli_20an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ecoli_20an_nn ---> ", now(), "\n"))
sink()

# glass_20an_nn -----------------------------------------------------------

out <- fitNum(glass_20an_nn)
fit_glass_20an_nn_d <- out$fitd
fit_glass_20an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- glass_20an_nn ---> ", now(), "\n"))
sink()

# ionosphere_20an_nn -----------------------------------------------------------

out <- fitNum(ionosphere_20an_nn)
fit_ionosphere_20an_nn_d <- out$fitd
fit_ionosphere_20an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ionosphere_20an_nn ---> ", now(), "\n"))
sink()

# sonar_20an_nn -----------------------------------------------------------

out <- fitNum(sonar_20an_nn)
fit_sonar_20an_nn_d <- out$fitd
fit_sonar_20an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- sonar_20an_nn ---> ", now(), "\n"))
sink()

# wine_20an_nn -----------------------------------------------------------

out <- fitNum(wine_20an_nn)
fit_wine_20an_nn_d <- out$fitd
fit_wine_20an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- wine_20an_nn ---> ", now(), "\n"))
sink()