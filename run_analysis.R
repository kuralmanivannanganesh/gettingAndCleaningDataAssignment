fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCIHARData.zip",method = "curl")

unzip(zipfile = "./data/UCIHARData.zip", exdir = "./data")

path_rf <- file.path("./data","UCI HAR Dataset")

subjectTrainData <- read.table(file.path(path_rf,"train","subject_train.txt"), header = FALSE)
subjectTestData <- read.table(file.path(path_rf,"test","subject_test.txt"), header = FALSE)

activityTrainData <- read.table(file.path(path_rf,"train","Y_train.txt"),header = FALSE)
activityTestData <- read.table(file.path(path_rf,"test","Y_test.txt"),header = FALSE)

featTrainData <- read.table(file.path(path_rf,"train","X_train.txt"),header = FALSE)
featTestData <- read.table(file.path(path_rf,"test","X_test.txt"),header = FALSE)

subjData <- rbind(subjectTrainData,subjectTestData)
actData <- rbind(activityTrainData, activityTestData)
featData <- rbind(featTrainData,featTestData)

names(subjData) <- c("subject")
names(actData) <- c("activity")
featureNames <- read.table(file.path(path_rf,"features.txt"),header = FALSE)
names(featData) <- featureNames$V2

allData <- cbind(subjData,actData)
data <- cbind(featData, allData)

meanAndStdRownames <- grep("mean\\(\\)|std\\(\\)",featureNames$V2)
subdataFeatureNames <- featureNames$V2[meanAndStdRownames]
selectedNames <- c(as.character(subdataFeatureNames),"subject","activity")

data <- subset(data, select = selectedNames)

activityLabels <- read.table(file.path(path_rf,"activity_labels.txt"),header = FALSE)
data$activity <- factor(data$activity,labels =  activityLabels$V2)

names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

install.packages("plyr")
library(plyr)

data2 <- aggregate(. ~subject + activity, data, mean)
write.table(data2, file = "tidydata.txt",row.name=FALSE)

