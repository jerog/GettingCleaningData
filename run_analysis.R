#############################################################
# Wearable computing - Getting and Cleaning data sets
#############################################################

library(dplyr)

# read in the list of activity labels
activityLabels <- read.table(file.path("raw_data", "activity_labels.txt"), 
                             stringsAsFactors = FALSE, 
                             col.names = c("Number", "Label"))

rawFeatureNames <- read.table(file.path("raw_data", "features.txt"), 
                             stringsAsFactors = FALSE, 
                             col.names = c("Number", "FeatureName"))

targetFeatureColumns <- grep("(mean|std)\\(\\)", rawFeatureNames$FeatureName, perl = TRUE)

targetFeatureNames <- gsub("[(|)]", "", rawFeatureNames$FeatureName[targetFeatureColumns])

# assembleDataSet function 
# takes values of 'train' or 'test' for parameter 'subset'
# and returns the assembled data set for that subset of the data.
assembleDataSet <- function(subset) {
  #get 1-column data.frame of subjects
  subject    <- file.path("raw_data", subset, paste("subject_", subset, ".txt", sep = "")) %>%
    read.table(stringsAsFactors = FALSE, col.names = "Subject")

  #get 1-column data.frame of activities
  activities <- file.path("raw_data", subset, paste("y_", subset, ".txt", sep = "")) %>%
    read.table(stringsAsFactors = FALSE, col.names = "Activity")

  #get 561-column data.frame of variables
  properties <- file.path("raw_data", subset, paste("X_", subset, ".txt", sep = "")) %>%
    read.table(stringsAsFactors = FALSE)

  #select only the mean and std properties and give them labels
  extractedProperties <- properties %>% select(targetFeatureColumns)
  names(extractedProperties) <- targetFeatureNames
  
  cbind(subject, activities, extractedProperties)
}
trainSet <- assembleDataSet("train")
testSet  <- assembleDataSet("test")

#combine train and test into a single set
combinedSet <- rbind(trainSet, testSet)

#translate activity numbers to strings 
combinedSet$Activity <- activityLabels$Label[combinedSet$Activity]

#create tidy set with the means of all variables
tidySet <- combinedSet %>% group_by(Subject, Activity) %>% summarise_all(funs(mean))

write.table(tidySet, "tidy_data_set.txt", row.names = FALSE)