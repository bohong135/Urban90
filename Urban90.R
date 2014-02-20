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
for (j in hvector){
  hindex<- which(names(urban)==j)
  urban[ ,hindex] <-as.numeric(urban[ ,hindex])
}

#class(urban$nhazineh)
#---------------------------------
# Data Exploration
summary(urban$daramad)

#---------------------------------
#modeling data
#formula1 <- daramad ~ .

# for (k in 1:length(names(urban)[dindex])){
#   for (l in names(urban)[dindex][k]){
#   mformula <- update(formula1,data=urban, ~.- l)
# }
# }
# 
# length(names(urban)[dindex])
#DF[,!(names(DF) %in% drops)]
#-------------------------------------------------------
# removing all kinds of daramad from outcome variables
# removing daramad from dindex
dindex2 <- names(urban)[dindex][which(names(urban)[dindex]!="daramad")] 
dindex2
treeurban <- urban[ ,!(names(urban)) %in% names(urban)[dindex2]]

#head(treeurban$daramad)
# removing all kinds of hazineh from outcome variables
treeurbanf <- treeurban[ ,!(names(urban)) %in% hvector]
#head(treeurbanf$daramad)
library(party)
myFormula <- daramad ~ .
urban_ctree <- ctree(myFormula, data=urban)