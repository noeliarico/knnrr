sink("executed", append = TRUE)
cat("Numerical multiclass < 10 \n")
sink()

# Adult -------------------------------------------------------------------

out <- fitMix(mini_adult)
fit_mini_adult_d <- out$fitd
fit_mini_adult_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_adult ---> ", now(), "\n"))
sink()



# Travel insurance --------------------------------------------------------

out <- fitMix(travel_insurance)
fit_travel_insurance_d <- out$fitd
fit_travel_insurance_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- travel_insurance ---> ", now(), "\n"))
sink()

# Statlog -----------------------------------------------------------------

out <- fitMix(statlog)
fit_statlog_d <- out$fitd
fit_statlog_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- statlog ---> ", now(), "\n"))
sink()
