# Coursera Data cleaning project


## Purpose of the R-Script run_analysis.R

The R-script performs reads the data from the data set problem
provided on human activity recognition on Samsung smartphones
data set as part of the Data cleaning project week 3. Then it
performs the steps summarized below:

1.)Merges the training and the test sets to create one data set.
2.)Extracts only the measurements on the mean and standard deviation 
for each measurement. 
3.)Uses descriptive activity names to name the activities in the data set
4.)Appropriately labels the data set with descriptive variable names.
5.)From the data set in step 4, creates a second, independent tidy data 
 set with the average of each variable for each activity and each subject.

## Data sets required and working directory

The script "run_analysis.R" should be run in the directory
above "UCI_HAR_Dataset" directory which contains the original
dataset.~Otherwise you should download this dataset from the
link here
 "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

The data set must be unzipped and by default it creates the directory UCI HAR Dataset.
The directory UCI HAR Dataset MUST be renamed to UCI_HAR_Dataset.
This dataset however has also been provided in this repository.


## Running the script and output

The script "run_analysis.R" can be simply started in R-Studio
or "R" using source("run_analysis.R").` It performs
the steps 1-5 above and generates an output directory
called "outputdata" in the working directory.~The output from step
5 which is a tidydata set is called "CourseraProjectOutput.txt".
Additionally, csv files "CourseraProjectOutput.csv" is also produced.

## Output format
The file "CourseraProjectOutput.txt" contains the average of each
 variable for each activity and each subject.
