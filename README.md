GetAndCleanAssignment
=====================

The script **run_analysis.R** must run in the directory that contains  the **train** and **test** data sets. It reads in the two directories (xxx = test, train) the **subject_xxx.txt**, **y_xxx.txt**, and **X_xxx.txt** files and create two data sets: **train_set** and **test_set**. Then, it merges the sets.

Using the file **features.txt**, the script selects only the columns of the merged data set that correspond to a mean or a standard deviation of a signal.

The script also changes the 66-feature names according to the rules described in **CodeBook.md** and replaces the numeric identifier of each activity for its label.

Then, the mean of the features is calculated after aggregating all the records with the same Subject_ID and activity.

Finally, the tidy data set was saved in the **tidy_dataset.txt** file.   