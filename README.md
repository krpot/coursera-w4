==================================================================
Coursera Week 4 of Getting and Cleaning Data Assignment
==================================================================


You can download the orginal data set from the URL if you do not have the data before you run the script.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You can get the working directory by run getwd() function in your R or R studio.

Unzip it into your_working_directory/dataset directory. The zip file incluses activity_labels.txt, features.txt, test and train folder. 

Make suere that you have run_analysis.R in the working directory. If not, put run_analysis.R into the working directory.

To run run_analysis.R, run the command 
source('run_analysis.R', chdir=TRUE)
app.run()

Then, the script will create tidy_dataset.txt as a final outcome in the working directory.

run_analysis.R does the follong jobs:
1. Merge the training and the test sets of x, y and subject in order to create one dataset.
   mergeFile() merges train and test data. It take file prefix as an argument. So mergeFile("X") will merge dataset/train/X_train.txt and dataset/test/X_test.txt.
   xData <- mergeFile("X") %>% extratMeanAndStandardMeasurement()
   yData <- mergeFile("Y") %>% useDescriptiveActivityNames()
   sData <- mergeFile("subject") %>% labelDescriptiveVariableNames()

2. Extract then entries that include mean() and std() in the name by using grep() function.
3. For activities, it uses descriptive names by using activity name instead of activity code and removing underscore from the name.
4. Set descriptive variable name for subject and combine suject, x and y data by using cbind().
5. Creates tidy data set with the average of each variable for each activity and subject. gather() and dcast() are used.

To view the tidy dataset, you can run:
data <- read.table("tidy_dataset.txt", header = TRUE)
View(data)
