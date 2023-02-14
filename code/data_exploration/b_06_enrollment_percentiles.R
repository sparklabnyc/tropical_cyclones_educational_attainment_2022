rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

#Load packages
library(dplyr)

#Generating enrollment percentile variable in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(percentile_enrollment=ntile(totenrl,100)) 

math_DID <- math_DID %>% group_by(year) %>% mutate(percentile_enrollment=ntile(totenrl,100)) %>% pull(percentile_enrollment,totenrl) %>% distinct_values()

#Generating enrollment percentile variable in RLA data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(percentile_enrollment=ntile(totenrl,100))

rla_DID <- rla_DID %>% group_by(year) %>% mutate(percentile_enrollment=ntile(totenrl,100)) %>% pull(percentile_enrollment,totenrl) %>% distinct_values()
