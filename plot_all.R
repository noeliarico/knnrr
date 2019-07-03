num_binary <- c("mini_bank_note","haberman","mini_skin", "mini_weight_height", "vertebral_colum2")
num_multiclass <-c("filtered_ecoli", "iris", "life_expectancy", "seeds", "vertebral_column3", "wifi_localization", "mini_yeast")

mixed_binary <- c("caesarian", "mini_mammographic_masses")

data_list <- mixed_binary
append_plot <- function(name) {
  paramr <- get(paste0("fit_", name, "_r"))
  paramd <- get(paste0("fit_", name, "_d"))
  p <- compare_F1(paramr, paramd, name)
  return(p)
}

all_plots <- lapply(data_list, append_plot)


#library(gridExtra)
#n <- length(plist)
#nCol <- floor(sqrt(n))
#do.call("grid.arrange", c(all_plots, ncol=2))

#library(ggpubr)
figure <- ggarrange(plotlist = all_plots, common.legend = TRUE) 
# annotate_figure(figure,
#                 top = text_grob("Binary", color = "red", face = "bold", size = 14),
#                 bottom = text_grob("Data source: \n ToothGrowth data set", color = "blue",
#                                    hjust = 1, x = 1, face = "italic", size = 10),
#                 left = text_grob("Tooth length", color = "green", rot = 90),
#                 right = "I'm done, thanks :-)!",
#                 fig.lab = "Figure 1", fig.lab.face = "bold"
# )

append_plot_ties <- function(name) {
  paramr <- get(paste0("fit_", name, "_d"))
  p <- compare_ties(paramd$results)
  return(p)
}
all_plots <- lapply(data_list, append_plot_ties)
compare_ties
