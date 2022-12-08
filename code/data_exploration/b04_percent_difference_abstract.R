rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

library(dplyr)

math_DID <- math_DID %>% group_by(state,grade) %>% summarise(grade_avg=mean(gcs_mn_all))

3.410066 - 4.181332
#-0.771266

-0.10/-0.771266
#0.129657
