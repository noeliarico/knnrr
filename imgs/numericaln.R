out <- fitNum(mini_balancen)
fit_mini_balancen_d <- out$fitd
fit_mini_balancen_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_banknote ---> ", now(), "\n"))
sink()

out <- fitNum(hayes_rothn)
fit_hayes_rothn_d <- out$fitd
fit_hayes_rothn_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_banknote ---> ", now(), "\n"))
sink()


out <- fitNum(dermatology_6)
fit_dermatologyn_6_d <- out$fitd
fit_dermatologyn_6_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_banknote ---> ", now(), "\n"))
sink()
