compare_ties <- function(data) {
  data <- data %>% select(k, distance, ties, Accuracy)
  ggplot(data, aes(k, Accuracy, color = ties)) +
    geom_point() +
    facet_grid(~distance)
}
