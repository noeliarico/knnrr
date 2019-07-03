compare_F1 <- function(rdata, ddata, name = "", breakties = "randomly") {

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
    select(k, rr, F1) %>% 
    mutate(method = rr, 
           rr = NULL,
           type = "rr")
  
  
  ddata <- ddata %>% 
    filter(ties == breakties) %>%
    select(k, distance, F1) %>%
    mutate(method = distance, 
           distance = NULL,
           type = "distance")
  
  print(ddata)
  
  all_data <- bind_rows(rdata, ddata) %>%
    filter(k < 9) %>%
    mutate(k = as.factor(k),
           method = factor(method)) 

  all_data$method <- ordered(all_data$method,
                             levels = c("borda_count", "plurality", "two", "three", "five", "seven",
                                        "3", "4", "manhattan", "euclidean", "chebyshev"))

  p <- ggplot(all_data, aes(type, F1)) +
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



