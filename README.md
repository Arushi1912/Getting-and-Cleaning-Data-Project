# Getting-and-Cleaning-Data-Project

The datasets are downloaded in a folder called "UCI HAR Dataset." It comprises the test folder, train folder, as well as the activity labels and features, etc. 

run_analysis.R 
1. It loads the activity, feature, test and train datasets.
2. It merges the test and train datasets for x, y and subject correspondingly.
3. It creates the character vector that consists of all the relevant column headers i.e subject, activity, mean, std measurements.
4. It subsets the original datatable to give the required datatable.
5. It uses activity labels to factorise the Activity Column so that the activity numbers are replaced by the activity labels. 
6. It also labels the dataset variables correctly using gsub with regex. 
7. It averages all the values per activity per subject. 
8. The data table is then written to a file called "Data.txt."

CodeBook.md
This illustrates all the variables, and data, along with any transformations that have occured while tidying the data.


Data.txt
This file constitutes the final dataset, after cleaning.
