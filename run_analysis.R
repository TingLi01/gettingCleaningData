#First load the test and train data into R 
testx<-read.table("./test/X_test.txt")
testy<-read.table("./test/y_test.txt")
test_sub<-read.table("./test/subject_test.txt")
trainx<-read.table("./train/X_train.txt")
trainy<-read.table("./train/y_train.txt")
train_sub<-read.table("./train/subject_train.txt")
feature_text<-read.table("features.txt")

#1. Merges the training and the test sets to create one data set

merge_x<-rbind(trainx, testx)
merge_y<-rbind(trainy, testy)
merge_sub<-rbind(train_sub, test_sub)
merge_all<-cbind(merge_x, merge_y, merge_sub)

#2.Extracts only the measurements on the mean and standard deviation for each measurement

mean_sd_col_index1 <- grep("mean|std", feature_text[, 2])
mean_sd_col_index <- c(mean_sd_col_index1, 562, 563)

new_set_mean_sd <- merge_all[, mean_sd_col_index]

#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names
#step 3 and step 4 
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING

# First, extract the feature names
features_names <- as.character(feature_text[mean_sd_col_index1, 2])
features_names <-gsub("[()]", "", features_names)
features_names <- c(features_names, "activity", "subject") 

#Then, add descriptive variable names

colnames(new_set_mean_sd) <-features_names

#Replace activity with names in the data set

new_set_mean_sd$activity[new_set_mean_sd$activity == 1] <- "WALKING"
new_set_mean_sd$activity[new_set_mean_sd$activity == 2] <- "WALKING_UPSTAIRS"
new_set_mean_sd$activity[new_set_mean_sd$activity == 3] <- "WALKING_DOWNSTAIRS"
new_set_mean_sd$activity[new_set_mean_sd$activity == 4] <- "SITTING"
new_set_mean_sd$activity[new_set_mean_sd$activity == 5] <- "STANDING"
new_set_mean_sd$activity[new_set_mean_sd$activity == 6] <- "LAYING"

#5. Generate a new tidy data set with the average of each variable for each activity and each subject.

library(plyr)
tidy_set_2 <- ddply(new_set_mean_sd, .(subject, activity), colwise(mean))

#write the new tidy data
write.table(tidy_set_2, file = "tidy_data.txt", row.name=FALSE)
