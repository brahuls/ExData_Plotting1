###############################################################################
## $Header:: "plot2.R"; version v 1.0.0 2019-04-21
## Author:: Rahul S. Brahmachari
##
## This R script will construct the plot and save it to a PNG file with a 
## width of 480 pixels and a height of 480 pixels as requested in the assignment.
plot2<- function(){
  ## Sourcing the file to use the getdata() function 
        source("./getdata.R")
        subsetdata <- getdata()
  ## Creating a datetime column by concatinating the Date & Time column for 
  ## plotting the graph. This could have been done in the getdata () function and 
  ## passed with cbind() function or use in plots functions. But desist as the 
  ## plot1 function does not need ths additional data.
        FullTimeDate <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), 
                                 "%Y-%m-%d %H:%M:%S")
## Graphics device to save the plot as a PNG file; width & height explicitly 
## mentioned, though the defallt can be used as the value are same
        png("plot2.png", width=480, height=480)
        with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", 
                              xlab="", ylab="Global Active Power (kilowatts)"))
        dev.off()
        
}