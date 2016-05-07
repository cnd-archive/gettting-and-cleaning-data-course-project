filename <- "getdata-projectfiles-UCI HAR Dataset.zip"

if (!file.exists(filename)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  filename, method = "curl")
}

unzip(filename, overwrite = TRUE)