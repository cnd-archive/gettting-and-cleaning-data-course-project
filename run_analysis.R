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
    testData <- narrowColumns(getFeatureDataset("UCI HAR Dataset/test/X_test.txt"), regex)
    trainData <- narrowColumns(getFeatureDataset("UCI HAR Dataset/train/X_train.txt"), regex)
    allData <- rbind(testData, trainData)
    allData
}
# head(narrowColumns(df2, "(mean|std)\\(\\)$"))