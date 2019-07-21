# yeast_0_3_5_9_vs_7_8 ---------------------------------------------------

out <- fitNum(yeast_0_3_5_9_vs_7_8)
fit_yeast_0_3_5_9_vs_7_8_d <- out$fitd
fit_yeast_0_3_5_9_vs_7_8_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- yeast_0_3_5_9_vs_7_8 ---> ", now(), "\n"))
sink()

# yeast6 ------------------------------------------------------------------

out <- fitNum(yeast6)
fit_yeast6_d <- out$fitd
fit_yeast6_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- yeast6 ---> ", now(), "\n"))
sink()

# glass2 ------------------------------------------------------------------

out <- fitNum(glass2)
fit_glass2_d <- out$fitd
fit_glass2_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- glass2 ---> ", now(), "\n"))
sink()


# glass4 ------------------------------------------------------------------

out <- fitNum(glass4)
fit_glass4_d <- out$fitd
fit_glass4_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- glass4 ---> ", now(), "\n"))
sink()

# glass5 ------------------------------------------------------------------

out <- fitNum(glass5)
fit_glass5_d <- out$fitd
fit_glass5_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- glass5 ---> ", now(), "\n"))
sink()

# ecoli4 ------------------------------------------------------------------

out <- fitNum(ecoli4)
fit_ecoli4_d <- out$fitd
fit_ecoli4_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ecoli4 ---> ", now(), "\n"))
sink()

# ecoli_0_1_4_6_vs_5 ---------------------------------------------------

out <- fitNum(ecoli_0_1_4_6_vs_5)
fit_ecoli_0_1_4_6_vs_5_d <- out$fitd
fit_ecoli_0_1_4_6_vs_5_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ecoli_0_1_4_6_vs_5 ---> ", now(), "\n"))
sink()

# ecoli_0_1_4_7_vs_2_3_5_6 ---------------------------------------------------

out <- fitNum(ecoli_0_1_4_7_vs_2_3_5_6)
fit_ecoli_0_1_4_7_vs_2_3_5_6_d <- out$fitd
fit_ecoli_0_1_4_7_vs_2_3_5_6_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ecoli_0_1_4_7_vs_2_3_5_6 ---> ", now(), "\n"))
sink()

# ecoli_0_1_4_7_vs_5_6 --------------------------------------------------------

out <- fitNum(ecoli_0_1_4_7_vs_5_6)
fit_ecoli_0_1_4_7_vs_5_6_d <- out$fitd
fit_ecoli_0_1_4_7_vs_5_6_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ecoli_0_1_4_7_vs_5_6 ---> ", now(), "\n"))
sink()

# ecoli_0_6_7_vs_5 --------------------------------------------------------

out <- fitNum(ecoli_0_6_7_vs_5)
fit_ecoli_0_6_7_vs_5_d <- out$fitd
fit_ecoli_0_6_7_vs_5_r <- out$fitr

sink("executed", append = TRUE)
cat(paste0("- ecoli_0_6_7_vs_5 ---> ", now(), "\n"))
sink()
