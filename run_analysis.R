#Create file if not exist and download it
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")


#Unzip the dataset file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Get list of unzipped files
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files


#Merges the training and the test sets to create one data set

#Read Activity Files
actTest<- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
actTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)


#Read Subject Files
subTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
subTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)


#Read feature Files
featureTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
featureTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)


#Properties of variables
str(actTest)
str(actTrain)
str(subTest)
str(subTrain)
str(featureTest)
str(featureTrain)


#Merge the training and test data sets into one data set

#Combine data tables by rows
dataSub <- rbind(subTrain, subTest)
dataAct<- rbind(actTrain, actTest)
dataFeat<- rbind(featureTrain,featureTest)

#Set names for variables
names(dataSub)<-c("subject")
names(dataAct)<- c("activity")
dataFeatNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeat)<- dataFeatNames$V2

#Merge cols to get data frame
dataCombine <- cbind(dataSub, dataAct)
Data <- cbind(dataFeat, dataCombine)



#Extract only the meand and sd for each measurement
#Subset names of features by measurements
subdataFeatNames<-dataFeatNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeatNames$V2)]

#Subset data frame by selected name of features
selectedNames<-c(as.character(subdataFeatNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

#Check structure of data frame
str(Data)


#Uses descriptive activity names to name activities in data set
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

#factorize variable activity in data frame 
Data$activity<-factor(Data$activity);
Data$activity<- factor(Data$activity,labels=as.character(activityLabels$V2))

head(Data$activity,30)


#Appropriately labels the data set
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#check
names(Data)



#Create 2nd independent tidy set and output it
library(plyr);
dataTidy<-aggregate(. ~subject + activity, Data, mean)
dataTidy<-dataTidy[order(dataTidy$subject,dataTidy$activity),]
write.table(dataTidy, file = "tidydata.txt",row.name=FALSE)
