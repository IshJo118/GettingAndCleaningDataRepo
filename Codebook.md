# Codebook

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.
You will be graded by your peers on a series of yes/no questions related to the project.
You will be required to submit: 
1) a tidy data set as described below,
2) a link to a Github repository with your script for performing the analysis, 
3) a code book that describes the variables, the data, and any transformations or work that you performed to 
clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. 
This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Description of abbreviations of measurements

leading t or f is based on time or frequency measurements.

Body = related to body movement.

Gravity = acceleration of gravity

Acc = accelerometer measurement

Gyro = gyroscopic measurements

Jerk = sudden movement acceleration

Mag = magnitude of movement

mean and SD are calculated for each subject for each activity for each mean and SD measurements.

 [1] "timeBodyAccelerometer-mean()-X"                
 [2] "timeBodyAccelerometer-mean()-Y"                
 [3] "timeBodyAccelerometer-mean()-Z"                
 [4] "timeBodyAccelerometer-std()-X"                 
 [5] "timeBodyAccelerometer-std()-Y"                 
 [6] "timeBodyAccelerometer-std()-Z"                 
 [7] "timeGravityAccelerometer-mean()-X"             
 [8] "timeGravityAccelerometer-mean()-Y"             
 [9] "timeGravityAccelerometer-mean()-Z"             
[10] "timeGravityAccelerometer-std()-X"              
[11] "timeGravityAccelerometer-std()-Y"              
[12] "timeGravityAccelerometer-std()-Z"              
[13] "timeBodyAccelerometerJerk-mean()-X"            
[14] "timeBodyAccelerometerJerk-mean()-Y"            
[15] "timeBodyAccelerometerJerk-mean()-Z"            
[16] "timeBodyAccelerometerJerk-std()-X"             
[17] "timeBodyAccelerometerJerk-std()-Y"             
[18] "timeBodyAccelerometerJerk-std()-Z"             
[19] "timeBodyGyroscope-mean()-X"                    
[20] "timeBodyGyroscope-mean()-Y"                    
[21] "timeBodyGyroscope-mean()-Z"                    
[22] "timeBodyGyroscope-std()-X"                     
[23] "timeBodyGyroscope-std()-Y"                     
[24] "timeBodyGyroscope-std()-Z"                     
[25] "timeBodyGyroscopeJerk-mean()-X"                
[26] "timeBodyGyroscopeJerk-mean()-Y"                
[27] "timeBodyGyroscopeJerk-mean()-Z"                
[28] "timeBodyGyroscopeJerk-std()-X"                 
[29] "timeBodyGyroscopeJerk-std()-Y"                 
[30] "timeBodyGyroscopeJerk-std()-Z"                 
[31] "timeBodyAccelerometerMagnitude-mean()"         
[32] "timeBodyAccelerometerMagnitude-std()"          
[33] "timeGravityAccelerometerMagnitude-mean()"      
[34] "timeGravityAccelerometerMagnitude-std()"       
[35] "timeBodyAccelerometerJerkMagnitude-mean()"     
[36] "timeBodyAccelerometerJerkMagnitude-std()"      
[37] "timeBodyGyroscopeMagnitude-mean()"             
[38] "timeBodyGyroscopeMagnitude-std()"              
[39] "timeBodyGyroscopeJerkMagnitude-mean()"         
[40] "timeBodyGyroscopeJerkMagnitude-std()"          
[41] "frequencyBodyAccelerometer-mean()-X"           
[42] "frequencyBodyAccelerometer-mean()-Y"           
[43] "frequencyBodyAccelerometer-mean()-Z"           
[44] "frequencyBodyAccelerometer-std()-X"            
[45] "frequencyBodyAccelerometer-std()-Y"            
[46] "frequencyBodyAccelerometer-std()-Z"            
[47] "frequencyBodyAccelerometerJerk-mean()-X"       
[48] "frequencyBodyAccelerometerJerk-mean()-Y"       
[49] "frequencyBodyAccelerometerJerk-mean()-Z"       
[50] "frequencyBodyAccelerometerJerk-std()-X"        
[51] "frequencyBodyAccelerometerJerk-std()-Y"        
[52] "frequencyBodyAccelerometerJerk-std()-Z"        
[53] "frequencyBodyGyroscope-mean()-X"               
[54] "frequencyBodyGyroscope-mean()-Y"               
[55] "frequencyBodyGyroscope-mean()-Z"               
[56] "frequencyBodyGyroscope-std()-X"                
[57] "frequencyBodyGyroscope-std()-Y"                
[58] "frequencyBodyGyroscope-std()-Z"                
[59] "frequencyBodyAccelerometerMagnitude-mean()"    
[60] "frequencyBodyAccelerometerMagnitude-std()"     
[61] "frequencyBodyAccelerometerJerkMagnitude-mean()"
[62] "frequencyBodyAccelerometerJerkMagnitude-std()" 
[63] "frequencyBodyGyroscopeMagnitude-mean()"        
[64] "frequencyBodyGyroscopeMagnitude-std()"         
[65] "frequencyBodyGyroscopeJerkMagnitude-mean()"    
[66] "frequencyBodyGyroscopeJerkMagnitude-std()"     
[67] "subject"                                       
[68] "activity"


