save_fit <- function(name) {
  named <- paste0("fit_", name, "_d")
  obd <- get(named)
  namer <- paste0("fit_", name, "_r")
  obr <- get(namer)
  saveRDS(obd, file = paste0("experiments/results/oldtapproval_k10/", named, ".rds"))
}

lapply(num, save_fit)


