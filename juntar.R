juntar <- function(dataset, metric) {
  
  rdata <- get(paste0("fit_", dataset, "_r"))
  ddata <- get(paste0("fit_", dataset, "_d"))
  
  rdata <- rdata$results
  ddata <- ddata$results
  
  colnames(rdata) <- str_remove(colnames(rdata), "Mean_")
  colnames(ddata) <- str_remove(colnames(ddata), "Mean_")
  
  rdata <- rdata %>%
    select(k, rr, {{metric}}) %>% 
    mutate(method = rr, 
           rr = NULL,
           type = "rr")
  
  ddata <- ddata %>% 
    select(k, distance, {{metric}}) %>%
    mutate(method = distance, 
           distance = NULL,
           type = "distance")
  
  all_data <- bind_rows(rdata, ddata) %>%
    mutate(k = as.factor(k),
           method = factor(method)) 
  
}

juntar_noisy <- function(dataset, metric) {
  
  dataset <- get(paste0(dataset))
  
  dataset <- dataset %>%
    select(k, method, {{metric}}) %>% 
    mutate(k = as.factor(k),
           method = factor(method)) 
  
}

nnames <- c("ecoli", "glass", "wine", "ionosphere", "sonar")
sufixes <- apply(expand.grid("5_", 1:5, c("tra", "tst")), 1, glue_collapse)
an_cn_20 <- apply(expand.grid(nnames, "_20an_cn"), 1, glue_collapse)
an_cn_5 <- apply(expand.grid(nnames, "_5an_cn"), 1, glue_collapse)
an_nc_20 <- apply(expand.grid(nnames, "_20an_nc"), 1, glue_collapse)
an_nc_5 <- apply(expand.grid(nnames, "_5an_nc"), 1, glue_collapse)
an_nn_20 <- apply(expand.grid(nnames, "_20an_nn"), 1, glue_collapse)
an_nn_5 <- apply(expand.grid(nnames, "_5an_nn"), 1, glue_collapse)

an_nn20 <- lapply(an_nn20, juntar, metric = "Balanced_Accuracy")
names(an_nn20) <- an_nn_20
save(an_nn20, file = "an_nn20.RData")
an_nn5 <- lapply(an_nn_5, juntar, metric = "Balanced_Accuracy")
names(an_nn5) <- an_nn_5
save(an_nn5, file = "an_nn5.RData")

an_cn20 <- lapply(an_cn_20, juntar_noisy, metric = "Balanced_Accuracy")
names(an_cn20) <- an_cn_20
save(an_cn20, file = "an_cn20.RData")
an_cn5 <- lapply(an_cn_5, juntar_noisy, metric = "Balanced_Accuracy")
names(an_cn5) <- an_cn_5
save(an_cn5, file = "an_cn5.RData")

an_nc20 <- lapply(an_nc_20, juntar_noisy, metric = "Balanced_Accuracy")
names(an_nc20) <- an_nc_20
save(an_nc20, file = "an_nc20.RData")
an_nc5 <- lapply(an_nc_5, juntar_noisy, metric = "Balanced_Accuracy")
names(an_nc5) <- an_nc_5
save(an_nc5, file = "an_nc5.RData")




lista <- lapply(trained, metric = "Balanced_Accuracy", juntar)
names(lista) <- trained

lista_numerical <- lapply(numerical$name, metric = "Balanced_Accuracy", juntar)
names(lista_numerical) <- numerical$name
save(lista_numerical, file = "lista_numerical.RData")

lista_numerical_binary <- lapply(numerical_binary$name, metric = "Balanced_Accuracy", juntar)
names(lista_numerical_binary) <- numerical_binary$name
save(lista_numerical_binary, file = "lista_numerical_binary.RData")

lista_numerical_binary_imb1 <- lapply(numerical_binary_imb1$name, metric = "Balanced_Accuracy", juntar)
names(lista_numerical_binary_imb1) <- numerical_binary_imb1$name
save(lista_numerical_binary_imb1, file = "lista_numerical_binary_imb1.RData")

lista_numerical_binary_imb2 <- lapply(numerical_binary_imb2$name, metric = "Balanced_Accuracy", juntar)
names(lista_numerical_binary_imb2) <- numerical_binary_imb2$name
save(lista_numerical_binary_imb2, file = "lista_numerical_binary_imb2.RData")

lista_numerical_multiclass <- lapply(numerical_multiclass$name, metric = "Balanced_Accuracy", juntar)
names(lista_numerical_multiclass) <- numerical_multiclass$name
save(lista_numerical_multiclass, file = "lista_numerical_multiclass.RData")

lista_mixed <- lapply(mixed$name, metric = "Balanced_Accuracy", juntar)
names(lista_mixed) <- mixed$name
save(lista_mixed, file = "lista_mixed.RData")

lista_mixed_binary <- lapply(mixed_binary$name, metric = "Balanced_Accuracy", juntar)
names(lista_mixed_binary) <- mixed_binary$name
save(lista_mixed_binary, file = "lista_mixed_binary.RData")

lista_mixed_multiclass <- lapply(mixed_multiclass$name, metric = "Balanced_Accuracy", juntar)
names(lista_mixed_multiclass) <- mixed_multiclass$name
save(lista_mixed_multiclass, file = "lista_mixed_multiclass.RData")

