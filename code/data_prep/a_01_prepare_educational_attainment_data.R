rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

# load the local educational attainment full csv 
data_educational_attainment_full_raw_gcs = readr::read_csv(educational_attainment_full_local_file_gcs) 

#Specifying that FIPS column is character
read_csv(educational_attainment_full_local_file_gcs, col_types = list(
  fips = "c"))

# determine the unique values of fips (Robbie: Check if state FIPS)
states = data_educational_attainment_full_raw_gcs %>% pull(fips) %>% unique()

# loop through each state and save
for(state_current in states){
  # filter only one state
  data_educational_attainment_full_raw_state_gcs = data_educational_attainment_full_raw_gcs %>%
    dplyr::filter(fips==state_current)
  
  
  # save as RDS file
  saveRDS(data_educational_attainment_full_raw_state_gcs, 
          paste0(processed.educational.attainment.folder,state_current,'_educational_attainment_gcs.rds'))
}

#Test loading the file
readRDS(paste0(processed.educational.attainment.folder,'1_educational_attainment_gcs.rds'))
  
