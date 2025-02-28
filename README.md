# Balancing monitoring and management in the adaptive management of an invasive species

### Brielle K. Thompson, Julian D. Olden, Sarah J. Converse

### Journal: 

### DOI: 

### Please contact the first author for questions about the code or data: Brielle K Thompson (bkwarta@uw.edu)

__________________________________________________________________________________________________________________________________________

## Abstract


## Table of contents: 
The repository is organized as follows. 

* **scripts**: simulation scripts and JAGS model code, simulation code for parameter values
* **data**: data files used for model inputs
* **results**: scripts for cleaning result files and creating manuscript plots
  + Raw result files can be obtained by emailing the first author


## Required Packages and Versions Used
LaplacesDemon_16.1.6
rjags_4-15
R2jags_0.8-5
MCMCvis_0.16.3
tidyverse_2.0.0
strex_2.0.0
plyr_1.8.9
readr_2.1.5

## Details of Article
Thompson BK, Olden JD, Converse SJ. In Review. Balancing monitoring and management in the adaptive management of an invasive species

## How to Use this Repository
In the scripts folder, the Management Strategy Evaluation process can be found in the estimation sub folder. The 'MultistateDNDdata' folder includes scripts to run analysis without community science data and the 'Bothdata' folder includes scripts to run analysis with community science data. Scripts entitled space1 is used for the analysis with an established invader and space2 is used for the analysis with an emerging invader. Prior to running the adaptive management alternatives, the 'first3yrs' scripts are run to establish the relationship between detection and search effort. Then, the other alternatives can be run (e.g., linear, high invasion, and epicenter scripts). 
