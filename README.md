
This file describes how run_analysis.R script works.

First, download and unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Make sure the folder extracted from the downloaded zipped file and the run_analysis.R script are both in the current working directory, and "plyr" should be installed on th computer before running the script.

Second, run source("run_analysis.R") command in R. Then an output file "Mean_of_M_and_SD.txt" (225 Kb), will be generated in the current working directory, which contains the result for step 5 with 180*68 dimension.

Use data <- read.table("Mean_of_M_and_SD.txt", header=T) to read the file. Because the project requested us to get the average of each variable for each activity and each subject, there are 6 activities and 30 subjects in total, so we have 180 rows and 68 colomns with all combinations for each of the 66 features.
