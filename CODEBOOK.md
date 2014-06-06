# Exploratory Data Analysis - Course Project 1

This is an assignment for Course Project 1 of the Course `Exploratory Data Analysis` on Coursera.

## Data used in this exercise

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, it will be using the “Individual household electric power consumption Data Set” which is made available on the course web site:

* Dataset: Electric power consumption [20Mb]
  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

* Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

* Date: Date in format dd/mm/yyyy
* Time: time in format hh:mm:ss
* Global_active_power: household global minute-averaged active power (in kilowatt)
* Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
* Voltage: minute-averaged voltage (in volt)
* Global_intensity: household global minute-averaged current intensity (in ampere)
* Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
* Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
* Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

The original dataset has 2,075,259 rows and 9 columns. A calculation of how much memory the dataset will require in memory provides an estimate of 2,075,259 x 9 x 8 bytes = 142.5 MiB.

Reading the whole dataset into R and obtaining its actual object size using the command `object.size()` reveals a memory allocation of 142.65 MiB:

    dat<-read.table(datafile,sep=";",header=TRUE, na.strings="?", quote="",stringsAsFactors=FALSE)
    > object.size(dat)
    149581752 bytes

As we will only be using data from the dates 2007-02-01 and 2007-02-02, one alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates to save memory and processing time.

The data in the dataset is already sorted by date and time. As the analysis for this exercise is limited to the dates 2007-02-01 and 2007-02-02 the dataset needs to be read only partially from

* date 2007-02-01 starting at observation 66637 (not counting the header row) to 
* date 2007-02-02 ending at observation 69516 (not counting the header row)

providing a total of 2800 observations (69516-66637+1) for the two days with observations ranging from
2007-02-01 00:00:00 to 2007-02-02 23:59:00 which gives exactly the same dataset as when
reading in the whole dataset and then subsetting it to the dates 2007-02-01 and 2007-02-02. Each
observation covers a measurement over one minute (2880 observations = 48 hours = 2 days).

    dat<-read.table(datafile,sep=";",header=TRUE, na.strings="?", quote="",stringsAsFactors=FALSE)
    > match(as.Date("2007-02-01"),dat$Date)
    [1] 66637
    > match(as.Date("2007-02-02"),dat$Date)
    [1] 68077
    > match(as.Date("2007-02-03"),dat$Date)
    [1] 69517
    > 69517-66637
    [1] 2880

In order to convert the given Date and Time variables to a combined POSIX Date-Time class the `strptime()` and `as.Date()` functions are used. The data seems to be collected in France, so Central European Time (CET = UTC+01:00) is assumed for the date and time values.

Missing values in the original dataset are coded as "?" and replaced by "NA" when reading the dataset into R.

## Script execution and graphs

The scripts require that the dataset is manually downloaded from

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

Each script reads the 2880 observations from the dataset from 2007-02-01 00:00 to 2007-02-02 23:59 and plots the data into the requested graphs. Each script produces one graph. The graph is written as a png file with 480x480 pixels in the local working directory as

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


### Individual household electric power consumption Data Set 

Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
  
This archive contains 2075259 measurements gathered between December 2006 and November 2010 (47 months).

Notes:

1.(global_active_power*1000/60 - sub_metering_1 - sub_metering_2 - sub_metering_3) represents the active energy consumed every minute (in watt hour) in the household by electrical equipment not measured in sub-meterings 1, 2 and 3.

2.The dataset contains some missing values in the measurements (nearly 1,25% of the rows). All calendar timestamps are present in the dataset but for some timestamps, the measurement values are missing: a missing value is represented by the absence of value between two consecutive semi-colon attribute separators. For instance, the dataset shows missing values on April 28, 2007.



