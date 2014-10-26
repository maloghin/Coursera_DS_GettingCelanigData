##Getting and Cleaning Data (Coursera) Course Project 

The purpose of this project is to apply the techniques of collecting and cleaning data and prepare tidy data set that can be used for subsequent data analysis and sharing processes. The techniques are taught in the Coursera / Getting & Cleaning Data course.

##Data Sets

###Original Data Set

The data made available for this course project represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded >accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

>Check the README.txt file for further details about this dataset.

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

A full description is available at the site where the data was obtained. 
For a complete description of the data collection process and data set information, pleas refer tot the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

And here is the link for the data project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Processed Tidy Data Set

The tidy data set is a TXT file ("DataSetMeanStd_Mean.txt"). The file contains the result dataset produced from row data made available for the project and processed following  the specifications:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



####Features Selection

For each dataset record it is provided:
1.Activity class label (integer)
2.Activity name (factor)
3.Identifier for the subject who performed the activity (integer)
4.79 measurements vector with averaged value, for each subject and activity, from original dataset (floating point numbers) 

To learn more and to understand the future selection for the purpose of this tidy dataset, please refer to the specifications files in the original dataset provided above.

For the purpose of this assignment the measurements extracted are only the measurements on the mean and standard deviation from the original dataset.

#####Complete list of variables:

* Identification variables
  + ActivityID
  + Activity
  + SubjectID
 
* Time domain measurements along X, Y, and Z:
  + tBodyAcc_mean_X
  + tBodyAcc_mean_Y
  + tBoyAcc_mean_Z
  + tBodyAcc_std_X
  + tBodyAcc_std_Y
  + tBodyAcc_std_Z
  + tGravityAcc_mean_X
  + tGravityAcc_mean_Y
  + tGravityAcc_mean_Z
  + tGravityAcc_std_X
  + tGravityAcc_std_Y
  + tGravityAcc_std_Z
  + tBodyAccJerk_mean_X
  + tBodyAccJerk_mean_Y
  + tBodyAccJerk_mean_Z
  + tBodyAccJerk_std_X
  + tBodyAccJerk_std_Y
  + tBodyAccJerk_std_Z
  + tBodyGyro_mean_X
  + tBodyGyro_mean_Y
  + tBodyGyro_mean_Z
  + tBodyGyro_std_X
  + tBodyGyro_std_Y
  + tBodyGyro_std_Z
  + tBodyGyroJerk_mean_X
  + tBodyGyroJerk_mean_Y
  + tBodyGyroJerk_mean_Z
  + tBodyGyroJerk_std_X
  + tBodyGyroJerk_std_Y
  + tBodyGyroJerk_std_Z
  + tBodyAccMag_mean
  + tBodyAccMag_std
  + tGravityAccMag_mean
  + tGravityAccMag_std
  + tBodyAccJerkMag_mean
  + tBodyAccJerkMag_std
  + tBodyGyroMag_mean
  + tBodyGyroMag_std
  + tBodyGyroJerkMag_mean

* Frequency domain measurements along X, Y, and Z:
  + tBodyGyroJerkMag_std
  + fBodyAcc_mean_X
  + fBodyAcc_mean_Y
  + fBodyAcc_mean_Z
  + fBodyAcc_std_X
  + fBodyAcc_std_Y
  + fBodyAcc_std_Z
  + fBodyAcc_meanFreq_X
  + fBodyAcc_meanFreq_Y
  + fBodyAcc_meanFreq_Z
  + fBodyAccJerk_mean_X
  + fBodyAccJerk_mean_Y
  + fBodyAccJerk_mean_Z
  + fBodyAccJerk_std_X
  + fBodyAccJerk_std_Y
  + fBodyAccJerk_std_Z
  + fBodyAccJerk_meanFreq_X
  + fBodyAccJerk_meanFreq_Y
  + fBodyAccJerk_meanFreq_Z
  + fBodyGyro_mean_X
  + fBodyGyro_mean_Y
  + fBodyGyro_mean_Z
  + fBodyGyro_std_X
  + fBodyGyro_std_Y
  + fBodyGyro_std_Z
  + fBodyGyro_meanFreq_X
  + fBodyGyro_meanFreq_Y
  + fBodyGyro_meanFreq_Z
  + fBodyAccMag_mean
  + fBodyAccMag_std
  + fBodyAccMag_meanFreq
  + fBodyBodyAccJerkMag_mean
  + fBodyBodyAccJerkMag_std
  + fBodyBodyAccJerkMag_meanFreq
  + fBodyBodyGyroMag_mean
  + fBodyBodyGyroMag_std
  + fBodyBodyGyroMag_meanFreq
  + fBodyBodyGyroJerkMag_mean
  + fBodyBodyGyroJerkMag_std
  + fBodyBodyGyroJerkMag_meanFreq



##Data processing

1. Loads required librarys 
2. Downloads required data from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. Extract zip archive from the downloaded file
4. Read complete list of variables from features.txt
5. Read Tests data set into data frame object from data files and name the data frame columns. Used data files:
  * subject_test subject ids
  * y_test activity class labels
  * X_test data measurements
6. Read Train data set into data frame objects from data file and name the data frame columns. Used data files:
  * subject_train subject ids
  * y_train activity class labels
  * X_train data measurements
7. Merges the training and the test sets to create one data set and add the Subject and Class Activiy Label
8. Extracts only the measurements on the mean and standard deviation for each measurement 
9. Name the activities in the data set using descriptive activity names from activity_labels.txt data file
10. Creates a new, independent tidy data set with the average of each variable for each activity and each subject
11. Write the tidy into DataSetMeanStd_Mean.txt


