# Tropical cyclones and educational attainment

Work in progress by Gabriella Meltzer, Joan Casey, Marianthi-Anna Kioumourtzoglou, Robbie M Parks

note: please run 0_00_create_folder_structure.R first to create folders which may not be there when first loaded.

note: to run an R Markdown file from command line, run\
Rscript -e "rmarkdown::render('SCRIPT_NAME.Rmd')"

## Data preparation (data_prep) list:

a_01_prepare_educational_attainment_data - prepare educational attainment data from raw (in local) to annual tidied format (in GitHub repo).

a_02_prepare_county_covariates_data - prepare county covariates data from raw (in local) to annual tidied format (in GitHub repo)

a_03_prepare_county_cohort_data - prepare county cohort data from annual tidied format to format ready for modeling

## Data exploration (data_exploration) list:

b_01_plotting_scores_years_ggplot2 - prepare GCS data and plot change in score over years, faceted by grade

b_02_plotting_scores_grades_ggplot2 - prepare GCS data and plot change in score over grades, faceted by years

b_01_plotting_covariates_ggplot2 - prepare covariates data and plot change in over years, faceted by grade

## Model running (models) list:

c_XX - XX

## Model processing (model_processing) list:

d_XX - XX

## Model running (model_plotting) list:

e_XX - XX
