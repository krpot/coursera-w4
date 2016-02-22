Assignment: Getting and Cleaning Data Course Project CodeBook by Mark Park


The original dataset was downloaded from the URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Each variables in the tidy data set represents the following:

activity
Activity name participants has involved in the organisation

subject	
participants name and this can be identified by others.


value


The experiments have been carried out with a group of 30 volunteers and each person performed six activities WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

You can download the orginal data set from the URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip it and you will get activity_labels.txt, features.txt, test and train folder. All dataset being used in the project are located in dataset folder.

The train folder and each folder structure are exactly same. 70% of the testing data is stored in the train folder and 30% to the test folder randomly.
There doesn't need to use the data in the 'Inertial Signals' folder because the files has been already handled to estimate x_test.txt and x_train.txt.
The text files in the test and train folder reprensents below:

dataset/activity_labels.txt
Activity labels
shows 6 different activities the experiment performed.
   	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING

dataset/features.txt
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
561 rows and 2 columns and includes signals were used to estimate variables of the feature vector for each pattern.
Column names in the features is the the entries that include mean() and std() at the end, or does it include entries with mean in an earlier part of the name as well like tBodyAcc-max()-X.

dataset/train/subject_train.txt
An identifier of the subject who carried out the experiment
Volunteers' IDs have attended to the testing. 7352 rows and 1 column. But if you unique them, it return 30 rows. which is the same number with the volunteers.

dataset/train/X_train.txt
Training set, which has 7352 rows and 561 columns. Columns represents signals used, which can be found in dataset/features.txt.
A 561-feature vector with time and frequency domain variables

dataset/train/y_train.txt
Training labels. It includes activty label code, which linked to 'activity_labels.txt'.

dataset/test/subject_train.txt 
An identifier of the subject who carried out the experiment
Test set, which consist of 2947 rows and 1 column. Same structure with 'dataset/train/subject_train.txt'.

dataset/test/X_test.txt
Test set, which has 2947 rows and 561 columns. Same structure with 'dataset/train/X_train.txt'.

dataset/test/y_test.txt
Test labels. 2947 rows and 1 column Same structure with 'dataset/train/y_train.txt'.


subject_train activity 	tBodyAcc-mean()-X ... angle(Z,gravityMean)
1			  STAYING	2.5717778e-001	  ... 7978304e-002


According to the assignment instruction, you can handle those files like following:

1. Merges the training and the test sets to create one data set.
You can merge x_test.txt and y_test.txt by using cbind().

2.Extracts only the measurements on the mean and standard deviation for each measurement.


Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
