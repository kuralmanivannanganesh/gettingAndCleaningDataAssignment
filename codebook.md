# Getting and Cleaning Data Assignment codebook

The structure of the data set is described in the Data section, its variables are listed in the Variables section, and the transformations that were carried out to obtain the data set based on the source data are presented in the Transformations section

## Data
tidydata.txt is the data text file, with space seperated values. 
first row contains the variable names.

## Variables
Average of the signal measurments for each given subject and activity is listed in each row.

- subject
    Subject Id, integer, ranges from 1 to 30.
    
- activity
    Activity Id, string, with 6 possible values:
        - WALKING
        - WALKING_UPSTAIRS
        - WALKING_DOWNSTAIRS
        - SITTING
        - STANDING
        - LAYING
        
- Average of measurements
All measurements are floating-point values.

## Transformations

The following trasformations were applied to the source data.

 1. The training and test sets were meged to create a complete data set.
 2. Only the mean and standard deviation measurements were extracted along with subject and activity.
 3. Activity id was replaced with the Activity Name
 4. Variable names were replaced with descriptive names.
 5. The Average for each variable was calulated for each Subject and Activity.
 