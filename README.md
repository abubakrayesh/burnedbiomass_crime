# burnedbiomass_crime
Replication Data for JEEM Publication

Final data is in "Final.zip"
Code for replicating all tables and figures is in "Analysis"

The data is created from Raw to Final in the following steps:
  Step 1 coverts data under "Raw" into data under "Temporary"
  Step 2 converts data under "Temporary" into data under "Processed"
  Step 3 converts data under "Processed" into data under "Final" 

For do files to be used for each step, refer to the below:


The raw data files are located in Raw.
Note: the raw raster files for Aerosol Optical Depth and Fire data, and dta files for publicly available survey data for mechanisms are not provided because they are more than 65 GB in size. However, the code used to process those raster files is provided in Code/R/aod and Code/Stata/PSLM. 

The Raw data files are then used to create the data files located in Temporary.
  Both R and Stata are used for this purpose. The relevant code can be found at RCode/weather and RCode/wind for R files; and StataCode/climate for Stata.
  First run all the R code under Weather and Wind folders.
  Next run all the Stata code under climate and PSLM folders (assuming you have the PSLM data).

The Temporary data files are then used to create the data files located in Processed.
  The Do file in Code/Stata titled “import” and “import_2” are used for this purpose.
  The “import_2” DO file creates the dataset for distance from rice growing districts. The user should first run the code of “import” DO file. 
  Next, the user should run the R script files located in Code/R/distance to calculate the distance from rice growing districts to remaining districts. 
  Then, the user can run the code in the “import_2” DO file. Necessary annotations are provided in the DO file.

Finally, construct the final two datasets for analysis, located in Final.
  The Do file in StataCode titled “merge” is used for this purpose.
