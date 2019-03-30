<h5> Download the dataset </h5>
Dataset is downloaded and extracted to a folder named "UCI HAR Dataset"

<h5> Assigning data to variables </h5>
features <- features.txt : 561 rows, 2 columns 
These features indicate gyroscopic and accelerometer measurements across all subjects and activities.

activity_labels <- activity_labels.txt : 6 rows, 2 columns 
These indicate the corresponding activity for the activity code, eg : 1 for WALKING.

subject_test <- test/subject_test.txt : 2947 rows, 1 column 
These contain test data (ids) for 30% of the subjects. 

x_test <- test/X_test.txt : 2947 rows, 561 columns 
These contain measured data across all features for 30% of the subjects.

y_test <- test/y_test.txt : 2947 rows, 1 columns 
These contain the performed activity code across all features for 30% of the subject.

subject_train <- test/subject_train.txt : 7352 rows, 1 column 
These contain test data (ids) for 70% of the subjects.

x_train <- test/X_train.txt : 7352 rows, 561 columns 
These contain measured data across all features for 70% of the subjects.

y_train <- test/y_train.txt : 7352 rows, 1 columns 
These contain the performed activity code across all features for 30% of the subject.

<h5> Process activity_labels and features </h5>

<h5> Merges the training and the test sets to create one data set </h5>

featuresCombined(10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function

activityCombined (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function

subjectCombined (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function

totalCombined (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

<h5> Extracts only the measurements on the mean and standard deviation for each measurement </h5>

totalCombined (10299 rows, 88 columns) is created by subsetting totalCombined, selecting only columns: subject, activity and required mean and standard deviation measures.

<h5> Uses descriptive activity names to name the activities in the data set </h5>
The numbers in the activity columns i.e activity codes is now replaced by corresponding activity in activity labels.

<h5> Appropriately labels the data set </h5>
All that start with 't' in column’s name subsituted with Time.
All that start with character 'f' in column’s name subsituted with Frequency.
All Acc in column’s name subsituted with Accelerometer.
All Gyro in column’s name subsituted with Gyroscope.
All Mag in column’s name subsituted with Magnitude.
All -mean in column's name subsituted with Mean.
All -std in column's name subsituted with STD.
All BodyBody in column’s name subsituted with Body.



<h5> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject </h5>
totalCombined (180 rows, 81 columns) is created by sumarizing totalCombined taking the means of each variable per subject per activity, via group_by subject and activity.

<h5> Write the datatable as a txt file </h5>
Export totalCombined into Data.txt file.
