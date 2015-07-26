# GettingAndCleaningData
Course Project for Getting and Cleaning Data

### Directions

#### Notes

The run_analysis.R file attempts to set the directory to the directory where the run_analysis.R file resides using the line `setwd(dirname(sys.frame(1)$ofile))`

While that worked on my normal environment; it is not consistent and I was unable to find a way to consistently locate the current directory of a file in the R language that works under all environments.  If it were to fail then the line would need to be commented out and a manual setwd() to the directory where run_analysis.R lives prior to sourcing the file would be needed.

#### Dependencies

The `plyr` package must be installed for this to work.

#### Overview

The run_analysis.R code will check if the dataset has been downloaded and unzipped to a relative `data` directory, if not it will download and unzip the file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" as specified in the class project overview.

I used rbind/cbind to merge the rows and columns of the training and testing datasets into a single dataset and then applied activity labels and subject ids.  I then used gsub and grep to remove unneeded data columns and make column names more human readable.

Lastly I used ddply to calculate the mean of the subject/activities for the final `tiny_data.txt` file.