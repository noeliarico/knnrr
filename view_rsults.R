compare_F1 <- function(rdata, ddata, breakties = "randomly") {
  
  
  rdata <- rdata %>%
    filter(ties == breakties) %>% 
    select(k, ties, rr, F1) %>% 
    mutate(method = rr, 
           rr = NULL,
           type = "rr")
  
  
  ddata <- ddata %>% 
    filter(ties == breakties) %>%
    select(k, distance, F1) %>%
    mutate(method = distance, 
           distance = NULL,
           type = "distance")
  
  
  all_data <- bind_rows(rdata, ddata) %>%
    mutate(k = as.factor(k))
  print(rdata)
  ggplot(all_data, aes(type, F1, shape = type)) +
    geom_point(aes(color = method, shape = type), size = 5, alpha = 0.8, position = position_jitter(w = 0.1, h = 0)) +
    #scale_alpha_discrete(range = c(0.6)) +
    scale_shape(guide = FALSE) +
    scale_linetype(guide = FALSE) + 
    facet_grid(~k)
 }

# rdata <- list(
#   
# )
# 
# ddata <- list(
#   
# )

# arrange a list of plots

# library(gridExtra)
# n <- length(plist)
# nCol <- floor(sqrt(n))
# do.call("grid.arrange", c(plist, ncol=nCol))



