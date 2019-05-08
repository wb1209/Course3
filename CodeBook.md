## Description of the study

The data contains the observations from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 


## Data and variabels

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyro-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMag, timeGravityAccelerometerMag, timeBodyAccelerometerJerkMag, timeBodyGyroscopeMag, timeBodyGyroscopeJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, fBodyAccelerometerJerk-XYZ, frequencytBodyGyroscope-XYZ, frequencyBodyAccelerometerJerkMag, frequencyBodyGyroscopeMag, frequencyBodyGyroscopeJerkMag. (Note the 'frequency-prefix' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For each of the below measurements (which are normalized and bounded within [-1,1]), the calculated mean and standard deviation are included in the calculation (i.e. the corresponding variabels that contain the word "mean" or "standardDeviation" respectively) of the average values per activity, per subject.

- timeBodyAccelerometer-XYZ
- timeGravityAccelerometer-XYZ
- timeBodyAccelerometerJerk-XYZ
- timeBodyGyroscope-XYZ
- timeBodyGyroscopeJerk-XYZ
- timeBodyAccelerometerMag
- timeGravityAccelerometerMag
- timeBodyAccelerometerJerkMag
- timeBodyGyroscopeMag
- timeBodyGyroscopeJerkMag
- frequencyBodyAccelerometer-XYZ
- frequencyBodyAccelerometerJerk-XYZ
- frequencyBodyGyroscope-XYZ
- frequencyBodyAccelerometerMag
- frequencyBodyAccelerometerJerkMag
- frequencyBodyGyroscopeMag
- frequencyBodyGyroscopeJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- timeBodyAccererlometerMean
- timeBodyAccerelometerJerkMean
- timeBodyGyroscopeMean
- timeBodyGyroscopeJerkMean

Beside the actual measurements the activity is included in a variable called:

- Activity (possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Moreover an id that ranges from 1 to 30 is included that refers to the volunteer that performed the activity, called:

- Subject

## Transformation

The script run_analysis.R downloads the files available from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and subsequently extracts and reads the extracted files.

Subsequently the various test and train files are combined to a total dataset. 

Activity id's are replaced with its corresponding descriptive activity name.

Changes will be made to various column names so that they are more descriptive:
- "t" prefix is replaced by the word "time"
- "f" prefix is replaced by the word "frequency"
- "Acc" is replaced by "Accerelometer"
- "Gyro" is the word "Gyroscope"

Finally the average of the mean and standard deviation variabels are calculated per activity, per subject 

This output is saved in the working directory with a name called "tidydataset.txt"


## Notes
- Features are normalized and bounded within [-1,1].
- Column names in the source file are not uniquely named. In case of duplicate column names the column number is added to the column name as a suffx (e.g. frequencyBodyGyroscopeJerkMag-Mean_542)


For more information about this dataset contact: activityrecognition@smartlab.ws