The set of variables that were estimated from these signals are:

mean(): Mean value
std(): Standard deviation


# Download Data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

Unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

Get the list of the files
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files

[1] "activity_labels.txt"                         
 [2] "features.txt"                                
 [3] "features_info.txt"                           
 [4] "README.txt"                                  
 [5] "test/Inertial Signals/body_acc_x_test.txt"   
 [6] "test/Inertial Signals/body_acc_y_test.txt"   
 [7] "test/Inertial Signals/body_acc_z_test.txt"   
 [8] "test/Inertial Signals/body_gyro_x_test.txt"  
 [9] "test/Inertial Signals/body_gyro_y_test.txt"  
[10] "test/Inertial Signals/body_gyro_z_test.txt"  
[11] "test/Inertial Signals/total_acc_x_test.txt"  
[12] "test/Inertial Signals/total_acc_y_test.txt"  
[13] "test/Inertial Signals/total_acc_z_test.txt"  
[14] "test/subject_test.txt"                       
[15] "test/X_test.txt"                             
[16] "test/y_test.txt"                             
[17] "train/Inertial Signals/body_acc_x_train.txt" 
[18] "train/Inertial Signals/body_acc_y_train.txt" 
[19] "train/Inertial Signals/body_acc_z_train.txt" 
[20] "train/Inertial Signals/body_gyro_x_train.txt"
[21] "train/Inertial Signals/body_gyro_y_train.txt"
[22] "train/Inertial Signals/body_gyro_z_train.txt"
[23] "train/Inertial Signals/total_acc_x_train.txt"
[24] "train/Inertial Signals/total_acc_y_train.txt"
[25] "train/Inertial Signals/total_acc_z_train.txt"
[26] "train/subject_train.txt"                     
[27] "train/X_train.txt"                           
[28] "train/y_train.txt" 

Read Acitivity files
actTest<- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
actTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

Read Subject files
subTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
subTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)

Read feature Files
featureTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
featureTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

Display Properties of variables
str(actTest)
str(actTrain)
str(subTest)
str(subTrain)
str(featureTest)
str(featureTrain)

Combine data tables by rows
dataSub <- rbind(subTrain, subTest)
dataAct<- rbind(actTrain, actTest)
dataFeat<- rbind(featureTrain,featureTest)

Set names for variables
names(dataSub)<-c("subject")
names(dataAct)<- c("activity")
dataFeatNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeat)<- dataFeatNames$V2

Merge cols to get data frame
dataCombine <- cbind(dataSub, dataAct)
Data <- cbind(dataFeat, dataCombine)

Subset names of features by measurements
subdataFeatNames<-dataFeatNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeatNames$V2)]

Subset data frame by selected name of features
selectedNames<-c(as.character(subdataFeatNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

Check structure of data frame
str(Data)

Uses descriptive activity names to name activities in data set
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

factorize variable activity in data frame 
Data$activity<-factor(Data$activity);
Data$activity<- factor(Data$activity,labels=as.character(activityLabels$V2))

head(Data$activity,30)

Appropriately labels the data set
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

check
names(Data)

Create 2nd independent tidy set and output it
library(plyr);
dataTidy<-aggregate(. ~subject + activity, Data, mean)
dataTidy<-dataTidy[order(dataTidy$subject,dataTidy$activity),]
write.table(dataTidy, file = "tidydata.txt",row.name=FALSE)
