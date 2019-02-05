# Getting and Cleaning Data Assignment
Assignment submission for the course Getting and Cleaning Data


## Downloading the dataset
UCIHAR data set is downloaded from the given url
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and unzipped into local folder.

## Loading data

-Training as well as Test data for Subject, Activity and Features are loaded from its      respective text files. 
-Training and Test sets are megerd into subjData, actData and featData.
-Column names are set for the loaded data sets. Column names for feature data set is loaded from features.txt

## Cleaning data
-Activity, Subject and Feature data are merged into data.
-Columns pretaining to only meand and standard deviation is extracted for the given subject and activity.
-Activity names are loaded from activity_labels.txt and replaced with the respective ID from the loaded data.
-Columns are renamed to meaningful names
    - t -> time
    - f -> frequency
    - Acc -> Accelerometer
    - Gyro -> Gyroscope
    - Mag -> Magnitude
    - BodyBody -> Body
    
#Analysis
New Data set is created with the calculated mean values for each variable for each activity and subject
