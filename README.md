## Run_analysis.R 
The script generates a tidy dataset that will be saved as a txt file called "tidydataset.txt" in the working directory.
The dataset contains the average of the measurements of the mean and the standard deviations per activity, per subject (i.e. the person who carried out the experiment).


## Source Data
The source data is retrieved from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The data contains the observations from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 


## Transformation
The script downloads the zip-file in a subdirectory "Data" in the working directory, extracts and reads the files.

Subsequently the various objects are combined to create one object that contains all measurements for all subjects and activities. Changes will be made to the column names in order to be more descriptive. 

Finally only the variables containing the calculated mean and standard deviation are selected, for which the average is calculated per activity, per subject. The result is saved in the working directory as a txt file called tidydataset.


## License:
The following license information applies for the source data used:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
