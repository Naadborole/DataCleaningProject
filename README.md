# Getting and Cleaning Data Project

This project involves cleaning the [Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) and generating tidy data.

## Contents

File | description
-----|------------
run_analysis.R |Main script that runs analysis on dataset
TidyData.txt| Tidy dataset obtained after running script
CodeBook.md|Code book describing variables

## Goal of Script

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Source

The data can be found [here](https://archive.ics.uci.edu/ml/machine-learning-databases/00240/).
