# loading libraries

#Try to increase java Heap size(sufficient), by using
options(java.parameters = "-Xmx32g")
library(xlsx)
#--------------------------------------------------------------
# loading data
urban <- read.xlsx2("SumU90.xlsx",sheetIndex=1)

#Try to increase java Heap size(sufficient), by using
#options(java.parameters = "-Xmx32g")
#library(XLConnect)
#urban <- readWorksheetFromFile("SumU90.xlsx", sheet=1)
#-------------------------------------------------------------
#Data Munging
# to ease calling variables we rename them to lower case
names(urban) <- tolower(names(urban))
str(urban)
#--------------------------------
#creating a backup
urbanbackup <- urban
#--------------------------------
# using regular expression to find appropriate variables for converting factor to numeric
dpattern = '*?daramad*'
dindex = grep(dpattern, names(urban))
dindex
#names(urban)[dindex]

for (i in dindex) {
    urban[ ,i] <-as.numeric(urban[ ,i])
}

#class(urban$daramad03)
#--------------------------------
# adding hazine to numeric
hvector <- c("nhazineh","ghazineh","vkhorak","vgheirkhorak")
for (j in hvector){s
  hindex<- which(names(urban)==j)
  urban[ ,hindex] <-as.numeric(urban[ ,hindex])
}

#class(urban$nhazineh)
#---------------------------------
# Data Exploration
summary(urban$daramad)