

#--------------------1. DOWNLOAD, EXTRACT AND READ FILES-----------------

# Create directory which the data will be downloaded to if it doesn't already exists
if(!file.exists("./data")) {
    dir.create ("./data")
}

# Download and extract files if the file has not been downloaded already
if(!file.exists("./data/dataset.zip")){
    
    # Download file
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,"./data/dataset.zip",method = "curl")
    
    #extract file
    unzip("./data/dataset.zip",exdir = "./data") 
} 

# Read files
test_data <- read.table("./data/UCI HAR Dataset/test/x_test.txt",header=FALSE) 
test_activity <- read.table("./data/UCI HAR Dataset/test/y_test.txt",header=FALSE) 
train_data <- read.table("./data/UCI HAR Dataset/train/x_train.txt",header=FALSE)
train_activity <- read.table("./data/UCI HAR Dataset/train/y_train.txt",header=FALSE) 
feature_labels <- read.table("./data/UCI HAR Dataset/features.txt",header = FALSE,as.is = TRUE) #features are not unique
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",header = FALSE)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",header = FALSE)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header = FALSE)



#---------------2. CREATE COMBINED OBJECT WITH DESCRIPTIVE UNIQUE COLUMN NAMES--------------------------

# Combine train and testdata
combined_data <- rbind(test_data,train_data)
combined_subject <- rbind(subject_test,subject_train)
combined_activity <- rbind(test_activity,train_activity)

# change column names of subject and activity objects
colnames(combined_subject) <- "Subject"
colnames(combined_activity) <- "Activity"
colnames(activity_labels) <- c("nr","Activity")

#Replace activity id by activity description
total_activity <- data.frame(Activity=factor(combined_activity$Activity, 
                                             levels = activity_labels[, 1], 
                                             labels = activity_labels[, 2]))

# Change column names of merged data by replacing them with more descriptive names 
# Extract numbers from column names/ Delete "V" character from column names
splitnames <- strsplit(names(combined_data),"V")
secondElementAsInteger <- function(x){
    as.integer(x[2])
}
columnnames_total <- data.frame(nr = sapply(splitnames,secondElementAsInteger))
colnames(combined_data) <- columnnames_total$nr

# Replace existing columnnames by description in feature_labels matched by number. In case no desription 
# exists for the corresponding number keep the number as the column name
colnames(feature_labels) <-c("nr","column_name") 

# Make adjustments to the column names for more descriptive column names
feature_labels[,"column_name"] <- gsub("^f", "frequency", feature_labels[,"column_name"])
feature_labels[,"column_name"] <- gsub("^t", "time", feature_labels[,"column_name"])
feature_labels[,"column_name"] <- gsub("Acc", "Accelerometer", feature_labels[,"column_name"])
feature_labels[,"column_name"] <- gsub("Gyro", "Gyroscope", feature_labels[,"column_name"])
feature_labels[,"column_name"] <- gsub("mean", "Mean", feature_labels[,"column_name"])
feature_labels[,"column_name"] <- gsub("std", "StandardDeviation", feature_labels[,"column_name"])
feature_labels[,"column_name"] <- gsub("[\\(\\)]","",feature_labels[,"column_name"])
feature_labels[,"column_name"] <- gsub("anglet","angleTime",feature_labels[,"column_name"])
feature_labels[,"column_name"] <- gsub("BodyBody","Body",feature_labels[,"column_name"])

colnames(combined_data) <- unlist(merge(columnnames_total,feature_labels,by ="nr",x.all =TRUE)[2]) #

# Ensure column names are unique by adding the column number in case of duplicate column names
for (i in 1:length(colnames(combined_data))) {
    if (sum(grepl(colnames(combined_data)[i],colnames(combined_data),fixed = TRUE)) > 1) {
        colnames(combined_data)[i] <- paste(colnames(combined_data)[i],i,sep = "_")
    }
}

# Create one total dataset by combining the subject, activity and data objects
combined_dataset <- cbind(combined_subject,combined_activity,combined_data)


#---------------3. CREATE OBJECT WITH ONLY MEAN AND STANDARD DEVIATION COLUMNS-------------

selectedcolumns <- grepl("Subject|Activity|Mean|StandardDeviation", colnames(combined_dataset))
total_dataset_mean_sd <- combined_dataset[,selectedcolumns]




#---------------4. CREATE INDEPENDENT DATA SET MEAN PER SUBJECT PER ACTIVITY---------------

require("dplyr")
library(dplyr)

averagePerActivityPerSubject <- total_dataset_mean_sd %>%
    group_by(Activity,Subject) %>%
    summarise_all(funs(mean)) %>%
    arrange(Activity,Subject)



#---------------5. WRITE TIDY DATASET TO FILE------------------------------------------------

write.table(averagePerActivityPerSubject, file = "tidydataset.txt", row.names = FALSE)
