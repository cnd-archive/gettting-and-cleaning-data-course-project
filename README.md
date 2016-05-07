# Getting and Cleaning Data Course Project

This repository holds my solution for the [Getting and Cleaning Data course from Coursera](https://www.coursera.org/learn/data-cleaning/).

You should see the following files in this repository:

* [CodeBook.md](CodeBook.md): A codebook describing the tidy dataset provided.
* [run_analysis.R](run_analysis.R): R code to generate the tidy dataset from the [source dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
* [download_data.R](download_data.R): R code to download and extract the source dataset.
* [tidy_dataset.txt](tidy_dataset.txt): The tidy dataset generated.

## Cleaning the dataset

In order to generate the tidy dataset yourself, you will want to first run the code in `download_data.R`. You can run it within R. If you have a Unix shell (Linux and OS X systems, mainly), you can run the following on the command line:

```
R --no-save < download_data.R
```

Then load `run_analysis.R` into R. Run `getSummaryDataset()` to generate the tidy dataset. You can save this in a file like so:

```
write.table(getSummaryDataset(), "tidy_dataset.txt")
```

## Reading the dataset

If you wish to read in the tidy dataset, run the following within R:

```
read.table("tidy_dataset.txt", header = TRUE)
```