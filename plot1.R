###############################################################################
## Coursera Course: 04 Exploratory Data Analysis                             ##
## Course Project 1                                                          ##
###############################################################################
## R ##### Author: Gero Schmidt ###### Version: 1.00 ###### Date: 2014-06-06 ##
###############################################################################
## Script: plot1.R                                                           ##
## ---------------                                                           ##
## This is script 1 for the Course Project 1 in <Exploratory Data Analysis>. ##
## It reads the data from the <household_power_consumption.txt> dataset      ##
## located in the local working directory. The script reads the 2880         ##
## observations from 2007-02-01 00:00 to 2007-02-02 23:59 and produces the   ##
## requested plot 1 as png file with 480x480 pixels in the local working     ##
## driectory with file name <plot1.png> as requested by the instructions.    ## 
###############################################################################
## Disclaimer: The sample code described herein is provided on an "as is"    ##
## basis, without warranty of any kind. The author does not warrant,         ##
## guarantee or make any representations regarding the use, results of use,  ##
## accuracy, timeliness or completeness of any data or information relating  ##
## to this code. The author disclaims all warranties, express or implied,    ##
## and in particular, disclaims all warranties of merchantability, fitness   ##
## for a particular purpose, and warranties related to the code, or any      ##
## service or software related thereto. The author shall not be liable for   ##
## any direct, indirect or consequential damages or costs of any type        ##
## arising out of any action taken by you or others related to this code.    ##
###############################################################################

## -----------------------------------------
## Check if all required files are available
## -----------------------------------------

### Path to data and output graphics
fileUrl  <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
datafile <-"household_power_consumption.txt"
plotfile <-"plot1.png"

### Check for data directory and all required files

ALL_FOUND<-TRUE

if (!file.exists(datafile)) {
  message("File <", datafile, "> not found in local directory.")
  message("Do you want to automatically download and unzip the file? (y=yes/n=no)")
  ans<-readline()
  if (ans=="y") {
    message("Downloading data to local directory from ", fileUrl)
    ## Download file
    download.file(fileUrl, destfile = "./download.zip", method = "curl")
    dateDownloaded<-date()
    ## Unzip zip archive
    unzip("download.zip")
  } else {  
    ALL_FOUND<-FALSE
  }
}
if (ALL_FOUND==FALSE) {  
  message("Not all required files for the dataset were found in the local directory.")
  message("Please provide required files in requested location in your working directory.")
  message("Execution of script aborted...")
} else {
  message("OK, found all required data files and will start processing the data...")
}

## Stop if not all files have been found
stopifnot(ALL_FOUND)

## ------------------------
## Load and preprocess data
## ------------------------

## Read whole dataset is not necessary as original dataset is sorted by date and time
# message("Reading the data... This will take a while - please be patient!")
# dat<-read.table(datafile,sep=";",header=TRUE, na.strings="?", quote="",stringsAsFactors=FALSE)

## Original dataset is sorted by date and time. Read partial dataset for 
## 1) date 2007-02-01 starting at 66637 (not counting the header row) and
## 2) date 2007-02-02 ending at 69516 (not counting the header row)
## providing a total of 2800 observations (69516-66637+1) ranging from
## 2007-02-01 00:00:00 to 2007-02-02 23:59:00 which gives exactly the same dataset as when
## subsetting the whole dataset to the dates 2007-02-01 and 2007-02-02
message("Reading the data for dates 2007-02-01 and 2007-02-02 only...")
datnames<-names(read.table(datafile,sep=";",header=TRUE, na.strings="?", quote="",stringsAsFactors=FALSE, nrows=1))
dat<-read.table(datafile,sep=";",header=TRUE, col.names=datnames,na.strings="?", quote="",stringsAsFactors=FALSE, skip=66636,nrows=2880)

## Convert date
dat$Date<-as.Date(dat$Date, format="%d/%m/%Y")

## Reduce dataset to dates of interest (2007-02-01 and 2007-02-02) to save memory (not necessary anymore)
# dat<-subset(dat,dat$Date==as.Date("2007-02-01")|dat$Date==as.Date("2007-02-02"))

## Convert and merge date and time into POSIX date/time format (assume CET as data originates from France)
dat$Date<-strptime(paste(dat$Date,dat$Time,sep=" "),format="%Y-%m-%d %H:%M:%S",tz="CET")


## --------------------
## Plot requested graph
## --------------------

## Open png file device for 480x480 pixels in current working directory
png(filename=plotfile, width=480, height=480, units="px")

## Plot histogram of Global_active_power
hist(dat$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Close the png file device
dev.off()  

## Now you can open and view the file 'plot1.png' on your computer
message("Requested plot written to file <",plotfile,"> in current working directory")