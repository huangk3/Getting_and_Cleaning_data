1. Set the work directory. 

2. Download the raw data from the link and unzip it to the work directory.

3. Load the "plyr" package which will be utilized in step 5.

4. Use function read.table read in the raw data from "UCI HAR Dataset/": a. activity label (activity_labels.txt, saved in "act_lab"); b. feature code (features.txt, saved in "fea_code"); c. data of the test group (saved in Te_data, Te_subj, Te_act) d. data of the training group (saved in Tr_data, Tr_subj, Tr_act).

5. Use make.names transform the features recorded in the "features.txt" file into valid R variable names, and use them to rename the test/train data columns. 

6. Rename the column of the table hold information for subject id (subject.id) and activity type (activity.label).

7. Use rbind and cbind to combine the tables of test group and training group, and get the result (dataframe "Glob_D") for step 1.

8. Obtain the index of mean/std variable from "features.txt", and extracts only the measurements on the mean and standard deviation for each measurement using the index (dataframe "M_and_SD").

9. Transform the dataset, convert the class of activity column to factor. Label the activities using descriptive name.

10. Use ddply of the "plyr" packge creates the second, independent tidy data set with the average of each variable for each activity and each subject (dataframe "Mean_of_M_and_SD").

11. Output the data in tab delimited formate to local file ("Mean_of_M_and_SD.txt").