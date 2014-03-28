# part of preparing for random forest
# finding  categorical predictors with more than 32 categories to remove the error
#Can not handle categorical predictors with more than 32 categories.
candidates32.index <- c()
for (m in (1 : ncol(urban)))   {
  
  #m=3
  if (   is.factor(urban[ ,m])  & nlevels(urban[ ,m]) > 32    )
    {   candidates32.index <- append(candidates32.index,m) ;
        urban[ ,m]<- as.character(urban[ ,m]) }
}

#str(urban)

#names(urban[ ,candidates32.index])

#urban[ ,14]<- as.character(urban[ ,14]) 
#summary(urban$a09)
#unique(urban$a09)

#------------------------------------------------------------------------------------------
#finding columns with no data
# 
 candidatesnodata.index <- c()
 for (j in (1 : ncol(urban)))   {
   

   if (    is.numeric(urban[ ,j])  &  length(unique(as.numeric(urban[ ,j]))) == 1      )
     {candidatesnodata.index <- append(candidatesnodata.index,j);
                        #urban <- urban[ , - j] }
                                }}
# 
# 
urban <- urban[ , - candidatesnodata.index]
# #names(urban[ ,candidates.nodata.index])
# urban <- urban[ , - (candidates.nodata.index)] 
# #candidates.nodata.index
#names(urban[ ,candidates.nodata.index])


#urbantest <- urbantest[ , !names(urbantest) %in% var.out] 
#------------------------------------------------------------
#finding columns with 1 unique value -can be excluded from dataset
# candidatesoneunique.index <- c()
# for (k in (1 : ncol(urban)))   {
#   if (   sum(unique(urban[ ,k]) , na.rm=TRUE) == 0    )
#     candidatesoneunique.index <- append(candidatesoneunique.index,j)
# }


#unique(urban[ ,2])
#unique(urban[ ,3])
#unique(urban[ ,4])

