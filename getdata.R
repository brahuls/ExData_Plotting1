###############################################################################
## $Header:: "getdata.R"; version v 1.0.0 2019-04-21
## Author:: Rahul S. Brahmachari
##
## This R script will check for the data file "household_power_consumption.txt" 
## in the present working directory. If the file is not present, then it will 
## download the source zip archive from internet and unzip it.
## This script will extract data on measurements of electric power consumption 
## with different electrical quantities and some sub-metering values in one 
## household with a one-minute sampling rate over a period of 2 days only 
## spanning the dates 2007-02-01 and 2007-02-02.
## The etracted data will be used to construct the needed plots using the base 
## plotting system. 

getdata<- function(){
  ## If the data file "household_power_consumption.txt" does not exist 
        if(!file.exists("./household_power_consumption.txt")) {
                fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                dataFile <- "sourcedata.zip"
        ## Download the source zip  archive from internet       
                download.file(fileURL, dataFile)
        ## Unzip the downloaded File
                unzip(dataFile)
        ## Remove the .zip archive file of source data set; however, keeping the 
        ## unzipped source data files for future use 
                unlink(dataFile)
        }
  ## Read data rom file to memory
        powerdata <- read.table("./household_power_consumption.txt", 
                                stringsAsFactors = FALSE, 
                                header = TRUE, sep =";",na.strings ="?")
  ## Convert the date for ertracting over a 2-day period in February, 2007.      
        powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
  ## Extracting data for a 2-day period in February, 2007.
        subsetdata <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")
  ##Freeing the memory by removing the large unused data set      
        rm("powerdata")
  ## Converting the other colums      
        subsetdata$Time <- format(subsetdata$Time, format="%H:%M:%S")
        subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
        subsetdata$Global_reactive_power <- as.numeric(subsetdata$Global_reactive_power)
        subsetdata$Voltage <- as.numeric(subsetdata$Voltage)
        subsetdata$Global_intensity <- as.numeric(subsetdata$Global_intensity)
        subsetdata$Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
        subsetdata$Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
        subsetdata$Sub_metering_3 <- as.numeric(subsetdata$Sub_metering_3)
    ## returning the sellected dataset for a 2-day period in February, 2007.    
        return(subsetdata)
}


        