ccolumn.pattern <- '^c[0123456789][0123456789]?'
ccolumn.index = grep(ccolumn.pattern, names(urban))
ccolumn.index
names(urban [ , ccolumn.index])

#----------------------------------------------------------
summary(urban$c05)
unique(urban$c05)
#NAs already removed by acolumns
#----------------------------------------------------------
#converting c columns to factor
urbantest <- urban

for (k in ccolumn.index){
  
  #k=2
  urban[ ,k] <- as.factor(urban[ ,k])
  
}
str(urban)