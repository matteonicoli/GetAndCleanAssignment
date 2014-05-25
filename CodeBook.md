# Getting and Cleaning Data 
## Course Project - Code Book
### The raw dataset
The train and test dataset contain the experimental data recorded from a group of 30 volunteers identified by
a Subject_ID 1..30 with age within 19-48 years. Each subject performed six different activities:

1. walking
2. walking upstairs
3. walking downstairs 
4. sitting
5. standing
6. laying

wearing a smartphone (Samsung Galaxy S II) on the waist. From the accelerometer and the gyroscope the 3-axial 
linear acceleration and 3-axial angular velocity were recorded at a rate of 50 measurements per second. The 
dataset of sensor signals was randomly partitioned into a training data set (70%, 21 subjects) and a test data 
set (30%, 9 subjects) and stored in the corrispective *Inertial Signals* folders.     

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##### Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Features are normalized and bounded within [-1,1] and each feature vector is a row on the text file.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean( ): Mean value
- std( ): Standard deviation
- mad( ): Median absolute deviation 
- max( ): Largest value in array
- min( ): Smallest value in array
- sma( ): Signal magnitude area
- energy( ): Energy measure. Sum of the squares divided by the number of values. 
- iqr( ): Interquartile range 
- entropy( ): Signal entropy
- arCoeff( ): Autorregresion coefficients with Burg order equal to 4
- correlation( ): correlation coefficient between two signals
- maxInds( ): index of the frequency component with largest magnitude
- meanFreq( ): Weighted average of the frequency components to obtain a mean frequency
- skewness( ): skewness of the frequency domain signal 
- kurtosis( ): kurtosis of the frequency domain signal 
- bandsEnergy( ): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle( ): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in **features.txt**

##### Files in the dataset

- **README.txt**

- **features_info.txt**: Shows information about the variables used on the feature vector.

- **features.txt**: List of all features.

- **activity_labels.txt**: Links the class labels with their activity name.

- **train/X_train.txt**: Training set.

- **train/y_train.txt**: Training labels.

- **test/X_test.txt**: Test set.

- **test/y_test.txt**: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- **train/subject_train.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- **train/Inertial Signals/total_acc_x_train.txt**: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- **train/Inertial Signals/body_acc_x_train.txt**: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- **train/Inertial Signals/body_gyro_x_train.txt**: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Variables in the tidy dataset

After merging the train and the test dataset in one big data frame, I extracted only the columns with 
the mean and the standard deviation of the 561-feature vector. Then I 
selected only the 66 features with the mean and standard deviation of
the different signals. After this step the data set consists of 68 columns:

1. **Subject_ID**, the number that identifies the volunteer
2. **Activity**, the number of the activity performed
3. **66 features**, containing the mean and standard deviation of the different signals.

The 66-feature names were changed according to the following rules:

1. All the parenthesis were removed
2. the characters "-" and "," were replaced with "."
3. The character "t" and "f" were replaced with "time" and "frequency", respectively.     

Then I replaced the **Activity** number for the equivalent label.

Finally, the tidy data set (**tidy_dataset.txt**) was created aggregating all the **Subject_ID** and **Activity** and calculating the mean of the 66 features. The tidy data set has 180 rows and 68 columns. 

