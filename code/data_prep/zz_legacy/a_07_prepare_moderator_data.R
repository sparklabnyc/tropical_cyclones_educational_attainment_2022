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

#Create quartile variable for percent students economically disadvantaged in the grade in math data frame
math_DID <- math_DID %>% mutate(perecd_quart = ntile(perecd, 4)) 
math_DID <- math_DID %>% mutate(perecd_quart = as_factor(perecd_quart))

#Create quartile variable for percent students economically disadvantaged in the grade in RLA data frame
rla_DID <- rla_DID %>% mutate(perecd_quart = ntile(perecd, 4)) 
rla_DID <- rla_DID %>% mutate(perecd_quart = as_factor(perecd_quart))

#PRESENTED MINORITY (WITHOUT ASIANS) TERTILE AT ISEE

#Create tertile variable for percent Black, Hispanic, and Native American students in the cohort in math data frame
math_DID <- math_DID %>% mutate(minority = pernam + perhsp + perblk) 
math_DID <- math_DID %>% group_by(year) %>% mutate(minority_tert = ntile(minority, 3)) 
math_DID <- math_DID %>% mutate(minority_tert = as_factor(minority_tert))

#Create tertile variable for percent Black, Hispanic, and Native American students in the cohort in RLA data frame
rla_DID <- rla_DID %>% mutate(minority = pernam + perhsp + perblk) 
rla_DID <- rla_DID %>% group_by(year) %>% mutate(minority_tert = ntile(minority, 3))
rla_DID <- rla_DID %>% mutate(minority_tert = as_factor(minority_tert)) 

#Create tertile variable for percent in county with BA in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(college_tert = ntile(baplusall, 3)) 
math_DID <- math_DID %>% mutate(college_tert = as_factor(college_tert))

#Create tertile variable for percent in county with BA in RLA data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(college_tert = ntile(baplusall, 3)) 
rla_DID <- rla_DID %>% mutate(college_tert = as_factor(college_tert))

#PRESENTED POVERTY TERTILE AT ISEE

#Create tertile variable for county poverty in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(poverty_tert = ntile(povertyall, 3)) 
math_DID <- math_DID %>% mutate(poverty_tert = as_factor(poverty_tert))

#Create tertile variable for county poverty in RLA data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(poverty_tert = ntile(povertyall, 3)) 
rla_DID <- rla_DID %>% mutate(poverty_tert = as_factor(poverty_tert))

#Create tertile variable for student economic disadvantage in RLA data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(ecd_tert = ntile(perecd, 3)) 
rla_DID <- rla_DID %>% mutate(ecd_tert = as_factor(ecd_tert))

#Create tertile variable for student economic disadvantage in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(ecd_tert = ntile(perecd, 3)) 
math_DID <- math_DID %>% mutate(ecd_tert = as_factor(ecd_tert))

#Create binary variable for percent Black, Hispanic, NA in math data frame
summary(math_DID$minority) #0.18612
math_DID <- math_DID %>% mutate(minority_binary = if_else(minority < 0.18612, 0, 1, missing = NULL))

#Create binary variable for percent Black, Hispanic, NA in RLA data frame
summary(rla_DID$minority) #0.19703
rla_DID <- rla_DID %>% mutate(minority_binary = if_else(minority < 0.19703, 0, 1, missing = NULL))

#Create binary variable for percent in county with BA in math data frame
summary(math_DID$baplusall) #0.16813
math_DID <- math_DID %>% mutate(college_binary = if_else(baplusall < 0.16813, 0, 1, missing = NULL))

#Create binary variable for percent in county with BA in RLA data frame
summary(rla_DID$baplusall) #0.16884
rla_DID <- rla_DID %>% mutate(college_binary = if_else(baplusall < 0.16884, 0, 1, missing = NULL))

#Create binary variable for percent in county in poverty in math data frame
summary(math_DID$povertyall) #0.1620
math_DID <- math_DID %>% mutate(poverty_binary = if_else(povertyall < 0.1620, 0, 1, missing = NULL))

#Create binary variable for percent in county in poverty in RLA data frame
summary(rla_DID$povertyall) #0.1617
rla_DID <- rla_DID %>% mutate(poverty_binary = if_else(povertyall < 0.1617, 0, 1, missing = NULL))

#Create binary variable for percent economically disadvantaged students in math data frame
summary(math_DID$perecd) #0.56689
math_DID <- math_DID %>% mutate(ecd_binary = if_else(perecd < 0.56689, 0, 1, missing = NULL))

#Create binary variable for percent economically disadvantaged students in RLA data frame
summary(rla_DID$perecd) #0.56579
rla_DID <- rla_DID %>% mutate(ecd_binary = if_else(perecd < 0.56579, 0, 1, missing = NULL))

#THESE EFFECT MODIFICATION VARIABLES WERE CREATED AFTER ISEE PRESENTATION

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

## REPEAT PROCESS FOR LAGGED EXPOSURE

#Load data sets
math_DID <- readRDS(paste0(prepared.math.DID.folder, "math_DID_hurricanes_lagged.rds"))
rla_DID <- readRDS(paste0(prepared.rla.DID.folder, "rla_DID_hurricanes_lagged.rds"))

