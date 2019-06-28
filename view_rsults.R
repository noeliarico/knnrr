compare_F1 <- function(rdata, ddata) {
  rdata <- rdata %>%
    select(k, rr, F1) %>% 
    mutate(method = rr, rr = NULL)
  ddata <- ddata %>% 
    select(k, distance, F1) %>%
    mutate(method = distance, distance = NULL)
  all_data <- bind_rows(rdata, ddata)
  ggplot(all_data, aes(F1, 1)) +
    geom_point(aes(color = method)) + 
    facet_grid(~k)
}




