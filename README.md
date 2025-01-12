# Disruption to Test Scores after Hurricanes in the United States

Gabriella Meltzer, G. Brooke Anderson, Xicheng Xie, Joan A. Casey, Joel Schwartz, Michelle Bell, Yoshira Ornelas Van Horne, Jared Fox, Marianthi-Anna Kioumourtzoglou, Robbie M Parks

## Project Description

This dataset and code is used for the paper

## Code

### Data preparation (data_prep) list:

a_01_prepare_educational_attainment_data - prepare educational attainment data from raw (in local) to annual tidied format (in GitHub repo).

a_02_prepare_county_covariates_data - prepare county covariates data from raw (in local) to annual tidied format (in GitHub repo)

a_03_prepare_county_cohort_data - prepare county cohort data from annual tidied format to format ready for modeling

a_04_prepare_covariates_data - prepare covariates data from annual tidied format to format ready for modeling

a_05_prepare_tropical_cyclone_data - prepare tropical cyclone data both regular and lagged

a_06_prepare_hurricane_did_data - prepare hurricane DID data for initial DID model analysis

a_07_prepare_tc_did_data - prepare tropical cyclone DID data for DID model analysis

a_08_prepare_moderator_data - prepare moderator variables for regression analyses

a_09_data_truncation - prepared math and RLA data frames excluding missing test scores and enrollment below 5th and above 95th percentiles

a_10_prepare_hurricane_lagged_did_data - prepare lagged hurricane data for lagged DID model analysis

a_11_prepare_tc_lagged_did_data - prepare lagged tropical cyclone DID data for lagged DID model analysis

a_12_prepare_tc_once_data - prepare tropical cyclone data to isolate only one exposure

a_13_prepare_hurricane_once_data_did - merging hurricane data for only one exposure with data for analysis

a_14_prepare_tc_once_data_did - merging tropical cyclone data for only one exposure with data for analysis

### Data exploration (data_exploration) list:

b_01_plotting_scores_years_ggplot2 - prepare GCS data and plot change in score over years, faceted by grade

b_02_plotting_scores_grades_ggplot2 - prepare GCS data and plot change in score over grades, faceted by years

b_03_plotting_covariates_ggplot2 - prepare covariates data and plot change in over years, faceted by grade

b_04_percent_difference_abstract - calculating the percent difference in Florida hurricane scores to report in the ISEE abstract

b_05_figure 1_maps - prepare code for Figure 1 maps showing locations of hurricanes and tropical cyclones

b_06_effect_modification_midpoints - generate effect modification midpoints, compare to tertiles

b_07_figure 2_maps - prepare code for Figure 2 map showing distribution of county poverty tertiles

b_09_figure 1_map - prepare code for revised Figure 1 showing locations of lagged hurricanes

### Model running (models) list:

c_01_hurricane_did_national- national model with state-specific effects for hurricanes only

c_02_hurricane_did_national_effect_modification_race_tertile - national model with state-specific effects, including student race effect modification by tertile for hurricanes only

c_03_hurricane_did_national_effect_modification_SES_tertile - national model with state-specific effects, including SES composite effect modification by tertile for hurricanes only

c_04_hurricane_did_national_effect_modification_speced_tertile - national model with state-specific effects, including special education effect modification by tertile for hurricanes only

c_05_hurricane_did_national_SES_specialed_sensitivity - national model with state-specific effects, effect modification between SES and special education

c_06_cyclone_did_national - national model with state-specific effects for all tropical cyclones

c_07_cyclone_did_national_effect_modification_race_tertile - national model with state-specific effects, including student race effect modification by tertile for hurricanes only

c_08_cyclone_did_national_effect_modification_SES_tertile - national model with state-specific effects, including SES composite effect modification by tertile for hurricanes only

c_09_cyclone_did_national_effect_modification_speced_tertile - national model with state-specific effects, including special education effect modification by tertile for hurricanes only

c_10_tc_did_lagged- national model with state-specific effects for tropical cyclones; lagged

c_11_hurricane_truncated_did_national_effect_modification_race_tertile - national model with state-specific effects, including student race effect modification by tertile for hurricanes only; truncated

c_12_hurricane_truncated_did_national_effect_modification_SES_tertile - national model with state-specific effects, including SES composite effect modification by tertile for hurricanes only; truncated

c_13_hurricane_truncated_did_national_effect_modification_speced_tertile - national model with state-specific effects, including special education effect modification by tertile for hurricanes only; truncated

c_14_cyclone_truncated_did_national - national model with state-specific effects for all tropical cyclones; truncated

