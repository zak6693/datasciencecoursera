complete <- function(directory, id= 1:332){
  
  ## Create an empty vector of id's
  ids = c()
  
  ## Create an empty vector of nobs
  nobss = c()
  
  ## Get a list of filenames
  filenames = list.files(directory)
  
  ## For each .csv file in id
  for(i in id){
    
    ## Concatinate the directory and filename
    ## e.g. directory = "C:/folder", filenames = vector("001.csv", "002.csv", ...), filepath="C:/folder/001.csv"
    filepath=paste(directory,"/" ,filenames[i], sep="")
    
    ## read in each file and store it in data
    data = read.csv(filepath, header = TRUE)
    
    ##Get a subset of all rows with complete data meaning no NA's
    ##completeCases = subset(data, !is.na(Date) & !is.na(sulfate) & !is.na(nitrate) & !is.na(id),select = TRUE )
    completeCases = data[complete.cases(data), ]
    
    ids =  c(ids, i)                    ## We can use i for id and concatinate a vector of id's
    nobss = c(nobss, nrow(completeCases) )## Concatinates the number of completed rows from the subset into a vector
    
  }
  ## Return the data frame
  data.frame(id=ids, nobs=nobss)
}
