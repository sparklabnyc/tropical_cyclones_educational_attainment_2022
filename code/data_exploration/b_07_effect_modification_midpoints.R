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

#Generating midpoint of effect modification by poverty for math 
math_DID <- math_DID %>% dplyr::filter(grade==6, year ==2015) %>% mutate(tertile_poverty=ntile(povertyall, 3))

#Create scatterplot comparing midpoint tertile to whole sample tertile
plot(math_DID$tertile_poverty, math_DID$poverty_tert)

#Generating midpoint of effect modification by poverty for RLA 
rla_DID <- rla_DID %>% dplyr::filter(grade==6, year ==2015) %>% mutate(tertile_poverty=ntile(povertyall, 3))

#Create scatterplot comparing midpoint tertile to whole sample tertile
plot(rla_DID$tertile_poverty, rla_DID$poverty_tert)

#Generating midpoint of effect modification by race for math 
math_DID <- math_DID %>% dplyr::filter(grade==6, year ==2015) %>% mutate(tertile_minority=ntile(minority, 3))

#Create scatterplot comparing midpoint tertile to whole sample tertile
plot(math_DID$tertile_minority, math_DID$minority_tert)

#Generating midpoint of effect modification by race for RLA 
rla_DID <- rla_DID %>% dplyr::filter(grade==6, year ==2015) %>% mutate(tertile_minority=ntile(minority, 3))

#Create scatterplot comparing midpoint tertile to whole sample tertile
plot(rla_DID$tertile_minority, rla_DID$minority_tert)

#Generating midpoint of effect modification by college education for math 
math_DID <- math_DID %>% dplyr::filter(grade==6, year ==2015) %>% mutate(tertile_college=ntile(baplusall, 3))

#Create scatterplot comparing midpoint tertile to whole sample tertile
plot(math_DID$tertile_college, math_DID$college_tert)

#Generating midpoint of effect modification by college education for math 
rla_DID <- rla_DID %>% dplyr::filter(grade==6, year ==2015) %>% mutate(tertile_college=ntile(baplusall, 3))

#Create scatterplot comparing midpoint tertile to whole sample tertile
plot(rla_DID$tertile_college, rla_DID$college_tert)


