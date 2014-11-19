Class: Getting and cleaning Data
--------------------------------

**Document:** Code book

**Contents:**

*Variable description
*Data description
*Data transformations

**Data sources**

1. Secondary source

 * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Original Source

 * http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**About R script**

the R script run_analysis.R performs the following data cleaning procedures (not in the specific order):

1. Merges the training and the test sets to create one data set.

 * Merge measures
	test/X_test.txt, test/X_train.txt resulting in a 10299 561 data frame
 * Merge activities
	test/y_test.txt, test/y_train.txt resulting in a 10299 1 data frame
 * Merge subjects
	test/subject_test.txt, test/subject_train.txt resulting in a 10299 1 data frame

2. Extracts only the measurements on the mean and standard deviation for each measurement from the merged measures data 

 * Data used: features.txt
 * Result: a 10299x66 data frame with only the measurements on the mean and standard deviation for each measurement

3. Uses descriptive activity names to name the activities in the data set

 * Data used: activity_labels.txt
 
 * Activity Labels:
"laying"            "sitting"           "standing"          "walking"           "walkingdownstairs" "walkingupstairs"  

4. Appropriately labels the data set with descriptive variable names.

 * Data used: features.txt
 * Labels examples:

"tbodyacc-mean-x" "tbodyacc-mean-y" "tbodyacc-mean-z"
"tbodyacc-std-x"  "tbodyacc-std-y"  "tbodyacc-std-z" ...

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* The final tidy dataset contains the following variables:
  1. the subject ids [ids = 1-30 inclusive] 
	* "Subject"
	* Ids range from 1 to 30 inclusive since there were 30 participants
  2. the activity name with appropriate names [see names in 3 above] 
	* "Activity"
  3. 66 measurements
  4. The result is saved as tidy_data_set_with_the_averages.txt, a 180x68 data frame

	* Column 1 = Subject
	* Column 2 = Activity
	* Columns 3 - 66 = Means
