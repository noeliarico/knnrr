num_binary_l10 <- c("mini_bank_note","haberman","mini_skin", "mini_weight_height", "vertebral_column2", "cpu")
num_binary_m10 <- c("mini_egg_eye_state", "ionosphere", "sonar")
num_multiclass_l10 <-c("filtered_ecoli", "glass", "iris", "life_expectancy", "seeds", "vertebral_column3", "wifi_localization", "mini_yeast")
num_multiclass_m10 <- ""
num_binary <- c(num_binary_l10, num_binary_m10)
num_multiclass <- c(num_multiclass_l10)

# "acute_inflammations1", "acute_inflammations2", # F1 = 1
mix_binary_l10 <- c("caesarian", "mini_mammographic_masses", "primary_tumor")
mix_binary_m10 <- c("ionosphere", "mini_adult", "mini_travel_insurance", "statlog")
mix_multiclass <- c("mini_abalone","flags", "teaching_assistant", "contraceptive")
mix_binary <- c(mix_binary_l10, mix_binary_m10)

cat_binary <- c("balance_scale", "breast_cancer", "lenses", "mini_cars", "somerville", "mini_tic_tac_toe")#, "mini_chess")
cat_multiclass <- c("post_operative", "mini_connect4","soybean_large", "zoo")



all_data <- c(
  num_binary, num_multiclass,
  mix_binary, mix_multiclass,
  cat_binary, cat_multiclass
)


# Compare distances and rankings ------------------------------------------

append_plot <- function(name, metric, input) {
  paramr <- get(paste0("fit_", name, "_r"))
  paramd <- get(paste0("fit_", name, "_d"))
  p <- compare_metric(paramr, paramd, metric = metric, name = name, input = input)
  return(p)
}

all_plots_num_binary <- lapply(num_binary, append_plot, metric = "F1", input = "numerical")
all_plots_num_multiclass <- lapply(num_multiclass, append_plot, metric = "Mean_F1", input = "numerical")
all_plots_cat_binary <- lapply(cat_binary, append_plot, metric = "F1", input = "categorical")
all_plots_cat_multiclass <- lapply(cat_multiclass, append_plot, metric = "Mean_F1", input = "categorical")
all_plots_mix_binary <- lapply(mix_binary, append_plot, metric = "F1", input = "mixed")
all_plots_mix_multiclass <- lapply(mix_multiclass, append_plot, metric = "Mean_F1", input = "mixed")

all_plots <- all_plots_num_binary

figure <- ggarrange(plotlist = all_plots, common.legend = TRUE,
                    ncol = 3, nrow = 3)
figure
# annotate_figure(figure,
#                 top = text_grob("Binary", color = "red", face = "bold", size = 14),
#                 bottom = text_grob("Data source: \n ToothGrowth data set", color = "blue",
#                                    hjust = 1, x = 1, face = "italic", size = 10),
#                 left = text_grob("Tooth length", color = "green", rot = 90),
#                 right = "I'm done, thanks :-)!",
#                 fig.lab = "Figure 1", fig.lab.face = "bold"
# )

# Compare random and threshold --------------------------------------------

append_plot_ties <- function(name) {
  paramd <- get(paste0("fit_", name, "_d"))
  p <- compare_ties(paramd$results, metric = "Kappa", name = name)
  return(p)
}

all_plots <- lapply(num_binary, append_plot_ties)
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE) 
figure

