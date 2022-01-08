getwd()
setwd("C:/Users/robles/OneDrive/Desktop/2ndminiproject/UCI_HAR_Dataset")
getwd()

install.packages("dplyr")
library(dplyr)

# loading all data frames #######

# loading activity_labels
activity_labels <- read.table("./specdata/UCI HAR Dataset/activity_labels.txt", 
                       col.names = c("code", "activity"))

# loading features
features <- read.table("./specdata/UCI HAR Dataset/features.txt", 
                       col.names = c("n","functions"))

# loading subject_test
subject_test <- read.table("./specdata/UCI HAR Dataset/test/subject_test.txt",
                           col.names = "subject")
# loading x_test
x_test <- read.table("./specdata/UCI HAR Dataset/test/X_test.txt",
                     col.names = features$functions)
# loading y_test
y_test <- read.table("./specdata/UCI HAR Dataset/test/y_test.txt",
                     col.names = "code")

# loading subject_train
subject_train <- read.table("./specdata/UCI HAR Dataset/train/subject_train.txt",
                           col.names = "subject")
# loading x_train
x_train <- read.table("./specdata/UCI HAR Dataset/train/X_train.txt",
                     col.names = features$functions)
# loading y_train
y_train <- read.table("./specdata/UCI HAR Dataset/train/y_train.txt",
                     col.names = "code")




# 1. merging the training and the test sets to create one dataset

x_merged <- rbind(x_train, x_test)

y_merged <- rbind(y_train, y_test)

subject_merged <- rbind(subject_train, subject_test)

merged_dataset <- cbind(subject_merged, y_merged, x_merged)




# 2. extracting only the measurements on the mean and standard deviation for each measurement

tidy_data <- merged_dataset %>% select(subject, code, contains("mean"),
                                         contains("std"))



# 3. using descriptive activity names to name the activities in the dataset

tidy_data$code <- activity_labels[tidy_data$code, 2]



# 4. labeling the dataset appropriately with descriptive varaiable names

# replacing code column to activity
names(tidy_data)[2] = "activity"

# replacing all columns with Acc to Accelerometer
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))

# replacing all columns with Gyro to Gyroscope
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))

# replacing all columns with Body to Body
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))

# replacing all columns with Mag to Magnitude
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))

# replacing all columns with angle to Angle
names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))

# replacing all columns with gravity to Gravity
names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))

# replacing all columns that starts with t to Time
names(tidy_data)<-gsub("^t", "Time", names(tidy_data))

# replacing all columns that that starts with f to Frequency
names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))

# replacing all columns with tBody to TimeBody
names(tidy_data)<-gsub("tBody", "TimeBody", names(tidy_data))

# replacing all columns with -mean() to Mean
names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)

# replacing all columns with -std() to STD
names(tidy_data)<-gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)

# replacing all columns with -freq() to Frequency
names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)



# 5. creating a second, independent tidy data set with the average of each variable for each activity and each subject from the data set in step 4 

final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))



