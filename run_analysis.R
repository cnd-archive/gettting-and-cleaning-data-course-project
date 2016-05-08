getFeatureLabels <- function () {
    df <- read.table("UCI HAR Dataset/features.txt")
    as.character(df$V2)
}

getFeatureDataset <- function (filename) {
    df <- read.table(filename)
    featureLabels <- getFeatureLabels()
    names(df) <- featureLabels
    df
}

narrowColumns <- function (df, regex) {
    cols <- names(df)
    cols <- cols[grep(regex, cols)]
    df[,cols]
}

getFeaturesAndActivities <- function(testOrTrain) {
    regex <- "(mean|std)\\(\\)$"
    directory <- paste0("UCI HAR Dataset/", testOrTrain, "/")
    featureFile <- paste0(directory, "X_", testOrTrain, ".txt")
    activityFile <- paste0(directory, "y_", testOrTrain, ".txt")
    subjectFile <- paste0(directory, "subject_", testOrTrain, ".txt")
    
    features <- narrowColumns(getFeatureDataset(featureFile), regex)
    activities <- read.table(activityFile, col.names=c("Activity"))
    subjects <- read.table(subjectFile, col.names=c("Subject"))
    data <- cbind(activities, subjects, features)
    data
}

getDataset <- function () {
    testData <- getFeaturesAndActivities("test")
    trainData <- getFeaturesAndActivities("train")

    allData <- rbind(testData, trainData)

    activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
    allData$Activity <- factor(allData$Activity, activityLabels$V1, activityLabels$V2)
    
    allData
}

getSummaryDataset <- function () {
    df <- getDataset()
    aggregate(. ~ Activity + Subject, data = df, mean)
}

# To get the summary dataset, run the following:
# getSummaryDataset()