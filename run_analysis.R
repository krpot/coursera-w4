library(data.table)
library(tidyr)
library(dplyr)

log.debug <- function(...) {
    cat("[LOG.run_analysis]", ..., "\n")
}

#1.Merge the training and the test sets
getPath <- function(train.type, data.type){
  file.path("dataset", train.type, paste0(data.type, "_", train.type, ".txt"))
}

mergeFile <- function(data.type){
  x <- read.table(getPath("train", data.type))
  y  <- read.table(getPath("test", data.type))
  rbind(x, y)
}

getMeanAndStandardMeasurement <- function(columns, as.label=FALSE){
    append(columns, grep(s, cols_x_test, value=as.label))
}

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
extratMeanAndStandardMeasurement <- function(x, selection) {
   x <- x[, selection]
   return(x)
}

#3. Uses descriptive activity names to name the activities in the data set
useDescriptiveActivityNames <- function(y) {
  activity_labels <- read.table("dataset/activity_labels.txt")
  
  #remove underscore
  activity_labels[,2] <- gsub("_", "", activity_labels[,2])
  y[,1] <- activity_labels[y[,1],2]
  
  #set column name
  names(y) <- "activity"
  return(y)
}

#4.Appropriately labels the data set with descriptive variable names.
labelDescriptiveVariableNames <- function(x, xcols){
  names(x) <- xcols#features[selection, 2]
  
  #remove brackets
  names(x) <- gsub("\\(|\\)", "", names(x))
  return(x)
}

labelDescriptiveSubjectNames <- function(s){
    names(s) <- "subject"
    return(s)
}

combineData <- function(subject, ydata, xdata){
  cbind(subject, ydata, xdata)
}


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
createTidyDataset <- function(x){
  cols <- 3:ncol(x)
  x %>% 
    gather(measurement, value, cols) %>%
    dcast(subject + activity ~ measurement, mean)
  
}

#Call this function to run the project
app.run <- function(){
    features <- read.table("dataset/features.txt")
    selection <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
  
    sData <- mergeFile("subject") %>% labelDescriptiveSubjectNames()
    xData <- mergeFile("X") %>% extratMeanAndStandardMeasurement(selection) %>% labelDescriptiveVariableNames(features[selection, 2])
    yData <- mergeFile("Y") %>% useDescriptiveActivityNames()
    tidyData <- combineData(sData, yData, xData) %>% createTidyDataset()
    
    #You will get tidy_dataset.txt
    file.name = "tidy_dataset.txt"
    write.table(tidyData, file.name, quote = FALSE, row.name=FALSE)
    log.debug(file.name, "has been created in the working directory.")
}

#Run this script
app.run()