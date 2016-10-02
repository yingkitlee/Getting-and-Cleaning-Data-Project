# Coursera Data Science Specialization #
## Getting and Cleaning Data Course Project ##
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files in this Repo ##

* README.md - ***Description about the project***
* Codebook.md - ***Describes the variables, the data, and any transformations or work performed to clean up the data***
* run_analysis.R - ***R Script of the code***

## Accomplishment of run_analysis.R ##
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**During runtime you will have to specify the working directory**

## Required Libraries: ##
* data.table
* reshape2

## Explanation of the script ##

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
