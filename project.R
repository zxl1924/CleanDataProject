#I download this zip file at first, then unzip it.
link<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(link,destfile="C:/Users/User/Desktop/Word/COURSA/DATA CLEAN/project.zip")
#set working directory to the location where the UCI HAR Dataset was unzipped.
setwd('C:/Users/User/Desktop/Word/COURSA/DATA CLEAN/UCI HAR Dataset')
# Read in the data from files
features     <- read.table('./features.txt',header=FALSE) #imports features.txt
activityLabel <- read.table('./activity_labels.txt',header=FALSE) #imports activity_labels.txt
#train
subjectTrain <- read.table('./train/subject_train.txt',header=FALSE)#imports subject_train.txt
xTrain       <- read.table('./train/x_train.txt',header=FALSE) #imports x_train.txt
yTrain       <- read.table('./train/y_train.txt',header=FALSE) #imports y_train.txt
#test
subjectTest <- read.table('./test/subject_test.txt',header=FALSE) #imports subject_test.txt
xTest       <- read.table('./test/x_test.txt',header=FALSE) #imports x_test.txt
yTest       <- read.table('./test/y_test.txt',header=FALSE) #imports y_test.txt
#-------------------------------------
#Change names of tables
colnames(activityLabel)  <- c('activityId','activityType')
colnames(subjectTrain)  <- "subjectId"
colnames(xTrain)        <- features[,2]
colnames(yTrain)        <- "activityId"

colnames(subjectTest) <- "subjectId"
colnames(xTest)       <- features[,2] 
colnames(yTest)       <- "activityId"
#combine all training data
trainingData <- cbind(yTrain,subjectTrain,xTrain)
#combine all test data
testData <- cbind(yTest,subjectTest,xTest)
#Combine all data(Question 1)
totalData<-rbind(trainingData,testData)
#-----------------------------------------
# names of all columns
colnames<-colnames(totalData)
#find all measurements on the mean and standard deviation
mean_std<-grepl("-(mean|std)\\(\\)",colnames)
#question 2
Q2<-totalData[,mean_std]
#-------------------------------------------
#For question 3, I use the dataset created at question 1
totalData3<-merge(totalData,activityLabel,by="activityId")
#-------------------------------------------------
#I am not quite sure the meaning of "Appropriately labels the data set"
#I just list all descriptive names shown under features (Question 4)
names(totalData3)
#------------------------------------------------------
#For question 5, I use aggregate to group activityId and subjectId
Q5<-aggregate(totalData[,names(totalData3)!=c('activityId','subjectId',"activityType")],by=list(activityId=totalData$activityId,subjectId=totalData$subjectId),mean)
#add activity type
Q5<-merge(Q5,activityLabel,by="activityId")
#export the final answer
write.table(Q5, './Q5.txt',row.names=TRUE,sep='\t')





