rm(list=ls())

# Declare root directory, folder locations and load essential stuff
project.folder = paste0(print(here::here()),'/')


# load the csv
# TO DO
data_educational_attainment_full_raw = readr::read_csv(educational_attainment_full_local_file)
