# part of preparing for random forest
# finding  categorical predictors with more than 32 categories to remove the error
#Can not handle categorical predictors with more than 32 categories.
candidates.32.index <- c()


                              

summary(urban$b13)   
unique(urban$b13)  
sum(unique(urban$b11) , na.rm=TRUE)

is.nan(sum(unique(urban$b01)  ))



sum(is.nan(unique(urban[ ,j])))
ncol(urban)


#finding columns with no data

candidates.nodata.index <- c()
for (j in (1 : ncol(urban)))   {
  if (   sum(unique(urban[ ,j]) , na.rm=TRUE) == 0    )
    candidates.nodata.index <- append(candidates.nodata.index,j)
                               }

urban <- urban[ , -candidates.nodata.index] 
#candidates.nodata.index
#names(urban[ ,candidates.nodata.index])

summary(urban$b24)   
unique (urban$b24)
         

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

