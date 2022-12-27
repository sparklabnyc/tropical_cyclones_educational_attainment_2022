rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

library(dplyr)
library(tidyverse)

#Create quartile variable for percent white students in the grade in math data frame
math_DID <- math_DID %>% mutate(perwht_quart = ntile(perwht, 4)) 
math_DID <- math_DID %>% mutate(perwht_quart = as_factor(perwht_quart))

#Create quartile variable for percent students economically disadvantaged in the grade in math data frame
math_DID <- math_DID %>% mutate(perecd_quart = ntile(perecd, 4)) 
math_DID <- math_DID %>% mutate(perecd_quart = as_factor(perecd_quart))

#Create quartile variable for percent white students in the grade in RLA data frame
rla_DID <- rla_DID %>% mutate(perwht_quart = ntile(perwht, 4)) 
rla_DID <- rla_DID %>% mutate(perwht_quart = as_factor(perwht_quart))

#Create quartile variable for percent students economically disadvantaged in the grade in RLA data frame
rla_DID <- rla_DID %>% mutate(perecd_quart = ntile(perecd, 4)) 
rla_DID <- rla_DID %>% mutate(perecd_quart = as_factor(perecd_quart))

