## Getting and cleaning data course project
#-----------------------------------------------------------------------------------
# Load libraries
library(data.table)
library(plyr)
#-----------------------------------------------------------------------------------
# Set working directory
setwd("C:/Users/Divine/Dropbox/Coursera/GetandCleanData/CourseProject/UCIHARDataset")
#-----------------------------------------------------------------------------------

# Variable names
varNames <- read.table("features.txt",col.names=c("ind","Name"))
# tail(varNames)

# Activity names
actvNames <- read.table("activity_labels.txt",col.names=c("Activity","Activity.Name"))

#-----------------------------------------------------------------------------------
# Test data
# Get test data
xTestd <- read.table("test/X_test.txt")
# Get test activity data
yTestd <- read.table("test/y_test.txt",col.names="Activity")
# get test "subject" data
subjTestd <- read.table("test/subject_test.txt",col.names="Subject")
# head(xTestd[,1:5],3)
# head(yTestd,3)
# head(subjTestd,3)

#-----------------------------------------------------------------------------------
# Train data
# Get train data
xTraind <- read.table("train/X_train.txt")
# Get train activity data
yTraind <- read.table("train/y_train.txt",col.names="Activity")
# get train "subject" data
subjTraind <- read.table("train/subject_train.txt",col.names="Subject")
# head(xTraind[,1:5],3)
# head(yTraind,3)
# head(subjTraind,3)

#-----------------------------------------------------------------------------------
## Merge test and train data
# Measures data
measDat <- rbind(xTestd,xTraind)
# Activity data
activ <- rbind(yTestd,yTraind)
# Subject data
subj <- rbind(subjTestd,subjTraind)

#-----------------------------------------------------------------------------------
## Select mean and std variables
# Selected variables
selectVarsInds <- grep("-mean\\(\\)|-std\\(\\)",varNames$Name)
measDat <- measDat[, selectVarsInds]
names(measDat) <- varNames[selectVarsInds, 2]
names(measDat) <- gsub("\\(|\\)", "", names(measDat))
names(measDat) <- tolower(names(measDat))

#-----------------------------------------------------------------------------------
# Name activities
actvNames$Activity.Name <- gsub("_", "", tolower(as.character(actvNames$Activity.Name)))
activ$Activity <- actvNames[activ$Activity ,2]

#-----------------------------------------------------------------------------------
# All data
allData <- cbind(subj,activ,measDat)
# tail(allData[,1:7],3)
write.table(allData, "mean_std_measures_data.txt")

# ----------------------------------------------------------------------------------
# Averages of mean and std vars
tidyData <- ddply( allData, .(Subject, Activity), numcolwise(mean,na.rm = TRUE))
# head(tidyData[,(1:5)],3)
# tail(tidyData[,(1:5)],3)

# Write the tidy data set to a text file
write.table(tidyData, "tidy_data_set_with_the_averages.txt",row.name=FALSE)