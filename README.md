1. Setting the working directory
	The working directory was set to ensure that the R file is in the right directory.

2. Downloading the package
	The dplyr package was downloaded and used.

3. Each data was assigned to a variable
	All data frames from the unzipped folder was loaded.
	
	activity_labels  - taken from activity_labels.txt 
			 - columns were named "code" and "activity"
				"code" contains the code from 1-6 for their activities
				"activities" contains the label for each of the code
	features - taken from features.txt
		 - columns were named as "n" and "functions"
			"n" contains the number of each ovbservation
			"functions" contains the data from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ
	subject_test - taken from subject_test.txt from the test folder
		     - column was named "subject"
			     "subject" contains the test data of 9/30 volunteer test subjects being observed
	x_test - taken from test/X_test.txt
	       - contains recorded features test data
	       - the column names of this data set were from the functions column of the features dataset
	y_test - taken from test/y_test.txt
	       - columns was named "code" which contains test data of activities’ code labels
	subject_train - taken from subject_train.txt from the train folder
		     - column was named "subject"
			     "subject" contains the train data of 21/30 volunteer subjects being observed
	x_train - taken from train/X_train.txt
	       - contains recorded features train data
	       - the column names of this data set were from the functions column of the features dataset
	y_train - taken from train/y_train.txt
	       - columns was named "code" which contains train data of activities’ code labels 

3. Merged the training and the test sets to create one dataset
	Using rbind() and cbind, the data from the training and test sets were merged.
	
	x_merged - result of using rbind () to x_train and x_test
	y_merged - result of using rbind () to y_train and y_test
	subject_merged - result of using rbind () to subject_train and subject_test
	merged_datset - result of using cbind to the merged datasets, x_merged, y_merged, and subject_merged

4. Extracted only the measurements on the mean and standard deviation for each measurement
	tidy_data was created by subseting merged_data. 
	Columns contaning the subject, code, the measurements on the mean and standard deviation (std) for each measurement were selected.

5. Used descriptive activity names to name the activities in the dataset
	The numbers from the code column of tidy_data were replaced by their corresponding activity based from the activity column of the activities variable. 

6. Labelled the dataset appropriately with descriptive varaiable names
	The names of the columns were replaced by using the names() as well as gsub() functions
	
	the second column of the tidy_data was replaced with "activity"
	replaced all columns with Acc to Accelerometer
	replaced all columns with Gyro to Gyroscope
	replaced all columns with Body to Body
	replaced all columns with Mag to Magnitude
	replaced all columns with angle to Angle
	replaced all columns with gravity to Gravity
	replaced all columns that starts with t to Time
	replaced all columns that that starts with f to Frequency
	replaced all columns with tBody to TimeBody
	replaced all columns with -mean() to Mean while ignoring the letter case
	replaced all columns with -std() to STD while ignoring the letter case
	replaced all columns with -freq() to Frequency while ignoring the letter case

7. creating a second, independent tidy data set with the average of each variable for each activity and each subject from the data set in the previous step
	final_data is created by summarizing tidy_data taking the means of each variable for each activity and each subject, after being  grouped by subject and activity.
