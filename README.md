# Tropical cyclones and educational attainment

Work in progress by Gabriella Meltzer, Joan Casey, Joel Schwartz, Michelle Bell, Marianthi-Anna Kioumourtzoglou, Robbie M Parks

note: please run 0_00_create_folder_structure.R first to create folders which may not be there when first loaded.

note: to run an R Markdown file from command line, run\
Rscript -e "rmarkdown::render('SCRIPT_NAME.Rmd')"

## Data preparation (data_prep) list:

a_01_prepare_educational_attainment_data - prepare educational attainment data from raw (in local) to annual tidied format (in GitHub repo).

a_02_prepare_county_covariates_data - prepare county covariates data from raw (in local) to annual tidied format (in GitHub repo)

a_03_prepare_county_cohort_data - prepare county cohort data from annual tidied format to format ready for modeling

a_04_prepare_covariates_data - prepare covariates data from annual tidied format to format ready for modeling

a_05_prepare_tropical_cyclone_data - prepare tropical cyclone data

a_06_prepare_hurricane_did_data - prepare hurricane DID data for initial DID model analysis

a_07_prepare_moderator_data - prepare moderator variables for regression analyses

## Data exploration (data_exploration) list:

b_01_plotting_scores_years_ggplot2 - prepare GCS data and plot change in score over years, faceted by grade

b_02_plotting_scores_grades_ggplot2 - prepare GCS data and plot change in score over grades, faceted by years

b_03_plotting_covariates_ggplot2 - prepare covariates data and plot change in over years, faceted by grade

b_04_percent_difference_abstract - calculating the percent difference in Florida hurricane scores to report in the ISEE abstract

## Model running (models) list:

c_01_hurricane_did_florida - initial model for ISEE NAC abstract for Florida

## Model processing (model_processing) list:

d_XX - XX

## Model running (model_plotting) list:

e_XX - XX
