# Libraries ---------------------------------------------------------------

library(devtools)

library(caret)
library(cluster)
library(foreign)
library(tidyverse)
library(parallel)
library(nnet)
library(usedist)
library(ade4)


# Load consensus ---------------------------------------------------------

# install_github("noeliarico/consensus",
#                subdir = "consensus",
#                force = TRUE)
library(consensus)

# Load data ---------------------------------------------------------------

source("data/load_data.R")
rm(path_to_data) # created for doc only

# Load methods ------------------------------------------------------------

files <- list.files("methods", recursive = TRUE)
files <- file.path("methods", files)
sapply(files, source)
rm(files)

