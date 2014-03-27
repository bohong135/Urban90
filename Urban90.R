# loading libraries

#increase java Heap size(sufficient)
options(java.parameters = "-Xmx32g")
library(xlsx) #function read.xlsx2
library(sqldf) 
library(e1071) # function naiveBayes
library(Hmisc) # function cut2
library(randomForest) #function randomForest

#--------------------------------------------------------------
# loading data - 100 rows  na.strings %in% ( "" )
if(!(exists("urban"))){
  urban <- read.xlsx2("SumU90.xlsx",sheetIndex=1,endRow=100,header=TRUE,
         stringsAsFactors = FALSE,colClasses=rep("numeric",116))
}
# loading data for join
if(!(exists("joinsheet"))){
  joinsheet <- read.xlsx2("SumU90.xlsx",sheetIndex=2)
}

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


#--correct
levels(urbantest$a01)[levels(urbantest$a01)== "1" ] <- "man"
levels(urbantest$a01)[levels(urbantest$a01)== "2" ] <- "woman"

summary(urbantest$a01)
unique(urbantest$a01)

#--------------------------------------------------------------------------------------------
#Random Forest
set.seed(2)
#OK <- complete.cases(urban)
#completeurban <- urban [OK,]
#head(completeurban)


#options(stringsAsFactors = FALSE)
urban.random.forest <- randomForest(daramad ~ ., data = urban, 
                ntree=2000, keep.forest=FALSE,importance=TRUE,na.action = na.omit)

length(unique(urban$daramad))# ==58

varImpPlot(urban.random.forest)
class(urban)

summary(urbantest$)
unique(urban$daramad)




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