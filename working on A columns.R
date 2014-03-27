
acolumn.pattern <- '^a[0123456789][0123456789]?'
acolumn.index = grep(acolumn.pattern, names(urban))
acolumn.index
names(urban [ , acolumn.index])
#----------------------------------------------------------------------

#inspecting NAs
summary(urban$a10)
unique(urban$a10)

summary(urban$a08)
unique(urban$a08)

summary(urban$a09)
unique(urban$a09)
#a08 and a09 and a10 all have 41 NAs. it seems they have the same NAs.
urbantest <-urban
dim(     urban [ which ( !(is.nan(urban$a08 ))  ), ]      )

# removing three columns NAs
urban <-  urban [ which ( !(is.nan(urban$a08 ))  ), ]
#----------------------------------------------------------------------------
#converting a columns to factor


urbantest <- urban
for (k in acolumn.index){
  
  #k=48
  urban[ ,k] <- as.factor(urban[ ,k])
  
}

str(urban)
#-----------------------------------------------------------------
#test
summary(urbantest$a02)
unique(urbantest$a02)

summary(urbantest$a08)
unique(urbantest$a08)

summary(urban$a09)
unique(urban$a09)


urban$a08 <- urbantest$a08
urban$a09 <- urbantest$a09
urban$a02 <- urbantest$a02