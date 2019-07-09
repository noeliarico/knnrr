compare_metric <- function(rdata, ddata, metric, name = "", 
                           input = "numerical", breakties = "randomly") { #, low_limit = 1) {
  
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
"#a85a72",
"#750c41",
"#00294f",
"#232b2b",
"#3b444b",
"#0e1111")
  
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
    #filter({{metric}} >= low_limit) %>%
    select(k, distance, {{metric}}) %>%
    mutate(method = distance, 
           distance = NULL,
           type = "distance")
  
  all_data <- bind_rows(rdata, ddata) %>%
    filter(k < 9) %>%
    mutate(k = as.factor(k),
           method = factor(method)) 
  
  if (input == "numerical") {

    all_data <- all_data %>%
      mutate(method = fct_recode(method, minkowski_p3 = "3", minkowski_p4 = "4",
                                 t2_approval = "two", t3_approval = "three", 
                                 t5_approval = "five",  t7_approval = "seven"))
    
    all_data <- all_data %>%
      mutate(method = fct_relevel(method, "borda_count", "plurality", "t2_approval", 
                                  "t3_approval", "t5_approval", "t7_approval",
                                  "manhattan", "euclidean", "chebyshev", 
                                  "minkowski_p3", "minkowski_p4"))
  
    
  }
  else if (input == "mixed") {
    all_data <- all_data %>%
      mutate(method = fct_recode(method, 
                                 t2_approval = "two", t3_approval = "three", 
                                 t5_approval = "five",  t7_approval = "seven"))
    
    all_data <- all_data %>%
      mutate(method = fct_relevel(method, "borda_count", "plurality", "t2_approval", 
                                  "t3_approval", "t5_approval", "t7_approval",
                                  "manhattan", "euclidean", "gower"))
  }
 
 
  
  
  
  p <- ggplot(all_data, aes_string(x = "type", y = metric)) + 
  geom_point(
      aes(color = method, shape = method),
      size = 2,
      alpha = 0.85,
      position = position_jitter(w = 0.1, h = 0)
    ) +
    #scale_alpha_discrete(range = c(0.6)) +
    facet_grid( ~ k) +
    #scale_shape_manual(values = c(15:19, 5:10)) +
    scale_shape_manual(values = c(1:16)) +
    #scale_color_brewer(palette="Spectral") + 
    scale_color_manual(values = colors) +
    ggtitle(name) +
    theme_light() +
    guides(shape = guide_legend(ncol = 6, byrow = TRUE),
           col = guide_legend(ncol = 6, byrow = TRUE)) 
    
  if (input == "numerical") {
    p <- p 
      
  }
  

  return(p)
}


