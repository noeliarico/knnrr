sink("executed", append = TRUE)
cat("Numerical binary < 10 \n")
sink()

# bank_note ---------------------------------------------------------------

out <- fitNum(mini_banknote)
fit_mini_banknote_d <- out$fitd
fit_mini_banknote_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_banknote ---> ", now(), "\n"))
sink()

# cpu ---------------------------------------------------------------------

out <- fitNum(cpu_discretized)
fit_cpu_discretized_d <- out$fitd
fit_cpu_discretized_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- cpu ---> ", now(), "\n"))
sink()

# haberman ----------------------------------------------------------------

out <- fitNum(haberman)
fit_haberman_d <- out$fitd
fit_haberman_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- haberman --->", now(), "\n"))
sink()

# skin --------------------------------------------------------------------

out <- fitNum(mini_skin)
fit_mini_skin_d <- out$fitd
fit_mini_skin_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_skin ---> ", now(), "\n"))
sink()

# vertebral column --------------------------------------------------------

out <- fitNum(vertebral_column2)
fit_vertebral_column2_d <- out$fitd
fit_vertebral_column2_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- vertebral_column2 ---> ", now(), "\n"))
sink()

# weight_height -----------------------------------------------------------

out <- fitNum(mini_weight_height)
fit_mini_weight_height_d <- out$fitd
fit_mini_weight_height_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_weight_height ---> ", now(), "\n"))
sink()
