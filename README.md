The downloaded data includes test and train folder and each folder structure are exactly same. 
70% of the testing data is stored in the train folder and 30% to the test folder.
There doesn't need to use the data in the 'Inertial Signals' folder because the files has been already handled to estimate x_test.txt and x_train.txt.
The text files in the test and train folder reprensents below:

- 'train/subject_train.txt': Volunteers' IDs have attended to the testing. If you unique them, it will return 30 rows. which is the same number with the volunteers.

- 'train/X_train.txt': Training set, which has 2047 records. Each row consists of 561 variables and the variables are linked to 'features.txt' file in the test data root folder.

- 'train/y_train.txt': Training labels. It includes activty label code, which linked to 'activity_labels.txt'.
   	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING

- 'test/X_test.txt': Test set, which has 2047 records. Same structure with 'train/X_train.txt'.

- 'test/y_test.txt': Test labels. Same structure with 'train/y_train.txt'.

According to the assignment instruction, you can handle those files like following:

1. Merges the training and the test sets to create one data set.
You can merge x_test.txt and y_test.txt by using col_bind().

Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
