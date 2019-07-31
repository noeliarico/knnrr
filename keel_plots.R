names <- c("ecoli", "glass", "ionosphere", "sonar", "wine")

# Attribute noise - noisy train, clean test -------------------------------

names_5an_nc <- sapply(names, paste0, "_5an_nc")
all_plots <- lapply(names_5an_nc, compare_metric_noisy, metric = "F1", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure


names_20an_nc <- sapply(names, paste0, "_20an_nc")
all_plots <- lapply(names_20an_nc, compare_metric_noisy, metric = "F1", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure

# Attribute noise - clean train, noisy test -------------------------------

names_5an_cn <- sapply(names, paste0, "_5an_cn")
all_plots <- lapply(names_5an_cn, compare_metric_noisy, metric = "F1", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure

names_20an_cn <- sapply(names, paste0, "_20an_cn")
all_plots <- lapply(names_20an_cn, compare_metric_noisy, metric = "F1", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure

