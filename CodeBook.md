# Code Book

This dataset contains data about experiments testing the linear acceleration and angular velocity of 30 volunteers while performing six different activities. The acceleration and velocity were sampled many times for each volunteer. We have the mean and standard deviation for all the samples for each volunteer in our source dataset and we will have the mean of each of those in our tidy dataset.

A [Fast Fourier Transform (FFT)](https://en.wikipedia.org/wiki/Fast_Fourier_transform) was applied to some of the signals in the source dataset. You will see these prefixed with an "f", and designated below with (FFT).

## The tidy dataset

The tidy dataset contains the mean of several variables for each of six activities. The columns are as follows:

* `Activity`: one of "WALKING", "WALKING\_UPSTAIRS", "WALKING\_DOWNSTAIRS", "SITTING", "STANDING", or "LAYING"
* `Subject`: the number of the subject (volunteer) being observed
* `tBodyAccMag-mean()`: the mean of the mean body linear acceleration magnitude
* `tBodyAccMag-std()`: the mean of the standard deviation of the body linear acceleration magnitude
* `tGravityAccMag-mean()`: the mean of the mean gravity linear acceleration magnitude
* `tGravityAccMag-std()`: the mean of the standard deviation of the gravity linear acceleration magnitude
* `tBodyAccJerkMag-mean()`: the mean of the mean body linear acceleration jerk signal magnitude
* `tBodyAccJerkMag-std()`: the mean of the standard deviation of the body linear acceleration jerk signal magnitude
* `tBodyGyroMag-mean()`: the mean of the mean body angular velocity magnitude
* `tBodyGyroMag-std()`: the mean of the standard deviation of the body angular velocity magnitude
* `tBodyGyroJerkMag-mean()`: the mean of the mean body angular velocity jerk signal magnitude
* `tBodyGyroJerkMag-std()`: the mean of the standard deviation of the body angular velocity jerk signal magnitude
* `fBodyAccMag-mean()`: (FFT) the mean of the mean body linear acceleration magnitude
* `fBodyAccMag-std()`: (FFT) the mean of the standard deviation of the body linear acceleration magnitude
* `fBodyBodyAccJerkMag-mean()`: (FFT) the mean of the mean body linear acceleration jerk signal magnitude
* `fBodyBodyAccJerkMag-std()`: (FFT) the mean of the standard deviation of the body linear acceleration jerk signal magnitude
* `fBodyBodyGyroMag-mean()`: (FFT) the mean of the mean body angular velocity magnitude
* `fBodyBodyGyroMag-std()`: (FFT) the mean of the standard deviation of the body angular velocity magnitude
* `fBodyBodyGyroJerkMag-mean()`: (FFT) the mean of the mean body angular velocity jerk signal magnitude
* `fBodyBodyGyroJerkMag-std()`: (FFT) the mean of the standard deviation of the body angular velocity jerk signal magnitude

## How the data was transformed

I transform the source data with the code in [run_analysis.R](run_analysis.R) by running it through the following steps:

1. I load the features for the test data.
2. I name the columns using the data in `features.txt`.
3. I remove all columns that do not end in `std()` or `mean()`.
4. I load the activities for the test data.
5. I load the subjects for the test data.
6. I add the subjects and activities to the features to make my test dataset.
7. I repeat 1-5 for the train data.
8. I combine the test and train data to get all data.
9. I turn the "Activity" column into a factor using the labels from `activity_labels.txt`.
10. I aggregate the data by Activity and Subject to get the mean of each column by activity and subject.