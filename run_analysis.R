# load data into R, add the column of test label and subject id
#Q1:merge the test and train dataset into one
setwd("~/Rprog/UCI HAR Dataset/")
features<-read.table("features.txt",sep="" ,header = F)
setwd("~/Rprog/UCI HAR Dataset/test/")
test_set<-read.table("X_test.txt",sep="" ,header = F)
test_lable<-read.table("y_test.txt",sep="" ,header = F)
subject_names<-read.table("subject_test.txt",sep="" ,header = F)
names(test_set)<-features[,2]
test_set$activity<-test_lable[,1]
test_set$subject_id<-subject_names[,1]
setwd("~/Rprog/UCI HAR Dataset/train/")
train_set<-read.table("X_train.txt",sep="" ,header = F)
train_lable<-read.table("y_train.txt",sep="" ,header = F)
subject_names<-read.table("subject_train.txt",sep="" ,header = F)
names(train_set)<-features[,2]
train_set$activity<-train_lable[,1]
train_set$subject_id<-subject_names[,1]
oneset<-rbind(test_set,train_set)
#Q2:Extracts only the measurements on the mean and standard deviation for each measurement
sub_feat<-features[grep("mean",features[,2],ignore.case = T),]
sub_feat<-rbind(sub_feat,features[grep("std",features[,2],ignore.case = T),])
sub_feat$V2<-as.character(sub_feat$V2)
sub_feat<-rbind(sub_feat,c("999","activity"))
sub_feat<-rbind(sub_feat,c("888","subject_id"))
mean_n_std<-oneset[,(names(oneset) %in% sub_feat[,2])]
#Q3:Uses descriptive activity names to name the activities in the data set
activities<-read.table("activity_labels.txt",sep = "",header = F)
names(activities)<-c("activity","activity_name")
withname<-merge(mean_n_std,activities,by="activity")
# the variable "acitivity name" in dataset "withname" is the descripitve names"
#Q4:Appropriately labels the data set with descriptive variable names.
# the data has already been labeled with respective variable labels
write.table(withname,"run_analysis_step_1_4.txt",row.names = F)
#output the dataframe 
#Q5:From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
step5<-aggregate(.~activity_name+subject_id,data=withname,mean)
step5<-step5[,-3]
#drop the useless colomn3 which indicates the label of acitivity
write.table(step5,"average_by_subject_and_activity.txt",row.names=F)
#ouput the tidy dataframe contains the average for each subject and each activity