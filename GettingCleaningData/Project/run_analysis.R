library(dplyr);library(Hmisc);
# Here the instructions:-
#demonstrate your ability to collect, work with, and clean a data set. 
#The goal is to prepare tidy data that can be used for later analysis.
# run_analysis.R does the following
#1.) Merges the training and the test sets to create one data set. []
#2.)Extracts only the measurements on the mean and standard deviation 
#for each measurement. 
#3.)Uses descriptive activity names to name the activities in the data set
#4.)Appropriately labels the data set with descriptive variable names.
# 5.)From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.


# Step 1. Merge: files are X_train.txt with labes from y_train.txt
test_filedata<-file.path("./UCI_HAR_Dataset/test/X_test.txt")
train_filedata<-file.path("./UCI_HAR_Dataset/train/X_train.txt")
#Get activity ids
test_filedataids<-file.path("./UCI_HAR_Dataset/test/y_test.txt")
train_filedataids<-file.path("./UCI_HAR_Dataset/train/y_train.txt")
# Get subject ids
test_filesubids<-file.path("./UCI_HAR_Dataset/test/subject_test.txt")
train_filesubids<-file.path("./UCI_HAR_Dataset/train/subject_train.txt")

# Read the rownames from features.txt
colnamesall<-read.table("./UCI_HAR_Dataset/features.txt")
#Transpose and the [2,] entries now contain
# the appropriate colnames
colnamesall<-t(colnamesall)
# Assign correct colnames
#colnames(dtest)<-colnamesall[2,]
#dtrain(dtrain)<-colnamesall[2,]

# Read the test and train data sets and assign column names. This solves
# almost the question 4. Only activity will be reset in section 4
dtest<-read.table(test_filedata,header=FALSE,col.names=colnamesall[2,])
dtrain<-read.table(train_filedata,header=FALSE,col.names=colnamesall[2,])

# Read the data sets with ids. and directly assign column names
dtest_ids<-read.table(test_filedataids,header=FALSE,col.names=c("ActivityID"))
dtrain_ids<-read.table(train_filedataids,header=FALSE,col.names=c("ActivityID"))  

# Read the data sets with ids and directly assign column names
dtest_subids<-read.table(test_filesubids,header=FALSE,col.names=c("SubjectID"))
dtrain_subids<-read.table(train_filesubids,header=FALSE,col.names=c("SubjectID"))  

#Create a bind of the ids to create complete test and train datasets
dtest_idbinds<-cbind(dtest_subids,dtest_ids,dtest)
dtrain_idbinds<-cbind(dtrain_subids,dtrain_ids,dtrain)

# Bizarrely my computer hangs if i merge this so i am doing a 
# somewhat not so elegant workaround
#dtesttrainmerge_all<-merge(dtest_idbinds,dtrain_idbinds,by.x="ActivityID",
# by.y="ActivityID")
# This one works fine. 
# This is the final clean data set of all with all labels.
dtesttrainmerge_all<-rbind(dtest_idbinds,dtrain_idbinds)

#Extract only mean and sd for each measurement
#condition_mean<-grepl("mean",names(dtesttrainmerge_all),ignore.case=TRUE)
#condition_sd<-grepl("std",names(dtesttrainmerge_all),ignore.case=TRUE)
#cond_all<-condition_mean|condition_sd
#DataMeanStd<-dtesttrainmerge_all[,cond_all]
#data_mean<-dtesttrainmerge_all[,condition_mean]
#data_sd<-dtesttrainmerge_all[,condition_sd]
# Elegant way. Much better than the above commented out way.
# Left it uncommented for my future reference.

#Final answer question 2
DataMeanStd<-select(dtesttrainmerge_all,contains("mean"),contains("std"))

#Question3: Get first activity labels: Activitynamed datasets
activitylabels<-read.table("./UCI_HAR_Dataset/activity_labels.txt")
dtesttrainmerge_all[,2]<-factor(dtesttrainmerge_all[,2],
                                labels=c(as.character(activitylabels[,"V2"])))

##### This is it. We got all the data sets. phuuuuiii..Only rename the activity

# Question 4 is already answered above while reading. The appropriate
# names have been assigned. Check names(dtesttrainmerge_all)
names(dtesttrainmerge_all)[2]<-c("Activity") 
# This is the complete dataset
# Question 5
# Split produces errors. Using aggregate function by mean...
#This is a workaround and it works fine.
dataset_beforetidying<-dtesttrainmerge_all[,3:dim(dtesttrainmerge_all)[2]]
tidydata_foroutput<-aggregate(dataset_beforetidying, 
                              list(dtesttrainmerge_all$SubjectID, 
                                   dtesttrainmerge_all$Activity), mean)

#Set the subject id and activity column names
names(tidydata_foroutput)[1:2]<-c("SubjectID","Activity")
#write output
if(!file.exists("./outputdata")) {dir.create("./outputdata")}
write.table(tidydata_foroutput,"./outputdata/CourseraProjectOutput.txt",row.names=FALSE)
write.csv(tidydata_foroutput,"./outputdata/CourseraProjectOutput.csv",row.names=FALSE)
