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
# 
# summary(urbantest$b10)
# unique(urbantest$b10)
# 
# sum(is.na(urbantest$b12))
# sum(is.null(urbantest$b12))
# sum(is.nan(urbantest$b12))
#--------------------------------------------------------------------------------

(unique(urban$b16) == c(0,1)) | (unique(urban$b16) == c(1,0))
length(unique(urban$b16)) ==2

