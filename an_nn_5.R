# ecoli_5an_nn -----------------------------------------------------------

out <- fitNum(ecoli_5an_nn)
fit_ecoli_5an_nn_d <- out$fitd
fit_ecoli_5an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ecoli_5an_nn ---> ", now(), "\n"))
sink()

# glass_5an_nn -----------------------------------------------------------

out <- fitNum(glass_5an_nn)
fit_glass_5an_nn_d <- out$fitd
fit_glass_5an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- glass_5an_nn ---> ", now(), "\n"))
sink()

# ionosphere_5an_nn -----------------------------------------------------------

out <- fitNum(ionosphere_5an_nn)
fit_ionosphere_5an_nn_d <- out$fitd
fit_ionosphere_5an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ionosphere_5an_nn ---> ", now(), "\n"))
sink()

# sonar_5an_nn -----------------------------------------------------------

out <- fitNum(sonar_5an_nn)
fit_sonar_5an_nn_d <- out$fitd
fit_sonar_5an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- sonar_5an_nn ---> ", now(), "\n"))
sink()

# wine_5an_nn -----------------------------------------------------------

out <- fitNum(wine_5an_nn)
fit_wine_5an_nn_d <- out$fitd
fit_wine_5an_nn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- wine_5an_nn ---> ", now(), "\n"))
sink()