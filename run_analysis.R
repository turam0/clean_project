


# Read in all of the files

# all training files
x_train <- read.table("..\\UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table("..\\UCI HAR Dataset\\train\\y_train.txt")
sub_train <- read.table("..\\UCI HAR Dataset\\train\\subject_train.txt")


# all test files
x_test <- read.table("..\\UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table("..\\UCI HAR Dataset\\test\\y_test.txt")
sub_test <- read.table("..\\UCI HAR Dataset\\test\\subject_test.txt")


# features and activities files
features <- read.table("..\\UCI HAR Dataset\\features.txt")
activities <- read.table("..\\UCI HAR Dataset\\activity_labels.txt")



########   Combine test and train into one dataset

x_combine <- rbind(x_train,x_test)
y_combine <- rbind(y_train,y_test)
sub_combine <- rbind(sub_train,sub_test)

# remove old data
rm(x_train)
rm(x_test)
rm(y_train)
rm(y_test)
rm(sub_train)
rm(sub_test)

# create column names on x_combine
features[,2]<-as.character(features[,2])
activities[,2]<-as.character(activities[,2])
names(x_combine) <- features[,2]
names(y_combine) <- "activity"
names(sub_combine) <- "subject"
names(activities) <- c("activity.id","activity.name")

# subset x_combine to include only the features that are means or std deviations
x_combine<-x_combine[,grepl("mean|std",features[,2])]

# create a new merged dataset with x_combine and y_combine (activity)
merged_set <- cbind(sub_combine,y_combine)
merged_set <- cbind(merged_set,x_combine)
rm(x_combine)
rm(y_combine)
rm(sub_combine)


# merge the final data set with the activity list to have meaningful activity names instead of activity ids
merged_set<-merge(activities,merged_set,by.x="activity.id",by.y="activity")
merged_set$activity.id <- NULL


# Creating a new data set that contains the mean of each variable by subject and activity
melted_set <- melt(merged_set,id=c("activity.name","subject"))

average_set <- dcast(melted_set, activity.name + subject ~ variable, fun.aggregate=mean)


# write out the new merged data to a file
write.table(average_set,"average_data.csv",sep=",")




