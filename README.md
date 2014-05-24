clean_project for coursera.
=============

## Overview
run_analysis.R is the main program which will take the input data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and create a new dataset which is an average of every mean and std deviation feature column from the original dataset

## Setup
The script assumes the following:
* The data is downloaded and unzipped into a directory above the current working directory.
* The column names that we are interested in extracted and averaging are the mean and standard deviation columns which must include either 'mean' or 'std' in the column feature name.

## Output
The script writes a file to the current working directory:  average_data.csv
It is a comma separated value file with text in "" characters



