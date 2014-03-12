data(iris)

classifier<-naiveBayes(iris[,1:4], iris[,5]) 
table(predict(classifier, iris[,-5]), iris[,5])


dim(iris[,-5]) # 150 4
length(iris[,-5]) #4
class(iris[,-5]) #"data.frame"

dim(iris[,5]) #null
length(iris[,5]) #150
class(iris[,5]) #factor

