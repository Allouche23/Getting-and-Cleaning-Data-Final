

#  Codebook
This codebook describes all the variables annd summaries calculated, along with units, and any other relevant information.The codebook is split up in a part describing the raw data and its attributes, a part derscribing the tidy data and its varaibles, and a part describing the transformation of the data.

##The raw data
The raw data was original collected for the project "Human Activity Recognition Using Smartphones Dataset
Version 1.0"
and has been made the following:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

it has been obtained using the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The raw datafile included

* 'README.txt'

* 'features_in.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.


## units and vaiables
The data was collected from a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured acceleration and velocity from the participants.
The obtained dataset was  randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
(This text is partly a siplified and remade version of the original describtion, README, which can be found in the orginal filemap,

###variables
the data contains the following attributes
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

## Transformation of data
The tidy data was made using the files described in "Raw data".

The files are merged in to one dataset containing 30

After that the variables are labeled with the original variable names

Then all the variable that are not either a mean or a standarddeviation are removed from the dataset
the activit vaiable was converted in to a factor variable and labeled with the labels from the textfile 'activity_labels.txt'

the data is then converted in to a final data file containing the mean of each activity from each subject.

The data was then converted in to a cvs.file


## The tidy dataset
The data set contains the following variables

* A variable indentifiying the 30 different subjects.
* A variable describing the 6 different types of activity that each subject do
* A set of 66 variables describing the mean or standardiviastion of each of the different ways that the activitie have been measured
* The data in the 180 rows contains the mean value for the 66 variables.
