compare_metric <- function(rdata, ddata, metric, name = "", breakties = "randomly", input = "numerical") {

  print(metric)
  
colors <- c(
"#ff6f61",
"#45b5aa",
"#d94f70",
"#88b04b",
"#5f4b8b",
"#db9e23",
"#381452",
"#80bab0",
"#9e6fb8",
"#004000",
"#a85a72")
  
  rdata <- rdata$results
  ddata <- ddata$results
  
  rdata <- rdata %>%
    filter(ties == breakties) %>% 
    select(k, rr, {{metric}}) %>% 
    mutate(method = rr, 
           rr = NULL,
           type = "rr")
  
  
  ddata <- ddata %>% 
    filter(ties == breakties) %>%
    select(k, distance, {{metric}}) %>%
    mutate(method = distance, 
           distance = NULL,
           type = "distance")
  
  all_data <- bind_rows(rdata, ddata) %>%
    filter(k < 9) %>%
    mutate(k = as.factor(k),
           method = factor(method)) 

  # all_data$method <- ordered(all_data$method,
  #                            levels = c("borda_count", "plurality", "two", "three", "five", "seven",
  #                                       "3-approval", "4-approval", "manhattan", "euclidean", "chebyshev"))
  
  print(all_data)
  
  all_data$method <- ordered(all_data$method,
                             levels = c("binary", "euclidean", "smc",
                                        "borda_count", "plurality", "two", "three", "five", "seven"))

  p <- ggplot(all_data, aes_string("type", y = metric)) +
    geom_point(
      aes(color = method, shape = method),
      size = 5,
      alpha = 0.85,
      position = position_jitter(w = 0.1, h = 0)
    ) +
    #scale_alpha_discrete(range = c(0.6)) +
    facet_grid( ~ k) +
    scale_shape_manual(values = c(15:19, 5:10)) +
    guides(shape=guide_legend(nrow=1),col=guide_legend(ncol=6)) +
    #scale_color_brewer(palette="Spectral")
    scale_color_manual(values = colors) +
    ggtitle(name)
    
  
  p
  return(p)
}


