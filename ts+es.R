micro_ionosphere <- ionosphere[1:10, c(1:5, 34)] 
ios <-  expand.grid(k = c(1,2,3),
                          distance = get_distances("mixed"),
                          ties = c("randomly"),
                          verbose = FALSE,
                          developer = FALSE)
sink("ionosphere")
set.seed(123)
train(
  x =  micro_ionosphere[, -6],
  y = micro_ionosphere[, 6],
  data = micro_ionosphere,
  method = dknn,
  preProcess = c("center", "scale"),
  trControl = binary_fitControl,
  tuneGrid = ios
)
sink()

