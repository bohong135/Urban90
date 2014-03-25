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