c_15_cyclone_truncated_did_national_effect_modification_race_tertile - national model with state-specific effects, including student race effect modification by tertile for hurricanes only; truncated

c_16_cyclone_truncated_did_national_effect_modification_SES_tertile - national model with state-specific effects, including SES composite effect modification by tertile for hurricanes only; truncated

c_17_cyclone_truncated_did_national_effect_modification_speced_tertile - national model with state-specific effects, including special education effect modification by tertile for hurricanes only; truncated

c_18_hurricane_did_lagged - national model with state-specific effects for hurricanes; lagged

c_19_hurricane_did_once - national model with state-specific effects for hurricanes only; in counties with only one hurricane in the timeframe

c_20_cyclone_did_once - national model with state-specific effects for tropical cyclones; in counties with only one tropical cyclone in the timeframe

c_21_hurricane_lagged_did_national_effect_modification_grade - national lagged hurricane model with effect modification by grade level

c_22_hurricane_lagged_did_national_sensitivity - sensitivity analysis of the national lagged hurricane model with state specific effects, adding groups of covariates one at a time (per reviewer request)

### Model processing (model_processing) list:

d_01_posterior probability_math - calculating posterior probabilities for the state-specific math hurricane model

d_02_posterior probability_rla - calculating posterior probabilities for the state-specific RLA hurricane model

d_03_posterior probability_math_lagged - calculating posterior probabilities for the state-specific math lagged hurricane model

d_04_posterior probability_rla_lagged - calculating posterior probabilities for the state-specific RLA lagged hurricane model

d_05_posterior probability_math_national_lagged - calculating posterior probabilities for the national math lagged hurricane model

d_06_posterior probability_rla_national_lagged - calculating posterior probabilities for the national RLA lagged hurricane model

d_07_posterior probability_rla_lagged_sensitivity - calculating posterior probabilities for the national RLA lagged hurricane model, sensitivity analysis with no covariates

d_08_posterior probability_rla_once_sensitivity - calculating posterior probabilities for the national RLA lagged hurricane model, sensitivity analysis for single exposure counties with no covariates

### Model running (model_plotting) list:

e_01_figure 2a_cyclones_math - Forest plot of state-specific tropical cyclone math model, state results

e_02_figure 2b_cyclones_math - Forest plot of state-specific tropical cyclone math model, covariate results

e_03_figure 3a_cyclones_rla - Forest plot of state-specific tropical cyclone rla model, state results

e_04_figure 3b_cyclones_rla - Forest plot of state-specific tropical cyclone rla model, covariate results

e_05_figure 4a_hurricanes_math - Forest plot of state-specific hurricane math model, state results

e_06_figure 4b_hurricanes_math - Forest plot of state-specific hurricane math model, covariate results

e_07_figure 5a_hurricanes_rla - Forest plot of state-specific hurricanes rla model, state results

e_08_figure 5b_hurricanes_rla - Forest plot of state-specific hurricanes rla model, covariate results

e_09_plot_hurricanes_lagged_math - Forest plot of state-specific lagged hurricanes math model, state results

e_10_plot_hurricanes_lagged_rla - Forest plot of state-specific lagged hurricanes RLA model, state results

e_11_plot_cyclones_lagged_math - Forest plot of state-specific lagged tropical cyclones math model, state results

e_12_plot_cyclones_lagged_rla - Forest plot of state-specific lagged tropical cyclones math model, state results

e_13_plot_hurricanes_lagged_grade_math - Forest plot of national lagged hurricane model of math scores, effect modification by grade level

e_14_plot_hurricanes_lagged_grade_rla - Forest plot of national lagged hurricane model of RLA scores, effect modification by grade level

e_15_plot_hurricanes_lagged_covariates_math - Forest plot of national lagged hurricane model of math scores, covariate results

e_16_plot_hurricanes_lagged_covariates_rla - Forest plot of national lagged hurricane model of RLA scores, covariate results

## Directory structure

## Data availability

Data used for this analysis are available via <https://github.com/sparklabnyc/tropical_cyclones_educational_attainment_2022>

The data used in this study were created from the following datasets. - Tropical cyclone and hurricane exposure data are available as a package developed by Dr. Anderson via <https://github.com/geanders/hurricaneexposure> and <https://github.com/geanders/hurricaneexposuredata>. - County-level standardized test score and covariate data from 2008/2009 to 2017/2018 are available via the Stanford Education Data Archive Version 4.1: <https://purl.stanford.edu/xv742vh9296>.
