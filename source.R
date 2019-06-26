files <- list.files("methods", recursive = TRUE)
files <- file.path("methods", files)
sapply(files, source)
