pollutantmean<-function(directory, pollutant, id=1:332){
          
  # create an empty vector
  pollutants = c()
  
  # file names
  filenames = list.files(directory)
  print(filenames)
  #for each csv file
  for (i in id){
    
  
  filepath = paste(directory,"/",filenames[i],sep="")
  #print(filepath)
  # reading each file and soring into data
  data = read.csv(filepath,header = TRUE)
  
  ##Concatinate the vectors from each file of the pollutant('sulfate' or 'nitrate') column to pollutants vector
  pollutants = c(pollutants, data[,pollutant])
  
  }
  ## Get the mean of the pollutants and remove NA values
  pollutants_mean = mean(pollutants, na.rm=TRUE)
  
  ## Return the mean 'pollutants_mean'
  pollutants_mean
}