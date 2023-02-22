rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

#Load packages
library(dplyr)
library(tidyverse)

#Load data frames
math_DID <- readRDS("~/Git/tropical_cyclones_educational_attainment_2022/data/prepared_DID_data/prepared_math_DID_data/math_DID.rds")
rla_DID <- readRDS("~/Git/tropical_cyclones_educational_attainment_2022/data/prepared_DID_data/prepared_rla_DID_data/rla_DID.rds")

#Merging math_DID and math_DID_percentile data frames
math_DID_truncated <- left_join(math_DID, math_DID_percentile)

#Merging rla_DID and rla_DID_percentile data frames
rla_DID_truncated <- left_join(rla_DID, rla_DID_percentile)

#Filtering math data frame by percentile enrollment 
math_DID_truncated <- math_DID_truncated %>% filter(totenrl > perc_5 & totenrl < perc_95) 

#Filtering RLA data frame by percentile enrollment
rla_DID_truncated <- rla_DID_truncated %>% filter(totenrl > perc_5 & totenrl < perc_95) 

#Filtering math data frame to nonmissing scores
math_DID_truncated <- math_DID_truncated %>% filter(is.na(gcs_mn_all) == FALSE)

#Filtering RLA data frame to nonmissing scores
rla_DID_truncated <- rla_DID_truncated %>% filter(is.na(gcs_mn_all) == FALSE)

#Saving data frames
saveRDS(math_DID_truncated, paste0(prepared.math.DID.folder, "math_DID_truncated.rds"))
saveRDS(rla_DID_truncated, paste0(prepared.rla.DID.folder, "rla_DID_truncated.rds"))
