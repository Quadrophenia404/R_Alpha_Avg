#Enter mapping file
map <- read.table(readline( prompt = "Please enter mapping file: "), header = TRUE, sep = "\t",
                  dec = ".", row.names = 1, fill = TRUE, comment.char = "#")

#Enter alpha div file
read <- read.table(readline( prompt = "Please enter alpha diversity file: "), header = TRUE, sep = "\t",
                  dec = ".", fill = TRUE, comment.char = "#")

#Defines the name of the new Column
newCol<-c()
#Loop over the header of the mapping file
for (row in rownames(map)){
  #check if each header is actually in the alpha diversity file
  if (is.element(row, colnames(read))){
    #if the header is in the alpha div file, the average of the column goes into newCol
    newCol<- append(newCol,mean(read[,row]))
  } else {
    #if the header is not in the alpha div file, add NA to newCol
    newCol<- append(newCol, NA)
  }
}

#writes column data
getNewMap<- readline(prompt = "Enter file output name: ")
write.table(newCol, file=getNewMap, append = TRUE, sep="\t", eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = FALSE)















