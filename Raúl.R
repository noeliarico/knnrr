library(tidyverse)

data <- tribble(~x, ~y, ~name, ~class,
                0, 0, "X", "to_classify",
                1, 0, "A", "circle",
                1, 2, "B", "triangle",
                3, 2, "C", "circle",
                0, 4, "D", "triangle")
data$class <- factor(data$class, levels = c("circle", "triangle", "to_classify"))

data <- data %>% mutate(highlight = name %in% c("A","D","B"))
#data <- data %>% mutate(highlight = name %in% c("A","C","B"))

data[1,]$highlight <- 2
data$highlight <- factor(data$highlight, levels = c(2,0,1))

ggplot(data, aes(x, y)) + 
  scale_x_continuous(limits = c(-5, 5), breaks = -5:5) +
  scale_y_continuous(limits = c(-5, 5), breaks = -5:5) +
  scale_shape_manual(values=c(16, 17, 4)) +
  coord_fixed() +
  geom_polygon(data = circle, fill = "black", color = "red", alpha = 0) +
  geom_polygon(data = manhattan, fill = "black", color = "blue", alpha = 0) +
  geom_rect(aes(xmin=-3, ymin=-3, xmax=3, ymax=3), fill = "black", color="green", alpha=0) +
  geom_point(aes(shape = class), size = 6)  +
  geom_point(aes(shape = class, color = highlight), size = 6)  +
  theme_minimal() +
  theme(legend.position="none") + 
  scale_color_manual(values=c("#FF0000", "#860076", "#999999"))

