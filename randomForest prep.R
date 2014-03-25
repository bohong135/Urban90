
#preparing for Random Forest temporarily turning datatype to
#urbantest$daramad<- cut2(urbantest$daramad,g=4)
#variables with more than 25 levels are selected to remove the error caused by random forest
random.forest.vector <- c("address","a02","a05","a08","a09","block","b04","d02")

for (j in random.forest.vector){
  #j<- 2
  random.forest.index<- which(names(urban)==j)
  urbantest[ ,random.forest.index] <- as.numeric(as.character(urbantest[ ,random.forest.index]))
  urbantest[ ,random.forest.index] <- cut2(urbantest[ ,random.forest.index],g=4)
}
j


urban2[ ,72] <- as.numeric(urban2[ ,72])

timeRanges <-cut2(urban2[ ,72],g=4)
table(timeRanges,useNA="ifany")

summary(urbantest$b04)

timeRanges

head((urban2[ ,72]),20)

#---------------------------------------------------------------------------------------------
#test
y <- NULL
addclass <- is.null(y)
classRF <- addclass || is.factor(y)
if (!classRF && length(unique(y)) <= 5) {
  warning("The response has five or fewer unique values.  Are you sure you want to do regression?")}