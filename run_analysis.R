# TODO: 3, 4, 5
# - add activities
# - name activities
# - create final data set

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


getDataset <- function () {
    regex <- "(mean|std)\\(\\)$"

    testFeatures <- narrowColumns(getFeatureDataset("UCI HAR Dataset/test/X_test.txt"), regex)
    testActivities <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("Activity"))
    testData <- cbind(testActivities, testFeatures)

    trainFeatures <- narrowColumns(getFeatureDataset("UCI HAR Dataset/train/X_train.txt"), regex)
    trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("Activity"))
    trainData <- cbind(trainActivities, trainFeatures)

    allData <- rbind(testData, trainData)

    activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
    allData$Activity <- factor(allData$Activity, activityLabels$V1, activityLabels$V2)
}
