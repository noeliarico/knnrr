# Numerical

all_plots <- lapply(numerical$name, append_plot, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure

## Numerical > Binary

all_plots <- lapply(numerical_binary$name, append_plot, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure

### Numerical > Imbalance < 9

all_plots <- lapply(numerical_binary_imb1$name[-10], append_plot, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure


all_plots <- lapply(numerical_binary_imb2[4:9, ]$name, append_plot, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE, nrow = 3, ncol = 2)
figure


### Numerical > N features

all_plots <- lapply(numerical_binary_l10att$name, append_plot, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure

all_plots <- lapply(numerical_binary_m10att$name, append_plot, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure

## Numerical > Multiclass

all_plots <- lapply(numerical_multiclass$name, append_plot, metric = "Balanced_Accuracy", input = "numerical")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure


# Mixed
all_plots <- lapply(mixed$name, append_plot, metric = "Balanced_Accuracy", input = "mixed")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure

## Mixed > Binary

all_plots <- lapply(mixed_binary$name, append_plot, metric = "Balanced_Accuracy", input = "mixed")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure

## Mixed > Multiclass

all_plots <- lapply(mixed_multiclass$name, append_plot, metric = "Balanced_Accuracy", input = "mixed")
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure
