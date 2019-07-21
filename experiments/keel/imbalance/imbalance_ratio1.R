# ecoli_0_vs_1 --------------------------------------------------------

out <- fitNum(ecoli_0_vs_1)
fit_ecoli_0_vs_1_d <- out$fitd
fit_ecoli_0_vs_1_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ecoli_0_vs_1 ---> ", now(), "\n"))
sink()

# iris0 -------------------------------------------------------------------

out <- fitNum(iris0)
fit_iris0_d <- out$fitd
fit_iris0_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- iris0 ---> ", now(), "\n"))
sink()

# glass0 ------------------------------------------------------------------

out <- fitNum(glass0)
fit_glass0_d <- out$fitd
fit_glass0_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- glass0 ---> ", now(), "\n"))
sink()

# glass1 ------------------------------------------------------------------

out <- fitNum(glass1)
fit_glass1_d <- out$fitd
fit_glass1_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- glass1 ---> ", now(), "\n"))
sink()

# glass6 ------------------------------------------------------------------

out <- fitNum(glass6)
fit_glass6_d <- out$fitd
fit_glass6_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- glass6 ---> ", now(), "\n"))
sink()

# wisconsin ---------------------------------------------------------------

out <- fitNum(wisconsin)
fit_wisconsin_d <- out$fitd
fit_wisconsin_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- wisconsin ---> ", now(), "\n"))
sink()
