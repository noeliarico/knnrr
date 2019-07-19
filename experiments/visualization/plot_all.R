# Data --------------------------------------------------------------------

num_binary_l10 <- c("mini_bank_note", "cpu", "haberman", "mini_skin", "vertebral_column2", "mini_weight_height")
num_binary_m10 <- c("mini_egg_eye_state", "ionospheren", "sonar")
num_multiclass_l10 <-c("filtered_ecoli", "glass", "life_expectancy", "seeds", "vertebral_column3", "wifi_localization", "mini_yeast") #"iris", 
num_multiclass_m10 <- c("mini_waves")
num_binary <- c(num_binary_l10, num_binary_m10)
num_multiclass <- c(num_multiclass_l10, num_multiclass_m10)
num <- c(num_binary, num_multiclass)

# "acute_inflammations1", "acute_inflammations2", # F1 = 1
mix_binary_l10 <- c("caesarian", "mini_mammographic_masses", "primary_tumor")
mix_binary_m10 <- c( "mini_adult", "mini_travel_insurance", "statlog")#"ionosphere", 
mix_multiclass <- c("mini_abalone","flags", "teaching_assistant", "contraceptive")
mix_binary <- c(mix_binary_l10, mix_binary_m10)
mix <- c(mix_binary, mix_multiclass)

cat_binary <- c("balance_scale", "breast_cancer", "mini_cars", "mini_poker_hand", "somerville", "mini_tic_tac_toe", "post_operative") 
cat_multiclass <- c("mini_connect4","lenses","soybean_large", "zoo", "mini_chess")#
cat <- c(cat_binary, cat_multiclass)

all_data <- c(
  num_binary, num_multiclass,
  mix_binary, mix_multiclass,
  cat_binary, cat_multiclass
)


# Compare distances and rankings ------------------------------------------

append_plot <- function(name, metric, input, fix_axis = FALSE, min = 0.0, max = 0.9) {
  paramr <- get(paste0("fit_", name, "_r"))
  paramd <- get(paste0("fit_", name, "_d"))
  p <- compare_metric(paramr, paramd, metric = metric, name = name, input = input,
                      fix_axis = fix_axis, min = min, max = max)
  return(p)
}

# -- Numerical

# ------ Binary
all_plots_num_binary <- lapply(num_binary, append_plot, metric = "F1", input = "numerical")
figure <- ggarrange(plotlist = all_plots_num_binary, common.legend = TRUE,
                    ncol = 3, nrow = 3)
figure

# ------ Multiclass
all_plots_num_multiclass <- lapply(num_multiclass, append_plot, metric = "Mean_F1", input = "numerical")
figure <- ggarrange(plotlist = all_plots_num_multiclass, common.legend = TRUE,
                    ncol = 3, nrow = 3)
figure

# -- Categorical

# ------ Binary
all_plots_cat_binary <- lapply(cat_binary, append_plot, metric = "F1", input = "categorical")
figure <- ggarrange(plotlist = all_plots_cat_binary, common.legend = TRUE,
                    ncol = 3, nrow = 3)
figure

# ------ Multiclass
all_plots_cat_multiclass <- lapply(cat_multiclass, append_plot, metric = "Mean_F1", input = "categorical")
figure <- ggarrange(plotlist = all_plots_cat_multiclass, common.legend = TRUE,
                    ncol = 3, nrow = 3)
figure

# -- Mixed

# ------ Binary
all_plots_mix_binary <- lapply(mix_binary, append_plot, metric = "F1", input = "mixed")

figure <- ggarrange(plotlist = all_plots_mix_binary, common.legend = TRUE,
                    ncol = 2, nrow = 3)
figure

# ------ Multiclass
all_plots_mix_multiclass <- lapply(mix_multiclass, append_plot, metric = "Mean_F1", input = "mixed")

figure <- ggarrange(plotlist = all_plots_mix_multiclass, common.legend = TRUE,
                    ncol = 2, nrow = 2)
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
  p <- compare_ties(paramd$results, metric = "Mean_F1", name = name)
  return(p)
}

all_plots <- lapply(cat_multiclass, append_plot_ties)
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE) 
figure


# Compare all datasets ----------------------------------------------------




for(k in ) {
  k = 7
  name <- paste0("borda_and_distances-mixed_", k, "_", metric, ".pdf")
  pdf(file=name, onefile=T, paper='A4') 
  compare_type(mix, metric = metric, the_k = k, caret = TRUE, input = "mixed")
  dev.off()
  Sys.sleep(5)
}

metric <- "Balanced_Accuracy"
ks <- c(1, 2, 3, 5, 7)
all_plots <- lapply(ks, function(x) compare_type(mix, metric = metric, the_k = x, caret = TRUE, input = "mixed"))
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE) 
figure


