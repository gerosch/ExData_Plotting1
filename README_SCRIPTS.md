# Exploratory Data Analysis - Course Project 1

This is an assignment for Course Project 1 of the Course `Exploratory Data Analysis` on Coursera.
This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, it will be using the “Individual household electric power consumption Data Set” which is made available on the course web site:

* Dataset: Electric power consumption [20Mb]
  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

* Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

Please refer to the CODEBOOK.md for information about the data and the transformations.

## Script execution and graphs

The scripts which produce the requested graphs from the assignment (as described in the `README.md` file) require that the dataset is manually downloaded from

https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

and unzipped (extracted) into the local working directory where the R script files

    plot1.R
    plot2.R
    plot3.R
    plot4.R

reside. The data structure of the local working directory needs to contain the following files in order to generate the requested graphs when executing the scripts using `source("plot1.R")` to `source("plot4.R")`:

    household_power_consumption.txt
    plot1.R
    plot2.R
    plot3.R
    plot4.R

Each script reads the 2880 observations from the dataset from 2007-02-01 00:00 to 2007-02-02 23:59 and plots the data into the requested graphs. Each script produces one graph. The graph is written as a png file with 480x480 pixels in the local working directory as follows:

    plot1.R -> plot1.png
    plot2.R -> plot2.png
    plot3.R -> plot3.png
    plot4.R -> plot4.png

Please note, that already existing files with the file names `plot1.png`, `plot2.png`, `plot3.png`, `plot4.png` are overwritten without asking the user when executing the scripts.

## Original Data Source

The data is provided by 

* Georges Hebrail (georges.hebrail '@' edf.fr), Senior Researcher, EDF R&D, Clamart, France
* Alice Berard, TELECOM ParisTech Master of Engineering Internship at EDF R&D, Clamart, France

on the UC Irvine Machine Learning Repository at

https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

Bache, K. & Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. 

Irvine, CA: University of California, School of Information and Computer Science.
