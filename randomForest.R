#http://lojze.lugos.si/~darja/software/r/library/randomForest/html/varImpPlot.html


#Examples
library(randomForest)

set.seed(4543)
data(mtcars)
mtcars.rf <- randomForest(mpg ~ ., data=mtcars, ntree=1000, keep.forest=FALSE,
                          importance=TRUE)
varImpPlot(mtcars.rf)

#view the source code for randomForest

randomForest
getAnywhere('randomForest.default')