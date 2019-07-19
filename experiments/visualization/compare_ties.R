compare_ties <- function(data, metric, name = "") {
  col <- c("#4ca7ad", "#d04261")
  print(head(data))
  data <- data %>% select(k, distance, ties, {{metric}}) %>% mutate(k = as.factor(k))
  tryCatch({
  ggplot(data, aes_string("k", metric, color = "ties")) +
    geom_point(size = 5, alpha = 0.8) +
    #facet_grid(. ~ distance) + 
    scale_color_manual(values = col) +
    ggtitle(name) +
    theme_light()
  })
}