#Create quartile variable for percent students economically disadvantaged in the grade in math data frame
math_DID <- math_DID %>% mutate(perecd_quart = ntile(perecd, 4)) 
math_DID <- math_DID %>% mutate(perecd_quart = as_factor(perecd_quart))

#Create quartile variable for percent students economically disadvantaged in the grade in RLA data frame
rla_DID <- rla_DID %>% mutate(perecd_quart = ntile(perecd, 4)) 
rla_DID <- rla_DID %>% mutate(perecd_quart = as_factor(perecd_quart))

#PRESENTED MINORITY (WITHOUT ASIANS) TERTILE AT ISEE

#Create tertile variable for percent Black, Hispanic, and Native American students in the cohort in math data frame
math_DID <- math_DID %>% mutate(minority = pernam + perhsp + perblk) 
math_DID <- math_DID %>% group_by(year) %>% mutate(minority_tert = ntile(minority, 3)) 
math_DID <- math_DID %>% mutate(minority_tert = as_factor(minority_tert))

#Create tertile variable for percent Black, Hispanic, and Native American students in the cohort in RLA data frame
rla_DID <- rla_DID %>% mutate(minority = pernam + perhsp + perblk) 
rla_DID <- rla_DID %>% group_by(year) %>% mutate(minority_tert = ntile(minority, 3))
rla_DID <- rla_DID %>% mutate(minority_tert = as_factor(minority_tert)) 

#Create tertile variable for percent in county with BA in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(college_tert = ntile(baplusall, 3)) 
math_DID <- math_DID %>% mutate(college_tert = as_factor(college_tert))

#Create tertile variable for percent in county with BA in RLA data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(college_tert = ntile(baplusall, 3)) 
rla_DID <- rla_DID %>% mutate(college_tert = as_factor(college_tert))

#PRESENTED POVERTY TERTILE AT ISEE

#Create tertile variable for county poverty in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(poverty_tert = ntile(povertyall, 3)) 
math_DID <- math_DID %>% mutate(poverty_tert = as_factor(poverty_tert))

#Create tertile variable for county poverty in RLA data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(poverty_tert = ntile(povertyall, 3)) 
rla_DID <- rla_DID %>% mutate(poverty_tert = as_factor(poverty_tert))

#Create tertile variable for student economic disadvantage in RLA data frame
rla_DID <- rla_DID %>% group_by(year) %>% mutate(ecd_tert = ntile(perecd, 3)) 
rla_DID <- rla_DID %>% mutate(ecd_tert = as_factor(ecd_tert))

#Create tertile variable for student economic disadvantage in math data frame
math_DID <- math_DID %>% group_by(year) %>% mutate(ecd_tert = ntile(perecd, 3)) 
math_DID <- math_DID %>% mutate(ecd_tert = as_factor(ecd_tert))

#Create binary variable for percent Black, Hispanic, NA in math data frame
summary(math_DID$minority) #0.18612
math_DID <- math_DID %>% mutate(minority_binary = if_else(minority < 0.18612, 0, 1, missing = NULL))

#Create binary variable for percent Black, Hispanic, NA in RLA data frame
summary(rla_DID$minority) #0.19703
rla_DID <- rla_DID %>% mutate(minority_binary = if_else(minority < 0.19703, 0, 1, missing = NULL))

#Create binary variable for percent in county with BA in math data frame
summary(math_DID$baplusall) #0.16813
math_DID <- math_DID %>% mutate(college_binary = if_else(baplusall < 0.16813, 0, 1, missing = NULL))

#Create binary variable for percent in county with BA in RLA data frame
summary(rla_DID$baplusall) #0.16884
rla_DID <- rla_DID %>% mutate(college_binary = if_else(baplusall < 0.16884, 0, 1, missing = NULL))

#Create binary variable for percent in county in poverty in math data frame
summary(math_DID$povertyall) #0.1620
math_DID <- math_DID %>% mutate(poverty_binary = if_else(povertyall < 0.1620, 0, 1, missing = NULL))

#Create binary variable for percent in county in poverty in RLA data frame
summary(rla_DID$povertyall) #0.1617
rla_DID <- rla_DID %>% mutate(poverty_binary = if_else(povertyall < 0.1617, 0, 1, missing = NULL))

#Create binary variable for percent economically disadvantaged students in math data frame
summary(math_DID$perecd) #0.56689
math_DID <- math_DID %>% mutate(ecd_binary = if_else(perecd < 0.56689, 0, 1, missing = NULL))

#Create binary variable for percent economically disadvantaged students in RLA data frame
summary(rla_DID$perecd) #0.56579
rla_DID <- rla_DID %>% mutate(ecd_binary = if_else(perecd < 0.56579, 0, 1, missing = NULL))

#THESE EFFECT MODIFICATION VARIABLES WERE CREATED AFTER ISEE PRESENTATION

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
saveRDS(math_DID, paste0(prepared.math.DID.folder, "math_DID_hurricanes_lagged.rds"))
saveRDS(rla_DID, paste0(prepared.rla.DID.folder, "rla_DID_hurricanes_lagged.rds"))

