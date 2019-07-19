# Imbalance ---------------------------------------------------------------

# binary datasets: ratio between 1.5 and 9
imbalance1 <- c("imb_ecoli_0_vs_1", "imb_glass0", "imb_glass1", "imb_glass6", "imb_haberman", "imb_iris0", "imb_wisconsin")
all_plots <- lapply(imbalance1, append_plot, metric = "F1", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 3, nrow = 3)
figure

# binary datasets: ratio >= 9
imbalance2 <- c("imb_glass2", "imb_glass4", "imb_glass5", "imb_ecoli4", 
                "imb_ecoli_0_1_4_6_vs_5", "imb_ecoli_0_1_4_7_vs_2_3_5_6",
                "imb_ecoli_0_6_7_vs_5", "imb_ecoli_0_1_4_7_vs_5_6",
                "imb_yeast_0_3_5_9_vs_7_8") # "imb_yeast6",
all_plots <- lapply(imbalance2, append_plot, metric = "F1", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 3, nrow = 3)
figure

# multiclass data sets
imbalance_multiclassn <- c("imb_ecoli", "imb_glass", "imb_new_thyroid", "imb_penbased", "imb_shuttle", "imb_wine", "imb_yeast")
imbalance_multiclassc <- c("imb_contraceptive", "imb_balance", "imb_hayes_roth")
imbalance_multiclass <- c(imbalance_multiclassn, imbalance_multiclassc)
all_plots <- lapply(imbalance_multiclass, append_plot, metric = "Mean_Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 4, nrow = 3)
figure

# Class noise [cn] --------------------------------------------------------


# -------------------------------------------------------------------------


names <- c("ecoli", "glass", "ionosphere", "sonar")

# Attribute noise - noisy train, noisy test -------------------------------

names_an_nn <- sapply(names, paste0, "_an_nn5")
all_plots <- lapply(names_an_nn, append_plot, metric = "Neg_Pred_Value", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 2)
figure

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

# Per dataset comparisons -------------------------------------------------

name <- "sonar"
originals <- lapply(name, append_plot, metric = "F1", input = "numerical",
                    fix_axis = TRUE, min = 0.5, max = 0.9)
types <- c("_5an_nc","_20an_nc","_5an_cn","_20an_cn")
# c("ecoli", "glass", "ionosphere", "iris", "sonar")
datasets <- paste0(name, types)
all_plots <- lapply(datasets, compare_metric_noisy, metric = "F1", input = "numerical",
                    fix_axis = TRUE, min = 0.5, max = 0.9)
types <- c("_an_nn5", "_an_nn20")
datasets <- paste0(name, types)
new_plots <- lapply(datasets, append_plot, metric = "F1", input = "numerical",
                    fix_axis = TRUE, min = 0.5, max = 0.9)
all_plots <- all_plots %>% append(new_plots) %>% append(originals)
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 2, nrow = 4)
figure
