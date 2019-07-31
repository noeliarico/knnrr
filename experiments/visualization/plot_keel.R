# Attribute noise - noisy train, noisy test -------------------------------

names_an_nn <- sapply(names, paste0, "_5an_nn")
all_plots <- lapply(names_an_nn, append_plot, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure


names_an_nn <- sapply(names, paste0, "_20an_nn")
all_plots <- lapply(names_an_nn, append_plot, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure

# Attribute noise - noisy train, clean test -------------------------------

names_5an_nc <- sapply(names, paste0, "_5an_nc")
all_plots <- lapply(names_5an_nc, compare_metric_noisy, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure


names_20an_nc <- sapply(names, paste0, "_20an_nc")
all_plots <- lapply(names_20an_nc, compare_metric_noisy, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure

# Attribute noise - clean train, noisy test -------------------------------

names_5an_cn <- sapply(names, paste0, "_5an_cn")
all_plots <- lapply(names_5an_cn, compare_metric_noisy, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure

names_20an_cn <- sapply(names, paste0, "_20an_cn")
all_plots <- lapply(names_20an_cn, compare_metric_noisy, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure

# Per dataset comparisons -------------------------------------------------

# c("ecoli", "glass", "ionosphere", "iris", "sonar")

name <- "wine" # cambiar este y ejecutar. Los 5 que puede have están arriba

originals <- lapply(name, append_plot, metric = "Balanced_Accuracy", input = "numerical",
                    fix_axis = TRUE, min = 0.4, max = 1)
types <- c("_5an_nc","_20an_nc","_5an_cn","_20an_cn")

datasets <- paste0(name, types)
all_plots <- lapply(datasets, compare_metric_noisy, metric = "Balanced_Accuracy", input = "numerical",
                    fix_axis = TRUE, min = 0.4, max = 1)
types <- c("_5an_nn", "_20an_nn")
datasets <- paste0(name, types)
new_plots <- lapply(datasets, append_plot, metric = "Balanced_Accuracy", input = "numerical",
                    fix_axis = TRUE, min = 0.4, max = 1)
all_plots <- all_plots %>% append(new_plots) %>% append(originals)
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 4)
figure
