# part of preparing for random forest
# finding  categorical predictors with more than 32 categories to remove the error
#Can not handle categorical predictors with more than 32 categories.
candidates32 <- c()

for (j in names(urbantest))    
 {if (is.factor (urbantest[ ,which(names(urbantest) == j)] &   nlevels(urbantest[ ,which(names(urbantest) == j)] ) > 32 ) print(j) }
    
                          
                              



#finding factors with no data

candidates1 <- c()
for (j in names(urbantest))   {
if (   is.factor (urbantest[ ,which(names(urbantest) == j)]
     &
       nlevels(urbantest[ ,which(names(urbantest) == j)]) == 1 )
{candidates1 <- append(candidates1,j)}}


         

# removing d02 from urbantest 
var.out <- names(urbantest)[names(urbantest) %in% c("d02")]
var.out
urbantest <- urbantest[ , !names(urbantest) %in% var.out] 
#------------------------------------------------------------
#finding factors with 1 unique value
candidates <- c()
class(candidates)
n=0
j="b31"
for (j in names(urbantest))   {
  
  if (   is.factor (urbantest[ ,which(names(urbantest) == j)])
                    &
         length(unique(urbantest[ ,which(names(urbantest) == j)])) == 1 
                    
  )
 
  {candidates <- append(candidates,j)}

}

urbantest <- urbantest[ , !names(urbantest) %in% candidates] 

#--------------------------------------------------------------
unique(urbantest$b35)
length(unique(urbantest$b35))# ==1

length(unique(urbantest$address))# ==1
