###############################################################################
## $Header:: "plot1.R"; version v 1.0.0 2019-04-21
## Author:: Rahul S. Brahmachari
##
## This R script will construct a histogram and save it to a PNG file with a 
## width of 480 pixels and a height of 480 pixels as requested in the assignment.
plot1<- function(){
  ## Sourcing the file to use the getdata() function 
        source("./getdata.R")
        subsetdata <- getdata()
  ## Graphics device to save the plot as a PNG file; width & height explicitly 
  ## mentioned, though the defallt can be used as the value are same
        png("plot1.png", width=480, height=480)
  ## computes a histogram as requested
        hist(subsetdata$Global_active_power, col="red", border="black", 
             main ="Global Active Power", xlab="Global Active Power (kilowatts)", 
             ylab="Frequency")
        dev.off()
        
}