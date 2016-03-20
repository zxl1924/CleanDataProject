Introduction.
The script project.R performs the 5 steps described in the course project's definition.

First, dataset is downloaded through the given website. I unzip the file and read Features, Activity_labels, training datasets as well as test datasets into r script.
All datasets under categories of training and test are combined using cbind, respectively. Then, the total data set is created by combining
training part and test part through rbind.
As activity data is addressed with values 1:6, I take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
Variables.
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
trainingData and testData merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
totalData merges trainingData, testData and subject in a big dataset.
Finally, averages_data contains the relevant averages which will be later stored in a .txt file. 
aggregate() is used to calculate average numbers of each activity and each subject.
