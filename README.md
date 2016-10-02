### Getting-and-Cleaning-Data-Project

### run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject then output it to a file.

### Required Libraries:

1. data.table
2. reshape2

### Variables:

1. activity_labels: Row bind of train_label and test_label
2. features: List of features 
3. extract_features: TRUE/FALSE values that matched the mean and standard deviation
4. X_train: Contains the X training data 
5. y_train: Contains the y training data 
6. subject_train: Contains the subject training data 
7. train_data: Contains the training data combined based on X, y, and subject
8. X_test: Contains the X testing data 
9. y_test: Contains the y testing data 
10. subject_test: Contains the subject testing data 
11. test_data: Contains the testing data combined based on X, y, and subject
12. data: Contains the combined data of train_data and test_data 
13. id_labels: Contains the ID of the labels
14. data_labels: Contains the list of extracted labels
15. melt_data: Contains the molten data frame based on id_labels and measured based on data_labels
16. tidy_data: Contains the tidied data by dcast molten dataset and apply mean function
