# Libraries ---------------------------------------------------------------

library(ade4)
library(arules)
library(caret)
library(cluster)
library(devtools)
library(foreign)
library(GGally)
library(ggplot2)
library(ggpubr)
library(nnet)
library(parallel)
library(lubridate)
library(RKEEL)
library(tidyverse)
library(usedist)

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


# Distances ---------------------------------------------------------------

# custom distnaces y sets
