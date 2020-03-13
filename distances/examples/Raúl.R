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
  geom_circle(aes(x0 = 0, y0 = 0), radius = 1) +
  #geom_polygon(data = circle, fill = "black", color = "red", alpha = 0) +
  #geom_polygon(data = manhattan, fill = "black", color = "blue", alpha = 0) +
  geom_rect(aes(xmin=-3, ymin=-3, xmax=3, ymax=3), fill = "black", color="green", alpha=0) +
  geom_point(aes(shape = class), size = 6)  +
  geom_point(aes(shape = class, color = highlight), size = 6)  +
  theme_minimal() +
  theme(legend.position="none") + 
  scale_color_manual(values=c("#FF0000", "#860076", "#999999"))

circles <- data.frame(
  x0 = rep(1:3, 3),
  y0 = rep(1:3, each = 3),
  r = seq(0.1, 1, length.out = 9)
)




points <- tribble(~ x, ~ y,
                   0, 0,
                   3, 0,
                   2, 1,
                   1, 2,
                   0, 3,
                   2, 2) %>%
            mutate(name = LETTERS[1:n()])
ggplot() +
  scale_x_continuous(limits = c(-4, 4), breaks = -4:4) +
  scale_y_continuous(limits = c(-4, 4), breaks = -4:4) +
  coord_fixed() +
  geom_circle(aes(x0 = 0, y0 = 0, r = 3),  color="red") +
  geom_circle(aes(x0 = 0, y0 = 0, r = sqrt(5)),  color="red") +
  geom_circle(aes(x0 = 0, y0 = 0, r = sqrt(8)),  color="red") +
  
  #geom_circle(aes(x0 = 0, y0 = 0, r = 2),  color="red") +
  geom_rect(aes(xmin=-2, ymin=-2, xmax=2, ymax=2), fill = "black", color="green", alpha=0) +
  #geom_rect(aes(xmin=-2, ymin=-2, xmax=2, ymax=2), fill = "black", color="green", alpha=0) +
  geom_polygon(aes(x=c(-3,0,3,0), y = c(0,3,0,-3)), fill = "black", color="blue", alpha=0) +
  geom_polygon(aes(x=c(-4,0,4,0), y = c(0,4,0,-4)), fill = "black", color="blue", alpha=0) +
  geom_point(aes(x, y), data = points, size = 5) +
  theme_light()

               