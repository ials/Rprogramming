pollutantmean<- function(directory, pollutant, id = 1:332) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".
## 'id' is an integer vector indicating the monitor ID numbers
## to be used
## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
setwd(directory)
datafile <- read.csv("001.csv", header=T,nrows=1)
id1 <- as.character(id)
for (i in id1){
filename <- i
len <- nchar(filename, type = "chars")
tmp1 <- ifelse(len==3, paste(filename, ".csv", sep=""), ifelse(len==2,paste("0",filename,".csv", sep=""),paste("00",filename,".csv", sep="") ))
file <- read.csv(tmp1, header=T)
datafile <- rbind(datafile,file)
}
media <- mean(datafile[[pollutant]], na.rm=T)
return(media)
}
