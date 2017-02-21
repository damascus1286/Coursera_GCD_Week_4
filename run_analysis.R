# Get the file

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile=".ActivityData.zip")

#Unzip the file
unzip(zipfile="./.ActivityData.zip")

#Merges the training and the test sets to create one data set.

#Bring in training data
xtrain <- read.table("./UCI HAR Dataset/train/x_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Bring in test data

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Bring in activity labels
activities = read.table("./UCI HAR Dataset/activity_labels.txt")

#Bring in features
features <- read.table("./UCI HAR Dataset/features.txt")

#give column names
colnames(xtrain) <- features[,2]
colnames(xtest) <- features[,2]
colnames(ytrain) <- "activityCode"
colnames(ytest) <- "activityCode"
colnames(subjecttrain) <- "subject"
colnames(subjecttest) <- "subject"
colnames(activities) <- c("activityCode", "type")

train <- cbind(ytrain, subjecttrain, xtrain)
test <- cbind(ytest, subjecttest, xtest)
merged <- rbind(train, test)


##Extract only the measurements on the mean and standard deviation for each measurement.

#get the names of the columns into its own variable
columns <- colnames(merged)

#Define ID, mean, and STDEV
keycolumns <- (grepl("activityCode" , columns) | 
                   grepl("subject" , columns) | 
                   grepl("mean.." , columns) | 
                   grepl("std.." , columns) 
)

# subset only merged data from key columnes as defined above
keydata <- merged[ , keycolumns == TRUE]


#Appropriately labels the data set with descriptive variable names.
  
  labeledkeydata <- merge(keydata, activities,
                                by="activityCode",
                                all.x=TRUE)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

secondset <- aggregate(. ~subject + type, labeledkeydata, mean)  
secondset <- secondset[order(secondset$subject, secondset$activity),]
write.table(secondset, "secondset.txt", row.name=FALSE)














