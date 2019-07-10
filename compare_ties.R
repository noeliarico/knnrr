compare_ties <- function(data, metric, name = "") {
  data <- data %>% select(k, distance, ties, {{metric}}) %>% mutate(k = as.factor(k))
  head(data)
  tryCatch({
  ggplot(data, aes_string("k", metric, color = "ties")) +
    geom_point() +
    facet_grid(. ~ distance) + 
    ggtitle(name)
  })
}
