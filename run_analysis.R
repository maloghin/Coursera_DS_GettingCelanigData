library(plyr)
library(data.table)

## download the data archive file
urlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
archFile <- "./getdata-projectfiles-UCI-20HAR-20Dataset.zip"
if (! file.exists(archFile)) {
  download.file(urlFile, destfile=archFile)
}

## extract data file from the archive
dataPath <-"./UCI HAR Dataset/"
if (!file.exists(dataPath)) {
  unzip(archFile)
}


## Read varibels lists
varList <- read.table(paste(dataPath,"features.txt", sep = ""))


## Read tests data file into data frame object
dtTest <- read.table(paste(dataPath, "test/X_test.txt", sep = ""))
lbTest <- read.table(paste(dataPath, "test/y_test.txt", sep = ""))
sbTest <- read.table(paste(dataPath, "test/subject_test.txt", sep = ""))

## Appropriately labels the data set with descriptive variable names
colnames(dtTest)<-gsub("[(|)]","",gsub("-|[,]","_",varList[,2]))
colnames(sbTest)<- c("SubjectID")
colnames(lbTest)<- c("ActivityID")


## Read train data file into data frame object
dtTrain <- read.table(paste(dataPath, "train/X_train.txt", sep = ""))
lbTrain <- read.table(paste(dataPath, "train/y_train.txt", sep = ""))
sbTrain <- read.table(paste(dataPath, "train/subject_train.txt", sep = ""))


## Appropriately labels the data set with descriptive variable names
colnames(dtTrain)<-gsub("[(|)]","",gsub("-|[,]","_",varList[,2]))
colnames(sbTrain)<- c("SubjectID")
colnames(lbTrain)<- c("ActivityID")


## Merges the training and the test sets to create one data set
## Add the Subject and Class Activiy Label data
dt<-rbind(dtTest, dtTrain)
lb<-rbind(lbTest, lbTrain)
sb<-rbind(sbTest, sbTrain)


dataSet<-cbind(sb, lb, dt)

## Remove data temporary object from the environnment
rm(dtTest, dtTrain, lbTest, lbTrain, sbTest, sbTrain, sb, lb, dt)

## Extracts only the measurements on the mean and standard deviation for each measurement
##varMeanStd<-grep("Mean|Stg|mean|std",names(dataSet))
varMeanStd<-grep("mean|std",names(dataSet))
varSubset<-c(grep("ActivityID|SubjectID",names(dataSet)), varMeanStd)

dataSetMeanStd<-dataSet[varSubset]

## Remove data temporary object from the environnment
rm(dataSet)


## Uses descriptive activity names to name the activities in the data set
classLb <- read.table(paste(dataPath, "activity_labels.txt", sep = ""))
names(classLb)<-c("ActivityID", "Activity")
dataSetMeanStd<-merge(classLb, dataSetMeanStd, by.x = "ActivityID", by.y = "ActivityID")


## From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject


groupColumns<-c("ActivityID", "Activity", "SubjectID")
#dataColumns<-grep("Mean|Stg|mean|std",names(dataSetMeanStd))
dataColumns<-grep("mean|std",names(dataSetMeanStd))

res<-ddply(dataSetMeanStd, groupColumns, function(x) colMeans(x[dataColumns]))


fileName<-"./DataSetMeanStd_Mean.txt"
write.table(res, fileName, row.names = FALSE)

## Remove data temporary object from the environnment
rm(dataSetMeanStd, res)
