#http://lojze.lugos.si/~darja/software/r/library/randomForest/html/varImpPlot.html


#Examples
# library(randomForest)
# 
# set.seed(4543)
# data(mtcars)
# mtcars.rf <- randomForest(mpg ~ ., data=mtcars, ntree=1000, keep.forest=FALSE,
#                           importance=TRUE)
# varImpPlot(mtcars.rf)

#view the source code for randomForest

#randomForest
#getAnywhere('randomForest.default')
#Random Forest

#OK <- complete.cases(urban)
#completeurban <- urban [OK,]
#head(completeurban)


#options(stringsAsFactors = FALSE)
set.seed(1)
urban.randomforest.daramad <- randomForest(daramad ~ ., data = urban, 
            ntree=500, keep.forest=FALSE,importance=TRUE,na.action = na.omit)

#length(unique(urban$daramad))# ==58

varImpPlot(urban.randomforest.daramad)
#----------------------------------------------------------------
#another formula
set.seed(2)
urban.randomforest.c11 <- randomForest(c11 ~ ., data = urban, 
            ntree=500, keep.forest=FALSE,importance=TRUE,na.action = na.omit)
varImpPlot(urban.randomforest.c11)




#class(urban)

#summary(urbantest$)
#unique(urban$daramad)