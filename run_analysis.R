library(data.table)
library(dplyr)

setwd("/Volumes/DocHouse/projects/coursera/data cleaning/coursera-w4")

PATH_DATASET = "./dataset"
TEST = "test"
TRAIN = "train"

readAFile <- function(input, sep="auto", select=NULL){
  fread(input, sep=sep, select=select, stringsAsFactors=FALSE)
}

getFilePath <- function(prefix, opt) {
  s <- paste0(prefix, opt, ".txt")
  file.path(PATH_DATASET, opt, s)
}

activity_labels <- fread("./dataset/features.txt", sep=" ")
features <- fread("./dataset/features.txt", sep=" ")

cols_x_test <- features[features$V1 == 1:561]$V2##colnames(x_test)

readRecord <- function(opt){
    subject_file <- getFilePath("subject_", opt)
    x_test_file <- getFilePath("x_", opt)
    y_test_file <- getFilePath("y_", opt)
    
    subject <- readAFile(subject_file)
    x_test <- readAFile(x_test_file, sep=" ", select = 1:561)
    y_test <- readAFile(y_test_file)
    
    ##cols_x_test <- features[features$V1== 1:ncol(x_test)]$V2##colnames(x_test)
    colnames(x_test) <- cols_x_test
    
    ## Extracts only the measurements on the mean and standard deviation for each measurement
    ##x_test <- filter(features, V2 %like% "mean()" | V2 %like% "std()")
    cols_index <- grep("-mean()|-std()", cols_x_test)
    x_test <- x_test %>% select(cols_index)
    
    ## Uses descriptive activity names to name the activities in the data set
    ## apply labels with activity_labels to y_test. activity_labels$V1 == y_test$V1
    y_test <- merge(y_test, activity_labels, by="V1")
    colnames(y_test) <- c("ActivityCode", "ActivityName")
    
    ## Merges the training and the test sets to create one data set
    sample_data <- bind_cols(subject, y_test, x_test)
    
    ## Appropriately labels the data set with descriptive variable names
    ## apply labels with features to x_test by column
    ##colnames(sample_data) <- c("Subject", features[features$V1== 1:ncol(sample_data)]$V2)
    ##colnames(sample_data) <- c("Subject", features[features$V1== cols_index]$V2, colnames(y_test))
    
    ## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
    
    ## Extracts only the measurements on the mean and standard deviation for each measurement
    ##x_test <- filter(features, V2 %like% "mean()" | V2 %like% "std()")
    ##cols_index <- grep("-mean()|-std()", cols_x_test)
    ##colnames(sample_data) <- c("Subject", features[features$V1== 1:ncol(sample_data)]$V2)
    ##sample_data <- sample_data %>% select(cols_index)
    
    colnames(sample_data)[1] <- "Subject"
    return(sample_data)
}

mergeData <- function(){
  test <- readRecord(TEST)
  train <- readRecord(TRAIN)
  
  bind_rows(test, train)
}

tidyData <- function(given){
  ##TODO. Remove duplicate Subject, ActivityCode, ActivityName 
  given
}
