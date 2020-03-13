# Compare distances and rankings ------------------------------------------

append_plot <- function(name, metric, input, fix_axis = FALSE, min = 0.0, max = 0.9) {
  paramr <- get(paste0("fit_", name, "_r"))
  paramd <- get(paste0("fit_", name, "_d"))
  p <- compare_metric(paramr, paramd, metric = metric, name = name, input = input,
                      fix_axis = fix_axis, min = min, max = max)
  return(p)
}


# Compare random and threshold --------------------------------------------

append_plot_ties <- function(name) {
  paramd <- get(paste0("fit_", name, "_d"))
  p <- compare_ties(paramd$results, metric = "Mean_F1", name = name)
  return(p)
}

all_plots <- lapply(cat_multiclass, append_plot_ties)
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE) 
figure


# Compare distances and ranking rules -------------------------------------

all_plots <- lapply(numerical_binary_imb2, append_plot, metric = "Balanced_Accuracy", input = "numerical")

figure <- ggarrange(plotlist = all_plots, common.legend = TRUE)
figure

# Compare all datasets ----------------------------------------------------

compare_type(mix, metric = metric, the_k = k, caret = TRUE, input = "mixed")

metric <- "Balanced_Accuracy"
ks <- c(1, 2, 3, 5, 7)
all_plots <- lapply(ks, function(x) compare_type(mixed$name, metric = metric, the_k = x, caret = TRUE, input = "mixed"))
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE, ncol = 3, nrow = 2) 
figure


