title: "CodeBook.md"

author: "Joiey Seeley"

date: "07/26/2015"


## Project Description
Create a tidy data set for the John Hopkins Getting and Cleaning Data Course Project based off the Human Activity Recognition Using Smartphones Dataset from the Università degli Studi di Genova.  

##Study design and data processing

###Collection of the raw data

The following information on the original data comes directly from the README.txt of HAR Smartphones Dataset data from Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a          smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to  label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.                                                  
>                                                                                                                                                                                                                                              
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has   gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz     cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###Notes on the original (raw) data 

The original raw data was spread across activity_labels.txt, features.txt as well as a split of test/train data that is spread across label, set, and subject data (X _ (train | test).txt, Y _ (train | test).txt, and subject _ (train | test).txt) 

##Creating the tidy datafile

###Guide to create the tidy data file
The run_analysis.R code file will download and unzip the zipped dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip if it is not already in the relative ./data directory to the project.

###Cleaning of the data
The data from the train and test sets are horizontally merged back together using rbind then the x,y, and subject data sets are vertically merged using cbind.

Human readable activity labels were merged by matching on the activity_id using the data from activity_labels.txt.

Columns that would not be used were removed to tidy the data using grep and then renamed to be more human friendly.

[link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
 - Dimensions of the dataset: 180x68
 - Summary of the data
   - Subject/Activity mean of the merged dataset
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

Column | Variable Name | Definition
-------|---------------|------------
1  | subject_id | subject_id 
2  | activity_name | activity_name 
3  | TimeBodyAccMeanX                   | mean of the body acceleration on the x-axis
4  | TimeBodyAccMeanY                   | mean of the body acceleration on the y-axis
5  | TimeBodyAccMeanZ                   | mean of the body acceleration on the z-axis
6  | TimeBodyAccStdDevX                 | standard deviation of the body acceleration on the x-axis
7  | TimeBodyAccStdDevY                 | standard deviation of the body acceleration on the y-axis
8  | TimeBodyAccStdDevZ                 | standard deviation of the body acceleration on the z-axis
9  | TimeGravityAccMeanX                | mean of the gravity acceleration on the x-axis
10 | TimeGravityAccMeanY                | mean of the gravity acceleration on the y-axis
11 | TimeGravityAccMeanZ                | mean of the gravity acceleration on the z-axis
12 | TimeGravityAccStdDevX              | standard deviation of the gravity acceleration on the x-axis
13 | TimeGravityAccStdDevY              | standard deviation of the gravity acceleration on the y-axis
14 | TimeGravityAccStdDevZ              | standard deviation of the gravity acceleration on the z-axis
15 | TimeBodyAccJerkMeanX               | mean of the body acceleration jerk on the x-axis
16 | TimeBodyAccJerkMeanY               | mean of the body acceleration jerk on the y-axis
17 | TimeBodyAccJerkMeanZ               | mean of the body acceleration jerk on the z-axis
18 | TimeBodyAccJerkStdDevX             | standard deviation of the body acceleration jerk on the x-axis
19 | TimeBodyAccJerkStdDevY             | standard deviation of the body acceleration jerk on the y-axis
20 | TimeBodyAccJerkStdDevZ             | standard deviation of the body acceleration jerk on the z-axis
21 | TimeBodyGyroMeanX                  | mean of the body gyro rotation on the x-axis
22 | TimeBodyGyroMeanY                  | mean of the body gyro rotation on the y-axis
23 | TimeBodyGyroMeanZ                  | mean of the body gyro rotation on the z-axis
24 | TimeBodyGyroStdDevX                | standard deviation of the body gyro rotation on the x-axis
25 | TimeBodyGyroStdDevY                | standard deviation of the body gyro rotation on the y-axis
26 | TimeBodyGyroStdDevZ                | standard deviation of the body gyro rotation on the z-axis
27 | TimeBodyGyroJerkMeanX              | mean of the body gyro rotation jerk on the x-axis
28 | TimeBodyGyroJerkMeanY              | mean of the body gyro rotation jerk on the y-axis
29 | TimeBodyGyroJerkMeanZ              | mean of the body gyro rotation jerk on the z-axis
30 | TimeBodyGyroJerkStdDevX            | standard deviation of the body gyro rotation jerk on the x-axis
31 | TimeBodyGyroJerkStdDevY            | standard deviation of the body gyro rotation jerk on the y-axis
32 | TimeBodyGyroJerkStdDevZ            | standard deviation of the body gyro rotation jerk on the z-axis
33 | TimeBodyAccMagMean                 | mean of the body acceleration magnitude
34 | TimeBodyAccMagStdDev               | standard deviation of the body acceleration magnitude
35 | TimeGravityAccMagMean              | mean of the gravity acceleration magnitude
36 | TimeGravityAccMagStdDev            | standard deviation of the gravity acceleration magnitude
37 | TimeBodyAccJerkMagMean             | mean of the body acceleration jerk magnitude
38 | TimeBodyAccJerkMagStdDev           | standard deviation of the body acceleration jerk magnitude
39 | TimeBodyGyroMagMean                | mean of the body gyro rotation magnitude
40 | TimeBodyGyroMagStdDev              | standard deviation of the body gyro rotation magnitude
41 | TimeBodyGyroJerkMagMean            | mean of the body gyro rotation jerk magnitude
42 | TimeBodyGyroJerkMagStdDev          | standard deviation of the body gyro rotation jerk magnitude
43 | FrequencyBodyAccMeanX              | mean of the body accelleration frequency on the x-axis
44 | FrequencyBodyAccMeanY              | mean of the body accelleration frequency on the y-axis
45 | FrequencyBodyAccMeanZ              | mean of the body accelleration frequency on the z-axis
46 | FrequencyBodyAccStdDevX            | standard deviation of the body accelleration frequency on the x-axis
47 | FrequencyBodyAccStdDevY            | standard deviation of the body accelleration frequency on the y-axis
48 | FrequencyBodyAccStdDevZ            | standard deviation of the body accelleration frequency on the z-axis
49 | FrequencyBodyAccJerkMeanX          | mean of the body accelleration jerk frequency on the x-axis
50 | FrequencyBodyAccJerkMeanY          | mean of the body accelleration jerk frequency on the y-axis
51 | FrequencyBodyAccJerkMeanZ          | mean of the body accelleration jerk frequency on the z-axis
52 | FrequencyBodyAccJerkStdDevX        | standard deviation of the body accelleration jerk frequency on the x-axis
53 | FrequencyBodyAccJerkStdDevY        | standard deviation of the body accelleration jerk frequency on the y-axis
54 | FrequencyBodyAccJerkStdDevZ        | standard deviation of the body accelleration jerk frequency on the z-axis
55 | FrequencyBodyGyroMeanX             | mean of the body gyro rotation frequency on the x-axis
56 | FrequencyBodyGyroMeanY             | mean of the body gyro rotation frequency on the y-axis
57 | FrequencyBodyGyroMeanZ             | mean of the body gyro rotation frequency on the z-axis
58 | FrequencyBodyGyroStdDevX           | standard deviation of the body gyro rotation frequency on the x-axis
59 | FrequencyBodyGyroStdDevY           | standard deviation of the body gyro rotation frequency on the y-axis
60 | FrequencyBodyGyroStdDevZ           | standard deviation of the body gyro rotation frequency on the z-axis
61 | FrequencyBodyAccMagMean            | mean of the body accelleration magnitude frequency 
62 | FrequencyBodyAccMagStdDev          | standard deviation of the body accelleration magnitude frequency
63 | FrequencyBodyBodyAccJerkMagMean    | mean of the body accelleration jerk magnitude frequency 
64 | FrequencyBodyBodyAccJerkMagStdDev  | standard deviation of the body accelleration jerk magnitude frequency
65 | FrequencyBodyBodyGyroMagMean       | mean of the body gyro rotation magnitude frequency 
66 | FrequencyBodyBodyGyroMagStdDev     | standard deviation of the body gyro rotation magnitude frequency
67 | FrequencyBodyBodyGyroJerkMagMean   | mean of the body gyro rotation jerk magnitude frequency 
68 | FrequencyBodyBodyGyroJerkMagStdDev | standard deviation of the body gyro rotation jerk magnitude frequency