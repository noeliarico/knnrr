library(devtools)
noelia_github <- "e1f45786c26a22da3e5a2ca3e412755955a0e870"
install_github("noeliarico/consensus",
               subdir = "consensus",
               auth_token = noelia_github,
               force = TRUE)
library(consensus)

library(caret)
library(cluster)
library(foreign)
library(tidyverse)
library(parallel)
library(nnet)
library(usedist)
library(ade4)
