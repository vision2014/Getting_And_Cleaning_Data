Class: Getting and cleaning Data
Document: Code book
Contents:
1. Variable description
2. Data description
3. Data transformations

Data sources
Secondary source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original Source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

About R script
the R script run_analysis.R performs the following data cleaning procedures (not in the specific order):

1. Merges the training and the test sets to create one data set.
Data Merge
test data set merge
Data: test/subject_test.txt , test/y_test.txt and test/X_test.txt
Result: 2947  563 data frame
train data set merge
Data: train/subject_train.txt , train/y_train.txt and train/X_train.txt
Result: 7352  563 data frame
Merge train and test data sets

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Data used: features.txt
Result: a 10299x68 data frame with only the measurements on the mean and standard deviation for each measurement
First 2 variables are Subject and Activity variables

3. Uses descriptive activity names to name the activities in the data set
Data used: activity_labels.txt
Activity Labels:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

4. Appropriately labels the data set with descriptive variable names.
Data used: features.txt
Technique used: setnames()

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The final tidy dataset contains the following variables:
1. the subject ids [ids = 1-30 inclusive] 
	"Subject"
	Ids range from 1 to 30 inclusive since there were 30 participants
2. the activity name with appropriate names [see names in 3 above] 
	"Activity"
3. 66 measurements with the following attribute names:

	Examples:
	tBodyAcc-mean()-X
	tBodyAcc-mean()-Y
	tBodyAcc-mean()-Z
	...

Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as tidy_data_set_with_the_averages.txt, a 180x68 data frame
Column 1 = Subject
Column 2 = Activity
Columns 3 - 66 = Means
