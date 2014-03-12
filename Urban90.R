# loading libraries

#Try to increase java Heap size(sufficient), by using
options(java.parameters = "-Xmx32g")
library(xlsx)
library(sqldf)
library(e1071)

#--------------------------------------------------------------
# loading data - 100 rows
if(!(exists("urban"))){
  urban <- read.xlsx2("SumU90.xlsx",sheetIndex=1,endRow=100)
}
# loading data for join
if(!(exists("joinsheet"))){
  joinsheet <- read.xlsx2("SumU90.xlsx",sheetIndex=2)
}
#urban <- read.xlsx2("SumU90.xlsx",sheetIndex=1)

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
urban1 <- urban[ ,!(names(urban)) %in% names(urban)[dindex2]]

#head(treeurban$daramad)
# removing all kinds of hazineh from outcome variables
urban2 <- urban1[ ,!(names(urban)) %in% hvector]
#head(treeurbanf$daramad)
#----------------------------------------------------------
#exploratory data analysis
plot(daramad ~ a01, data=urbantest,varwidth = TRUE,col = rainbow(2)) # 1-man 2-woman
plot(daramad ~ a02, data=urban2,varwidth = TRUE,range = 0,col = rainbow(20)) #age
plot(daramad ~ a03, data=urban2,varwidth = TRUE,col = rainbow(2)) #1 literate 2 illiterate
plot(daramad ~ a04, data=urban2,varwidth = TRUE,col = rainbow(3)) #?
plot(daramad ~ a05, data=urban2,varwidth = TRUE,col = rainbow(3)) #?
plot(daramad ~ a06, data=urban2,varwidth = TRUE,col = rainbow(30)) #?
plot(daramad ~ a07, data=urban2,varwidth = TRUE,col = rainbow(4)) #?
plot(daramad ~ a08, data=urban2,varwidth = TRUE,col = rainbow(30)) #?
plot(daramad ~ a09, data=urban2,varwidth = TRUE,col = rainbow(30)) #?
plot(daramad ~ a10, data=urban2,varwidth = TRUE,col = rainbow(30)) #?
plot(daramad ~ a10new, data=urban2,varwidth = TRUE,col = rainbow(30)) #?

urbantest <- urban2


#--correct
levels(urbantest$a01)[levels(urbantest$a01)== "1" ] <- "man"
levels(urbantest$a01)[levels(urbantest$a01)== "2" ] <- "woman"

summary(urbantest$a01)
unique(urbantest$a01)

#------------------------



> classifier<-naiveBayes(iris[,1:4], iris[,5]) 


naivedfminusdaramad <- urbantest[ , !names(urbantest) %in% c("daramad")]
naivedfdaramad      <- urbantest[ , names(urbantest) %in% c("daramad")]

dim(naivedfminusdaramad)
dim(naivedfdaramad)


head(naivedfdaramad,20)

classifier <- naiveBayes(naivedfminusdaramad,naivedfdaramad)

table(predict(classifier, naivedfminusdaramad), naivedfdaramad)
> table(predict(classifier, iris[,-5]), iris[,5])
dim(iris[,-5])
dim(iris[,5])


#------------------------
# for  (i in head(names(urbantest))) {
# # urbantest<-  merge(x = urbantest, y = joinsheet, by = "CustomerId", all = TRUE)
#   sqldf('update urbantest 
#         set urbantest$i=
#          from urbantest ,joinsheet
# 
# 
#         where i==field and 
#         where age is not null group by age')
#   
#   
# }
    


#Prototyping data modeling

#library(party)
#myformula <- daramad ~ .
#urban_ctree <- ctree(myFormula, data=urban)
#urbanlm <- lm(myformula,data=treeurbanf)
#help(memory.size)