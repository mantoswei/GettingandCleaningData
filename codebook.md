test_set, train_set: read the X_test.txt, X_train.txt, respectively
test_lable, train_lable: read the Y_test.txt, Y_train.txt, respectively
subject_names: the unique subject number in both train and test
features: the exact activity names for the expriment
I add the subject no. and labels as two novel variables into the test and train datasets, respectively
oneset: the merged dataset, which has already been set the labels.
sub_feat:extract all the  items contain "mean"
mean_n_std is the dataset with all information about the "mean" subject
withname: the dataset has the exact activity names, then output the dataframe.
step5, the dataframe, avearge of each variable for each activity each subject.


