rm(list=ls())

# Declare root directory, folder locations, local file locations, objects, and functions
project.folder = paste0(print(here::here()),'/')
source(paste0(project.folder,'create_folder_structure.R'))
source(paste0(file.locations.folder,'file_locations.R'))
source(paste0(objects.folder,'objects.R'))
source(paste0(functions.folder,'functions.R'))

library(dplyr)
library(tidyverse)

#Load data sets
math_DID <- readRDS(paste0(prepared.math.DID.folder, "math_DID.rds"))
rla_DID <- readRDS(paste0(prepared.rla.DID.folder, "rla_DID.rds"))

#Create tertile variable for percent Black, Hispanic, and Native American students in the cohort in math data frame
math_DID <- math_DID %>% mutate(minority = pernam + perhsp + perblk) 
math_DID <- math_DID %>% group_by(year) %>% mutate(minority_tert = ntile(minority, 3)) 
math_DID <- math_DID %>% mutate(minority_tert = as_factor(minority_tert))

#Create tertile variable for percent Black, Hispanic, and Native American students in the cohort in RLA data frame
rla_DID <- rla_DID %>% mutate(minority = pernam + perhsp + perblk) 
rla_DID <- rla_DID %>% group_by(year) %>% mutate(minority_tert = ntile(minority, 3))
rla_DID <- rla_DID %>% mutate(minority_tert = as_factor(minority_tert)) 

#Create tertile variable for county poverty in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(poverty_tert = ntile(povertyall, 3)) 
math_DID <- math_DID %>% mutate(poverty_tert = as_factor(poverty_tert))

#Create tertile variable for county poverty in RLA data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(poverty_tert = ntile(povertyall, 3)) 
rla_DID <- rla_DID %>% mutate(poverty_tert = as_factor(poverty_tert))

#Create tertile variable for percent special education in county in RLA data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(perspeced_tert = ntile(perspeced, 3)) 
rla_DID <- rla_DID %>% mutate(perspeced_tert = as_factor(perspeced_tert))

#Create tertile variable for percent special education in county in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(perspeced_tert = ntile(perspeced, 3)) 
math_DID <- math_DID %>% mutate(perspeced_tert = as_factor(perspeced_tert))

#Create tertile variable for county SES composite variable in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(sesall_tert = ntile(sesall, 3)) 
math_DID <- math_DID %>% mutate(sesall_tert = as_factor(sesall_tert))

#Create tertile variable for county SES composite variable in math data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(sesall_tert = ntile(sesall, 3)) 
rla_DID <- rla_DID %>% mutate(sesall_tert = as_factor(sesall_tert))

#Save data frames as RDS files
saveRDS(math_DID, paste0(prepared.math.DID.folder, "math_DID.rds"))
saveRDS(rla_DID, paste0(prepared.rla.DID.folder, "rla_DID.rds"))

