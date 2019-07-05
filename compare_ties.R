compare_ties <- function(data, metric, name = "") {
  data <- data %>% select(k, distance, ties, {{metric}})
  head(data)
  tryCatch({
  ggplot(data, aes_string("k", metric, color = "ties")) +
    geom_point() +
    facet_grid(~distance) + 
    ggtitle(name)
  })
}
