sink("executed", append = TRUE)
cat("Numerical multiclass < 10 \n")
sink()

# ecoli -------------------------------------------------------------------

out <- fitNum(ecoli)
fit_ecoli_d <- out$fitd
fit_ecoli_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ecoli ---> ", now(), "\n"))
sink()

# filtered_ecoli -------------------------------------------------------------------

out <- fitNum(filtered_ecoli)
fit_filtered_ecoli_d <- out$fitd
fit_filtered_ecoli_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- filtered_ecoli ---> ", now(), "\n"))
sink()

# Glass -------------------------------------------------------------------

out <- fitNum(glass)
fit_glass_d <- out$fitd
fit_glass_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- glass ---> ", now(), "\n"))
sink()

# Iris --------------------------------------------------------------------

out <- fitNum(iris)
fit_iris_d <- out$fitd
fit_iris_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- iris ---> ", now(), "\n"))
sink()

# Life expectancy ---------------------------------------------------------

out <- fitNum(life_expectancy)
fit_life_expectancy_d <- out$fitd
fit_life_expectancy_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- life_expectancy ---> ", now(), "\n"))
sink()

# Seeds -------------------------------------------------------------------

out <- fitNum(seeds)
fit_seeds_d <- out$fitd
fit_seeds_r <- out$fitr

csink("executed", append = TRUE)
cat(paste0("- seeds ---> ", now(), "\n"))
sink()

# Vertebral column 3 ------------------------------------------------------

out <- fitNum(vertebral_column3)
fit_vertebral_column3_d <- out$fitd
fit_vertebral_column3_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- vertebral_column3 ---> ", now(), "\n"))
sink()

# Wifi localization -------------------------------------------------------

out <- fitNum(mini_wifi_localization)
fit_mini_wifi_localization_d <- out$fitd
fit_mini_wifi_localization_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_wifi_localization ---> ", now(), "\n"))
sink()

# mini_yeast -------------------------------------------------------------------

out <- fitNum(mini_yeast)
fit_mini_yeast_d <- out$fitd
fit_mini_yeast_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_yeast ---> ", now(), "\n"))
sink()