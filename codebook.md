## Code Book

This Code Book will describe the variables and data files used in the exercise. To use this code, just place the run_analysis.R script in a folder and execute it there. The script is designed to pull the data from the internet and unzip it. 

# Dource data
The source data is human activity data from Samsung phones. Details are available here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

If you would like to manually obtain the data and unzip it, it is available at the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## run_analysis.R
The run_analysis.R script executes all steps described in the Coursera exercise for week 4 of Getting and Cleaning Data as it was described in February of 2017. 

* Data sets beginning as separate test and training sets are compiled into a single master set
* The mean and STDEV are extracted from the master set.
* Activity names are labeled with descriptive names
* An independent set of tidy data is made averaging by activity and subject.
