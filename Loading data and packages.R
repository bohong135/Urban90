# loading libraries

#increase java Heap size(sufficient)
options(java.parameters = "-Xmx32g")
library(xlsx) #function read.xlsx2
#library(sqldf) 
#library(e1071) # function naiveBayes
#library(Hmisc) # function cut2
library(randomForest) #function randomForest

#--------------------------------------------------------------
# loading data - 100 rows  na.strings %in% ( "" )
if(!(exists("urban"))){
  urban <- read.xlsx2("SumU90.xlsx",sheetIndex=1,endRow=101,header=TRUE,
         stringsAsFactors = FALSE,colClasses=rep("numeric",116))
}

# loading data for join
#if(!(exists("joinsheet"))){
# joinsheet <- read.xlsx2("SumU90.xlsx",sheetIndex=2)
#}
#------------------------------------------------------------
# library XLconnect
#Try to increase java Heap size(sufficient), by using
#options(java.parameters = "-Xmx32g")
#library(XLConnect)
#urban <- readWorksheetFromFile("SumU90.xlsx", sheet=1)
#-------------------------------------------------------------
#Basic Data Munging
# to ease calling variables we rename them to lower case
names(urban) <- tolower(names(urban))
# to ease working with data I sorted data based on column names
urban        <- urban[,order(names(urban))]
#str(urban)
#--------------------------------
#creating a backup
urbanbackup <- urban