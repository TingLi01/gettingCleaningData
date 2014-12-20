README file for R script run_analysis.R

To run the script, make sure that the Samsung data is in the working directory, which has the following files:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt: subjects in training set.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt: subjects in test test.

The script first combines the training and the test sets to create one data set, which include the activity data, 
the type of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), and the subject 
IDs for carrying out the experiement.
   
Then a subset of the merged set was extracted with  only the measurements on the mean and standard deviation for 
each measurement. Descriptive activity names and variable names were added to the data set. 

Lastly, a tidy data set called "tidy_data.txt" was generated with the average of each variable for each activity and each subject.

The script requires the "plyr" package. To install plyr, simply run: >install.packages("plyr").  

>source ("run_analysis.R")

