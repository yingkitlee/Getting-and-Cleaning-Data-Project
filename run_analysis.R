# run_analysis.R  
  
#Load dplyr library  
library(dplyr)  
  
#Get train_X and train_Y then combine them into train_Data  
setwd("/Users/yingkitlee/Downloads/UCI HAR Dataset/train")  
a <- list.files(pattern=".*.txt")  
train_Data <- do.call(cbind,lapply(a, read.table))  

#Get test_X and test_Y then combine them into test_Data  
setwd("/Users/yingkitlee/Downloads/UCI HAR Dataset/test")  
b <- list.files(pattern=".*.txt")  
test_Data <- do.call(cbind,lapply(b, read.table))  

#Merges the training and the test sets to create one data set 
dataset <- rbind(train_Data, test_Data)  

#Extracts only the measurements on the mean and standard deviation for each measurement  
apply(train_Data, 1, mean)  
apply(train_Data, 1, sd)  
apply(test_Data, 1, mean)  
apply(test_Data, 1, sd)  
  
#Uses descriptive activity names to name the activities in the data set  
dataset$V1[dataset$V1 == 1] <- "WALKING"  
dataset$V1[dataset$V1 == 2] <- "WALKING UPSTAIRS"  
dataset$V1[dataset$V1 == 3] <- "WALKING_DOWNSTAIRS"  
dataset$V1[dataset$V1 == 4] <- "SITTING"  
dataset$V1[dataset$V1 == 5] <- "STANDING"  
dataset$V1[dataset$V1 == 6] <- "LAYING"  
  
#Read features  
features <- read.table("/Users/yingkitlee/Downloads/UCI HAR Dataset/features.txt")  
feature <- rbind(features[,c(1,2)], matrix(c(562,"activity", 563, "subject"), nrow = 2, byrow = TRUE))  

#Appropriately labels the data set with descriptive variable names  
colnames(dataset) <- feature[,2]  
  
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject  
act_mean <- aggregate(dataset$activity, dataset, mean)  
sub_mean <- aggregate(act_mean$subject, act_mean, mean)  
new_table <- sub_mean[,c(564,565)]  
  
#Output data  
write.table(new_table, file = "/Users/yingkitlee/Downloads/new_table.txt", row.name = F, quote = F)  
