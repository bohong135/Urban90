#unique(urbantest$b12)
#summary(urbantest$b12)



bcolumn.pattern <- '^b[0123456789][0123456789]'
bcolumn.index = grep(bcolumn.pattern, names(urban))
#bcolumn.index
#names(urban[ ,bcolumn.index])
#-----------------------------------------------------------------------------------------
# converting NULL values to zero because b columns are binary variables
bcolumn.nrow <- dim(urban)[1]

for (k in bcolumn.index){
  for (l in( 1 :bcolumn.nrow))
#k="b34"
#l=1
    if (    is.nan(urban [l, ][ ,k])    )
         
         {urban [l, ][ ,k] <- 0 }
}
                                            
#--------------------------------------------------------------------------------
# converting almost all b variables to zero-one
b.zero.one.vector <- c("b25","b26","b27","b28","b29","b30","b31","b32","b33","b34","b38","b39","b40")
length(b.zero.one.vector)
b.zero.one.index <- which(names(urban) %in% b.zero.one.vector)
#b.zero.one.index 
for (k in b.zero.one.index){
  for (l in( 1 :bcolumn.nrow))
    #k="b27"
    #l=1
    if (!(    (urban [l, ][ ,k]) == 0    ))
      
    {urban [l, ][ ,k] <- 1 }
}
#-----------------------------------------------------------------------------------
#converting b columns to factor
bcolumn.index

urbantest <- urban
for (k in bcolumn.index){

  #k=48
  urban[ ,k] <- as.factor(urban[ ,k])

}

#converting b04 to numeric
b04.index <- which(names (urban)=="b04")
urban [ ,b04.index] <- as.numeric(urban [ ,b04.index])

class(urban$b04)
str(urban)

# 
# summary(urbantest$b10)
# unique(urbantest$b10)
# 
# sum(is.na(urbantest$b12))
# sum(is.null(urbantest$b12))
# sum(is.nan(urbantest$b12))
#--------------------------------------------------------------------------------

