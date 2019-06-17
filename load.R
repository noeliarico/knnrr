library(devtools)
noelia_github <- "e878f2287a4e84b518fc9f774edc221a769d43ec"
install_github("noeliarico/consensus",
               subdir = "consensus",
               auth_token = noelia_github,
               force = TRUE)
library(consensus)
