# run_analysis.R  
  
#Load required libraries  
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

#Set working directory
setwd("/Users/yingkitlee/Downloads/UCI HAR Dataset")  


# Load: activity labels
activity_labels <- read.table("./activity_labels.txt")[,2]

# Load: features
features <- read.table("./features.txt")[,2]

# Extract only the mean and standard deviation
extract_features <- grepl("mean|std", features)


#Get and process X_train
X_train <- read.table("./train/X_train.txt")
names(X_train) = features
X_train = X_train[,extract_features]

#Get and process y_train
y_train <- read.table("./train/y_train.txt")
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")

#Get and process subject_train
subject_train <- read.table("./train/subject_train.txt")
names(subject_train) = "subject"

# Combine data into train_data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)


#Get and process X_test
X_test <- read.table("./test/X_test.txt")
names(X_test) = features
X_test = X_test[,extract_features]

#Get and process y_test
y_test <- read.table("./test/y_test.txt")
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")

#Get and process subject_test
subject_test <- read.table("./test/subject_test.txt")
names(subject_test) = "subject"

# Combine data into test_data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)


# Merge test and train data
data = rbind(test_data, train_data)

# Melt data based on id_labels and measure by data_labels
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt", row.name = FALSE)
