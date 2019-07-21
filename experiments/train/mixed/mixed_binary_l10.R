sink("executed", append = TRUE)
cat("Mixed binary < 10 \n")
sink()

# Caesarean ---------------------------------------------------------------

out <- fitMix(caesarian)
fit_caesarian_d <- out$fitd
fit_caesarian_r <- out$fitr
  
sink("executed", append = TRUE)
cat(paste0("- caesarian ---> ", now(), "\n"))
sink()

# Mammographic masses -----------------------------------------------------

out <- fitMix(mini_mammographic_masses)
fit_mini_mammographic_masses_d <- out$fitd
fit_mini_mammographic_masses_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- mini_mammographic_masses ---> ", now(), "\n"))
sink()
