# This line of code will set the working directory to 
# match the directory of this source file
setwd(dirname(sys.frame(1)$ofile))

if(!file.exists("data")){ dir.create("data")}
if(!file.exists("data/data.zip")){ 
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "./data/data.zip", method = "curl")
  setwd("./data/")
  unzip("data.zip")
  setwd("..")
} 

# read in top level mapping files and add some user friendly column names
features <- read.csv("data/UCI HAR Dataset/features.txt", header = FALSE, sep = " ", col.names = c("feature_id", "feature_name"))
activity_labels <- read.csv("data/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = " ", col.names = c("activity_id", "activity_name"))

# read in train files
xtrain <- read.fwf("data/UCI HAR Dataset/train/X_train.txt", rep(16, 561))
ytrain <- read.csv("data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.csv("data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# read in test files
xtest <- read.fwf("data/UCI HAR Dataset/test/X_test.txt", rep(16, 561))
ytest <- read.csv("data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.csv("data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# 1. Merges the training and the test sets to create one data set.

# First I'm rbind-ing the data with similar columns
# then mapping on human readable column names
x <- rbind(xtrain, xtest)
colnames(x) = features$feature_name # This maps on the feature names for Step #4
y <- rbind(ytrain, ytest)
colnames(y) = "activity_id"
subject <- rbind(subject_train, subject_test)
colnames(subject) = "subject_id"

# At this point all of the datasets (x,y,subject) should have the same number or rows
# so I cbind them up into one unified set of data
merged_data <- cbind(x,y,subject)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#  Note: I kept activity_id and subject_id around for now to make later steps easier.
mean_std_cols <- grep(".*(mean\\(\\)|std|activity_id|subject_id).*", colnames(merged_data))
merged_data <- merged_data[,mean_std_cols]

# 3. Uses descriptive activity names to name the activities in the data set
merged_data$activity_name <- activity_labels[merged_data$activity_id, 2]

# This cleans up the activity_id column since I no longer need it
merged_data <- merged_data[,!(names(merged_data) %in% c("activity_id"))]


# 4. Appropriately labels the data set with descriptive variable names. 
# I mapped the activity_labels on earlier, now I'm just cleaning up a bit
# to make things more human readable
columns <- colnames(merged_data)
columns <- gsub("\\()", "", columns)
columns <- gsub("-std", "StdDev", columns)
columns <- gsub("-mean", "Mean", columns)
columns <- gsub("^t", "Time", columns)
columns <- gsub("^f", "Frequency", columns)
columns <- gsub("-", "", columns)
colnames(merged_data) <- columns

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
avg <- ddply(merged_data, .(merged_data$subject_id, activity_name), function(i) colMeans(i[, 1:66]))
write.table(avg, "tiny_data.txt", row.name=FALSE)

# list.files("./data")
# TODO: Read it back in at the end
#data <- read.table(file_path, header = TRUE) #if they used some other way of saving the file than a default write.table, this step will be different
#View(data)