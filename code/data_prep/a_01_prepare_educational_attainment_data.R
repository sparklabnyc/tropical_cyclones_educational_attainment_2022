rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

# load the local educational attainment full csv 
data_educational_attainment_full_raw = readr::read_csv(educational_attainment_full_local_file)

# determine the unique values of fips 
data_educational_attainment_full_raw %>% pull(fips) %>% unique()
  
