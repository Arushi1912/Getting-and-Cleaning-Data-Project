#Loaded dplyr and data table packages.
#Inside the UCI Har dataset folder.

#Loads features and activity labels
features <- data.table::fread("features.txt")
activity_labels <- data.table::fread("activity_labels.txt")

#Load the test dataset
subject_test <- data.table::fread("./test/subject_test.txt")
x_test <- data.table::fread("./test/X_test.txt")
y_test <- data.table::fread("./test/y_test.txt")

#Load the training dataset
subject_train <- data.table::fread("./train/subject_train.txt")
x_train <- data.table::fread("./train/X_train.txt")
y_train <- data.table::fread("./train/y_train.txt")

#Processing 
features <- features[, 2]
activity_labels <- activity_labels[, 2]
requiredFeatures <- c("Subject", "Activity", features$V2[grep("mean\\(\\)|std\\(\\)", features$V2) ])


#1. Merges the training and the test sets to create one data set.
featuresCombined <- rbind(x_train, x_test)
activityCombined <- rbind(y_train, y_test)
subjectCombined <- rbind(subject_train, subject_test)

#Adding column names to each variable 
names(featuresCombined) <- as.character(transpose(features))
names(activityCombined) <- c("Activity")
names(subjectCombined) <- c("Subject")

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
totalCombined <- cbind(subjectCombined, activityCombined, featuresCombined)
totalCombined <- totalCombined[, ..requiredFeatures]

#3. Uses descriptive activity names to name the activities in the data set
totalCombined$Activity <- factor(totalCombined$Activity)
levels(totalCombined$Activity) <- activity_labels$V2
totalCombined <- totalCombined[order(totalCombined$Subject, totalCombined$Activity), ]

#4. Appropriately label the dataset 
names(totalCombined) <- gsub("^t", "Time", names(totalCombined))
names(totalCombined) <- gsub("^f", "Frequency", names(totalCombined))
names(totalCombined) <- gsub("Acc", "Accelerometer", names(totalCombined))
names(totalCombined) <- gsub("Gyro", "Gyroscope", names(totalCombined))
names(totalCombined) <- gsub("Mag", "Magnitude", names(totalCombined))
names(totalCombined) <- gsub("-mean", "Mean", names(totalCombined))
names(totalCombined) <- gsub("-std", "STD", names(totalCombined))
names(totalCombined) <- gsub("BodyBody", "Body", names(totalCombined))

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
totalCombined <- totalCombined %>% group_by(Subject, Activity) %>% summarize_all(mean)

#Write the datatable as a txt file
write.table(totalCombined, "Data.txt", row.name=FALSE)

