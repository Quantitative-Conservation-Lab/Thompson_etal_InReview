# Balancing monitoring and management in the adaptive management of an invasive species

### Thompson BK, JD Olden, and SJ Converse

### Journal

### DOI: 

### Please contact the first author for questions about the code or data: Brielle K Thompson (bkwarta@uw.edu)

__________________________________________________________________________________________________________________________________________

## Code: 

The repository is organized as follows. 

* **scripts**: simulation scripts and JAGS model code
  + <em>Estimation<em>: Includes estimation model code. Folders labeled 'Bothdata' indicate scripts where community science data is integrated. Folders labeled 'MultistateDNDdata' indicate that only agency data is included. Folders indicated with 'space2' are analysis for an emergent invasion.
  + <em>No-removal<em>: Include no removal scenario scripts
  + parametersets_R: files 'a' and 'b' simulate parameter sets for the study

* **post simulation process**: scripts for cleaning result files
* **spatial data**: spatial data used for this study
* **suppression plots**: plots for figure 5 in the main text
* **data**: data files used for model inputs

* Jags txt files are as follows:
  + Flower_datM_est1_explore = year 1 and 2 estimitation model during the period where we 'explore' and learn about the relationship between detection probability and hours spent monitoring, using only agency data
  + Flower_datM_est2_explore = year 3 estimitation model during the period where we 'explore' and learn about the relationship between detection probability and hours spent monitoring, using only agency data
  + Flower_datM_est2.txt = year 4+ estimation model, using only agency data
  + Flower_datB_est2.txt = year 4+ estimation model, using agency and community science data
