dcolumn.pattern <- '^d[0123456789][0123456789]'
dcolumn.index = grep(dcolumn.pattern, names(urban))
#dcolumn.index
#names(urban [ , dcolumn.index])

# summary(urban$d01)
# unique(urban$d01)
# 
# summary(urban$d02)
# unique(urban$d02)
#-----------------------------------------------------
#converting d columns to factor
for (k in dcolumn.index){
  
  #k=2
  urban[ ,k] <- as.factor(urban[ ,k])
  
}