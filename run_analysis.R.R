#Assignment getting and cleaning data script for performing the analysis 
# You should be able to run this script and get the tidy dataset 

#Part 1 setting your working directory in this part I will create the working directory for this project
getwd() #this identifies your current working directory 
if(!file.exists("tidydataproject")){dir.create("tidydataproject")} #creates or working directory if it do not  exist 
setwd("tidydataproject") #set my working directory to the directory, that i have created 
get() #checking if I am in the correct working directory 

#part 2 download the document to my working directory 
#create a variable with the URL
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
#download the file and names it zipfile
downloader::download(file.url, destfile = "zipfile")
#unzipfile
unzip ("zipfile")
# date off the download 
datedownload <- data()

#part 3 create variables with the data 
# read the data into variables in R 
# test 
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")

#train 
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")

# Names of variables and  and activities 
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

#nameing the activity variable
names(ytrain) <- "activity"
names(ytest) <- "activity"
#naming the subejct variable 
names(subjecttest) <- "subject.id"
names(subjecttrain) <- "subject.id"

# step 4 the varibles are named with appropiate variable name 
#apliying the featurenames to the variable features 
names(xtest) <- features$V2
names(xtrain) <- features$V2

#step 1 merge the data 
#bind the documents togethere 
alltest <- cbind(subjecttest, ytest, xtest)
alltrain <- cbind(subjecttrain, ytrain, xtrain)
alldata <- rbind(alltest,alltrain)

#step 2 standarddeviation and mean are exctracted 
#creating a document with the mean and standard deviation, (activity and subject.id)
alldata1 <- grepl("mean\\(\\)|std\\(\\)|subject.id|activity", names(alldata))
alldata2 <- alldata[,alldata1]

# step 3
# Inshuring that the data has appropiate activity labelse 
alldata2$activity <- factor(alldata2$activity, levels = activity_labels[,1], labels = activity_labels[,2])

#Step 4 I started with step four as I neaded the names in order to extract the mean and standard


# Step 5
#final reshaping of the data with the reshape2 package
library(reshape2)
mixed <- melt(alldata2, id = c("subject.id", "activity"))
tidydata <- dcast(mixed, subject.id + activity ~ variable, mean)

# write the data out as txt.file
write.csv(tidydata, "tidydata.csv", row.names=FALSE)
