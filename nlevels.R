# part of preparing for random forest
# finding  categorical predictors with more than 32 categories to remove the error
#Can not handle categorical predictors with more than 32 categories.
candidates32.index <- c()
for (m in (1 : ncol(urban)))   {
  if (   is.factor(urban[ ,m])  & nlevels(as.factor(urban[ ,m])) >32    )
    candidates32.index <- append(candidates32.index,j)
}
names(   urban[ ,unique(candidates32.index)]   )
                              
candidates32.index
unique(candidates32.index)

summary(urban$b13)   
unique(urban$b13)  
sum(unique(urban$b11) , na.rm=TRUE)

is.nan(sum(unique(urban$b01)  ))



sum(is.nan(unique(urban[ ,j])))
ncol(urban)


#finding columns with no data

candidates.nodata.index <- c()
for (j in (1 : ncol(urban)))   {
  
 
  if (    is.numeric(urban[ ,j])  &  length(unique(as.numeric(urban[ ,j]))) == 1      )
    {candidates.nodata.index <- append(candidates.nodata.index,j)}
                               }


names(urban[ ,candidates.nodata.index])
urban <- urban[ , -candidates.nodata.index] 
#candidates.nodata.index
#names(urban[ ,candidates.nodata.index])


#urbantest <- urbantest[ , !names(urbantest) %in% var.out] 
#------------------------------------------------------------
#finding columns with 1 unique value -can be excluded from dataset
candidates.oneunique.index <- c()
for (k in (1 : ncol(urban)))   {
  if (   sum(unique(urban[ ,k]) , na.rm=TRUE) == 0    )
    candidates.oneunique.index <- append(candidates.oneunique.index,j)
}


unique(urban[ ,2])
unique(urban[ ,3])
unique(urban[ ,4])

