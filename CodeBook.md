==================================================================
Getting and Cleaning Data Course Project CodeBook
==================================================================

The original dataset was downloaded from the URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

activity_lables.txt
6 observations and 2 variables. The columns consist of activity ID and activity name. The activity ID maps in y_test.txt.

features.txt
561 observations and 2 variables. feature ID and feature name. A 561-feature vector with time and frequency domain variables and it maps with X_test.txt and X_train.txt.

subject_test.txt, subject_train.txt
An identifier of the subject who carried out the experiment. If you combine subject_test.txt and subject_train.txt, you will get a datatable with 10299 rows and 1 variable. It it same row number with merged data of X data (X_test.txt and X_train.txt) and Y data (Y_test.txt and Y_train.txt).

X_test.txt, X_train.txt
These data 561 variables and then you will get 10299 observations if you bind rows together. The 561 variables match features number defined in features.txt by feature ID.

Y_test.txt, Y_train.txt
10299 observations of 1 variable after row binding. The variable in the dataset represents activity ID, which is defined in activity_labels.txt.


tidy_dataset.txt
You will get this file after running run_analysis.R. It is a tidy data set with the average of each variable for each activity and each subject.
It consist of 180 observations and 68 variables. It looks like the following:

		subject          activity fBodyAcc.mean.X ~ tGravityAccMag.std
	1       1            LAYING     -0.93909905     -0.79514486

	180      30 WALKINGUPSTAIRS      -0.4204028      -0.3274108



Each variables in the tidy data set represents the following:


subject
An identifier of the volunteer who involved in the experiment.
This variable ranges 1 to 30.


activity
Activity name participants has involved in the experiment. This variable has one of the following values:
LAYING
SITTING
STANDING
WALKING
WALKINGDOWNSTAIRS
WALKINGUPSTAIRS


other variables(fBodyAcc.mean.X to tGravityAccMag.std)
numeric field. It Represents feature names. These variables will have name pattern like tBodyAcc.mean.X. tBodyAcc indicates it comes from accelerometer and tGyro from gyroscope 3-axial raw signals. The second part, mean and std, stand for 'mean value' and 'standard deviation'.
Last part(X,Y,Z) is directions.
