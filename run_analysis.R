install.packages("data.table")
library(data.table)
setwd("c:/Users/bclark/Contacts/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train")
X <- read.table("x_train.txt")
Y <- read.table("Y_train.txt")
activities <- read.table("../activity_labels.txt")
activity_labels <- merge(activities,Y)
subjectstrain <- read.table("subject_train.txt")
colnames <- read.table("../features.txt")
colnames(X) <- colnames[,2]
XTest <- read.table("../test/X_test.txt")
YTest <- read.table("../test/y_test.txt")
activity_labels_test <- merge(activities,YTest)
colnames(XTest) <- colnames[,2]
XFinal <- rbind(X,XTest)
activity_labels_final <- rbind(activity_labels,activity_labels_test)
XFinal <- cbind(XFinal,activity_labels_final)
subjectstest <- read.table("../test/subject_test.txt")
subjectsfinal <- rbind(subjectstrain,subjectstest)
colnames(subjectsfinal) <- "subject"
XFinal <- cbind(XFinal,subjectsfinal)
myvars <- c("tGravityAcc-std()-Z","tGravityAcc-std()-Y","tGravityAcc-std()-X","tGravityAcc-mean()-Z","tGravityAcc-mean()-Y","tGravityAcc-mean()-X","tGravityAccMag-std()","tGravityAccMag-mean()","tBodyGyro-std()-Z","tBodyGyro-std()-Y","tBodyGyro-std()-X","tBodyGyro-mean()-Z","tBodyGyro-mean()-Y","tBodyGyro-mean()-X","tBodyGyroMag-std()","tBodyGyroMag-mean()","tBodyGyroJerk-std()-Z","tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-X","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-X","tBodyGyroJerkMag-std()","tBodyGyroJerkMag-mean()","tBodyAcc-std()-Z","tBodyAcc-std()-Y","tBodyAcc-std()-X","tBodyAcc-mean()-Z","tBodyAcc-mean()-Y","tBodyAcc-mean()-X","tBodyAccMag-std()","tBodyAccMag-mean()","tBodyAccJerk-std()-Z","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-X","tBodyAccJerk-mean()-Z","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-X","tBodyAccJerkMag-std()","tBodyAccJerkMag-mean()","fBodyGyro-std()-Z","fBodyGyro-std()-Y","fBodyGyro-std()-X","fBodyGyro-meanFreq()-Z","fBodyGyro-meanFreq()-Y","fBodyGyro-meanFreq()-X","fBodyGyro-mean()-Z","fBodyGyro-mean()-Y","fBodyGyro-mean()-X","fBodyBodyGyroMag-std()","fBodyBodyGyroMag-meanFreq()","fBodyBodyGyroMag-mean()","fBodyBodyGyroJerkMag-std()","fBodyBodyGyroJerkMag-meanFreq()","fBodyBodyGyroJerkMag-mean()","fBodyBodyAccJerkMag-std()","fBodyBodyAccJerkMag-meanFreq()","fBodyBodyAccJerkMag-mean()","fBodyAcc-std()-Z","fBodyAcc-std()-Y","fBodyAcc-std()-X","fBodyAcc-meanFreq()-Z","fBodyAcc-meanFreq()-Y","fBodyAcc-meanFreq()-X","fBodyAcc-mean()-Z","fBodyAcc-mean()-Y","fBodyAcc-mean()-X","fBodyAccMag-std()","fBodyAccMag-meanFreq()","fBodyAccMag-mean()","fBodyAccJerk-std()-Z","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-X","fBodyAccJerk-meanFreq()-Z","fBodyAccJerk-meanFreq()-Y","fBodyAccJerk-meanFreq()-X","fBodyAccJerk-mean()-Z","fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-X","angle(Z,gravityMean)","angle(Y,gravityMean)","angle(X,gravityMean)","angle(tBodyGyroMean,gravityMean)","angle(tBodyGyroJerkMean,gravityMean)","angle(tBodyAccMean,gravity)","angle(tBodyAccJerkMean),gravityMean)","V1","V2","subject")
XFinalTrimmed <- XFinal[myvars]
sumtable <- aggregate(x=XFinalTrimmed[1:86],by=list(XFinalTrimmed$V2,XFinalTrimmed$subject),FUN=mean)
write.table(sumtable,file="result.txt",row.names=FALSE)Enter file contents here
