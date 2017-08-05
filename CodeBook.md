# Human Activity Using Smartphones Dataset - Generate Tidy Summary

This R project is submitted as a peer-graded assignment for Getting and Cleaning Data (Coursera). The script 'run_analysis.R' is designed to read a series of summary data files, join them into a single data frame, and output a grouped summary of the combined data containing the mean values of selected variables of interest.

## The data

The files in the 'raw_data' folder were generated for a study [1] of human movements as recorded by smartphones. In the study, thirty subjects were recorded multiple times undertaking six different physical activities. (See 'raw_data/README.txt' for methodology.) The data recorded on the smartphones is recorded under 'raw_data/test/Inertial Signals' and 'raw_data/train/Inertial Signals'. 561 vectors, normalized between -1 and 1, were derived from the smartphone readings for each recording session. The R script generates a file summarizing the derived measures by taking their mean over subject and activity.

- 'README.md'

- 'CodeBook.md': This document

- 'run_analysis.R': The script that processes the data

- 'tidy_data_set.txt': The output of 'run_analysis.R' generated from the contents of 'raw_data'

- 'raw_data/README.txt'

- 'raw_data/features_info.txt': Shows information about the variables used on the feature vector.

- 'raw_data/features.txt': List of all features.

- 'raw_data/activity_labels.txt': Links the class labels with their activity name.

- 'raw_data/train/X_train.txt': Training set.

- 'raw_data/train/y_train.txt': Training labels.

- 'raw_data/test/X_test.txt': Test set.

- 'raw_data/test/y_test.txt': Test labels.

- 'raw_data/train/subject_train.txt' and 'raw_data/test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

'raw_data/features_info.txt' describes 33 variables the were measured for each session. This script is only concerned with the mean and standard deviation of each variable, so the output contains 68 columns (subject, activity, and mean and std for 33 variables).

## Procedure

1. Using 'raw_data/features.txt', identify the columns that represent the mean and standard deviation of derived variables - only the column names containing the string 'mean()' or 'std()'.

2. read in 'raw_data/test/X_test.txt', extract only the columns of interest as identified in Step 1, and apply the names of those columns for readability.

3. column-bind 'raw_data/test/subject_test.txt' (list of subjects by number), 'raw_data/test/y_test.txt' (list of activities by number), and the reduced version of 'raw_data/test/X_test.txt' to produce a single 68-column data frame.

4. Repeat Steps 2 and 3 for 'raw_data/train/subject_train.txt', 'raw_data/train/X_train.txt', and 'raw_data/train/y_train.txt'.

5. Row-bind the testing and training data frames to produce a combined frame showing the data for all subjects.

6. Replace each activity number with the string describing the activity using the key in 'raw_data/activity_labels.txt'

7. Grouping the combined data set by subject and activity, take the mean of all other columns; output the resulting tidy summary to 'tidy_data_set.txt'.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


