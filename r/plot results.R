results <- tribble(~dataset, ~plurality, ~borda, ~manhattan, ~euclidean, ~chebyshev,
                  "diabetes", 0.5669, 0.6767, 0.6692, 0.6720, 0.6715,
                  "fertility", 0.5000, 0.5359, 0.5417, 0.5417, 0.5000,
                  "ionosphere", 0.7832, 0.7883, 0.8637, 0.7763, 0.8024,
                  "nki70", 0.5521, 0.6354, 0.5833, 0.6250, 0.5781,
                  "sonar", 0.7463, 0.7841, 0.8211, 0.8029, 0.7292,
                  "glass", 0.6791, 0.7629, 0.7803, 0.7573, 0.7430,
                  "iris", 0.7153, 0.9749, 0.9698, 0.9749, 0.9599,
                  "wine", 0.7445, 0.9851, 0.9888, 0.9742, 0.9616)
                  ) 
results <- results %>% mutate(dataset = as.factor(dataset))
results <- results %>% 
              gather(Type, Accuracy, -dataset) %>%
              mutate(Type = as.factor(Type))

ggplot(results, aes(x = dataset, y = Accuracy)) + 
  geom_line() +
  geom_point(aes(col = Type, size = Type)) +
  scale_size_manual(values=c(5, 2, 2, 2, 2))


