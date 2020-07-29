#Extracts only the mean() and std() of every variable
#data : data as read from X_train.txt or y_train.txt
#features : vector of names of all variables
extractFeatures <- function(data, features){
  wantedFeatures <- features$featureNames[grepl("(mean|std)\\(\\)",features$featureNames)]
  ProcessedData <- data[,wantedFeatures]
  ProcessedData
}

#Concatenate subjectNum, data and activity together 
concatData <- function(subjectNum, data, activity){
  ProcessedData <- cbind(subjectNum, data, activity)
  ProcessedData
}

# Download data
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip", "HarData.zip")
# Unzip data
unzip("HarData.zip")

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("level", "labels"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "featureNames"))
#Read files from train folder
subjectNumTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subjectNum"))
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("Activity"))
DataTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
#Read files from test folder
subjectNumTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subjectNum"))
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("Activity"))
DataTest <- read.table("UCI HAR Dataset/test/X_test.txt")
names(DataTrain) = features$featureNames
names(DataTest) = features$featureNames

traindata <- extractFeatures(DataTrain, features)
traindata <- concatData(subjectNumTrain, traindata, activityTrain)
testdata <- extractFeatures(DataTest, features)
testdata <- concatData(subjectNumTest, testdata, activityTest)
#Merge train and test data
data <- rbind(traindata, testdata)

#Replace Activity number with its label
data$Activity <- factor(data$Activity, levels = activityLabels$level, labels = activityLabels$labels)

#New data containing average of every variable for every subjectNum and every Activity
TidyData <- aggregate(data[2:67],list(subjectNum = data$subjectNum, Activity = data$Activity), mean)

#save the TidyData dataframe as tab seperated txt file
write.table(TidyData,"TidyData.txt",sep="\t",row.names=FALSE)

#Save the TidyData dataframe as .csv file
write.csv(TidyData, "TidyData.csv", row.names = FALSE)