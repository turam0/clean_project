codebook
=========

# Raw Data
The raw data was downloaded from here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It is unzipped and we are mostly interested in only a few of the files.

The actual measurements appear to be in these two files:
* X_train.txt
* X_test.txt

The activity types are stored in the 'Y' files:
* Y_train.txt
* Y_test.txt

The activity names are stored in:
* activity_labels.txt

The subject lists are stored in:
* subject_train.txt
* subject_test.txt

The names of the feature columns are stored in:
* features.txt

# Merge Processing

1. The X train and X test files were combined into a single set of observations
2. The Y train and Y test files were combined in the same order to produce the list of activities for all of the observations
3. The subject train and subject test files were also combined in the same order to have a list of all subjects
4. The results of these files (subject, Y (activities), and X (observations)) were combined together into a single data set.
5. The features from features.txt are set to the column names for all of the observations
6. The activity names are replaced with the actual activity labels from the activity_labels.txt file.

# Extraction of columns for means or standard deviations
Using a regular expression match on the column names, all names that contain 'mean' or 'std' were extracted while all other columns are discarded

# Final output
The resulting data set is unpivoted (or melted I guess they call it in this R land) and then each feature value is average by subject and activity type.

It contains 81 columns

* activity.name - this is the name of the activity that occuring when measurement was taken and is taken from the activity_labels.txt file
* subject - this is the subject id number for which the measurements were taken
* all others - the rest are a bunch of averages for each measurement type by each activity and subject.








