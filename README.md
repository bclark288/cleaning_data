# cleaning_data
For Cleaning Data Course Project
The run_analysis.R script creates a tidy dataset containing the averages for the 86 mean or standard deviation variables extracted from the merged test and training datasets collected from the accelerometers from the Samsung Galaxy S smartphone as required in the project instructions.  The steps for doing this are as follows:
Reads the train variables and train lables into dataframes X and Y
Reads the activities from the file activity labels.txt into a dataframe calles activities
Merges the activites data frame with the Y data frame to create a data frame called activity_labels
Reads the train subject from the file subjects_train.txt into a data frame called subjectstrain
Creates a data frame called colnames by reading the file features.txt
Creates column names for data frame X using the colnames function
Reads the text variables and test labels into data frames XTest and YTest
Creates a data frame called activity_labels_test by merging the activity data frame with the YTest data frame
Creates column names for data frame XTest using the colnames function
Merges X and XTest using the rbind function to create a new data frame called XFinal
Reads subjects_test.txt into a data frame called subjectstest
Combines the subjectstrain data frame with with subjectstest data frame to create a new data frame called subjectsfinal
Names the colum for the subjectsfinal data frame subject using the colnames function
Adds the subjects data frame to the XFinal data frame using the cbind function
Creates a vector of column names called myvars to be used to extract only the required mean and standard deviation measurements 
Creates a new data frame called XFinalTrimmed by subsetting the XFinal dataframe with the myvars vector
Creates the tidy dataset called sumtable using the aggregate function on the XFinalTrimmed dataframe
Writes the dataset to a file called result.txt using write.table

This script should reproduce the result.txt file as long as the setwd() command is modified to the train subdirectory of the downloaded and extracted data
