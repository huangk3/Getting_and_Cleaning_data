setwd("/Users/ke.huang/Documents/workspace")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip", method="curl")
unzip("dataset.zip")
file.remove("dataset.zip")
library(plyr)
#list.files()
#read in the dataset
act_lab<-read.table("UCI HAR Dataset/activity_labels.txt", header=F)
fea_code<-read.table("UCI HAR Dataset/features.txt", header=F)

Te_data<-read.table("UCI HAR Dataset/test/X_test.txt", header=F)
Te_subj<-read.table("UCI HAR Dataset/test/subject_test.txt", header=F)
Te_act<-read.table("UCI HAR Dataset/test/y_test.txt", header=F)

Tr_data<-read.table("UCI HAR Dataset/train/X_train.txt", header=F)
Tr_subj<-read.table("UCI HAR Dataset/train/subject_train.txt", header=F)
Tr_act<-read.table("UCI HAR Dataset/train/y_train.txt", header=F)

#----Part1-Solution to step 4
#use make.names to transform the features into valid R variable name.
colnames(Te_data)<-make.names(fea_code[[2]], unique=T)
colnames(Tr_data)<-make.names(fea_code[[2]], unique=T)

colnames(Te_subj)<-"subject.id"
colnames(Te_act)<-"activity.label"
colnames(Tr_subj)<-"subject.id"
colnames(Tr_act)<-"activity.label"

#----Part2-Solution to step 1
Glob_D<-rbind(cbind(Te_subj, Te_act, Te_data), cbind(Tr_subj, Tr_act, Tr_data))

#----Part3-Solution to step 2
#extract the index of mean/std variable from "features.txt";
idx<-fea_code[grepl("mean\\(\\)|std\\(\\)", fea_code[,2]), ]

#column index used idx[[1]]+2, since the suject.id and  activity.label column were inserted in the beginning.  
M_and_SD<-Glob_D[, c(1, 2 ,idx[[1]]+2)]

#----Part4-Solution to step 3;
M_and_SD<-mutate(M_and_SD, activity.label=factor(activity.label, levels=act_lab[[1]], labels=act_lab[[2]]))

#----Part5-Solution to step 5;
Mean_of_M_and_SD<-ddply(M_and_SD, .(subject.id, activity.label), colwise(mean))

#Wirte the result of step 5 to harddisk
write.table(Mean_of_M_and_SD, file="Mean_of_M_and_SD.txt", row.name=F, sep="\t")



