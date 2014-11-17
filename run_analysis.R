## Getting and cleaning data course project

# Load libraries
library(data.table)
library(plyr)

# Set working directory
setwd("C:/Users/Divine/Dropbox/Coursera/GetandCleanData/CourseProject/UCIHARDataset")

# Variable names
varNames <- read.table("features.txt",col.names=c("ind","Name"))
newNames <- as.vector(varNames$Name)
# tail(varNames)

# Activity names
actvNames <- read.table("activity_labels.txt",col.names=c("Activity","Activity.Name"))

# Get test data
xTestd <- read.table("test/X_test.txt")
# Give proper names to test variables
setnames(xTestd,old=colnames(xTestd),new=newNames)
# Get test activity data
yTestd <- read.table("test/y_test.txt",col.names="Activity")
# get test "subject" data
subjTestd <- read.table("test/subject_test.txt",col.names="Subject")
# Create a test data set
testDat <- cbind(subjTestd,yTestd,xTestd)
# head(xTestd[,1:5],3)
# head(yTestd,3)
# head(subjTestd,3)
# head(testDat[,1:7],3)
# tail(testDat[,1:7],3)

# Get train data
xTraind <- read.table("train/X_train.txt")
# Give proper names to train variables
setnames(xTraind,old=colnames(xTraind),new=newNames)
# Get train activity data
yTraind <- read.table("train/y_train.txt",col.names="Activity")
# get train "subject" data
subjTraind <- read.table("train/subject_train.txt",col.names="Subject")
# Create a train data set
trainDat <- cbind(subjTraind,yTraind,xTraind)
# head(xTraind[,1:5],3)
# head(yTraind,3)
# head(subjTraind,3)
# head(trainDat[,1:7],3)
# tail(trainDat[,1:7],3)

## Merge test and train data
allData <- rbind(testDat,trainDat)
# tail(allData[,1:7],3)

# Select mean() and std() variables
vars <- character(0)
vars <- c(vars,names(allData))
# Select variables
selectVars <- c(vars[grepl(vars,pattern="-mean\\(\\)|-std\\(\\)")])
# mean and std measures data
meanStdDat <- allData[,c("Subject","Activity",selectVars)]
# tail(meanStdDat,3)

# Name activities
meanStdDatActv <- merge(meanStdDat, actvNames, all = TRUE, by = c("Activity"))

# Averages of mean and std vars
df1 <- ddply( meanStdDatActv, .(Subject, Activity.Name), numcolwise(mean,na.rm = TRUE))
tidyData <- df1[c(-3)]
# head(tidyData[,(1:5)],3)
# tail(tidyData[,(1:5)],3)

# Write the tidy data set to a text file
write.table(tidyData, "tidy_data_set_with_the_averages.txt",row.name=FALSE)