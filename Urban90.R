# loading libraries

#Try to increase java Heap size(sufficient), by using
options(java.parameters = "-Xmx32g")
library(xlsx)
library(sqldf) 
library(e1071) # function naiveBayes
library(Hmisc) # function cut2
library(randomForest) #function randomForest

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
urbantest$daramad<- cut2(urbantest$daramad,g=4)
table(urbantest$daramad,useNA="ifany")

naivedfminusdaramad <- urbantest[ , !names(urbantest) %in% c("daramad")]
naivedfdaramad      <- urbantest[ , names(urbantest) %in% c("daramad")]

dim(naivedfminusdaramad)
dim(naivedfdaramad)


classifier <- naiveBayes(naivedfminusdaramad,naivedfdaramad)
table(predict(classifier, naivedfminusdaramad), naivedfdaramad)
# shows that we can predict daramad from features in dataframe quite well


# second way of writing
classifier2 <- naiveBayes(daramad~., data=urbantest)
predict(classifier2,urbantest)

#preparing for Random Forest temporarily turning datatype to
#urbantest$daramad<- cut2(urbantest$daramad,g=4)

random.forest.vector <- c("address","a02","a05","a08","a09","block","b04")

for (j in random.forest.vector){
  random.forest.index<- which(names(urban)==j)
  urbantest[ ,random.forest.index] <- as.numeric(urbantest[ ,random.forest.index])
  #urbantest[ ,random.forest.index] <-cut2(urbantest[ ,random.forest.index],g=4)
}




#Random Forest
set.seed(1)
urbantest.rf <- randomForest(daramad ~ ., data=urbantest, ntree=1000, keep.forest=FALSE,importance=TRUE)
varImpPlot(urbantest.rf)






# #---------------------------
# class(urbantest[ , !names(urbantest) %in% c("daramad")]) #data.frame
# class(urbantest[ , names(urbantest) %in% c("daramad")])  #numeric
# #--------------------------------
# dim(urbantest[ , !names(urbantest) %in% c("daramad")]) #99 112
# dim(urbantest[ , names(urbantest) %in% c("daramad")])
# #----------------------------------
# length(urbantest[ , !names(urbantest) %in% c("daramad")]) # 112
# length(urbantest[ , names(urbantest) %in% c("daramad")]) #99
# #------------------------



class(urbantest$daramad)

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