data <- read.csv("loansData.csv")
names(data) <- c("requested", "funded", "interest", "loanlen", "purpose", "dtoiratio", 
                 "state", "own", "mincome", "fico", "oclines", "balance", "inquiries", "emplen")

data <- data[data$funded >= 0, ]  # two rows removed
data$interest <- as.numeric(gsub("%", "", as.character(data$interest)))
data$dtoiratio <- as.numeric(gsub("%", "", as.character(data$dtoiratio)))

data <- data[which(as.character(data$own) %in% c("MORTGAGE", "OTHER", "OWN", 
                                                 "RENT")), ]


#ruuning randomForest
data.rf <- randomForest(interest ~ ., data=data, ntree=500, keep.forest=FALSE,
                          importance=TRUE)

sum(is.na(data$requested)) + sum(is.null(data$requested)) 
sum(is.na(data$funded)) + sum(is.null(data$funded)) 
sum(is.na(data$interest)) + sum(is.null(data$interest)) 
sum(is.na(data$loanlen)) + sum(is.null(data$loanlen)) 
sum(is.na(data$purpose)) + sum(is.null(data$purpose)) 
sum(is.na(data$dtoiratio)) + sum(is.null(data$dtoiratio)) 
sum(is.na(data$state)) + sum(is.null(data$state)) 
sum(is.na(data$own)) + sum(is.null(data$own)) 
sum(is.na(data$fico)) + sum(is.null(data$fico)) 
sum(is.na(data$oclines)) + sum(is.null(data$oclines)) #1
sum(is.na(data$balance)) + sum(is.null(data$balance)) #1
sum(is.na(data$inquiries)) + sum(is.null(data$inquiries)) #1
sum(is.na(data$emplen)) + sum(is.null(data$emplen)) 

data <- data[ , !names(data) %in% c("state","fico")] 
data.rf <- randomForest(interest ~ ., data=data, 
           ntree=5000, keep.forest=FALSE,importance=TRUE,na.action = na.omit)

varImpPlot(data.rf)
