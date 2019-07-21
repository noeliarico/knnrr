sink("executed", append = TRUE)
cat("Numerical binary >= 10 \n")
sink()

# Egg eye style -----------------------------------------------------------

out <- fitNum(mini_egg_eye_state)
fit_mini_egg_eye_state_d <- out$fitd
fit_mini_egg_eye_state_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_egg_eye_state ---> ", now(), "\n"))
sink()

# Ionosphere --------------------------------------------------------------

out <- fitNum(ionospheren)
fit_ionospheren_d <- out$fitd
fit_ionospheren_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ionospheren ---> ", now(), "\n"))
sink()

# Sonar ------------------------------------------------------------------

out <- fitNum(sonar)
fit_sonar_d <- out$fitd
fit_sonar_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- sonar ---> ", now(), "\n"))
sink()

# Audit risk --------------------------------------------------------------

out <- fitNum(mini_audit_risk)
fit_mini_audit_risk_d <- out$fitd
fit_mini_audit_risk_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_audit_risk ---> ", now(), "\n"))
sink()