# Read and put together the two data sets
subj <- read.table("./train/subject_train.txt", colClasses = "numeric", col.names = "Subject_ID")
act  <- read.table("./train/y_train.txt", colClasses = "numeric", col.names = "Activity")
x    <- read.table("./train/X_train.txt", colClasses = rep("numeric",561))
train_set <- cbind(subj,act,x)

subj <- read.table("./test/subject_test.txt", colClasses = "numeric", col.names = "Subject_ID")
act  <- read.table("./test/y_test.txt", colClasses = "numeric", col.names = "Activity")
x    <- read.table("./test/X_test.txt", colClasses = rep("numeric",561))
test_set <- cbind(subj,act,x)

# Create one data set from the train and test sets
merged_set <- rbind(train_set, test_set)

#Extraction of the feature labels
feat <- read.table("features.txt", header = FALSE, colClasses = c("numeric","character"))
names(feat) <- c("FeatureNum","Feature")

# I select only the mean() and std() columns before renaming them
# at this stage is easier to extract the columns that contain "mean()" and "std()"
col_sel <- grep("(mean\\(\\)|std\\(\\))",feat$Feature)

#Rename the feature names with human readable labels
feat$Feature <- gsub("-",".",feat$Feature)
feat$Feature <- gsub("\\(\\)","",feat$Feature)
feat$Feature <- gsub(",",".",feat$Feature)
feat$Feature <- gsub("angle\\(","angle.",feat$Feature)
feat$Feature <- gsub("\\)$","",feat$Feature)
feat$Feature <- gsub("\\)",".",feat$Feature)
feat$Feature <- gsub("^t","time.",feat$Feature)
feat$Feature <- gsub("^f","frequency.",feat$Feature)
names(merged_set) <- c(names(merged_set)[1:2],feat$Feature)

#Extraction of the columns that contain the mean and the standard deviation of each signal
col_sel <- col_sel + 2
merged_set <- merged_set[,c(1,2,col_sel)]

#Adding the lables to the six different activities. Activities and Subject_ID are transformed in factor
#variable in order to use the aggregate function
actlab <- read.table("activity_labels.txt", header = FALSE, colClasses = c("numeric","character"))
names(actlab) <- c("ActivityNum","Activity")
actlab$Activity <- tolower(actlab$Activity)
merged_set$Activity <- as.factor(actlab$Activity[merged_set$Activity])
merged_set$Subject_ID <- as.factor(merged_set$Subject_ID)

#The tidy data set is created and saved in a text file (with header)
tidy_set <- aggregate(merged_set[,3:68], by = list(Subject_ID = merged_set$Subject_ID, 
                                                    Activity = merged_set$Activity), FUN=mean)

write.table(tidy_set, file = "tidy_dataset.txt")


