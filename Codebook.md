# CodeBook

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## The data source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Variables:

* activity_labels: Row bind of train_label and test_label
* features: List of features
* extract_features: TRUE/FALSE values that matched the mean and standard deviation
* X_train: Contains the X training data
* y_train: Contains the y training data
* subject_train: Contains the subject training data
* train_data: Contains the training data combined based on X, y, and subject
* X_test: Contains the X testing data
* y_test: Contains the y testing data
* subject_test: Contains the subject testing data
* test_data: Contains the testing data combined based on X, y, and subject
* data: Contains the combined data of train_data and test_data
* id_labels: Contains the ID of the labels
* data_labels: Contains the list of extracted labels
* melt_data: Contains the molten data frame based on id_labels and measured based on data_labels
* tidy_data: Contains the tidied data by dcast molten dataset and apply mean function

## Transformation details

* **Load required libraries.**

* **Set working directory.**
 
* **Load activity labels and features**

* **Extract only the mean and standard deviation**
  
* **Get and process training data**
 * Read X_train data and labeled data by features then extracted data based on mean and std measurements
 * Read y_train data and labeled data by activities
 * Read subject_train data
 * Combine training data based on subject, extracted features and activities

* **Get and process testing data**
 * Read X_test data and labeled data by features then extracted data based on mean and std measurements
 * Read y_test data and labeled data by activities
 * Read subject_test data
 * Combine testing data based on subject, extracted features and activities
 
* **Merge test and train data**

* **Tidy data**
 * Melt data based on id_labels and measure by data_labels
 * Apply mean function to dataset using dcast function
 * Output data to file

