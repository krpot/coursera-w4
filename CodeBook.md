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
These are all numeric fields. The variable names has pattern like fBodyAccJerk-mean-X, which means:

f: freqency domain.
t: time domain.

BodyAcc: body acceleration captured by accelerometer. 
BodyAccJerk: body acceleration jerk captured by accelerometer.
BodyAccGyro: body acceleration captured by gyroscope.
BodyAccGyroJerk: body acceleration jerk captured by gyroscope.

Mag: Magnitute

mean: Average value
std: Standard deviation

X: X cooridnate
Y: Y coordinate
Z: Z coordinate


All mesaurement value columns are like below:

Frequency domain:
fBodyAcc-mean-X
fBodyAcc-mean-Y
fBodyAcc-mean-Z 
fBodyAcc-std-X 
fBodyAcc-std-Y 
fBodyAcc-std-Z 
fBodyAccJerk-mean-X 
fBodyAccJerk-mean-Y 
fBodyAccJerk-mean-Z 
fBodyAccJerk-std-X 
fBodyAccJerk-std-Y 
fBodyAccJerk-std-Z 
fBodyAccMag-mean 
fBodyAccMag-std 
fBodyBodyAccJerkMag-mean 
fBodyBodyAccJerkMag-std 
fBodyBodyGyroJerkMag-mean 
fBodyBodyGyroJerkMag-std 
fBodyBodyGyroMag-mean 
fBodyBodyGyroMag-std 
fBodyGyro-mean-X 
fBodyGyro-mean-Y 
fBodyGyro-mean-Z 
fBodyGyro-std-X 
fBodyGyro-std-Y 
fBodyGyro-std-Z 

Time domain:
tBodyAcc-mean-X 
tBodyAcc-mean-Y 
tBodyAcc-mean-Z 
tBodyAcc-std-X 
tBodyAcc-std-Y 
tBodyAcc-std-Z 
tBodyAccJerk-mean-X 
tBodyAccJerk-mean-Y 
tBodyAccJerk-mean-Z 
tBodyAccJerk-std-X 
tBodyAccJerk-std-Y 
tBodyAccJerk-std-Z 
tBodyAccJerkMag-mean 
tBodyAccJerkMag-std 
tBodyAccMag-mean 
tBodyAccMag-std 
tBodyGyro-mean-X 
tBodyGyro-mean-Y 
tBodyGyro-mean-Z 
tBodyGyro-std-X 
tBodyGyro-std-Y 
tBodyGyro-std-Z 
tBodyGyroJerk-mean-X 
tBodyGyroJerk-mean-Y 
tBodyGyroJerk-mean-Z 
tBodyGyroJerk-std-X 
tBodyGyroJerk-std-Y 
tBodyGyroJerk-std-Z 
tBodyGyroJerkMag-mean 
tBodyGyroJerkMag-std 
tBodyGyroMag-mean 
tBodyGyroMag-std 
tGravityAcc-mean-X 
tGravityAcc-mean-Y 
tGravityAcc-mean-Z 
tGravityAcc-std-X 
tGravityAcc-std-Y 
tGravityAcc-std-Z 
tGravityAccMag-mean 
tGravityAccMag-std
