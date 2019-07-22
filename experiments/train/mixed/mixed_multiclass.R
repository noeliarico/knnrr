# Abalone -----------------------------------------------------------------

out <- fitMix(mini_abalone_sex)
fit_mini_abalone_sex_d <- out$fitd
fit_mini_abalone_sex_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_abalone_sex ---> ", now(), "\n"))
sink()

# Contraceptive method ----------------------------------------------------

out <- fitMix(mini_contraceptive)
fit_mini_contraceptive_d <- out$fitd
fit_mini_contraceptive_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_contraceptive ---> ", now(), "\n"))
sink()


# Covertype ---------------------------------------------------------------
# Flags -------------------------------------------------------------------

out <- fitMix(flags)
fit_flags_d <- out$fitd
fit_flags_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- statlog ---> ", now(), "\n"))
sink()

# Teaching assistant ------------------------------------------------------

out <- fitMix(teaching_assistant)
fit_teaching_assistant_d <- out$fitd
fit_teaching_assistant_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- statlog ---> ", now(), "\n"))
sink()
